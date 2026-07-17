-- Data for the v3 500-target bulk import (batch 3, see 20260717180000 for
-- the companion new-categories migration). Idempotent: every INSERT is
-- ON CONFLICT DO NOTHING keyed on tools.slug or
-- tool_strategic_metadata.tool_id. New tools land as
-- status='needs_review', noindex=true, sitemap_eligible=false — invisible
-- to the public site until enrichment (Phase B) reviews and publishes them.

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$suitecrm$q$, $q$SuiteCRM$q$, $q$https://suitecrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f642cdf4-9d25-4b51-b18d-2ac786b0b375', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$espocrm$q$, $q$EspoCRM$q$, $q$https://www.espocrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e1f5c4e-47f2-4e4f-84ee-91538babece0', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$yetiforce$q$, $q$YetiForce$q$, $q$https://yetiforce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad091561-b390-481a-bf66-f43ea55efb9d', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad091561-b390-481a-bf66-f43ea55efb9d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$orocrm$q$, $q$OroCRM$q$, $q$https://oroinc.com/orocrm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63ad3ef7-5046-461f-a151-5b360a08cc61', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63ad3ef7-5046-461f-a151-5b360a08cc61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$monica$q$, $q$Monica$q$, $q$https://www.monicahq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ec2fcab-82e1-40ba-a312-37feb11695e6', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ec2fcab-82e1-40ba-a312-37feb11695e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$dolibarr$q$, $q$Dolibarr$q$, $q$https://www.dolibarr.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'da85131f-6520-4e7e-b70d-0a49a665a0fa', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da85131f-6520-4e7e-b70d-0a49a665a0fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$erpnext$q$, $q$ERPNext$q$, $q$https://erpnext.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$tryton$q$, $q$Tryton$q$, $q$https://www.tryton.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fac895ab-84a4-44ef-95ce-d865e6760f3c', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fac895ab-84a4-44ef-95ce-d865e6760f3c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$metasfresh$q$, $q$Metasfresh$q$, $q$https://metasfresh.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '590b2d7a-0185-4363-87ce-75d530896404', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '590b2d7a-0185-4363-87ce-75d530896404')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$axelor$q$, $q$Axelor$q$, $q$https://www.axelor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0159edf-c1a0-4793-86d2-5849a29d5b23', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$apache-ofbiz$q$, $q$Apache OFBiz$q$, $q$https://ofbiz.apache.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e08b2a0-8365-4535-9e4d-361aee66a19f', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e08b2a0-8365-4535-9e4d-361aee66a19f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$idempiere$q$, $q$iDempiere$q$, $q$https://www.idempiere.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$adempiere$q$, $q$ADempiere$q$, $q$https://adempiere.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd896e501-64c6-49a9-a09c-ce638e9ebefe', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$orangehrm$q$, $q$OrangeHRM$q$, $q$https://www.orangehrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2a56d2f-1e25-421f-af5c-1494914a3095', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2a56d2f-1e25-421f-af5c-1494914a3095')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ef2735d-67cd-41bb-9fcf-cd6afd9dadc1', $q$sentrifugo$q$, $q$Sentrifugo$q$, $q$https://www.sentrifugo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ef2735d-67cd-41bb-9fcf-cd6afd9dadc1', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ef2735d-67cd-41bb-9fcf-cd6afd9dadc1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$icehrm$q$, $q$IceHrm$q$, $q$https://icehrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bffd64e4-dad4-418b-a22e-4efecf3333f5', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$frappe-hr$q$, $q$Frappe HR$q$, $q$https://frappehr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$opencats$q$, $q$OpenCATS$q$, $q$https://www.opencats.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '448ec905-8c58-4b0c-931b-b7bedf89db12', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '448ec905-8c58-4b0c-931b-b7bedf89db12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$recruiterflow$q$, $q$Recruiterflow$q$, $q$https://recruiterflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$recruit-crm$q$, $q$Recruit CRM$q$, $q$https://recruitcrm.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16d7a916-ff92-4379-8cb9-06913256e22d', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16d7a916-ff92-4379-8cb9-06913256e22d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$dover$q$, $q$Dover$q$, $q$https://www.dover.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f4357a3-4447-4c5e-a99e-78f3aab7061b', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$metaview$q$, $q$Metaview$q$, $q$https://www.metaview.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '337159a2-d409-432a-86c7-1ec8ab203620', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '337159a2-d409-432a-86c7-1ec8ab203620')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$paraform$q$, $q$Paraform$q$, $q$https://www.paraform.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0abb883b-fe31-411e-a600-34ef2c9cdba6', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0abb883b-fe31-411e-a600-34ef2c9cdba6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$juicebox$q$, $q$Juicebox$q$, $q$https://juicebox.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4cc45ff7-31f0-4735-be09-538439350dbc', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cc45ff7-31f0-4735-be09-538439350dbc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$findem$q$, $q$Findem$q$, $q$https://www.findem.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$hireez$q$, $q$HireEZ$q$, $q$https://hireez.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '75de4905-e02e-4641-aa2f-074c25a04d63', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75de4905-e02e-4641-aa2f-074c25a04d63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$seekout$q$, $q$SeekOut$q$, $q$https://www.seekout.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$leapsome$q$, $q$Leapsome$q$, $q$https://www.leapsome.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fdee0987-278e-4695-be35-6f8d4a24d46b', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdee0987-278e-4695-be35-6f8d4a24d46b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$15five$q$, $q$15Five$q$, $q$https://www.15five.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '172aeb66-4aac-42c5-b5fb-820fded05cd2', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '172aeb66-4aac-42c5-b5fb-820fded05cd2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$culture-amp$q$, $q$Culture Amp$q$, $q$https://www.cultureamp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8260c82f-10fa-4ece-b662-6c99bd5967eb', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8260c82f-10fa-4ece-b662-6c99bd5967eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$officevibe$q$, $q$Officevibe$q$, $q$https://officevibe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a31391fe-79aa-479e-ad05-f7def34d36ee', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a31391fe-79aa-479e-ad05-f7def34d36ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$worktango$q$, $q$WorkTango$q$, $q$https://www.worktango.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f693b898-12c0-4472-a7d3-8ed4219d2443', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f693b898-12c0-4472-a7d3-8ed4219d2443')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$bonusly$q$, $q$Bonusly$q$, $q$https://bonusly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6806207d-501f-442f-81f0-3c146ec0fedc', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6806207d-501f-442f-81f0-3c146ec0fedc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$kudos$q$, $q$Kudos$q$, $q$https://www.kudos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45bbc3cd-e3e9-484a-8307-e4b104d0b92c', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$motivosity$q$, $q$Motivosity$q$, $q$https://www.motivosity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$nectar-hr$q$, $q$Nectar HR$q$, $q$https://nectarhr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bc67bcec-f876-4c54-a194-c179aa6f1b6e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$assembly-employee-recognition$q$, $q$Assembly Employee Recognition$q$, $q$https://joinassembly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b80f26c5-559d-4dd6-a520-9913d10938f6', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b80f26c5-559d-4dd6-a520-9913d10938f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$awardco$q$, $q$Awardco$q$, $q$https://www.award.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$perkbox$q$, $q$Perkbox$q$, $q$https://www.perkbox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42ee2d70-9cde-4237-84bd-e916bc055119', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42ee2d70-9cde-4237-84bd-e916bc055119')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$benepass$q$, $q$Benepass$q$, $q$https://www.getbenepass.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ce82b7a0-b1b6-4191-9b58-41a63c85525c', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$forma-benefits$q$, $q$Forma Benefits$q$, $q$https://www.joinforma.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '558c959c-6ffc-4bcf-b6cc-8dce9830952a', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$pave$q$, $q$Pave$q$, $q$https://www.pave.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09bdd5ac-c605-4211-ad86-64bb2d399f8a', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$figures$q$, $q$Figures$q$, $q$https://figures.hr$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '51568536-b7e1-4391-a01a-fb0353541bf4', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51568536-b7e1-4391-a01a-fb0353541bf4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$ravio$q$, $q$Ravio$q$, $q$https://ravio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '240f9156-e0ab-42ca-b567-928a9cab1bb2', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '240f9156-e0ab-42ca-b567-928a9cab1bb2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$compa$q$, $q$Compa$q$, $q$https://www.compa.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$charthop$q$, $q$ChartHop$q$, $q$https://www.charthop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d53613b-ce48-4bee-a738-96b4bc59bd46', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d53613b-ce48-4bee-a738-96b4bc59bd46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$orgvue$q$, $q$Orgvue$q$, $q$https://www.orgvue.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$pingboard$q$, $q$Pingboard$q$, $q$https://pingboard.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e8b9691-f4ea-48a6-bf97-0daae2c823ac', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$sift-org-chart$q$, $q$Sift Org Chart$q$, $q$https://www.justsift.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54840d54-d23f-400b-9a21-c910db72a31a', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54840d54-d23f-400b-9a21-c910db72a31a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$knowledgeowl$q$, $q$KnowledgeOwl$q$, $q$https://www.knowledgeowl.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afdb353e-eadb-46f7-a2cf-7af280948165', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afdb353e-eadb-46f7-a2cf-7af280948165')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$gitbook$q$, $q$GitBook$q$, $q$https://www.gitbook.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3af57a6b-aa7b-403a-a094-3150492f8e93', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3af57a6b-aa7b-403a-a094-3150492f8e93')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$bookstack$q$, $q$BookStack$q$, $q$https://www.bookstackapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c979afd-7472-4f90-be81-546475814887', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c979afd-7472-4f90-be81-546475814887')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$wiki-js$q$, $q$Wiki.js$q$, $q$https://js.wiki$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8287b9b-43ca-4726-b309-28a1246e0832', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8287b9b-43ca-4726-b309-28a1246e0832')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$dokuwiki$q$, $q$DokuWiki$q$, $q$https://www.dokuwiki.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bac55456-ac21-473d-a96f-b37ba84bb107', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bac55456-ac21-473d-a96f-b37ba84bb107')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$xwiki$q$, $q$XWiki$q$, $q$https://www.xwiki.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb6f9f95-9f4c-4661-825d-e8c01f5894f4', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb6f9f95-9f4c-4661-825d-e8c01f5894f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$mediawiki$q$, $q$MediaWiki$q$, $q$https://www.mediawiki.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56575211-4e45-4694-ace2-cf86a40a1535', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56575211-4e45-4694-ace2-cf86a40a1535')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$tiddlywiki$q$, $q$TiddlyWiki$q$, $q$https://tiddlywiki.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9083bc49-72a1-47d8-94f0-9eca973868b2', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9083bc49-72a1-47d8-94f0-9eca973868b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$logseq$q$, $q$Logseq$q$, $q$https://logseq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d057e5f-65df-488c-80d0-410c33bb681b', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d057e5f-65df-488c-80d0-410c33bb681b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$anytype$q$, $q$Anytype$q$, $q$https://anytype.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$affine$q$, $q$Affine$q$, $q$https://affine.pro$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3923df9-f933-42f3-a870-8a16aaef419f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3923df9-f933-42f3-a870-8a16aaef419f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$appflowy$q$, $q$AppFlowy$q$, $q$https://appflowy.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a124a9a-48f0-4b4c-95da-4dc646598e63', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a124a9a-48f0-4b4c-95da-4dc646598e63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$superlist$q$, $q$Superlist$q$, $q$https://www.superlist.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bb2a1c0-a8a2-4210-989c-3a4008f6840a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$ellie-planner$q$, $q$Ellie Planner$q$, $q$https://ellieplanner.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cdc946d2-b06d-4438-be5e-2091531fcf59', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdc946d2-b06d-4438-be5e-2091531fcf59')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$timestripe$q$, $q$Timestripe$q$, $q$https://timestripe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e87249d5-d534-4dd2-b7ea-1a1690c96c53', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$tweek$q$, $q$Tweek$q$, $q$https://tweek.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0dd77a12-e3bc-4d46-ba35-97303cca0d1d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0dd77a12-e3bc-4d46-ba35-97303cca0d1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$lunatask$q$, $q$Lunatask$q$, $q$https://lunatask.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$amazing-marvin$q$, $q$Amazing Marvin$q$, $q$https://amazingmarvin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '43183bc9-0de0-415c-ba7d-2669401c12df', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43183bc9-0de0-415c-ba7d-2669401c12df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$sorted-3$q$, $q$Sorted 3$q$, $q$https://www.sortedapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee31d20d-7b66-46e5-8a2d-1857b726db37', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$noteplan$q$, $q$NotePlan$q$, $q$https://noteplan.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b839ece-85d0-4b47-9358-2feed4175b10', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b839ece-85d0-4b47-9358-2feed4175b10')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$bear$q$, $q$Bear$q$, $q$https://bear.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '233cbc74-52cc-4f26-9f7e-c27a33f74bfc', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$ulysses$q$, $q$Ulysses$q$, $q$https://ulysses.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96f26d26-8a1d-438a-a8a3-ab3602c704c2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96f26d26-8a1d-438a-a8a3-ab3602c704c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$obsidian$q$, $q$Obsidian$q$, $q$https://obsidian.md$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45916754-f5bf-43e2-98ed-4d4cec40d20c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45916754-f5bf-43e2-98ed-4d4cec40d20c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$capacities$q$, $q$Capacities$q$, $q$https://capacities.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5816d708-5e16-4d8f-8847-bc4d396ab602', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5816d708-5e16-4d8f-8847-bc4d396ab602')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$heptabase$q$, $q$Heptabase$q$, $q$https://heptabase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2bd44f6-8343-46e6-bef6-8aab0d7ad1bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$milanote$q$, $q$Milanote$q$, $q$https://milanote.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05e24cd3-962a-414e-b238-79b5d2f5477f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05e24cd3-962a-414e-b238-79b5d2f5477f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$scrintal$q$, $q$Scrintal$q$, $q$https://www.scrintal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44be1d54-c2e8-47bb-b553-cdc2120d6458', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44be1d54-c2e8-47bb-b553-cdc2120d6458')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$plane-project-management$q$, $q$Plane Project Management$q$, $q$https://plane.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '68399520-7bce-4cbd-8fad-93972635411f', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68399520-7bce-4cbd-8fad-93972635411f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$openproject$q$, $q$OpenProject$q$, $q$https://www.openproject.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c81a24e-2f8d-479b-aeeb-638429dd55ec', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$taiga$q$, $q$Taiga$q$, $q$https://taiga.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd0bc05e-d67e-4870-a277-70ee9d9c0af0', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd0bc05e-d67e-4870-a277-70ee9d9c0af0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$leantime$q$, $q$Leantime$q$, $q$https://leantime.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cc8a6c27-5e21-4987-a514-54dffa799736', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc8a6c27-5e21-4987-a514-54dffa799736')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$vikunja$q$, $q$Vikunja$q$, $q$https://vikunja.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d064484-1e39-4835-a77c-89f6fd35cc99', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d064484-1e39-4835-a77c-89f6fd35cc99')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$kanboard$q$, $q$Kanboard$q$, $q$https://kanboard.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd35f0bfc-a880-4f59-aa8f-867b297a21c1', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd35f0bfc-a880-4f59-aa8f-867b297a21c1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$wekan$q$, $q$Wekan$q$, $q$https://wekan.github.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d61482f-100a-4065-95f7-81efc054d452', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d61482f-100a-4065-95f7-81efc054d452')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ab386a2-faa0-49f0-97d8-6d5200fb72bb', $q$focalboard$q$, $q$Focalboard$q$, $q$https://www.focalboard.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ab386a2-faa0-49f0-97d8-6d5200fb72bb', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ab386a2-faa0-49f0-97d8-6d5200fb72bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$huly$q$, $q$Huly$q$, $q$https://huly.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c31b644-e9f8-4a6c-b3aa-e7960053e0dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$tuleap$q$, $q$Tuleap$q$, $q$https://www.tuleap.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '932248d2-07e2-4834-ad47-abd847ca7ad8', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '932248d2-07e2-4834-ad47-abd847ca7ad8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c0a3212-6a22-4654-b9a1-99819c416ff5', $q$phabricator$q$, $q$Phabricator$q$, $q$https://www.phacility.com/phabricator$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c0a3212-6a22-4654-b9a1-99819c416ff5', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c0a3212-6a22-4654-b9a1-99819c416ff5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$youtrack$q$, $q$YouTrack$q$, $q$https://www.jetbrains.com/youtrack$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2f12a930-1f2e-4928-8d88-770f30751680', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f12a930-1f2e-4928-8d88-770f30751680')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$aha$q$, $q$Aha!$q$, $q$https://www.aha.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d3b022c-eecd-4869-9efc-0b614824aa91', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d3b022c-eecd-4869-9efc-0b614824aa91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$productboard$q$, $q$Productboard$q$, $q$https://www.productboard.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44247eb4-4fad-4252-a448-315159706699', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44247eb4-4fad-4252-a448-315159706699')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$prodpad$q$, $q$ProdPad$q$, $q$https://www.prodpad.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f214525d-5b01-44d9-b029-88a13d27b4e6', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f214525d-5b01-44d9-b029-88a13d27b4e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$airfocus$q$, $q$airfocus$q$, $q$https://airfocus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1630ac29-62d1-433c-a8cb-b173926de875', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1630ac29-62d1-433c-a8cb-b173926de875')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$dragonboat$q$, $q$Dragonboat$q$, $q$https://dragonboat.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$craft-io$q$, $q$Craft.io$q$, $q$https://craft.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '78f287c8-68d3-4606-a4ac-c4ef808b1063', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78f287c8-68d3-4606-a4ac-c4ef808b1063')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$roadmunk$q$, $q$Roadmunk$q$, $q$https://roadmunk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$sharpcloud$q$, $q$SharpCloud$q$, $q$https://www.sharpcloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$productplan$q$, $q$ProductPlan$q$, $q$https://www.productplan.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '73f568cf-6fdf-4904-bb21-3fb27cb40d1c', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$portfoleon$q$, $q$Portfoleon$q$, $q$https://www.portfoleon.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4754e964-cca0-48dc-adc6-88e29e111bd1', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4754e964-cca0-48dc-adc6-88e29e111bd1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$zeda-io$q$, $q$Zeda.io$q$, $q$https://zeda.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ac86fa0-12e3-4373-bceb-3db29dc3719e', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0ac04a4-012a-47e1-a2d0-a654ad99ade3', $q$chisel$q$, $q$Chisel$q$, $q$https://chisellabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0ac04a4-012a-47e1-a2d0-a654ad99ade3', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0ac04a4-012a-47e1-a2d0-a654ad99ade3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$savio$q$, $q$Savio$q$, $q$https://www.savio.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69b064f9-d2d3-4029-9481-48380ca63924', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69b064f9-d2d3-4029-9481-48380ca63924')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$canny$q$, $q$Canny$q$, $q$https://canny.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de66f380-8299-4b3a-b413-b14569d70119', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de66f380-8299-4b3a-b413-b14569d70119')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$frill$q$, $q$Frill$q$, $q$https://frill.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$nolt$q$, $q$Nolt$q$, $q$https://nolt.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '464182df-a73e-41ff-88d0-d38b16891925', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '464182df-a73e-41ff-88d0-d38b16891925')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$sleekplan$q$, $q$Sleekplan$q$, $q$https://sleekplan.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed72e564-3150-4ee6-ad02-fc3247f087ae', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed72e564-3150-4ee6-ad02-fc3247f087ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$upvoty$q$, $q$Upvoty$q$, $q$https://www.upvoty.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b032034e-3c48-43b1-b97e-319af0c7611f', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b032034e-3c48-43b1-b97e-319af0c7611f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$featurebase$q$, $q$Featurebase$q$, $q$https://www.featurebase.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69ed37d5-2093-4b7b-87b5-2affc6a03505', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69ed37d5-2093-4b7b-87b5-2affc6a03505')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$uservoice$q$, $q$UserVoice$q$, $q$https://www.uservoice.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd278a62-8daf-4a08-9776-46b01f241b6d', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd278a62-8daf-4a08-9776-46b01f241b6d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('862d01e4-b70f-42d4-a767-087af055aa04', $q$commandbar$q$, $q$CommandBar$q$, $q$https://www.commandbar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '862d01e4-b70f-42d4-a767-087af055aa04', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '862d01e4-b70f-42d4-a767-087af055aa04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1d39120-ba26-4cce-9321-103e23bfe6f1', $q$dopt$q$, $q$Dopt$q$, $q$https://www.dopt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1d39120-ba26-4cce-9321-103e23bfe6f1', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1d39120-ba26-4cce-9321-103e23bfe6f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$stonly$q$, $q$Stonly$q$, $q$https://stonly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28d621bc-8148-478e-91f4-93954281f173', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28d621bc-8148-478e-91f4-93954281f173')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$lucky-orange$q$, $q$Lucky Orange$q$, $q$https://www.luckyorange.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '33ec13b1-2e9a-4373-9b50-55b018d5adaa', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26353690-a2ee-449c-bcc8-74fac8018f06', $q$sessionstack$q$, $q$SessionStack$q$, $q$https://www.sessionstack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26353690-a2ee-449c-bcc8-74fac8018f06', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26353690-a2ee-449c-bcc8-74fac8018f06')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$uxcam$q$, $q$UXCam$q$, $q$https://uxcam.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$contentsquare$q$, $q$Contentsquare$q$, $q$https://contentsquare.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '416c2613-6ccd-4b41-aea6-5f51b4411966', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '416c2613-6ccd-4b41-aea6-5f51b4411966')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$glassbox$q$, $q$Glassbox$q$, $q$https://www.glassbox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32c09a08-ca8d-4425-b7ea-3b78968f97a4', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$quantum-metric$q$, $q$Quantum Metric$q$, $q$https://www.quantummetric.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '546750c3-813f-430c-a551-e76c5f6484f1', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '546750c3-813f-430c-a551-e76c5f6484f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$snowplow$q$, $q$Snowplow$q$, $q$https://snowplow.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '62cb1717-61b9-4a9b-aab8-e3aeee5ab747', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62cb1717-61b9-4a9b-aab8-e3aeee5ab747')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$rudderstack$q$, $q$RudderStack$q$, $q$https://www.rudderstack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$jitsu$q$, $q$Jitsu$q$, $q$https://jitsu.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99ecac84-e959-4bdd-9c5f-dac64779d3d2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99ecac84-e959-4bdd-9c5f-dac64779d3d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$meltano$q$, $q$Meltano$q$, $q$https://meltano.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ecb792b6-733d-4b42-9447-29bbd9fb6b62', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecb792b6-733d-4b42-9447-29bbd9fb6b62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$singer$q$, $q$Singer$q$, $q$https://www.singer.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '33ad3642-ef12-4121-a02e-a01f3f57bc2b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33ad3642-ef12-4121-a02e-a01f3f57bc2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$mage$q$, $q$Mage$q$, $q$https://www.mage.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d48d5fd-47e9-414e-af53-a8687df65dbb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d48d5fd-47e9-414e-af53-a8687df65dbb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$node-red$q$, $q$Node-RED$q$, $q$https://nodered.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0f2485e-46a1-44ad-84ac-a606befaef5f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$latenode$q$, $q$Latenode$q$, $q$https://latenode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f977f684-1fe1-4506-a3eb-4159d62fd97f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$konnectzit$q$, $q$KonnectzIT$q$, $q$https://konnectzit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26b90793-47fc-44e2-b4ed-aaab363f429f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26b90793-47fc-44e2-b4ed-aaab363f429f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0ac7827-3295-4540-8b0d-c5df37be621b', $q$suretriggers$q$, $q$SureTriggers$q$, $q$https://suretriggers.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0ac7827-3295-4540-8b0d-c5df37be621b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0ac7827-3295-4540-8b0d-c5df37be621b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$inngest$q$, $q$Inngest$q$, $q$https://www.inngest.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3acb1b38-990d-4851-be0b-cc32baa33857', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3acb1b38-990d-4851-be0b-cc32baa33857')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$webhook-site$q$, $q$Webhook.site$q$, $q$https://webhook.site$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$beeceptor$q$, $q$Beeceptor$q$, $q$https://beeceptor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e2b9e0f1-deda-4938-ab90-97882bfe5810', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be14b634-b7cc-4d16-810a-ee3927fb4b01', $q$requestbin$q$, $q$RequestBin$q$, $q$https://requestbin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be14b634-b7cc-4d16-810a-ee3927fb4b01', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be14b634-b7cc-4d16-810a-ee3927fb4b01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$mockoon$q$, $q$Mockoon$q$, $q$https://mockoon.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7ffccc1-7061-4b16-994f-9a8923b1a11b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$mockserver$q$, $q$MockServer$q$, $q$https://www.mock-server.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$wiremock$q$, $q$WireMock$q$, $q$https://wiremock.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7b90709-b508-4388-a295-d5608f207c11', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7b90709-b508-4388-a295-d5608f207c11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$bruno$q$, $q$Bruno$q$, $q$https://www.usebruno.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a27d9c1d-671b-4574-89ec-95d7edf9ea00', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$insomnia$q$, $q$Insomnia$q$, $q$https://insomnia.rest$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26e0091a-2dbf-4bce-9fd3-e6410e5065db', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26e0091a-2dbf-4bce-9fd3-e6410e5065db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$httpie$q$, $q$HTTPie$q$, $q$https://httpie.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1c58995-800c-4ef6-9481-0dcaa3734eff', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$yaak$q$, $q$Yaak$q$, $q$https://yaak.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80059e68-8557-45a3-a76c-b2d0817a3a9c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80059e68-8557-45a3-a76c-b2d0817a3a9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$scalar$q$, $q$Scalar$q$, $q$https://scalar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$stoplight$q$, $q$Stoplight$q$, $q$https://stoplight.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28f84c5e-8df6-4846-8228-5943ba6223e8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28f84c5e-8df6-4846-8228-5943ba6223e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$readme$q$, $q$ReadMe$q$, $q$https://readme.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '889a35b0-763a-4ca4-86bc-b657c47e2c33', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '889a35b0-763a-4ca4-86bc-b657c47e2c33')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$mintlify$q$, $q$Mintlify$q$, $q$https://mintlify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f62cd71f-7351-4b7b-9348-da3ff16476e0', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$fern$q$, $q$Fern$q$, $q$https://buildwithfern.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5894d70-a0dc-4dd7-8b8a-620802d83100', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$speakeasy$q$, $q$Speakeasy$q$, $q$https://www.speakeasy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a18645e2-a581-4fd2-afca-e3a533873c8b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a18645e2-a581-4fd2-afca-e3a533873c8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$bump-sh$q$, $q$Bump.sh$q$, $q$https://bump.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a078e17b-44db-40a3-bdc1-7247b3634fc8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$redocly$q$, $q$Redocly$q$, $q$https://redocly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01c9cb83-d21b-4761-b79e-7d589ccbad23', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01c9cb83-d21b-4761-b79e-7d589ccbad23')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc82827c-9211-4f0a-9f9f-39778e88b1eb', $q$swaggerhub$q$, $q$SwaggerHub$q$, $q$https://swagger.io/tools/swaggerhub$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc82827c-9211-4f0a-9f9f-39778e88b1eb', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc82827c-9211-4f0a-9f9f-39778e88b1eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$docusaurus$q$, $q$Docusaurus$q$, $q$https://docusaurus.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7736f4e7-14df-4b55-a27c-530d35d06fd1', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7736f4e7-14df-4b55-a27c-530d35d06fd1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$mkdocs$q$, $q$MkDocs$q$, $q$https://www.mkdocs.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1bde5f50-16ca-4a06-bfe7-446daf35604f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bde5f50-16ca-4a06-bfe7-446daf35604f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$vitepress$q$, $q$VitePress$q$, $q$https://vitepress.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3fb0f468-f238-4fb1-a656-36ced87d1401', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fb0f468-f238-4fb1-a656-36ced87d1401')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$nextra$q$, $q$Nextra$q$, $q$https://nextra.site$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '81e4c7de-ab42-4127-ae48-4dd99e1894fb', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$starlight$q$, $q$Starlight$q$, $q$https://starlight.astro.build$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ffe3fec8-5847-4750-b01a-593c7901730d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffe3fec8-5847-4750-b01a-593c7901730d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$sphinx$q$, $q$Sphinx$q$, $q$https://www.sphinx-doc.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5b8e104-a176-4bca-a581-3d1e42859374', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b8e104-a176-4bca-a581-3d1e42859374')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$material-for-mkdocs$q$, $q$Material for MkDocs$q$, $q$https://squidfunk.github.io/mkdocs-material$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0491910-91ba-45bf-9e66-510a9761281d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0491910-91ba-45bf-9e66-510a9761281d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$storybook$q$, $q$Storybook$q$, $q$https://storybook.js.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '546237d7-afb6-42b7-8b01-ab03163155ce', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '546237d7-afb6-42b7-8b01-ab03163155ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$chromatic$q$, $q$Chromatic$q$, $q$https://www.chromatic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$percy$q$, $q$Percy$q$, $q$https://percy.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0521ec36-4a18-4308-8b35-efe654ddfaa1', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0521ec36-4a18-4308-8b35-efe654ddfaa1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$applitools$q$, $q$Applitools$q$, $q$https://applitools.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56030237-fe9d-4c89-85b0-e8fc3b277439', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56030237-fe9d-4c89-85b0-e8fc3b277439')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a72b20a-d407-4667-b31e-e8a6c6b98ad9', $q$lambdatest$q$, $q$LambdaTest$q$, $q$https://www.lambdatest.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a72b20a-d407-4667-b31e-e8a6c6b98ad9', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a72b20a-d407-4667-b31e-e8a6c6b98ad9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$browserstack$q$, $q$BrowserStack$q$, $q$https://www.browserstack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '509b81fc-5715-4f19-a1df-3b3b13c8ed42', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$sauce-labs$q$, $q$Sauce Labs$q$, $q$https://saucelabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$testingbot$q$, $q$TestingBot$q$, $q$https://testingbot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b712ecf-94b6-4e1e-a274-928b0f776caa', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b712ecf-94b6-4e1e-a274-928b0f776caa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$uptime-kuma$q$, $q$Uptime Kuma$q$, $q$https://uptime.kuma.pet$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a5a7e0d-829a-4fbf-b817-7512ee40ab96', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$statuscake$q$, $q$StatusCake$q$, $q$https://www.statuscake.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4af54de-4e6f-4013-b444-8a17c0797dd0', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$hetrixtools$q$, $q$HetrixTools$q$, $q$https://hetrixtools.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c7aa89c-3f60-4564-b444-ec64000a8454', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c7aa89c-3f60-4564-b444-ec64000a8454')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$oh-dear$q$, $q$Oh Dear$q$, $q$https://ohdear.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f675195-8d9d-4857-a42d-0da0b4ca4707', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f675195-8d9d-4857-a42d-0da0b4ca4707')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$hyperping$q$, $q$Hyperping$q$, $q$https://hyperping.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d916b89-9e14-4c8b-b458-9c5fbc97233a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$cronitor$q$, $q$Cronitor$q$, $q$https://cronitor.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76ba7a30-adea-4140-9ee6-3e5cd63011ed', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$signoz$q$, $q$SigNoz$q$, $q$https://signoz.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$prometheus$q$, $q$Prometheus$q$, $q$https://prometheus.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '898eb43f-2596-446a-a7b5-ae0add35bd12', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '898eb43f-2596-446a-a7b5-ae0add35bd12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$victoriametrics$q$, $q$VictoriaMetrics$q$, $q$https://victoriametrics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a800ff94-205d-4d00-9df5-8de02f912d82', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a800ff94-205d-4d00-9df5-8de02f912d82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$netdata$q$, $q$Netdata$q$, $q$https://www.netdata.cloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b6486af7-2d48-49bb-8a54-b53aaf072df4', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$zabbix$q$, $q$Zabbix$q$, $q$https://www.zabbix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59226ced-c95a-4575-8fdf-25651ad806d1', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59226ced-c95a-4575-8fdf-25651ad806d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$icinga$q$, $q$Icinga$q$, $q$https://icinga.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '263f6e12-dfc9-4797-a1fe-95f4616f1475', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263f6e12-dfc9-4797-a1fe-95f4616f1475')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$nagios-xi$q$, $q$Nagios XI$q$, $q$https://www.nagios.com/products/nagios-xi$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7fda584-6240-4d2f-8353-32a67b19e197', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7fda584-6240-4d2f-8353-32a67b19e197')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$groundcover$q$, $q$Groundcover$q$, $q$https://www.groundcover.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '66cb9934-6740-4aa9-bd5c-6b81c6f665af', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$coralogix$q$, $q$Coralogix$q$, $q$https://coralogix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87d8b957-ca86-43e1-bf19-a249b1bd836a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87d8b957-ca86-43e1-bf19-a249b1bd836a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$logz-io$q$, $q$Logz.io$q$, $q$https://logz.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$mezmo$q$, $q$Mezmo$q$, $q$https://www.mezmo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42e3325b-1211-486f-91fc-f675f017f411', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42e3325b-1211-486f-91fc-f675f017f411')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$honeycomb$q$, $q$Honeycomb$q$, $q$https://www.honeycomb.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5fe9efca-ce0e-4fb2-974d-c293416b1200', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fe9efca-ce0e-4fb2-974d-c293416b1200')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$airbrake$q$, $q$Airbrake$q$, $q$https://airbrake.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb0cca2e-8d1d-40a3-9f8a-327f674804be', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$glitchtip$q$, $q$GlitchTip$q$, $q$https://glitchtip.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$errbit$q$, $q$Errbit$q$, $q$https://errbit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3338502d-27fe-428c-9b82-985f4f0a73b4', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3338502d-27fe-428c-9b82-985f4f0a73b4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$openobserve$q$, $q$OpenObserve$q$, $q$https://openobserve.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22369d03-3beb-4c3b-bad9-983dd3069db4', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22369d03-3beb-4c3b-bad9-983dd3069db4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$uptrace$q$, $q$Uptrace$q$, $q$https://uptrace.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7a0b53e-f0d9-4f9d-ac95-70d431887088', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7a0b53e-f0d9-4f9d-ac95-70d431887088')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$hyperdx$q$, $q$HyperDX$q$, $q$https://www.hyperdx.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd0fed099-679d-4702-a509-fbb8a5115476', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd0fed099-679d-4702-a509-fbb8a5115476')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf9eca67-94ed-473e-92ff-8af4c2a5e735', $q$logtail$q$, $q$Logtail$q$, $q$https://betterstack.com/logs$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf9eca67-94ed-473e-92ff-8af4c2a5e735', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf9eca67-94ed-473e-92ff-8af4c2a5e735')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$crowdsec$q$, $q$CrowdSec$q$, $q$https://www.crowdsec.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '521d7edd-be93-4cc5-b678-97bf55389e62', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '521d7edd-be93-4cc5-b678-97bf55389e62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$wazuh$q$, $q$Wazuh$q$, $q$https://wazuh.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e60f5b02-2824-43ca-a32f-0fbe7c20da50', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$security-onion$q$, $q$Security Onion$q$, $q$https://securityonionsolutions.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e225ae3-f536-4753-a9dd-77c8187545ca', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e225ae3-f536-4753-a9dd-77c8187545ca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$falco$q$, $q$Falco$q$, $q$https://falco.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '07f5df46-0b11-4627-b5f3-78e1a12e546e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07f5df46-0b11-4627-b5f3-78e1a12e546e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$trivy$q$, $q$Trivy$q$, $q$https://trivy.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$grype$q$, $q$Grype$q$, $q$https://github.com/anchore/grype$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b665ac9-1776-455f-ad7c-c82e3c8843e9', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$syft$q$, $q$Syft$q$, $q$https://github.com/anchore/syft$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c83d263-30f5-472f-9408-4e9883759bcd', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c83d263-30f5-472f-9408-4e9883759bcd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$clair$q$, $q$Clair$q$, $q$https://quay.github.io/clair$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'caec6253-7f1b-408d-968e-1099f0367648', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caec6253-7f1b-408d-968e-1099f0367648')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$openvas$q$, $q$OpenVAS$q$, $q$https://www.openvas.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d037963-f9fb-4d88-bcc4-228a333d83cf', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d037963-f9fb-4d88-bcc4-228a333d83cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$greenbone$q$, $q$Greenbone$q$, $q$https://www.greenbone.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$nuclei$q$, $q$Nuclei$q$, $q$https://nuclei.projectdiscovery.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$burp-suite$q$, $q$Burp Suite$q$, $q$https://portswigger.net/burp$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '753226c3-cede-4bbb-9fad-9d73dd9827e4', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '753226c3-cede-4bbb-9fad-9d73dd9827e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$owasp-zap$q$, $q$OWASP ZAP$q$, $q$https://www.zaproxy.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26fa7763-662c-4590-abb7-062fe17b309e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26fa7763-662c-4590-abb7-062fe17b309e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$mend-io$q$, $q$Mend.io$q$, $q$https://www.mend.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c102b52-3adb-4485-b65a-2b1065f9aa19', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c102b52-3adb-4485-b65a-2b1065f9aa19')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$sonarqube$q$, $q$SonarQube$q$, $q$https://www.sonarsource.com/products/sonarqube$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6ee2d4f-e582-42ed-987a-7a8f22539693', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$checkmarx$q$, $q$Checkmarx$q$, $q$https://checkmarx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$veracode$q$, $q$Veracode$q$, $q$https://www.veracode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96409439-bd37-456a-bd67-52a51e831b1e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96409439-bd37-456a-bd67-52a51e831b1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$gitleaks$q$, $q$Gitleaks$q$, $q$https://gitleaks.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0db8e4b7-3129-43e3-bd36-cff6d52f51bc', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0db8e4b7-3129-43e3-bd36-cff6d52f51bc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$trufflehog$q$, $q$TruffleHog$q$, $q$https://trufflesecurity.com/trufflehog$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c90a97bd-ed6e-4be5-a516-b67be914e3cd', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$akeyless$q$, $q$Akeyless$q$, $q$https://www.akeyless.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$hashicorp-vault$q$, $q$HashiCorp Vault$q$, $q$https://www.vaultproject.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bf2641e-776f-49ba-814c-30d9468c54c8', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bf2641e-776f-49ba-814c-30d9468c54c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$1password-secrets-automation$q$, $q$1Password Secrets Automation$q$, $q$https://developer.1password.com/docs/secrets-automation$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae78ea6a-31f8-4642-9dd7-797047244d47', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae78ea6a-31f8-4642-9dd7-797047244d47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$passbolt$q$, $q$Passbolt$q$, $q$https://www.passbolt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a88a88b-6d60-45fe-acbd-4156c50580ba', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a88a88b-6d60-45fe-acbd-4156c50580ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$psono$q$, $q$Psono$q$, $q$https://psono.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86d1b99d-d37d-41bd-92c8-594e4d8c5d07', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$padloc$q$, $q$Padloc$q$, $q$https://padloc.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e2954a02-620d-4992-b4df-7f9f14891142', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2954a02-620d-4992-b4df-7f9f14891142')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$keeweb$q$, $q$KeeWeb$q$, $q$https://keeweb.info$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$vaultwarden$q$, $q$Vaultwarden$q$, $q$https://github.com/dani-garcia/vaultwarden$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72bf9a68-6a9a-4412-9612-8de0644c372e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72bf9a68-6a9a-4412-9612-8de0644c372e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$authentik$q$, $q$Authentik$q$, $q$https://goauthentik.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79882661-bae5-49ff-b255-e4b3a8eb0fb9', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$zitadel$q$, $q$Zitadel$q$, $q$https://zitadel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69d914d3-8667-4dc1-83ca-010c75550ec9', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69d914d3-8667-4dc1-83ca-010c75550ec9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$fusionauth$q$, $q$FusionAuth$q$, $q$https://fusionauth.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53f62fac-4ecb-4373-8264-0094d3faebee', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53f62fac-4ecb-4373-8264-0094d3faebee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$keycloak$q$, $q$Keycloak$q$, $q$https://www.keycloak.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$supertokens$q$, $q$SuperTokens$q$, $q$https://supertokens.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a5bd012-2f3f-4dff-ab18-daad2501a4b0', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$ory$q$, $q$Ory$q$, $q$https://www.ory.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f21e8c47-9727-46e1-8769-b1874bae4d03', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f21e8c47-9727-46e1-8769-b1874bae4d03')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$cerbos$q$, $q$Cerbos$q$, $q$https://www.cerbos.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '62db09f8-596e-4759-92a2-df735f8464c1', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62db09f8-596e-4759-92a2-df735f8464c1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$permit-io$q$, $q$Permit.io$q$, $q$https://www.permit.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d826762-9d50-46fb-93f2-f3db167ecdd7', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d826762-9d50-46fb-93f2-f3db167ecdd7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('daf48211-2666-4915-ade5-f918f2d8b847', $q$aserto$q$, $q$Aserto$q$, $q$https://www.aserto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'daf48211-2666-4915-ade5-f918f2d8b847', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daf48211-2666-4915-ade5-f918f2d8b847')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$openfga$q$, $q$OpenFGA$q$, $q$https://openfga.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '801862d9-7d0d-4545-aa0d-0e249ca2ab37', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$spicedb$q$, $q$SpiceDB$q$, $q$https://authzed.com/spicedb$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ce745a19-20cd-4b81-bc11-a6593524a8d1', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0206b22-b8e1-4aea-b694-687c1d876d1b', $q$boxyhq$q$, $q$BoxyHQ$q$, $q$https://boxyhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0206b22-b8e1-4aea-b694-687c1d876d1b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0206b22-b8e1-4aea-b694-687c1d876d1b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$workos$q$, $q$WorkOS$q$, $q$https://workos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3455877b-59ac-4ce9-8371-d5101e680c67', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3455877b-59ac-4ce9-8371-d5101e680c67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$stytch$q$, $q$Stytch$q$, $q$https://stytch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2b01301f-20d2-49a2-a9d0-dfcb07a99c20', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$descope$q$, $q$Descope$q$, $q$https://www.descope.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$kinde$q$, $q$Kinde$q$, $q$https://kinde.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0d7e15c-04f7-4a2d-9419-58dab06d3af3', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0d7e15c-04f7-4a2d-9419-58dab06d3af3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$clerk$q$, $q$Clerk$q$, $q$https://clerk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84902cee-488e-4583-aad3-f2fbf318cb9e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84902cee-488e-4583-aad3-f2fbf318cb9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$logto$q$, $q$Logto$q$, $q$https://logto.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0668898-096e-49d0-a80e-31cce8d69397', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0668898-096e-49d0-a80e-31cce8d69397')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$hanko$q$, $q$Hanko$q$, $q$https://www.hanko.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7124bf7-efbe-423b-8a94-15a5db73d353', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7124bf7-efbe-423b-8a94-15a5db73d353')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$corbado$q$, $q$Corbado$q$, $q$https://www.corbado.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '62db571f-582a-43e0-9f5f-3cf4413ae59a', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62db571f-582a-43e0-9f5f-3cf4413ae59a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$frontegg$q$, $q$Frontegg$q$, $q$https://frontegg.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5eaaad6-9ac2-4633-a29e-68531875f434', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5eaaad6-9ac2-4633-a29e-68531875f434')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$slashid$q$, $q$SlashID$q$, $q$https://www.slashid.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d1eff7c-0366-4a72-af49-95cd19369f3b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d1eff7c-0366-4a72-af49-95cd19369f3b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$scalekit$q$, $q$Scalekit$q$, $q$https://www.scalekit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f089f3d0-931d-41ab-b83c-765e387a247e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f089f3d0-931d-41ab-b83c-765e387a247e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$propelauth$q$, $q$PropelAuth$q$, $q$https://www.propelauth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '789f97be-c510-457a-8f6f-591187e6b959', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '789f97be-c510-457a-8f6f-591187e6b959')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$casdoor$q$, $q$Casdoor$q$, $q$https://casdoor.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '698be4be-d4e5-4e9b-8413-12a637e83e7c', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '698be4be-d4e5-4e9b-8413-12a637e83e7c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$opensign$q$, $q$OpenSign$q$, $q$https://www.opensignlabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b92e33a-9ce9-4f11-bf8a-c6758fc2237c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$documenso$q$, $q$Documenso$q$, $q$https://documenso.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4da77cfa-32ce-403c-8b98-4e1620167573', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4da77cfa-32ce-403c-8b98-4e1620167573')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$docuseal$q$, $q$Docuseal$q$, $q$https://www.docuseal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fed2af81-3cbf-403c-8135-b548f382e7ac', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fed2af81-3cbf-403c-8135-b548f382e7ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$boldsign$q$, $q$BoldSign$q$, $q$https://boldsign.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de8338ea-b5f1-466f-9506-f229d3f662f7', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de8338ea-b5f1-466f-9506-f229d3f662f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$signwell$q$, $q$SignWell$q$, $q$https://www.signwell.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '082213b2-ced8-444a-8548-3b973c136452', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '082213b2-ced8-444a-8548-3b973c136452')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$signrequest$q$, $q$SignRequest$q$, $q$https://signrequest.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fede56b3-f85c-4052-aeaf-1ba74f7f371f', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fede56b3-f85c-4052-aeaf-1ba74f7f371f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5b2b745-3c35-43ca-b42a-63a3a29daf34', $q$yousign$q$, $q$Yousign$q$, $q$https://yousign.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5b2b745-3c35-43ca-b42a-63a3a29daf34', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b2b745-3c35-43ca-b42a-63a3a29daf34')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$oneflow$q$, $q$Oneflow$q$, $q$https://oneflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5508cca3-5bae-43ef-99a9-12d8e8bc4e09', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5508cca3-5bae-43ef-99a9-12d8e8bc4e09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$scrive$q$, $q$Scrive$q$, $q$https://www.scrive.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '285c3bc6-63b3-46e5-8de1-99baa6d03c1f', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '285c3bc6-63b3-46e5-8de1-99baa6d03c1f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$penneo$q$, $q$Penneo$q$, $q$https://penneo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d258a01-ef39-4b35-84fd-1f22985df12e', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d258a01-ef39-4b35-84fd-1f22985df12e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$concord$q$, $q$Concord$q$, $q$https://www.concordnow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a0f2d3b-c073-4fa4-9c50-2b0847121c18', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a0f2d3b-c073-4fa4-9c50-2b0847121c18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$juro$q$, $q$Juro$q$, $q$https://juro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3138f4f-7b47-4597-bf67-8ea806a1edd0', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3138f4f-7b47-4597-bf67-8ea806a1edd0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$linksquares$q$, $q$LinkSquares$q$, $q$https://linksquares.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95bdcbb9-6021-42d0-a5e2-e06607c0d49b', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95bdcbb9-6021-42d0-a5e2-e06607c0d49b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$spotdraft$q$, $q$SpotDraft$q$, $q$https://www.spotdraft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e12cbfc9-d246-4893-93a6-78ac5fffa567', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e12cbfc9-d246-4893-93a6-78ac5fffa567')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$contractbook$q$, $q$Contractbook$q$, $q$https://contractbook.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2ccb15e-37d0-481d-a412-ddf5ab66d3dc', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2ccb15e-37d0-481d-a412-ddf5ab66d3dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$sirion$q$, $q$Sirion$q$, $q$https://www.sirion.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8023eebe-e18e-4b41-9174-8eede636edf1', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8023eebe-e18e-4b41-9174-8eede636edf1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$icertis$q$, $q$Icertis$q$, $q$https://www.icertis.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b1e19ecc-4775-4332-8779-84e45195b570', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1e19ecc-4775-4332-8779-84e45195b570')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$agiloft$q$, $q$Agiloft$q$, $q$https://www.agiloft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79e7a68c-5b55-4efb-8ebc-7627e27d0ded', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$evisort$q$, $q$Evisort$q$, $q$https://www.evisort.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57b9a346-5643-4807-89c0-802cddc8a87c', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57b9a346-5643-4807-89c0-802cddc8a87c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$lexion$q$, $q$Lexion$q$, $q$https://www.lexion.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dcb87420-fbd7-430c-9df6-534d57e84b61', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcb87420-fbd7-430c-9df6-534d57e84b61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$robin-ai$q$, $q$Robin AI$q$, $q$https://www.robinai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb49326f-7c73-43d6-b58a-39f713485eed', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb49326f-7c73-43d6-b58a-39f713485eed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$spellbook$q$, $q$Spellbook$q$, $q$https://www.spellbook.legal$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4518f944-7168-437d-a54e-83df3dc6c03e', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4518f944-7168-437d-a54e-83df3dc6c03e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$harvey$q$, $q$Harvey$q$, $q$https://www.harvey.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27da3ffe-16ca-4435-8f4c-af4532ecfbcd', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$filevine$q$, $q$Filevine$q$, $q$https://www.filevine.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '15c3e1d1-3978-4b9a-82fd-8517048b2955', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15c3e1d1-3978-4b9a-82fd-8517048b2955')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$litify$q$, $q$Litify$q$, $q$https://www.litify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc263e36-ce97-42d4-be53-04c312ae1484', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc263e36-ce97-42d4-be53-04c312ae1484')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$cosmolex$q$, $q$CosmoLex$q$, $q$https://www.cosmolex.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cee2123f-c1f7-4345-90bb-fd1586f42fd7', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$timesolv$q$, $q$TimeSolv$q$, $q$https://www.timesolv.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a06b1be4-eb20-4b50-a730-a18c95839a81', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06b1be4-eb20-4b50-a730-a18c95839a81')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$bill4time$q$, $q$Bill4Time$q$, $q$https://www.bill4time.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20f8795e-e405-44d9-8790-07ffa387bbf6', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20f8795e-e405-44d9-8790-07ffa387bbf6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4504bbf9-9763-4106-8ef1-3bb5ef09eec3', $q$centerbase$q$, $q$Centerbase$q$, $q$https://centerbase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4504bbf9-9763-4106-8ef1-3bb5ef09eec3', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4504bbf9-9763-4106-8ef1-3bb5ef09eec3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$actionstep$q$, $q$Actionstep$q$, $q$https://www.actionstep.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83af1af4-6221-4015-833c-810c8bd8d57f', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83af1af4-6221-4015-833c-810c8bd8d57f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$casepeer$q$, $q$CASEpeer$q$, $q$https://www.casepeer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2daef1f5-cac7-42ef-aa09-bc9e2945a78a', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2daef1f5-cac7-42ef-aa09-bc9e2945a78a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$cloudlex$q$, $q$CloudLex$q$, $q$https://www.cloudlex.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '963e1b92-071f-415e-9b5e-38f557ab5057', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '963e1b92-071f-415e-9b5e-38f557ab5057')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$everlaw$q$, $q$Everlaw$q$, $q$https://www.everlaw.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2ca87f00-e097-436b-b238-146a0f31af0e', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ca87f00-e097-436b-b238-146a0f31af0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$relativityone$q$, $q$RelativityOne$q$, $q$https://www.relativity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b59bfb3-5ea0-4d33-92fe-b141944faacf', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$logikcull$q$, $q$Logikcull$q$, $q$https://www.logikcull.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '440d249d-d889-40ff-bcf3-14b8168ba59e', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '440d249d-d889-40ff-bcf3-14b8168ba59e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$disco$q$, $q$DISCO$q$, $q$https://csdisco.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '046d5368-1873-461f-9ac4-29a6afeb6d0a', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '046d5368-1873-461f-9ac4-29a6afeb6d0a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$reveal$q$, $q$Reveal$q$, $q$https://www.revealdata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f433b75-2930-48b2-9563-119f142dab72', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f433b75-2930-48b2-9563-119f142dab72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$nextpoint$q$, $q$Nextpoint$q$, $q$https://www.nextpoint.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b84747d-9c0b-41c9-af25-ea0cdbd81392', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00255f96-7650-4ae5-b57c-6b941447ffcc', $q$therapynotes$q$, $q$TherapyNotes$q$, $q$https://www.therapynotes.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00255f96-7650-4ae5-b57c-6b941447ffcc', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00255f96-7650-4ae5-b57c-6b941447ffcc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$theranest$q$, $q$TheraNest$q$, $q$https://theranest.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5fbb1de8-79fd-408f-ab12-959b5b74f712', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fbb1de8-79fd-408f-ab12-959b5b74f712')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$jane-app$q$, $q$Jane App$q$, $q$https://jane.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e495d174-9d89-4a75-aaca-d48d89a2581f', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e495d174-9d89-4a75-aaca-d48d89a2581f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06b89e1b-945d-45ca-a596-cd703e666e95', $q$kareo$q$, $q$Kareo$q$, $q$https://www.kareo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06b89e1b-945d-45ca-a596-cd703e666e95', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06b89e1b-945d-45ca-a596-cd703e666e95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('baefb679-ec89-4479-9664-e5f0cd704e8b', $q$zocdoc$q$, $q$Zocdoc$q$, $q$https://www.zocdoc.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'baefb679-ec89-4479-9664-e5f0cd704e8b', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'baefb679-ec89-4479-9664-e5f0cd704e8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$doctolib$q$, $q$Doctolib$q$, $q$https://www.doctolib.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3824531-7fee-4eb7-9d43-f3de065cb703', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3824531-7fee-4eb7-9d43-f3de065cb703')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$cliniko$q$, $q$Cliniko$q$, $q$https://www.cliniko.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$pabau$q$, $q$Pabau$q$, $q$https://pabau.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6bb22d65-1575-461a-bfe4-728c9cfb68cf', $q$power-diary$q$, $q$Power Diary$q$, $q$https://www.powerdiary.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6bb22d65-1575-461a-bfe4-728c9cfb68cf', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bb22d65-1575-461a-bfe4-728c9cfb68cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$carepatron$q$, $q$Carepatron$q$, $q$https://www.carepatron.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff4be8dd-9512-4070-826b-f8b412c8fa01', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$healthie$q$, $q$Healthie$q$, $q$https://www.gethealthie.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ca5d5be-9880-4ce7-94dd-56ab90d70f72', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$practice-better$q$, $q$Practice Better$q$, $q$https://practicebetter.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d1c8fab-760d-491b-9864-dafede147c46', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d1c8fab-760d-491b-9864-dafede147c46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$nutrium$q$, $q$Nutrium$q$, $q$https://nutrium.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c10d8d2-81ae-4c01-b041-bf40e0c15cf4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$halaxy$q$, $q$Halaxy$q$, $q$https://www.halaxy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fddf95b3-6124-4cb3-8919-8d1df1119657', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fddf95b3-6124-4cb3-8919-8d1df1119657')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$spruce-health$q$, $q$Spruce Health$q$, $q$https://sprucehealth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1de08da2-3fe6-4896-9da1-03448621c680', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1de08da2-3fe6-4896-9da1-03448621c680')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$ohmd$q$, $q$OhMD$q$, $q$https://www.ohmd.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0827d2c4-33ac-4c46-a57f-b360cc0f698b', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71a56f1d-a4f4-4480-9c66-e4602baa4d1a', $q$klara$q$, $q$Klara$q$, $q$https://www.klara.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71a56f1d-a4f4-4480-9c66-e4602baa4d1a', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71a56f1d-a4f4-4480-9c66-e4602baa4d1a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$luma-health$q$, $q$Luma Health$q$, $q$https://www.lumahealth.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$artera$q$, $q$Artera$q$, $q$https://artera.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea7c3712-bfdd-4d8d-b737-f0af4c024576', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$weave$q$, $q$Weave$q$, $q$https://www.getweave.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '122093a2-2cf8-46b9-8fcf-07070f5d37e2', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$birdeye$q$, $q$Birdeye$q$, $q$https://birdeye.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96e7ec06-f2ec-4702-94ef-ddc083739f48', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96e7ec06-f2ec-4702-94ef-ddc083739f48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$reputation$q$, $q$Reputation$q$, $q$https://reputation.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69e9043e-430d-4fc5-97c8-fc58de34946f', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69e9043e-430d-4fc5-97c8-fc58de34946f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$reviewtrackers$q$, $q$ReviewTrackers$q$, $q$https://www.reviewtrackers.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '39c68560-090d-4a39-b278-5e450024c11c', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39c68560-090d-4a39-b278-5e450024c11c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$gatherup$q$, $q$GatherUp$q$, $q$https://gatherup.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb4b68ba-b4d4-4c0f-8fd7-b849bda16445')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$grade-us$q$, $q$Grade.us$q$, $q$https://www.grade.us$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b1a03e2a-1f45-466c-a273-8c8ac39242e0', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1a03e2a-1f45-466c-a273-8c8ac39242e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$nicejob$q$, $q$NiceJob$q$, $q$https://get.nicejob.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$broadly$q$, $q$Broadly$q$, $q$https://broadly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6724785a-7009-4bc5-a8a9-4314ca7e5d4f', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6724785a-7009-4bc5-a8a9-4314ca7e5d4f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$soci$q$, $q$SOCi$q$, $q$https://www.meetsoci.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$yext$q$, $q$Yext$q$, $q$https://www.yext.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e37c82e0-4240-4f11-9aae-4a179e6cd032', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e37c82e0-4240-4f11-9aae-4a179e6cd032')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$uberall$q$, $q$Uberall$q$, $q$https://uberall.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9771ecf-9807-4fa4-832a-c7fb0c45e484', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$synup$q$, $q$Synup$q$, $q$https://www.synup.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad9d61a8-318e-41aa-b413-59187e3567de', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad9d61a8-318e-41aa-b413-59187e3567de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$brightlocal$q$, $q$BrightLocal$q$, $q$https://www.brightlocal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05db3079-f16d-4821-84d1-93a68b767ea8', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05db3079-f16d-4821-84d1-93a68b767ea8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$whitespark$q$, $q$Whitespark$q$, $q$https://whitespark.ca$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab7eacb8-b8b0-4ec2-9930-7d165f43051c', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab7eacb8-b8b0-4ec2-9930-7d165f43051c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$local-falcon$q$, $q$Local Falcon$q$, $q$https://www.localfalcon.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f3bfd847-c715-4e81-938c-aaa0b4445e79', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$places-scout$q$, $q$Places Scout$q$, $q$https://www.placesscout.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48120309-810d-426d-85b1-0cc890be92d9', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48120309-810d-426d-85b1-0cc890be92d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$georanker$q$, $q$GeoRanker$q$, $q$https://www.georanker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5f976254-fda1-4e80-a22f-8c5674b5c9b6', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$localo$q$, $q$Localo$q$, $q$https://localo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41237a9a-e783-4b00-96f5-d87ac34a53d1', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41237a9a-e783-4b00-96f5-d87ac34a53d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$grid-my-business$q$, $q$Grid My Business$q$, $q$https://gridmybusiness.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'db5079b7-d737-4eb2-99fe-040725cc7508', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db5079b7-d737-4eb2-99fe-040725cc7508')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$merchynt$q$, $q$Merchynt$q$, $q$https://www.merchynt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b0618a9-c067-473b-869a-3d9864cb6eda', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b0618a9-c067-473b-869a-3d9864cb6eda')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$chatmeter$q$, $q$Chatmeter$q$, $q$https://www.chatmeter.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0be2db6b-44c2-4d2c-bc3d-01cd84786d78', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0be2db6b-44c2-4d2c-bc3d-01cd84786d78')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$rio-seo$q$, $q$Rio SEO$q$, $q$https://www.rioseo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b222011-bf30-40f8-a823-ef6029be8ff5', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b222011-bf30-40f8-a823-ef6029be8ff5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$marqii$q$, $q$Marqii$q$, $q$https://www.marqii.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd376b9a-76da-4d57-99b7-dede36f6af47', '8528fb60-d454-4bd7-badc-5d06c8a47095', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd376b9a-76da-4d57-99b7-dede36f6af47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$owner-com$q$, $q$Owner.com$q$, $q$https://www.owner.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af3ba62b-b530-4e1a-9d87-543bbbe2cc25', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af3ba62b-b530-4e1a-9d87-543bbbe2cc25')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$toast-tables$q$, $q$Toast Tables$q$, $q$https://pos.toasttab.com/products/toast-tables$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a648195-23d1-462c-80b6-a9d18bdb505a', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a648195-23d1-462c-80b6-a9d18bdb505a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$sevenrooms$q$, $q$SevenRooms$q$, $q$https://sevenrooms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d77d287-461d-4b2b-b185-9fa78b3a2e55', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$opentable$q$, $q$OpenTable$q$, $q$https://www.opentable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae9d7434-92d8-4d57-91cd-e0572dbd91d6', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae9d7434-92d8-4d57-91cd-e0572dbd91d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$resy$q$, $q$Resy$q$, $q$https://resy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de627a61-90d5-4b28-8678-2d3f4251e213', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de627a61-90d5-4b28-8678-2d3f4251e213')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$tock$q$, $q$Tock$q$, $q$https://www.exploretock.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b848b09-87f9-4b49-ae0b-1296d600f752', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b848b09-87f9-4b49-ae0b-1296d600f752')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$eat-app$q$, $q$Eat App$q$, $q$https://restaurant.eatapp.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '58340ae3-bb72-49c9-8eb1-38e05b4918b4', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '58340ae3-bb72-49c9-8eb1-38e05b4918b4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$tablein$q$, $q$Tablein$q$, $q$https://www.tablein.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c81486a4-91b4-43a3-938b-cb4a8e444d88', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c81486a4-91b4-43a3-938b-cb4a8e444d88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28ff458a-dcea-455d-938b-9fb1327451b1', $q$quandoo$q$, $q$Quandoo$q$, $q$https://www.quandoo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28ff458a-dcea-455d-938b-9fb1327451b1', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28ff458a-dcea-455d-938b-9fb1327451b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$thefork-manager$q$, $q$TheFork Manager$q$, $q$https://www.theforkmanager.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd454fe2-fd4b-4e4f-9816-8a9c32182617', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd454fe2-fd4b-4e4f-9816-8a9c32182617')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$lightspeed-restaurant$q$, $q$Lightspeed Restaurant$q$, $q$https://www.lightspeedhq.com/pos/restaurant$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ed66bad-7bcf-4b57-a6f5-992c5dbb3327')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$lavu$q$, $q$Lavu$q$, $q$https://lavu.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa214254-dedb-418f-829f-a286a6fdbeb5', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa214254-dedb-418f-829f-a286a6fdbeb5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$gotab$q$, $q$GoTab$q$, $q$https://gotab.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a57ea53a-5e59-4850-be73-20f61d1184e1', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a57ea53a-5e59-4850-be73-20f61d1184e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9ea6dbd-ab88-43fc-9a5e-d9bb062380a2', $q$upserve$q$, $q$Upserve$q$, $q$https://upserve.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9ea6dbd-ab88-43fc-9a5e-d9bb062380a2', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9ea6dbd-ab88-43fc-9a5e-d9bb062380a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$marginedge$q$, $q$MarginEdge$q$, $q$https://www.marginedge.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'adae3e2d-9b36-4cc0-8d29-a710afd0f677', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adae3e2d-9b36-4cc0-8d29-a710afd0f677')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$marketman$q$, $q$MarketMan$q$, $q$https://www.marketman.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$restaurant365$q$, $q$Restaurant365$q$, $q$https://www.restaurant365.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9db567bc-79c1-40cb-a4a7-632f1cdc6fde', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9db567bc-79c1-40cb-a4a7-632f1cdc6fde')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$craftable$q$, $q$Craftable$q$, $q$https://craftable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b5712ae-a2d8-4a37-a333-309ad689655d', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b5712ae-a2d8-4a37-a333-309ad689655d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$apicbase$q$, $q$Apicbase$q$, $q$https://get.apicbase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1735b50-6d47-4686-933f-7e0edb8f7d21', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$meez$q$, $q$Meez$q$, $q$https://www.getmeez.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6cf21005-e4bd-49c2-a890-817f14482aab', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6cf21005-e4bd-49c2-a890-817f14482aab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$galley$q$, $q$Galley$q$, $q$https://www.galleysolutions.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '81547fe6-0936-48d6-be6a-e999e7dcc1ec', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81547fe6-0936-48d6-be6a-e999e7dcc1ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$choco$q$, $q$Choco$q$, $q$https://choco.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$bluecart$q$, $q$BlueCart$q$, $q$https://www.bluecart.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c1947c7c-e691-4991-bc52-01c2627b4ff1', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1947c7c-e691-4991-bc52-01c2627b4ff1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$order-co$q$, $q$Order.co$q$, $q$https://www.order.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a442a095-0271-47c3-9bde-0e4be198b2c6', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a442a095-0271-47c3-9bde-0e4be198b2c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$precoro$q$, $q$Precoro$q$, $q$https://precoro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b529879-d2eb-436f-9583-eb2ecac8f8c7', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b529879-d2eb-436f-9583-eb2ecac8f8c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$procurify$q$, $q$Procurify$q$, $q$https://www.procurify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c43b72a7-6804-4129-86f6-0b65715b2b9b', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c43b72a7-6804-4129-86f6-0b65715b2b9b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$tradogram$q$, $q$Tradogram$q$, $q$https://www.tradogram.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f5fd302-9cde-4c0c-9ce1-23c0223b163f', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f5fd302-9cde-4c0c-9ce1-23c0223b163f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$zip$q$, $q$Zip$q$, $q$https://ziphq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0302fe96-81fa-4f14-b5ac-8414fede5b87', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0302fe96-81fa-4f14-b5ac-8414fede5b87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$vendr$q$, $q$Vendr$q$, $q$https://www.vendr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47c26ff2-e8f9-4fe3-9718-d79f6a0f9407')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$tropic$q$, $q$Tropic$q$, $q$https://www.tropicapp.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$sastrify$q$, $q$Sastrify$q$, $q$https://www.sastrify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a1fdc49-4c8e-46b7-aa0e-d428cafa9212')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$vertice$q$, $q$Vertice$q$, $q$https://www.vertice.one$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe', '4cae9914-301b-46ed-8ed5-f254e1406452', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$payem$q$, $q$PayEm$q$, $q$https://www.payem.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$soldo$q$, $q$Soldo$q$, $q$https://www.soldo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$found$q$, $q$Found$q$, $q$https://found.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22c9265b-8d90-4eb5-973c-a18df96a2516', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22c9265b-8d90-4eb5-973c-a18df96a2516')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$lili$q$, $q$Lili$q$, $q$https://lili.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a9a8cf9-4012-4a32-af0c-34784bc34030', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a9a8cf9-4012-4a32-af0c-34784bc34030')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b324175-a7cb-4029-86d5-3cab4828ebe4', $q$north-one$q$, $q$North One$q$, $q$https://www.northone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b324175-a7cb-4029-86d5-3cab4828ebe4', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b324175-a7cb-4029-86d5-3cab4828ebe4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$bluevine$q$, $q$Bluevine$q$, $q$https://www.bluevine.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e483d96-1e11-493c-b7e9-c3b377066d91', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e483d96-1e11-493c-b7e9-c3b377066d91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$arc$q$, $q$Arc$q$, $q$https://arc.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b1475af-f4bc-459d-ac77-e29162361ec3', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b1475af-f4bc-459d-ac77-e29162361ec3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$pipe$q$, $q$Pipe$q$, $q$https://pipe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61d2abfe-020b-44ad-8493-bab43284c852', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61d2abfe-020b-44ad-8493-bab43284c852')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$capchase$q$, $q$Capchase$q$, $q$https://www.capchase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53147b31-f2fc-40d8-abf5-b79accdf962a', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53147b31-f2fc-40d8-abf5-b79accdf962a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$founderpath$q$, $q$Founderpath$q$, $q$https://founderpath.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '806674db-f3e6-419b-a6a4-aa3e4199d96e', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '806674db-f3e6-419b-a6a4-aa3e4199d96e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d4e8ad2-0a77-49b7-a93f-86b5b0d11355', $q$boopos$q$, $q$Boopos$q$, $q$https://boopos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d4e8ad2-0a77-49b7-a93f-86b5b0d11355', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d4e8ad2-0a77-49b7-a93f-86b5b0d11355')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$clearco$q$, $q$Clearco$q$, $q$https://clear.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dadc676c-ec7c-4645-a7c6-759360a99282', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dadc676c-ec7c-4645-a7c6-759360a99282')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$numeral$q$, $q$Numeral$q$, $q$https://www.numeral.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c9efa528-a016-40bf-b672-db270aa7c09d', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9efa528-a016-40bf-b672-db270aa7c09d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$anrok$q$, $q$Anrok$q$, $q$https://www.anrok.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06b10ebd-3c73-4f10-9bef-ad204412b1f3', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$zamp$q$, $q$Zamp$q$, $q$https://zamp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca461870-55b1-4c9b-a8d8-8006576315c0', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca461870-55b1-4c9b-a8d8-8006576315c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$taxjar$q$, $q$TaxJar$q$, $q$https://www.taxjar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '12d24fe7-48a0-44d8-984c-abefbbe5363a', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12d24fe7-48a0-44d8-984c-abefbbe5363a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$avalara$q$, $q$Avalara$q$, $q$https://www.avalara.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e671dda-5728-40ae-ba4d-0e752a749848', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e671dda-5728-40ae-ba4d-0e752a749848')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$quaderno$q$, $q$Quaderno$q$, $q$https://quaderno.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3daa81ad-63b3-4469-9a34-5214e31502af', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3daa81ad-63b3-4469-9a34-5214e31502af')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$fonoa$q$, $q$Fonoa$q$, $q$https://www.fonoa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3cfd8357-fdc8-4d45-99e4-e5c8d322206d', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61a24175-f779-457b-81b7-e8e401c75867', $q$kintsugi-tax$q$, $q$Kintsugi Tax$q$, $q$https://kintsugi.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61a24175-f779-457b-81b7-e8e401c75867', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61a24175-f779-457b-81b7-e8e401c75867')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$lago$q$, $q$Lago$q$, $q$https://www.getlago.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd422245-3239-421a-87c7-ef20ba5506e5', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd422245-3239-421a-87c7-ef20ba5506e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$openmeter$q$, $q$OpenMeter$q$, $q$https://openmeter.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2df1bf37-9d52-4951-9c51-d887b5e883c4', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2df1bf37-9d52-4951-9c51-d887b5e883c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$amberflo$q$, $q$Amberflo$q$, $q$https://www.amberflo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '244bf9a5-5a31-4fb4-9a33-bdfd960154d2', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$m3ter$q$, $q$m3ter$q$, $q$https://www.m3ter.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6963e7b-5db0-4f3f-a759-a0c758f52263', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$zenskar$q$, $q$Zenskar$q$, $q$https://www.zenskar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de85e666-3a6a-4ce4-b304-a77397acde17', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de85e666-3a6a-4ce4-b304-a77397acde17')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e0b38be-797c-4dda-bbd8-cffa25076218', $q$saasoptics$q$, $q$SaaSOptics$q$, $q$https://www.saasoptics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e0b38be-797c-4dda-bbd8-cffa25076218', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e0b38be-797c-4dda-bbd8-cffa25076218')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$tabs$q$, $q$Tabs$q$, $q$https://www.tabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '97ea30fd-29e7-475a-a5ab-0fa38bf0a882', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$sequence$q$, $q$Sequence$q$, $q$https://www.sequencehq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$subskribe$q$, $q$Subskribe$q$, $q$https://www.subskribe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0a76343-e065-4813-8f8c-fb490cece33b', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0a76343-e065-4813-8f8c-fb490cece33b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$ordway$q$, $q$Ordway$q$, $q$https://ordwaylabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$dealhub-cpq$q$, $q$DealHub CPQ$q$, $q$https://dealhub.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$salesbricks$q$, $q$Salesbricks$q$, $q$https://salesbricks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ba708a7-67bb-4103-86f5-6ecb278ba497', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ba708a7-67bb-4103-86f5-6ecb278ba497')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('568eb44d-bbd9-4755-b8c8-7b71d8e9489d', $q$cacheflow$q$, $q$Cacheflow$q$, $q$https://www.getcacheflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '568eb44d-bbd9-4755-b8c8-7b71d8e9489d', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '568eb44d-bbd9-4755-b8c8-7b71d8e9489d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$monetizenow$q$, $q$MonetizeNow$q$, $q$https://www.monetizenow.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba9cd538-3337-4088-b4ee-274f06f95fe4', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$nue$q$, $q$Nue$q$, $q$https://www.nue.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ec4f000a-01b3-43af-b663-6371cea0d208', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec4f000a-01b3-43af-b663-6371cea0d208')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$subskribe-cpq$q$, $q$Subskribe CPQ$q$, $q$https://www.subskribe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '989b012e-a050-497e-8c08-30d43f45ccd1', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '989b012e-a050-497e-8c08-30d43f45ccd1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$qobra$q$, $q$Qobra$q$, $q$https://www.qobra.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3a3af62-0fd4-4596-b2b3-6e071269284c', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$quotapath$q$, $q$QuotaPath$q$, $q$https://www.quotapath.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c83044af-b41e-4750-aff8-255f06855de1', $q$spiff$q$, $q$Spiff$q$, $q$https://spiff.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c83044af-b41e-4750-aff8-255f06855de1', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c83044af-b41e-4750-aff8-255f06855de1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$captivateiq$q$, $q$CaptivateIQ$q$, $q$https://www.captivateiq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '171030c2-a2f0-41bf-b969-187ee5d4f56b', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '171030c2-a2f0-41bf-b969-187ee5d4f56b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$everstage$q$, $q$Everstage$q$, $q$https://www.everstage.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '087b7f82-9397-45ec-9b2b-8507a996af85', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '087b7f82-9397-45ec-9b2b-8507a996af85')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$forma-ai$q$, $q$Forma.ai$q$, $q$https://www.forma.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd52f8727-8700-449a-a039-f5c8df0a1fe0', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$performio$q$, $q$Performio$q$, $q$https://www.performio.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bac928b-8b56-4410-b495-f9ee3e28df6b', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bac928b-8b56-4410-b495-f9ee3e28df6b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$xactly-incent$q$, $q$Xactly Incent$q$, $q$https://www.xactlycorp.com/products/incent$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be3d358d-02c4-42e2-b373-1d918d655065', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be3d358d-02c4-42e2-b373-1d918d655065')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$sales-cookie$q$, $q$Sales Cookie$q$, $q$https://salescookie.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5b12745-37b0-4202-a0e1-39121d42e60e', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b12745-37b0-4202-a0e1-39121d42e60e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$plecto$q$, $q$Plecto$q$, $q$https://www.plecto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '794737f5-a11c-4c4b-bd01-c5bd60d80316', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '794737f5-a11c-4c4b-bd01-c5bd60d80316')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$ambition$q$, $q$Ambition$q$, $q$https://ambition.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$spinify$q$, $q$Spinify$q$, $q$https://spinify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '656fe56e-f1ca-45b7-816b-0d5e43b18a06', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$salesscreen$q$, $q$SalesScreen$q$, $q$https://www.salesscreen.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$leveleleven$q$, $q$LevelEleven$q$, $q$https://leveleleven.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'db13d6f8-fa65-4d11-8578-05ad62a17ca6', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$clari$q$, $q$Clari$q$, $q$https://www.clari.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6c40226a-eb4f-4492-897b-fa93c0ac4f4c', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27fefb6a-7a24-4693-81d8-725996b762cc', $q$boostup$q$, $q$BoostUp$q$, $q$https://www.boostup.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27fefb6a-7a24-4693-81d8-725996b762cc', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27fefb6a-7a24-4693-81d8-725996b762cc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$aviso$q$, $q$Aviso$q$, $q$https://www.aviso.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e0adaa0-bc6f-4974-9a54-f5f303694cb7', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff305ade-9b90-430e-84b4-8e661e81a89a', $q$people-ai$q$, $q$People.ai$q$, $q$https://www.people.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff305ade-9b90-430e-84b4-8e661e81a89a', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff305ade-9b90-430e-84b4-8e661e81a89a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$gong$q$, $q$Gong$q$, $q$https://www.gong.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0177a50-1ba8-4919-b2dc-e93170edc86f', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$chorus-ai$q$, $q$Chorus.ai$q$, $q$https://www.zoominfo.com/products/chorus$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a2732f6-450c-43e0-9cb0-a1752605865d', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a2732f6-450c-43e0-9cb0-a1752605865d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$avoma$q$, $q$Avoma$q$, $q$https://www.avoma.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a70ed10a-92ff-4ae6-a48d-ff9752035a19', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$jiminny$q$, $q$Jiminny$q$, $q$https://jiminny.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '846a442d-c466-4a1c-ae5e-3ccb660753fb', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '846a442d-c466-4a1c-ae5e-3ccb660753fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$salesloft$q$, $q$Salesloft$q$, $q$https://salesloft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f4afdee-5f6e-4f90-abf7-5fd32937393b', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$outreach$q$, $q$Outreach$q$, $q$https://www.outreach.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7afd1993-2c5f-430d-bd16-ce044308f9b1', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7afd1993-2c5f-430d-bd16-ce044308f9b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$quickmail$q$, $q$QuickMail$q$, $q$https://quickmail.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bf18ee80-5dd1-4c12-9e38-a3430262d485', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$persistiq$q$, $q$PersistIQ$q$, $q$https://www.persistiq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$contactout$q$, $q$ContactOut$q$, $q$https://contactout.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a027b3c-fcee-43e5-9956-4c92e51917fc', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a027b3c-fcee-43e5-9956-4c92e51917fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$dropcontact$q$, $q$Dropcontact$q$, $q$https://www.dropcontact.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$fullenrich$q$, $q$FullEnrich$q$, $q$https://fullenrich.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$commsor$q$, $q$Commsor$q$, $q$https://www.commsor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f22ba73c-1e88-4f7f-a98a-953343da5e1d', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f22ba73c-1e88-4f7f-a98a-953343da5e1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d86990b5-159a-4c03-b952-68d1887a3625', $q$orbit$q$, $q$Orbit$q$, $q$https://orbit.love$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd86990b5-159a-4c03-b952-68d1887a3625', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd86990b5-159a-4c03-b952-68d1887a3625')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('995d909a-bf0a-4801-afe4-5ac7f7a520be', $q$threado$q$, $q$Threado$q$, $q$https://www.threado.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '995d909a-bf0a-4801-afe4-5ac7f7a520be', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '995d909a-bf0a-4801-afe4-5ac7f7a520be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ace10d4-d2fb-455a-9617-64239064acc6', $q$talkbase$q$, $q$Talkbase$q$, $q$https://www.talkbase.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ace10d4-d2fb-455a-9617-64239064acc6', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ace10d4-d2fb-455a-9617-64239064acc6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$bettermode$q$, $q$Bettermode$q$, $q$https://bettermode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$circle$q$, $q$Circle$q$, $q$https://circle.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80b9c68e-3f2c-4b1d-93e5-905ec8474aef', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80b9c68e-3f2c-4b1d-93e5-905ec8474aef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$mighty-networks$q$, $q$Mighty Networks$q$, $q$https://www.mightynetworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab6e1565-807c-46d0-90ce-52da6ac62e1c', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab6e1565-807c-46d0-90ce-52da6ac62e1c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$discourse$q$, $q$Discourse$q$, $q$https://www.discourse.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6b5b1e4-ac40-42b0-bab2-d22554c5ce08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6fabe7e2-5d35-419d-8d50-486f02260d5a', $q$vanilla-forums$q$, $q$Vanilla Forums$q$, $q$https://vanillaforums.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6fabe7e2-5d35-419d-8d50-486f02260d5a', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fabe7e2-5d35-419d-8d50-486f02260d5a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$hivebrite$q$, $q$Hivebrite$q$, $q$https://hivebrite.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '08901206-af95-4614-be7a-942eac7c6ae2', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08901206-af95-4614-be7a-942eac7c6ae2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf06b4d4-7d24-4cb0-92b2-0fd280491d4c', $q$mobilize$q$, $q$Mobilize$q$, $q$https://www.mobilize.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf06b4d4-7d24-4cb0-92b2-0fd280491d4c', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf06b4d4-7d24-4cb0-92b2-0fd280491d4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$higher-logic-vanilla$q$, $q$Higher Logic Vanilla$q$, $q$https://www.higherlogic.com/products/vanilla$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb2edfa9-9825-4a3e-9d74-500ef6b711a8', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb2edfa9-9825-4a3e-9d74-500ef6b711a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$khoros-communities$q$, $q$Khoros Communities$q$, $q$https://khoros.com/platform/communities$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09a7538e-340b-43e0-b19c-d39402e0b1c4', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09a7538e-340b-43e0-b19c-d39402e0b1c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c37b6e8e-c4a0-4359-948c-1359f39db6d4', $q$insided$q$, $q$inSided$q$, $q$https://www.insided.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c37b6e8e-c4a0-4359-948c-1359f39db6d4', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c37b6e8e-c4a0-4359-948c-1359f39db6d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$disciple$q$, $q$Disciple$q$, $q$https://www.disciplemedia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0754695b-69c5-4fc3-ae4a-a24cfa640353', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0754695b-69c5-4fc3-ae4a-a24cfa640353')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('556a93d8-b420-4b3f-a29f-77ac1ef26fa4', $q$tribe-community-platform$q$, $q$Tribe Community Platform$q$, $q$https://tribe.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '556a93d8-b420-4b3f-a29f-77ac1ef26fa4', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '556a93d8-b420-4b3f-a29f-77ac1ef26fa4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$skool$q$, $q$Skool$q$, $q$https://www.skool.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03467347-7168-44c1-be43-606e7826c361', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03467347-7168-44c1-be43-606e7826c361')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$heartbeat$q$, $q$Heartbeat$q$, $q$https://www.heartbeat.chat$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3fda2cde-3534-421f-9cdb-eac5fb45b0e6', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fda2cde-3534-421f-9cdb-eac5fb45b0e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$geneva$q$, $q$Geneva$q$, $q$https://www.geneva.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f060f9b6-0029-44ee-a1ce-f641464783dd', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f060f9b6-0029-44ee-a1ce-f641464783dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e4c6cda-81f7-4260-95f3-37b80caf619d', $q$peerboard$q$, $q$PeerBoard$q$, $q$https://peerboard.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e4c6cda-81f7-4260-95f3-37b80caf619d', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e4c6cda-81f7-4260-95f3-37b80caf619d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$forumbee$q$, $q$Forumbee$q$, $q$https://forumbee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e83b9e49-d147-4636-a644-73eb25d07963', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e83b9e49-d147-4636-a644-73eb25d07963')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$flarum$q$, $q$Flarum$q$, $q$https://flarum.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdf350cb-3f1d-4f22-b2fc-e83f597e6faf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$nodebb$q$, $q$NodeBB$q$, $q$https://nodebb.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8cded24f-f6e3-445f-86fb-dc2b2871d6b2', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cded24f-f6e3-445f-86fb-dc2b2871d6b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$mybb$q$, $q$MyBB$q$, $q$https://mybb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74a1d6b8-aba9-4709-96d4-eef201241dde', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74a1d6b8-aba9-4709-96d4-eef201241dde')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$phpbb$q$, $q$phpBB$q$, $q$https://www.phpbb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c103625-d77b-4769-a06c-01a9300cd28b', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c103625-d77b-4769-a06c-01a9300cd28b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$loomio$q$, $q$Loomio$q$, $q$https://www.loomio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$decidim$q$, $q$Decidim$q$, $q$https://decidim.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a37a860-0053-444d-834e-ac1979dd8720', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a37a860-0053-444d-834e-ac1979dd8720')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$polis$q$, $q$Polis$q$, $q$https://pol.is$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3dea5eed-dd33-4128-91b3-fee23cd6f46a', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3dea5eed-dd33-4128-91b3-fee23cd6f46a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$crowdcast$q$, $q$Crowdcast$q$, $q$https://www.crowdcast.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a877cfed-31d8-488b-bd3f-59adb9df9eea', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a877cfed-31d8-488b-bd3f-59adb9df9eea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$butter$q$, $q$Butter$q$, $q$https://www.butter.us$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd85d55fa-0d1c-4513-9dd7-5d0afd3835fd', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd85d55fa-0d1c-4513-9dd7-5d0afd3835fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$webinarjam$q$, $q$WebinarJam$q$, $q$https://home.webinarjam.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$everwebinar$q$, $q$EverWebinar$q$, $q$https://home.everwebinar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd87ae7b9-660c-4f9e-9f79-7e32216b89fd', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd87ae7b9-660c-4f9e-9f79-7e32216b89fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$bigmarker$q$, $q$BigMarker$q$, $q$https://www.bigmarker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2958e078-5211-4d10-8a25-a1936a3d292c', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2958e078-5211-4d10-8a25-a1936a3d292c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$airmeet$q$, $q$Airmeet$q$, $q$https://www.airmeet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$goldcast$q$, $q$Goldcast$q$, $q$https://www.goldcast.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ebccc093-34ed-4258-b26b-8a95b2400c1e', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$bizzabo$q$, $q$Bizzabo$q$, $q$https://www.bizzabo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef81f2cc-5d19-4029-abc4-98bb85afba1c', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef81f2cc-5d19-4029-abc4-98bb85afba1c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$spotme$q$, $q$SpotMe$q$, $q$https://spotme.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f78d10ab-b34b-493a-9c96-2e256f6d8c27', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f78d10ab-b34b-493a-9c96-2e256f6d8c27')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb8dc597-00ad-4ba8-baa8-e7a261b489dd', $q$hopin$q$, $q$Hopin$q$, $q$https://hopin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb8dc597-00ad-4ba8-baa8-e7a261b489dd', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb8dc597-00ad-4ba8-baa8-e7a261b489dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$whova$q$, $q$Whova$q$, $q$https://whova.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5bc7207-b92e-4b19-96fd-fdb155854d9f', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5bc7207-b92e-4b19-96fd-fdb155854d9f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$cvent$q$, $q$Cvent$q$, $q$https://www.cvent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbe1e28b-dacb-4d22-9f38-e5cc9dceeace')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$eventmobi$q$, $q$EventMobi$q$, $q$https://www.eventmobi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23d382d0-21fb-4b8d-ba10-31236baa07ed', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23d382d0-21fb-4b8d-ba10-31236baa07ed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$swapcard$q$, $q$Swapcard$q$, $q$https://www.swapcard.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$brella$q$, $q$Brella$q$, $q$https://www.brella.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe53f9a3-19f4-4579-b9ed-212212081f85', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe53f9a3-19f4-4579-b9ed-212212081f85')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$grip$q$, $q$Grip$q$, $q$https://www.grip.events$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '085a00b0-0152-462a-8236-efd96d4561c7', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '085a00b0-0152-462a-8236-efd96d4561c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$sched$q$, $q$Sched$q$, $q$https://sched.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ddaae47-3573-4276-bcc8-70bfee3048e2', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ddaae47-3573-4276-bcc8-70bfee3048e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$sessionize$q$, $q$Sessionize$q$, $q$https://sessionize.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ebd42bbd-e0eb-4348-9dec-c85d892145d6', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebd42bbd-e0eb-4348-9dec-c85d892145d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$pretalx$q$, $q$Pretalx$q$, $q$https://pretalx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$tito$q$, $q$Tito$q$, $q$https://ti.to$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a182b645-3634-449e-9ec3-d34c77f3ab09', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a182b645-3634-449e-9ec3-d34c77f3ab09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$ticket-tailor$q$, $q$Ticket Tailor$q$, $q$https://www.tickettailor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '732a7077-9f6e-449a-947d-9f0d056354b8', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '732a7077-9f6e-449a-947d-9f0d056354b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$humanitix$q$, $q$Humanitix$q$, $q$https://humanitix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$lu-ma$q$, $q$Lu.ma$q$, $q$https://lu.ma$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c973c5c5-70a6-48ab-b061-1028ca2b9440', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c973c5c5-70a6-48ab-b061-1028ca2b9440')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$partiful$q$, $q$Partiful$q$, $q$https://partiful.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b3922d4-da95-43dc-94df-57b5c18e296d', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b3922d4-da95-43dc-94df-57b5c18e296d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$zuddl$q$, $q$Zuddl$q$, $q$https://www.zuddl.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36a4b760-5ccb-4498-b325-7b29a847d7cf', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36a4b760-5ccb-4498-b325-7b29a847d7cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4691b056-1e97-4208-840d-187dff8b6d46', $q$welcome$q$, $q$Welcome$q$, $q$https://www.experiencewelcome.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4691b056-1e97-4208-840d-187dff8b6d46', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4691b056-1e97-4208-840d-187dff8b6d46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$vimeo-events$q$, $q$Vimeo Events$q$, $q$https://vimeo.com/features/virtual-events$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d990b19-e999-4c82-8ee9-31191d38d1f7', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d990b19-e999-4c82-8ee9-31191d38d1f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$streamyard$q$, $q$StreamYard$q$, $q$https://streamyard.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '805aa818-8503-43ab-bc29-2447c8f5ac0c', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '805aa818-8503-43ab-bc29-2447c8f5ac0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$riverside$q$, $q$Riverside$q$, $q$https://riverside.fm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc81b714-5cd0-41b9-8464-c9eca6e97648', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc81b714-5cd0-41b9-8464-c9eca6e97648')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$zencastr$q$, $q$Zencastr$q$, $q$https://zencastr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '55291a7c-44cc-4c8d-8410-f9af5ea79a43', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55291a7c-44cc-4c8d-8410-f9af5ea79a43')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$squadcast$q$, $q$SquadCast$q$, $q$https://squadcast.fm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c4d5d81-6ff4-4496-8867-73b2e003226f', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c4d5d81-6ff4-4496-8867-73b2e003226f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$cleanfeed$q$, $q$Cleanfeed$q$, $q$https://cleanfeed.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b313f97-5726-4dc3-822e-2919a68cf2b3', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b313f97-5726-4dc3-822e-2919a68cf2b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$boomcaster$q$, $q$Boomcaster$q$, $q$https://www.boomcaster.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '365cb646-7629-4791-a92b-ebcb79d3c233', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '365cb646-7629-4791-a92b-ebcb79d3c233')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$alitu$q$, $q$Alitu$q$, $q$https://alitu.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1273dc8b-9d1c-4cf2-8d57-e63805eee23b', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$hindenburg$q$, $q$Hindenburg$q$, $q$https://hindenburg.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bccb27f4-8fb2-457f-97ab-9ab82be7cb63', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bccb27f4-8fb2-457f-97ab-9ab82be7cb63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$transistor$q$, $q$Transistor$q$, $q$https://transistor.fm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc2d5e9c-d0f2-485e-b895-ac90c8c8411f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$captivate$q$, $q$Captivate$q$, $q$https://www.captivate.fm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$buzzsprout$q$, $q$Buzzsprout$q$, $q$https://www.buzzsprout.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '087b8581-02ae-4bfb-bac4-4d3ce7f324de', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '087b8581-02ae-4bfb-bac4-4d3ce7f324de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$podbean$q$, $q$Podbean$q$, $q$https://www.podbean.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1cfc533c-df77-4130-b1c1-cf54522f45ef', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1cfc533c-df77-4130-b1c1-cf54522f45ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$libsyn$q$, $q$Libsyn$q$, $q$https://libsyn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ceb65439-a59e-44c1-9f4f-22cf5bc366f7', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ceb65439-a59e-44c1-9f4f-22cf5bc366f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$simplecast$q$, $q$Simplecast$q$, $q$https://simplecast.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be61a68f-a190-43dc-9648-504807d5677a', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be61a68f-a190-43dc-9648-504807d5677a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$redcircle$q$, $q$RedCircle$q$, $q$https://redcircle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc9b345c-46db-4d94-b160-d1e40a0e6d6b', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc9b345c-46db-4d94-b160-d1e40a0e6d6b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$rss-com$q$, $q$RSS.com$q$, $q$https://rss.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '486dac3f-e396-4ba6-9c6e-20a5f563c673', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '486dac3f-e396-4ba6-9c6e-20a5f563c673')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$castos$q$, $q$Castos$q$, $q$https://castos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1be06e6f-80c4-4800-be23-0b5ae2f639dd', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1be06e6f-80c4-4800-be23-0b5ae2f639dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$spreaker$q$, $q$Spreaker$q$, $q$https://www.spreaker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41ee4232-5722-4e22-a602-9fdc2ae29ca2', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41ee4232-5722-4e22-a602-9fdc2ae29ca2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$megaphone$q$, $q$Megaphone$q$, $q$https://megaphone.spotify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3cef1a8-8aa7-4787-8139-49799a6367d9', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3cef1a8-8aa7-4787-8139-49799a6367d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$omny-studio$q$, $q$Omny Studio$q$, $q$https://omnystudio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '60043245-a189-4894-95be-8b1ffc4e271a', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60043245-a189-4894-95be-8b1ffc4e271a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$blubrry$q$, $q$Blubrry$q$, $q$https://blubrry.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$fusebox$q$, $q$Fusebox$q$, $q$https://fusebox.fm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb094cdf-883e-4e90-b7ee-22547256735e', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb094cdf-883e-4e90-b7ee-22547256735e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$seriously-simple-podcasting$q$, $q$Seriously Simple Podcasting$q$, $q$https://castos.com/seriously-simple-podcasting$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88430172-33f0-425e-bfc6-d920de02220c', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88430172-33f0-425e-bfc6-d920de02220c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$supercast$q$, $q$Supercast$q$, $q$https://www.supercast.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '438b1e2a-2db1-4fa1-aace-e651c95f62cf', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$CRM & Sales$q$, 1, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$CRM & Sales$q$, 2, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ad091561-b390-481a-bf66-f43ea55efb9d', $q$CRM & Sales$q$, 3, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad091561-b390-481a-bf66-f43ea55efb9d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '63ad3ef7-5046-461f-a151-5b360a08cc61', $q$CRM & Sales$q$, 4, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63ad3ef7-5046-461f-a151-5b360a08cc61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$CRM & Sales$q$, 5, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ec2fcab-82e1-40ba-a312-37feb11695e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$ERP & Business Management$q$, 6, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da85131f-6520-4e7e-b70d-0a49a665a0fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$ERP & Business Management$q$, 7, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$ERP & Business Management$q$, 8, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fac895ab-84a4-44ef-95ce-d865e6760f3c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '590b2d7a-0185-4363-87ce-75d530896404', $q$ERP & Business Management$q$, 9, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '590b2d7a-0185-4363-87ce-75d530896404')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$ERP & Business Management$q$, 10, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$ERP & Business Management$q$, 11, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e08b2a0-8365-4535-9e4d-361aee66a19f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$ERP & Business Management$q$, 12, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd896e501-64c6-49a9-a09c-ce638e9ebefe', $q$ERP & Business Management$q$, 13, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2a56d2f-1e25-421f-af5c-1494914a3095', $q$HR & Recruiting$q$, 14, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2a56d2f-1e25-421f-af5c-1494914a3095')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ef2735d-67cd-41bb-9fcf-cd6afd9dadc1', $q$HR & Recruiting$q$, 15, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ef2735d-67cd-41bb-9fcf-cd6afd9dadc1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$HR & Recruiting$q$, 16, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$HR & Recruiting$q$, 17, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '448ec905-8c58-4b0c-931b-b7bedf89db12', $q$HR & Recruiting$q$, 18, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '448ec905-8c58-4b0c-931b-b7bedf89db12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$HR & Recruiting$q$, 19, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16d7a916-ff92-4379-8cb9-06913256e22d', $q$HR & Recruiting$q$, 20, 7, 8, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16d7a916-ff92-4379-8cb9-06913256e22d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$HR & Recruiting$q$, 21, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '337159a2-d409-432a-86c7-1ec8ab203620', $q$HR & Recruiting$q$, 22, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '337159a2-d409-432a-86c7-1ec8ab203620')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$HR & Recruiting$q$, 23, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0abb883b-fe31-411e-a600-34ef2c9cdba6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4cc45ff7-31f0-4735-be09-538439350dbc', $q$HR & Recruiting$q$, 24, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cc45ff7-31f0-4735-be09-538439350dbc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$HR & Recruiting$q$, 25, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '75de4905-e02e-4641-aa2f-074c25a04d63', $q$HR & Recruiting$q$, 26, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75de4905-e02e-4641-aa2f-074c25a04d63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$HR & Recruiting$q$, 27, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fdee0987-278e-4695-be35-6f8d4a24d46b', $q$HR & Recruiting$q$, 28, 8, 7, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdee0987-278e-4695-be35-6f8d4a24d46b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$HR & Recruiting$q$, 29, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '172aeb66-4aac-42c5-b5fb-820fded05cd2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$HR & Recruiting$q$, 30, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8260c82f-10fa-4ece-b662-6c99bd5967eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a31391fe-79aa-479e-ad05-f7def34d36ee', $q$HR & Recruiting$q$, 31, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a31391fe-79aa-479e-ad05-f7def34d36ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f693b898-12c0-4472-a7d3-8ed4219d2443', $q$HR & Recruiting$q$, 32, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f693b898-12c0-4472-a7d3-8ed4219d2443')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6806207d-501f-442f-81f0-3c146ec0fedc', $q$HR & Recruiting$q$, 33, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6806207d-501f-442f-81f0-3c146ec0fedc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$HR & Recruiting$q$, 34, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$HR & Recruiting$q$, 35, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$HR & Recruiting$q$, 36, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b80f26c5-559d-4dd6-a520-9913d10938f6', $q$HR & Recruiting$q$, 37, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b80f26c5-559d-4dd6-a520-9913d10938f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$HR & Recruiting$q$, 38, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '42ee2d70-9cde-4237-84bd-e916bc055119', $q$HR & Recruiting$q$, 39, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42ee2d70-9cde-4237-84bd-e916bc055119')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$HR & Recruiting$q$, 40, 7, 8, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$HR & Recruiting$q$, 41, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$HR & Recruiting$q$, 42, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '51568536-b7e1-4391-a01a-fb0353541bf4', $q$HR & Recruiting$q$, 43, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51568536-b7e1-4391-a01a-fb0353541bf4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$HR & Recruiting$q$, 44, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '240f9156-e0ab-42ca-b567-928a9cab1bb2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$HR & Recruiting$q$, 45, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$HR & Recruiting$q$, 46, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d53613b-ce48-4bee-a738-96b4bc59bd46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$HR & Recruiting$q$, 47, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$HR & Recruiting$q$, 48, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54840d54-d23f-400b-9a21-c910db72a31a', $q$HR & Recruiting$q$, 49, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54840d54-d23f-400b-9a21-c910db72a31a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afdb353e-eadb-46f7-a2cf-7af280948165', $q$Knowledge Management$q$, 50, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afdb353e-eadb-46f7-a2cf-7af280948165')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Knowledge Management$q$, 51, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3af57a6b-aa7b-403a-a094-3150492f8e93')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1c979afd-7472-4f90-be81-546475814887', $q$Knowledge Management$q$, 52, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c979afd-7472-4f90-be81-546475814887')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8287b9b-43ca-4726-b309-28a1246e0832', $q$Knowledge Management$q$, 53, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8287b9b-43ca-4726-b309-28a1246e0832')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bac55456-ac21-473d-a96f-b37ba84bb107', $q$Knowledge Management$q$, 54, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bac55456-ac21-473d-a96f-b37ba84bb107')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Knowledge Management$q$, 55, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb6f9f95-9f4c-4661-825d-e8c01f5894f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '56575211-4e45-4694-ace2-cf86a40a1535', $q$Knowledge Management$q$, 56, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56575211-4e45-4694-ace2-cf86a40a1535')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Knowledge Management$q$, 57, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9083bc49-72a1-47d8-94f0-9eca973868b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d057e5f-65df-488c-80d0-410c33bb681b', $q$Knowledge Management$q$, 58, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d057e5f-65df-488c-80d0-410c33bb681b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Productivity & Collaboration$q$, 59, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b3923df9-f933-42f3-a870-8a16aaef419f', $q$Productivity & Collaboration$q$, 60, 6, 9, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3923df9-f933-42f3-a870-8a16aaef419f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Productivity & Collaboration$q$, 61, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a124a9a-48f0-4b4c-95da-4dc646598e63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Productivity & Collaboration$q$, 62, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Productivity & Collaboration$q$, 63, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdc946d2-b06d-4438-be5e-2091531fcf59')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Productivity & Collaboration$q$, 64, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Productivity & Collaboration$q$, 65, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0dd77a12-e3bc-4d46-ba35-97303cca0d1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Productivity & Collaboration$q$, 66, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '43183bc9-0de0-415c-ba7d-2669401c12df', $q$Productivity & Collaboration$q$, 67, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43183bc9-0de0-415c-ba7d-2669401c12df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Productivity & Collaboration$q$, 68, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b839ece-85d0-4b47-9358-2feed4175b10', $q$Productivity & Collaboration$q$, 69, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b839ece-85d0-4b47-9358-2feed4175b10')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Productivity & Collaboration$q$, 70, 6, 7, 7, $q$Tier B — Strong expansion$q$, 6.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Productivity & Collaboration$q$, 71, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96f26d26-8a1d-438a-a8a3-ab3602c704c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Productivity & Collaboration$q$, 72, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45916754-f5bf-43e2-98ed-4d4cec40d20c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Productivity & Collaboration$q$, 73, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5816d708-5e16-4d8f-8847-bc4d396ab602')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Productivity & Collaboration$q$, 74, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2bd44f6-8343-46e6-bef6-8aab0d7ad1bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Productivity & Collaboration$q$, 75, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05e24cd3-962a-414e-b238-79b5d2f5477f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Productivity & Collaboration$q$, 76, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44be1d54-c2e8-47bb-b553-cdc2120d6458')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '68399520-7bce-4cbd-8fad-93972635411f', $q$Project & Work Management$q$, 77, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68399520-7bce-4cbd-8fad-93972635411f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Project & Work Management$q$, 78, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Project & Work Management$q$, 79, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd0bc05e-d67e-4870-a277-70ee9d9c0af0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cc8a6c27-5e21-4987-a514-54dffa799736', $q$Project & Work Management$q$, 80, 6, 8, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc8a6c27-5e21-4987-a514-54dffa799736')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Project & Work Management$q$, 81, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d064484-1e39-4835-a77c-89f6fd35cc99')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Project & Work Management$q$, 82, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd35f0bfc-a880-4f59-aa8f-867b297a21c1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d61482f-100a-4065-95f7-81efc054d452', $q$Project & Work Management$q$, 83, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d61482f-100a-4065-95f7-81efc054d452')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ab386a2-faa0-49f0-97d8-6d5200fb72bb', $q$Project & Work Management$q$, 84, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ab386a2-faa0-49f0-97d8-6d5200fb72bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Project & Work Management$q$, 85, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c31b644-e9f8-4a6c-b3aa-e7960053e0dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Project & Work Management$q$, 86, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '932248d2-07e2-4834-ad47-abd847ca7ad8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c0a3212-6a22-4654-b9a1-99819c416ff5', $q$Developer Tools$q$, 87, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c0a3212-6a22-4654-b9a1-99819c416ff5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2f12a930-1f2e-4928-8d88-770f30751680', $q$Project & Work Management$q$, 88, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f12a930-1f2e-4928-8d88-770f30751680')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Product Management$q$, 89, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d3b022c-eecd-4869-9efc-0b614824aa91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '44247eb4-4fad-4252-a448-315159706699', $q$Product Management$q$, 90, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44247eb4-4fad-4252-a448-315159706699')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Product Management$q$, 91, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f214525d-5b01-44d9-b029-88a13d27b4e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1630ac29-62d1-433c-a8cb-b173926de875', $q$Product Management$q$, 92, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1630ac29-62d1-433c-a8cb-b173926de875')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Product Management$q$, 93, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Product Management$q$, 94, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78f287c8-68d3-4606-a4ac-c4ef808b1063')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Product Management$q$, 95, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Product Management$q$, 96, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Product Management$q$, 97, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Product Management$q$, 98, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4754e964-cca0-48dc-adc6-88e29e111bd1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Product Management$q$, 99, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0ac04a4-012a-47e1-a2d0-a654ad99ade3', $q$Product Management$q$, 100, 7, 8, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0ac04a4-012a-47e1-a2d0-a654ad99ade3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69b064f9-d2d3-4029-9481-48380ca63924', $q$Product Management$q$, 101, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69b064f9-d2d3-4029-9481-48380ca63924')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de66f380-8299-4b3a-b413-b14569d70119', $q$Product Management$q$, 102, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de66f380-8299-4b3a-b413-b14569d70119')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Product Management$q$, 103, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '464182df-a73e-41ff-88d0-d38b16891925', $q$Product Management$q$, 104, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '464182df-a73e-41ff-88d0-d38b16891925')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Product Management$q$, 105, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed72e564-3150-4ee6-ad02-fc3247f087ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b032034e-3c48-43b1-b97e-319af0c7611f', $q$Product Management$q$, 106, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b032034e-3c48-43b1-b97e-319af0c7611f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Product Management$q$, 107, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69ed37d5-2093-4b7b-87b5-2affc6a03505')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Product Management$q$, 108, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd278a62-8daf-4a08-9776-46b01f241b6d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '862d01e4-b70f-42d4-a767-087af055aa04', $q$Product Adoption$q$, 109, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '862d01e4-b70f-42d4-a767-087af055aa04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1d39120-ba26-4cce-9321-103e23bfe6f1', $q$Product Adoption$q$, 110, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1d39120-ba26-4cce-9321-103e23bfe6f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28d621bc-8148-478e-91f4-93954281f173', $q$Product Adoption$q$, 111, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28d621bc-8148-478e-91f4-93954281f173')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Product Analytics$q$, 112, 8, 7, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26353690-a2ee-449c-bcc8-74fac8018f06', $q$Product Analytics$q$, 113, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26353690-a2ee-449c-bcc8-74fac8018f06')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Product Analytics$q$, 114, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Product Analytics$q$, 115, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '416c2613-6ccd-4b41-aea6-5f51b4411966')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Product Analytics$q$, 116, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '546750c3-813f-430c-a551-e76c5f6484f1', $q$Product Analytics$q$, 117, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '546750c3-813f-430c-a551-e76c5f6484f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Data & Analytics$q$, 119, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62cb1717-61b9-4a9b-aab8-e3aeee5ab747')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Data & Analytics$q$, 120, 6, 9, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Data & Analytics$q$, 121, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99ecac84-e959-4bdd-9c5f-dac64779d3d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Data & Analytics$q$, 122, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecb792b6-733d-4b42-9447-29bbd9fb6b62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Data & Analytics$q$, 123, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33ad3642-ef12-4121-a02e-a01f3f57bc2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Data & Analytics$q$, 124, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d48d5fd-47e9-414e-af53-a8687df65dbb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Automation$q$, 126, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Automation$q$, 128, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Automation$q$, 129, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26b90793-47fc-44e2-b4ed-aaab363f429f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0ac7827-3295-4540-8b0d-c5df37be621b', $q$Automation$q$, 130, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0ac7827-3295-4540-8b0d-c5df37be621b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3acb1b38-990d-4851-be0b-cc32baa33857', $q$Developer Tools$q$, 131, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3acb1b38-990d-4851-be0b-cc32baa33857')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Developer Tools$q$, 132, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Developer Tools$q$, 133, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be14b634-b7cc-4d16-810a-ee3927fb4b01', $q$Developer Tools$q$, 134, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be14b634-b7cc-4d16-810a-ee3927fb4b01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Developer Tools$q$, 135, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Developer Tools$q$, 136, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7b90709-b508-4388-a295-d5608f207c11', $q$Developer Tools$q$, 137, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7b90709-b508-4388-a295-d5608f207c11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Developer Tools$q$, 139, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Developer Tools$q$, 140, 7, 7, 9, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26e0091a-2dbf-4bce-9fd3-e6410e5065db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Developer Tools$q$, 141, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Developer Tools$q$, 142, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80059e68-8557-45a3-a76c-b2d0817a3a9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Developer Tools$q$, 143, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Developer Tools$q$, 144, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28f84c5e-8df6-4846-8228-5943ba6223e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Developer Tools$q$, 145, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '889a35b0-763a-4ca4-86bc-b657c47e2c33')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Developer Tools$q$, 146, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Developer Tools$q$, 147, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Developer Tools$q$, 148, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a18645e2-a581-4fd2-afca-e3a533873c8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Developer Tools$q$, 149, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Developer Tools$q$, 150, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01c9cb83-d21b-4761-b79e-7d589ccbad23')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc82827c-9211-4f0a-9f9f-39778e88b1eb', $q$Developer Tools$q$, 151, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc82827c-9211-4f0a-9f9f-39778e88b1eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Developer Tools$q$, 152, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7736f4e7-14df-4b55-a27c-530d35d06fd1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Developer Tools$q$, 153, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bde5f50-16ca-4a06-bfe7-446daf35604f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Developer Tools$q$, 154, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fb0f468-f238-4fb1-a656-36ced87d1401')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Developer Tools$q$, 155, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ffe3fec8-5847-4750-b01a-593c7901730d', $q$Developer Tools$q$, 156, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffe3fec8-5847-4750-b01a-593c7901730d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5b8e104-a176-4bca-a581-3d1e42859374', $q$Developer Tools$q$, 157, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b8e104-a176-4bca-a581-3d1e42859374')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0491910-91ba-45bf-9e66-510a9761281d', $q$Developer Tools$q$, 158, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0491910-91ba-45bf-9e66-510a9761281d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '546237d7-afb6-42b7-8b01-ab03163155ce', $q$Developer Tools$q$, 159, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '546237d7-afb6-42b7-8b01-ab03163155ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Developer Tools$q$, 160, 7, 8, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Developer Tools$q$, 161, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0521ec36-4a18-4308-8b35-efe654ddfaa1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Developer Tools$q$, 162, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56030237-fe9d-4c89-85b0-e8fc3b277439')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a72b20a-d407-4667-b31e-e8a6c6b98ad9', $q$Developer Tools$q$, 163, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a72b20a-d407-4667-b31e-e8a6c6b98ad9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Developer Tools$q$, 164, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Developer Tools$q$, 165, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Developer Tools$q$, 166, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b712ecf-94b6-4e1e-a274-928b0f776caa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Monitoring & Observability$q$, 167, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Monitoring & Observability$q$, 168, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Monitoring & Observability$q$, 169, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c7aa89c-3f60-4564-b444-ec64000a8454')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Monitoring & Observability$q$, 170, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f675195-8d9d-4857-a42d-0da0b4ca4707')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Monitoring & Observability$q$, 171, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Monitoring & Observability$q$, 172, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Monitoring & Observability$q$, 174, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Monitoring & Observability$q$, 175, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '898eb43f-2596-446a-a7b5-ae0add35bd12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a800ff94-205d-4d00-9df5-8de02f912d82', $q$Monitoring & Observability$q$, 176, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a800ff94-205d-4d00-9df5-8de02f912d82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Monitoring & Observability$q$, 177, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '59226ced-c95a-4575-8fdf-25651ad806d1', $q$Monitoring & Observability$q$, 178, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59226ced-c95a-4575-8fdf-25651ad806d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Monitoring & Observability$q$, 179, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263f6e12-dfc9-4797-a1fe-95f4616f1475')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7fda584-6240-4d2f-8353-32a67b19e197', $q$Monitoring & Observability$q$, 180, 7, 9, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7fda584-6240-4d2f-8353-32a67b19e197')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Monitoring & Observability$q$, 181, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Monitoring & Observability$q$, 182, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87d8b957-ca86-43e1-bf19-a249b1bd836a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Monitoring & Observability$q$, 183, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '42e3325b-1211-486f-91fc-f675f017f411', $q$Monitoring & Observability$q$, 184, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42e3325b-1211-486f-91fc-f675f017f411')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Monitoring & Observability$q$, 185, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fe9efca-ce0e-4fb2-974d-c293416b1200')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Monitoring & Observability$q$, 186, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Monitoring & Observability$q$, 187, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Monitoring & Observability$q$, 188, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3338502d-27fe-428c-9b82-985f4f0a73b4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Monitoring & Observability$q$, 189, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22369d03-3beb-4c3b-bad9-983dd3069db4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Monitoring & Observability$q$, 190, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7a0b53e-f0d9-4f9d-ac95-70d431887088')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd0fed099-679d-4702-a509-fbb8a5115476', $q$Monitoring & Observability$q$, 191, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd0fed099-679d-4702-a509-fbb8a5115476')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf9eca67-94ed-473e-92ff-8af4c2a5e735', $q$Monitoring & Observability$q$, 192, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf9eca67-94ed-473e-92ff-8af4c2a5e735')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '521d7edd-be93-4cc5-b678-97bf55389e62', $q$Security & IT$q$, 193, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '521d7edd-be93-4cc5-b678-97bf55389e62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Security & IT$q$, 194, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Security & IT$q$, 195, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e225ae3-f536-4753-a9dd-77c8187545ca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Security & IT$q$, 196, 8, 7, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07f5df46-0b11-4627-b5f3-78e1a12e546e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Security & IT$q$, 197, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Security & IT$q$, 198, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8c83d263-30f5-472f-9408-4e9883759bcd', $q$Security & IT$q$, 199, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c83d263-30f5-472f-9408-4e9883759bcd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'caec6253-7f1b-408d-968e-1099f0367648', $q$Security & IT$q$, 200, 7, 8, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caec6253-7f1b-408d-968e-1099f0367648')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Security & IT$q$, 201, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d037963-f9fb-4d88-bcc4-228a333d83cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Security & IT$q$, 202, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Security & IT$q$, 203, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Security & IT$q$, 204, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '753226c3-cede-4bbb-9fad-9d73dd9827e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26fa7763-662c-4590-abb7-062fe17b309e', $q$Security & IT$q$, 205, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26fa7763-662c-4590-abb7-062fe17b309e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Security & IT$q$, 206, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c102b52-3adb-4485-b65a-2b1065f9aa19')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Developer Tools$q$, 207, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Security & IT$q$, 208, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '96409439-bd37-456a-bd67-52a51e831b1e', $q$Security & IT$q$, 209, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96409439-bd37-456a-bd67-52a51e831b1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Security & IT$q$, 210, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0db8e4b7-3129-43e3-bd36-cff6d52f51bc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Security & IT$q$, 211, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Security & IT$q$, 212, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Security & IT$q$, 213, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bf2641e-776f-49ba-814c-30d9468c54c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Security & IT$q$, 214, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae78ea6a-31f8-4642-9dd7-797047244d47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Security & IT$q$, 215, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a88a88b-6d60-45fe-acbd-4156c50580ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Security & IT$q$, 216, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e2954a02-620d-4992-b4df-7f9f14891142', $q$Security & IT$q$, 217, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2954a02-620d-4992-b4df-7f9f14891142')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Security & IT$q$, 218, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Security & IT$q$, 219, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72bf9a68-6a9a-4412-9612-8de0644c372e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Security & IT$q$, 220, 7, 8, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Security & IT$q$, 221, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69d914d3-8667-4dc1-83ca-010c75550ec9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53f62fac-4ecb-4373-8264-0094d3faebee', $q$Security & IT$q$, 222, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53f62fac-4ecb-4373-8264-0094d3faebee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Security & IT$q$, 223, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Security & IT$q$, 224, 8, 7, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Security & IT$q$, 225, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f21e8c47-9727-46e1-8769-b1874bae4d03')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '62db09f8-596e-4759-92a2-df735f8464c1', $q$Security & IT$q$, 226, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62db09f8-596e-4759-92a2-df735f8464c1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Security & IT$q$, 227, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d826762-9d50-46fb-93f2-f3db167ecdd7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'daf48211-2666-4915-ade5-f918f2d8b847', $q$Security & IT$q$, 228, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daf48211-2666-4915-ade5-f918f2d8b847')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Security & IT$q$, 229, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Security & IT$q$, 230, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0206b22-b8e1-4aea-b694-687c1d876d1b', $q$Security & IT$q$, 231, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0206b22-b8e1-4aea-b694-687c1d876d1b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3455877b-59ac-4ce9-8371-d5101e680c67', $q$Security & IT$q$, 232, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3455877b-59ac-4ce9-8371-d5101e680c67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Security & IT$q$, 233, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Security & IT$q$, 234, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Security & IT$q$, 235, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0d7e15c-04f7-4a2d-9419-58dab06d3af3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Security & IT$q$, 236, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84902cee-488e-4583-aad3-f2fbf318cb9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0668898-096e-49d0-a80e-31cce8d69397', $q$Security & IT$q$, 237, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0668898-096e-49d0-a80e-31cce8d69397')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7124bf7-efbe-423b-8a94-15a5db73d353', $q$Security & IT$q$, 238, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7124bf7-efbe-423b-8a94-15a5db73d353')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Security & IT$q$, 239, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62db571f-582a-43e0-9f5f-3cf4413ae59a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5eaaad6-9ac2-4633-a29e-68531875f434', $q$Security & IT$q$, 240, 7, 9, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5eaaad6-9ac2-4633-a29e-68531875f434')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Security & IT$q$, 241, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d1eff7c-0366-4a72-af49-95cd19369f3b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f089f3d0-931d-41ab-b83c-765e387a247e', $q$Security & IT$q$, 242, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f089f3d0-931d-41ab-b83c-765e387a247e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '789f97be-c510-457a-8f6f-591187e6b959', $q$Security & IT$q$, 243, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '789f97be-c510-457a-8f6f-591187e6b959')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Security & IT$q$, 244, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '698be4be-d4e5-4e9b-8413-12a637e83e7c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Documents & E-signature$q$, 245, 6, 7, 7, $q$Tier B — Strong expansion$q$, 6.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b92e33a-9ce9-4f11-bf8a-c6758fc2237c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4da77cfa-32ce-403c-8b98-4e1620167573', $q$Documents & E-signature$q$, 246, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4da77cfa-32ce-403c-8b98-4e1620167573')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Documents & E-signature$q$, 247, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fed2af81-3cbf-403c-8135-b548f382e7ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Documents & E-signature$q$, 248, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de8338ea-b5f1-466f-9506-f229d3f662f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '082213b2-ced8-444a-8548-3b973c136452', $q$Documents & E-signature$q$, 249, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '082213b2-ced8-444a-8548-3b973c136452')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Documents & E-signature$q$, 250, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fede56b3-f85c-4052-aeaf-1ba74f7f371f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5b2b745-3c35-43ca-b42a-63a3a29daf34', $q$Documents & E-signature$q$, 251, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b2b745-3c35-43ca-b42a-63a3a29daf34')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Documents & E-signature$q$, 252, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5508cca3-5bae-43ef-99a9-12d8e8bc4e09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Documents & E-signature$q$, 253, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '285c3bc6-63b3-46e5-8de1-99baa6d03c1f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Documents & E-signature$q$, 254, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d258a01-ef39-4b35-84fd-1f22985df12e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Contract Management$q$, 255, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a0f2d3b-c073-4fa4-9c50-2b0847121c18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Contract Management$q$, 256, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3138f4f-7b47-4597-bf67-8ea806a1edd0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Contract Management$q$, 257, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95bdcbb9-6021-42d0-a5e2-e06607c0d49b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Contract Management$q$, 258, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e12cbfc9-d246-4893-93a6-78ac5fffa567')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Contract Management$q$, 259, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2ccb15e-37d0-481d-a412-ddf5ab66d3dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8023eebe-e18e-4b41-9174-8eede636edf1', $q$Contract Management$q$, 260, 6, 8, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8023eebe-e18e-4b41-9174-8eede636edf1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b1e19ecc-4775-4332-8779-84e45195b570', $q$Contract Management$q$, 261, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1e19ecc-4775-4332-8779-84e45195b570')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Contract Management$q$, 262, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '57b9a346-5643-4807-89c0-802cddc8a87c', $q$Contract Management$q$, 263, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57b9a346-5643-4807-89c0-802cddc8a87c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Contract Management$q$, 264, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcb87420-fbd7-430c-9df6-534d57e84b61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb49326f-7c73-43d6-b58a-39f713485eed', $q$Contract Management$q$, 265, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb49326f-7c73-43d6-b58a-39f713485eed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4518f944-7168-437d-a54e-83df3dc6c03e', $q$Legal Tech$q$, 266, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4518f944-7168-437d-a54e-83df3dc6c03e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Legal Tech$q$, 267, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Legal Tech$q$, 268, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15c3e1d1-3978-4b9a-82fd-8517048b2955')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc263e36-ce97-42d4-be53-04c312ae1484', $q$Legal Tech$q$, 269, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc263e36-ce97-42d4-be53-04c312ae1484')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Legal Tech$q$, 270, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Legal Tech$q$, 271, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06b1be4-eb20-4b50-a730-a18c95839a81')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Legal Tech$q$, 272, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20f8795e-e405-44d9-8790-07ffa387bbf6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4504bbf9-9763-4106-8ef1-3bb5ef09eec3', $q$Legal Tech$q$, 273, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4504bbf9-9763-4106-8ef1-3bb5ef09eec3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83af1af4-6221-4015-833c-810c8bd8d57f', $q$Legal Tech$q$, 274, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83af1af4-6221-4015-833c-810c8bd8d57f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Legal Tech$q$, 275, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2daef1f5-cac7-42ef-aa09-bc9e2945a78a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '963e1b92-071f-415e-9b5e-38f557ab5057', $q$Legal Tech$q$, 276, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '963e1b92-071f-415e-9b5e-38f557ab5057')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2ca87f00-e097-436b-b238-146a0f31af0e', $q$Legal Tech$q$, 277, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ca87f00-e097-436b-b238-146a0f31af0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Legal Tech$q$, 278, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Legal Tech$q$, 279, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '440d249d-d889-40ff-bcf3-14b8168ba59e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Legal Tech$q$, 280, 7, 7, 9, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '046d5368-1873-461f-9ac4-29a6afeb6d0a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f433b75-2930-48b2-9563-119f142dab72', $q$Legal Tech$q$, 281, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f433b75-2930-48b2-9563-119f142dab72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Legal Tech$q$, 282, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00255f96-7650-4ae5-b57c-6b941447ffcc', $q$Healthcare Software$q$, 283, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00255f96-7650-4ae5-b57c-6b941447ffcc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Healthcare Software$q$, 284, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fbb1de8-79fd-408f-ab12-959b5b74f712')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Healthcare Software$q$, 285, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e495d174-9d89-4a75-aaca-d48d89a2581f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06b89e1b-945d-45ca-a596-cd703e666e95', $q$Healthcare Software$q$, 286, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06b89e1b-945d-45ca-a596-cd703e666e95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'baefb679-ec89-4479-9664-e5f0cd704e8b', $q$Healthcare Software$q$, 287, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'baefb679-ec89-4479-9664-e5f0cd704e8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3824531-7fee-4eb7-9d43-f3de065cb703', $q$Healthcare Software$q$, 288, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3824531-7fee-4eb7-9d43-f3de065cb703')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Healthcare Software$q$, 289, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Healthcare Software$q$, 290, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6bb22d65-1575-461a-bfe4-728c9cfb68cf', $q$Healthcare Software$q$, 291, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bb22d65-1575-461a-bfe4-728c9cfb68cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Healthcare Software$q$, 292, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Healthcare Software$q$, 293, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d1c8fab-760d-491b-9864-dafede147c46', $q$Healthcare Software$q$, 294, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d1c8fab-760d-491b-9864-dafede147c46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Healthcare Software$q$, 295, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c10d8d2-81ae-4c01-b041-bf40e0c15cf4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Healthcare Software$q$, 296, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fddf95b3-6124-4cb3-8919-8d1df1119657')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1de08da2-3fe6-4896-9da1-03448621c680', $q$Healthcare Software$q$, 297, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1de08da2-3fe6-4896-9da1-03448621c680')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Healthcare Software$q$, 298, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '71a56f1d-a4f4-4480-9c66-e4602baa4d1a', $q$Healthcare Software$q$, 299, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71a56f1d-a4f4-4480-9c66-e4602baa4d1a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Healthcare Software$q$, 300, 7, 9, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Healthcare Software$q$, 301, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Healthcare Software$q$, 302, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Reputation Management$q$, 303, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96e7ec06-f2ec-4702-94ef-ddc083739f48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Reputation Management$q$, 304, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69e9043e-430d-4fc5-97c8-fc58de34946f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '39c68560-090d-4a39-b278-5e450024c11c', $q$Reputation Management$q$, 305, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39c68560-090d-4a39-b278-5e450024c11c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Reputation Management$q$, 306, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb4b68ba-b4d4-4c0f-8fd7-b849bda16445')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Reputation Management$q$, 307, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1a03e2a-1f45-466c-a273-8c8ac39242e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Reputation Management$q$, 308, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Reputation Management$q$, 309, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6724785a-7009-4bc5-a8a9-4314ca7e5d4f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Reputation Management$q$, 310, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Reputation Management$q$, 311, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e37c82e0-4240-4f11-9aae-4a179e6cd032')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Reputation Management$q$, 312, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ad9d61a8-318e-41aa-b413-59187e3567de', $q$Reputation Management$q$, 313, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad9d61a8-318e-41aa-b413-59187e3567de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05db3079-f16d-4821-84d1-93a68b767ea8', $q$Local SEO$q$, 314, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05db3079-f16d-4821-84d1-93a68b767ea8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local SEO$q$, 315, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab7eacb8-b8b0-4ec2-9930-7d165f43051c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Local SEO$q$, 316, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48120309-810d-426d-85b1-0cc890be92d9', $q$Local SEO$q$, 317, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48120309-810d-426d-85b1-0cc890be92d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Local SEO$q$, 318, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Local SEO$q$, 319, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41237a9a-e783-4b00-96f5-d87ac34a53d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'db5079b7-d737-4eb2-99fe-040725cc7508', $q$Local SEO$q$, 320, 6, 8, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db5079b7-d737-4eb2-99fe-040725cc7508')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Local SEO$q$, 321, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b0618a9-c067-473b-869a-3d9864cb6eda')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Reputation Management$q$, 322, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0be2db6b-44c2-4d2c-bc3d-01cd84786d78')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Local SEO$q$, 323, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b222011-bf30-40f8-a823-ef6029be8ff5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Reputation Management$q$, 324, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd376b9a-76da-4d57-99b7-dede36f6af47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Restaurant Software$q$, 325, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af3ba62b-b530-4e1a-9d87-543bbbe2cc25')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Restaurant Software$q$, 326, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a648195-23d1-462c-80b6-a9d18bdb505a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Restaurant Software$q$, 327, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Restaurant Software$q$, 328, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae9d7434-92d8-4d57-91cd-e0572dbd91d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de627a61-90d5-4b28-8678-2d3f4251e213', $q$Restaurant Software$q$, 329, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de627a61-90d5-4b28-8678-2d3f4251e213')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Restaurant Software$q$, 330, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b848b09-87f9-4b49-ae0b-1296d600f752')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Restaurant Software$q$, 331, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '58340ae3-bb72-49c9-8eb1-38e05b4918b4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Restaurant Software$q$, 332, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c81486a4-91b4-43a3-938b-cb4a8e444d88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28ff458a-dcea-455d-938b-9fb1327451b1', $q$Restaurant Software$q$, 333, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28ff458a-dcea-455d-938b-9fb1327451b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Restaurant Software$q$, 334, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd454fe2-fd4b-4e4f-9816-8a9c32182617')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Restaurant Software$q$, 335, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ed66bad-7bcf-4b57-a6f5-992c5dbb3327')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Restaurant Software$q$, 336, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa214254-dedb-418f-829f-a286a6fdbeb5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Restaurant Software$q$, 337, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a57ea53a-5e59-4850-be73-20f61d1184e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9ea6dbd-ab88-43fc-9a5e-d9bb062380a2', $q$Restaurant Software$q$, 338, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9ea6dbd-ab88-43fc-9a5e-d9bb062380a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Restaurant Software$q$, 339, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adae3e2d-9b36-4cc0-8d29-a710afd0f677')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Restaurant Software$q$, 340, 6, 8, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Restaurant Software$q$, 341, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9db567bc-79c1-40cb-a4a7-632f1cdc6fde')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Restaurant Software$q$, 342, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b5712ae-a2d8-4a37-a333-309ad689655d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Restaurant Software$q$, 343, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6cf21005-e4bd-49c2-a890-817f14482aab', $q$Restaurant Software$q$, 344, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6cf21005-e4bd-49c2-a890-817f14482aab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Restaurant Software$q$, 345, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81547fe6-0936-48d6-be6a-e999e7dcc1ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Restaurant Software$q$, 346, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Restaurant Software$q$, 347, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1947c7c-e691-4991-bc52-01c2627b4ff1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Procurement Software$q$, 348, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a442a095-0271-47c3-9bde-0e4be198b2c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Procurement Software$q$, 349, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b529879-d2eb-436f-9583-eb2ecac8f8c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Procurement Software$q$, 350, 6, 7, 7, $q$Tier B — Strong expansion$q$, 6.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c43b72a7-6804-4129-86f6-0b65715b2b9b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Procurement Software$q$, 351, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f5fd302-9cde-4c0c-9ce1-23c0223b163f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Procurement Software$q$, 352, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0302fe96-81fa-4f14-b5ac-8414fede5b87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Procurement Software$q$, 353, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47c26ff2-e8f9-4fe3-9718-d79f6a0f9407')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Procurement Software$q$, 354, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Procurement Software$q$, 355, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a1fdc49-4c8e-46b7-aa0e-d428cafa9212')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Procurement Software$q$, 356, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Finance & Billing$q$, 357, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Finance & Billing$q$, 358, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Finance & Billing$q$, 359, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22c9265b-8d90-4eb5-973c-a18df96a2516')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Finance & Billing$q$, 360, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a9a8cf9-4012-4a32-af0c-34784bc34030')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b324175-a7cb-4029-86d5-3cab4828ebe4', $q$Finance & Billing$q$, 361, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b324175-a7cb-4029-86d5-3cab4828ebe4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Finance & Billing$q$, 362, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e483d96-1e11-493c-b7e9-c3b377066d91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Finance & Billing$q$, 363, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b1475af-f4bc-459d-ac77-e29162361ec3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61d2abfe-020b-44ad-8493-bab43284c852', $q$Finance & Billing$q$, 364, 9, 7, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61d2abfe-020b-44ad-8493-bab43284c852')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Finance & Billing$q$, 365, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53147b31-f2fc-40d8-abf5-b79accdf962a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Finance & Billing$q$, 366, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '806674db-f3e6-419b-a6a4-aa3e4199d96e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d4e8ad2-0a77-49b7-a93f-86b5b0d11355', $q$Finance & Billing$q$, 367, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d4e8ad2-0a77-49b7-a93f-86b5b0d11355')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dadc676c-ec7c-4645-a7c6-759360a99282', $q$Finance & Billing$q$, 368, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dadc676c-ec7c-4645-a7c6-759360a99282')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c9efa528-a016-40bf-b672-db270aa7c09d', $q$Finance & Billing$q$, 369, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9efa528-a016-40bf-b672-db270aa7c09d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Finance & Billing$q$, 370, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Finance & Billing$q$, 371, 9, 7, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca461870-55b1-4c9b-a8d8-8006576315c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Finance & Billing$q$, 372, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12d24fe7-48a0-44d8-984c-abefbbe5363a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e671dda-5728-40ae-ba4d-0e752a749848', $q$Finance & Billing$q$, 373, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e671dda-5728-40ae-ba4d-0e752a749848')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3daa81ad-63b3-4469-9a34-5214e31502af', $q$Finance & Billing$q$, 374, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3daa81ad-63b3-4469-9a34-5214e31502af')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Finance & Billing$q$, 375, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61a24175-f779-457b-81b7-e8e401c75867', $q$Finance & Billing$q$, 376, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61a24175-f779-457b-81b7-e8e401c75867')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd422245-3239-421a-87c7-ef20ba5506e5', $q$Finance & Billing$q$, 377, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd422245-3239-421a-87c7-ef20ba5506e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Finance & Billing$q$, 378, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2df1bf37-9d52-4951-9c51-d887b5e883c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Finance & Billing$q$, 379, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Finance & Billing$q$, 380, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de85e666-3a6a-4ce4-b304-a77397acde17', $q$Finance & Billing$q$, 381, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de85e666-3a6a-4ce4-b304-a77397acde17')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e0b38be-797c-4dda-bbd8-cffa25076218', $q$Finance & Billing$q$, 382, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e0b38be-797c-4dda-bbd8-cffa25076218')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Finance & Billing$q$, 383, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Finance & Billing$q$, 384, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0a76343-e065-4813-8f8c-fb490cece33b', $q$Finance & Billing$q$, 385, 8, 7, 9, $q$Tier B — Strong expansion$q$, 7.9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0a76343-e065-4813-8f8c-fb490cece33b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Finance & Billing$q$, 386, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$CRM & Sales$q$, 387, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$CRM & Sales$q$, 388, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ba708a7-67bb-4103-86f5-6ecb278ba497')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '568eb44d-bbd9-4755-b8c8-7b71d8e9489d', $q$CRM & Sales$q$, 389, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '568eb44d-bbd9-4755-b8c8-7b71d8e9489d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$CRM & Sales$q$, 390, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ec4f000a-01b3-43af-b663-6371cea0d208', $q$CRM & Sales$q$, 391, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec4f000a-01b3-43af-b663-6371cea0d208')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '989b012e-a050-497e-8c08-30d43f45ccd1', $q$CRM & Sales$q$, 392, 9, 7, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '989b012e-a050-497e-8c08-30d43f45ccd1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$CRM & Sales$q$, 393, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$CRM & Sales$q$, 394, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c83044af-b41e-4750-aff8-255f06855de1', $q$CRM & Sales$q$, 395, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c83044af-b41e-4750-aff8-255f06855de1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$CRM & Sales$q$, 396, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '171030c2-a2f0-41bf-b969-187ee5d4f56b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '087b7f82-9397-45ec-9b2b-8507a996af85', $q$CRM & Sales$q$, 397, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '087b7f82-9397-45ec-9b2b-8507a996af85')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd52f8727-8700-449a-a039-f5c8df0a1fe0', $q$CRM & Sales$q$, 398, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$CRM & Sales$q$, 399, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bac928b-8b56-4410-b495-f9ee3e28df6b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be3d358d-02c4-42e2-b373-1d918d655065', $q$CRM & Sales$q$, 400, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be3d358d-02c4-42e2-b373-1d918d655065')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5b12745-37b0-4202-a0e1-39121d42e60e', $q$CRM & Sales$q$, 401, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b12745-37b0-4202-a0e1-39121d42e60e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$CRM & Sales$q$, 402, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '794737f5-a11c-4c4b-bd01-c5bd60d80316')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$CRM & Sales$q$, 403, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$CRM & Sales$q$, 404, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$CRM & Sales$q$, 405, 8, 9, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$CRM & Sales$q$, 406, 9, 7, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$CRM & Sales$q$, 407, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27fefb6a-7a24-4693-81d8-725996b762cc', $q$CRM & Sales$q$, 408, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27fefb6a-7a24-4693-81d8-725996b762cc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$CRM & Sales$q$, 409, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff305ade-9b90-430e-84b4-8e661e81a89a', $q$CRM & Sales$q$, 410, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff305ade-9b90-430e-84b4-8e661e81a89a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$CRM & Sales$q$, 411, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a2732f6-450c-43e0-9cb0-a1752605865d', $q$CRM & Sales$q$, 412, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a2732f6-450c-43e0-9cb0-a1752605865d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$CRM & Sales$q$, 413, 9, 7, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$CRM & Sales$q$, 414, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '846a442d-c466-4a1c-ae5e-3ccb660753fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$CRM & Sales$q$, 415, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$CRM & Sales$q$, 416, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7afd1993-2c5f-430d-bd16-ce044308f9b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$CRM & Sales$q$, 417, 9, 9, 9, $q$Tier A — Build + outreach$q$, 9, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$CRM & Sales$q$, 418, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$CRM & Sales$q$, 419, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a027b3c-fcee-43e5-9956-4c92e51917fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$CRM & Sales$q$, 420, 8, 8, 9, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$CRM & Sales$q$, 421, 9, 8, 9, $q$Tier A — Build + outreach$q$, 8.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Community & Customer Marketing$q$, 422, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f22ba73c-1e88-4f7f-a98a-953343da5e1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd86990b5-159a-4c03-b952-68d1887a3625', $q$Community & Customer Marketing$q$, 423, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd86990b5-159a-4c03-b952-68d1887a3625')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '995d909a-bf0a-4801-afe4-5ac7f7a520be', $q$Community & Customer Marketing$q$, 424, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '995d909a-bf0a-4801-afe4-5ac7f7a520be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ace10d4-d2fb-455a-9617-64239064acc6', $q$Community & Customer Marketing$q$, 425, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ace10d4-d2fb-455a-9617-64239064acc6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Community Platforms$q$, 426, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Community Platforms$q$, 427, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80b9c68e-3f2c-4b1d-93e5-905ec8474aef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Community Platforms$q$, 428, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab6e1565-807c-46d0-90ce-52da6ac62e1c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Community Platforms$q$, 429, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6b5b1e4-ac40-42b0-bab2-d22554c5ce08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6fabe7e2-5d35-419d-8d50-486f02260d5a', $q$Community Platforms$q$, 430, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fabe7e2-5d35-419d-8d50-486f02260d5a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '08901206-af95-4614-be7a-942eac7c6ae2', $q$Community Platforms$q$, 431, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08901206-af95-4614-be7a-942eac7c6ae2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf06b4d4-7d24-4cb0-92b2-0fd280491d4c', $q$Community Platforms$q$, 432, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf06b4d4-7d24-4cb0-92b2-0fd280491d4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Community Platforms$q$, 433, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb2edfa9-9825-4a3e-9d74-500ef6b711a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Community Platforms$q$, 434, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09a7538e-340b-43e0-b19c-d39402e0b1c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c37b6e8e-c4a0-4359-948c-1359f39db6d4', $q$Community Platforms$q$, 435, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c37b6e8e-c4a0-4359-948c-1359f39db6d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Community Platforms$q$, 436, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0754695b-69c5-4fc3-ae4a-a24cfa640353')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '556a93d8-b420-4b3f-a29f-77ac1ef26fa4', $q$Community Platforms$q$, 437, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '556a93d8-b420-4b3f-a29f-77ac1ef26fa4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03467347-7168-44c1-be43-606e7826c361', $q$Community Platforms$q$, 438, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03467347-7168-44c1-be43-606e7826c361')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Community Platforms$q$, 439, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fda2cde-3534-421f-9cdb-eac5fb45b0e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Community Platforms$q$, 440, 6, 8, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f060f9b6-0029-44ee-a1ce-f641464783dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e4c6cda-81f7-4260-95f3-37b80caf619d', $q$Community Platforms$q$, 441, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e4c6cda-81f7-4260-95f3-37b80caf619d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e83b9e49-d147-4636-a644-73eb25d07963', $q$Community Platforms$q$, 442, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e83b9e49-d147-4636-a644-73eb25d07963')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Community Platforms$q$, 443, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdf350cb-3f1d-4f22-b2fc-e83f597e6faf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Community Platforms$q$, 444, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cded24f-f6e3-445f-86fb-dc2b2871d6b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Community Platforms$q$, 445, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74a1d6b8-aba9-4709-96d4-eef201241dde')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c103625-d77b-4769-a06c-01a9300cd28b', $q$Community Platforms$q$, 446, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c103625-d77b-4769-a06c-01a9300cd28b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Community Platforms$q$, 447, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a37a860-0053-444d-834e-ac1979dd8720', $q$Community Platforms$q$, 448, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a37a860-0053-444d-834e-ac1979dd8720')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Community Platforms$q$, 449, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3dea5eed-dd33-4128-91b3-fee23cd6f46a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Video & Events$q$, 450, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a877cfed-31d8-488b-bd3f-59adb9df9eea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Video & Events$q$, 451, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd85d55fa-0d1c-4513-9dd7-5d0afd3835fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Video & Events$q$, 452, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Video & Events$q$, 453, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd87ae7b9-660c-4f9e-9f79-7e32216b89fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2958e078-5211-4d10-8a25-a1936a3d292c', $q$Video & Events$q$, 454, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2958e078-5211-4d10-8a25-a1936a3d292c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Video & Events$q$, 455, 6, 7, 7, $q$Tier B — Strong expansion$q$, 6.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Video & Events$q$, 456, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Video & Events$q$, 457, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef81f2cc-5d19-4029-abc4-98bb85afba1c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Video & Events$q$, 458, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f78d10ab-b34b-493a-9c96-2e256f6d8c27')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb8dc597-00ad-4ba8-baa8-e7a261b489dd', $q$Video & Events$q$, 459, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb8dc597-00ad-4ba8-baa8-e7a261b489dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Video & Events$q$, 460, 6, 8, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5bc7207-b92e-4b19-96fd-fdb155854d9f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Video & Events$q$, 461, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbe1e28b-dacb-4d22-9f38-e5cc9dceeace')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Video & Events$q$, 462, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23d382d0-21fb-4b8d-ba10-31236baa07ed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Video & Events$q$, 463, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Video & Events$q$, 464, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe53f9a3-19f4-4579-b9ed-212212081f85')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '085a00b0-0152-462a-8236-efd96d4561c7', $q$Video & Events$q$, 465, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '085a00b0-0152-462a-8236-efd96d4561c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Video & Events$q$, 466, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ddaae47-3573-4276-bcc8-70bfee3048e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Video & Events$q$, 467, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebd42bbd-e0eb-4348-9dec-c85d892145d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Video & Events$q$, 468, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Video & Events$q$, 469, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a182b645-3634-449e-9ec3-d34c77f3ab09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '732a7077-9f6e-449a-947d-9f0d056354b8', $q$Video & Events$q$, 470, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '732a7077-9f6e-449a-947d-9f0d056354b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Video & Events$q$, 471, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Video & Events$q$, 472, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c973c5c5-70a6-48ab-b061-1028ca2b9440')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Video & Events$q$, 473, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b3922d4-da95-43dc-94df-57b5c18e296d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Video & Events$q$, 474, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36a4b760-5ccb-4498-b325-7b29a847d7cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4691b056-1e97-4208-840d-187dff8b6d46', $q$Video & Events$q$, 475, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4691b056-1e97-4208-840d-187dff8b6d46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Video & Events$q$, 476, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d990b19-e999-4c82-8ee9-31191d38d1f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Video & Events$q$, 477, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '805aa818-8503-43ab-bc29-2447c8f5ac0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Video & Audio$q$, 478, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc81b714-5cd0-41b9-8464-c9eca6e97648')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Video & Audio$q$, 479, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55291a7c-44cc-4c8d-8410-f9af5ea79a43')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Video & Audio$q$, 480, 6, 9, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c4d5d81-6ff4-4496-8867-73b2e003226f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Video & Audio$q$, 481, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b313f97-5726-4dc3-822e-2919a68cf2b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '365cb646-7629-4791-a92b-ebcb79d3c233', $q$Video & Audio$q$, 482, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '365cb646-7629-4791-a92b-ebcb79d3c233')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Video & Audio$q$, 483, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Video & Audio$q$, 484, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bccb27f4-8fb2-457f-97ab-9ab82be7cb63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Podcast Hosting$q$, 485, 6, 8, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc2d5e9c-d0f2-485e-b895-ac90c8c8411f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Podcast Hosting$q$, 486, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Podcast Hosting$q$, 487, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '087b8581-02ae-4bfb-bac4-4d3ce7f324de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Podcast Hosting$q$, 488, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1cfc533c-df77-4130-b1c1-cf54522f45ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Podcast Hosting$q$, 489, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ceb65439-a59e-44c1-9f4f-22cf5bc366f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be61a68f-a190-43dc-9648-504807d5677a', $q$Podcast Hosting$q$, 490, 6, 7, 7, $q$Tier B — Strong expansion$q$, 6.6, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be61a68f-a190-43dc-9648-504807d5677a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Podcast Hosting$q$, 491, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc9b345c-46db-4d94-b160-d1e40a0e6d6b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Podcast Hosting$q$, 492, 7, 9, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '486dac3f-e396-4ba6-9c6e-20a5f563c673')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Podcast Hosting$q$, 493, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1be06e6f-80c4-4800-be23-0b5ae2f639dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Podcast Hosting$q$, 494, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41ee4232-5722-4e22-a602-9fdc2ae29ca2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Podcast Hosting$q$, 495, 6, 9, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3cef1a8-8aa7-4787-8139-49799a6367d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '60043245-a189-4894-95be-8b1ffc4e271a', $q$Podcast Hosting$q$, 496, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60043245-a189-4894-95be-8b1ffc4e271a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Podcast Hosting$q$, 497, 7, 7, 7, $q$Tier B — Strong expansion$q$, 7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb094cdf-883e-4e90-b7ee-22547256735e', $q$Podcast Hosting$q$, 498, 7, 9, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb094cdf-883e-4e90-b7ee-22547256735e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '88430172-33f0-425e-bfc6-d920de02220c', $q$Podcast Hosting$q$, 499, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88430172-33f0-425e-bfc6-d920de02220c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Podcast Hosting$q$, 500, 6, 8, 8, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a134f9f9-ee6d-4f7d-9d03-413bbcf4e3ec', $q$Web Analytics$q$, 118, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v3$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Automation$q$, 125, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v3$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fafc24bd-5a3c-4d63-b22a-5c5090aec3d7', $q$Automation$q$, 127, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('9ad514b4-f42c-4a24-9984-a035b5cef0f3', $q$Developer Tools$q$, 138, 8, 9, 8, $q$Tier B — Strong expansion$q$, 8.3, $q$gappsy-500-2026-07-17-v3$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('24aa6862-35d5-4811-b145-17e35cd64036', $q$Monitoring & Observability$q$, 173, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v3$q$)
ON CONFLICT (tool_id) DO NOTHING;

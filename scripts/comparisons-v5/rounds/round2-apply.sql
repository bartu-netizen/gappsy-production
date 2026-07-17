-- Comparison batch: cronofy-vs-hi, alf-vs-hi, mastodon-vs-repurpose-io, mastodon-vs-postiz, firefly-iii-vs-payhawk, goto-meeting-vs-mirotalk, paperless-ngx-vs-qwilr, dropbox-sign-vs-paperless-ngx, dropbox-sign-vs-signserver, form-io-vs-youform, form-io-vs-google-forms, owncloud-vs-sharefile, owncloud-vs-wetransfer, limesurvey-vs-userzoom, limesurvey-vs-qualtrics, activepieces-vs-woodpecker-ci, activepieces-vs-opennebula, activepieces-vs-portainer, activepieces-vs-harbor, activepieces-vs-bugsink, activepieces-vs-flux, activepieces-vs-snipe-it, activepieces-vs-netbox, activepieces-vs-rancher, activepieces-vs-graylog, activepieces-vs-nomad, activepieces-vs-verdaccio, activepieces-vs-hashicorp-consul, activepieces-vs-gatus, activepieces-vs-gitea, activepieces-vs-harvester, infisical-vs-parse-platform, airflow-vs-parse-platform, airflow-vs-backstage, airflow-vs-postal, airflow-vs-mailpit, airflow-vs-novu, airflow-vs-hugo, airflow-vs-archivebox, airflow-vs-nuxt, castopod-vs-optimizely, castopod-vs-ghost, maizzle-vs-vero, dittofeed-vs-maizzle, growthbook-vs-growthloop, growthloop-vs-matomo, matomo-vs-profitwell, hurl-vs-sqd, postgrest-vs-sqd, convoy-vs-sqd, craft-vs-linkding, linkding-vs-notion, libreoffice-vs-notion, notion-vs-wallabag, ethercalc-vs-notion, notion-vs-webrecorder, permify-vs-vanta, openarchiver-vs-permify, fleetdm-vs-openarchiver, openarchiver-vs-velociraptor, authelia-vs-openarchiver, openarchiver-vs-suricata, conjur-vs-openarchiver, openarchiver-vs-osquery, openarchiver-vs-thehive, dependency-track-vs-openarchiver, misp-vs-openarchiver, defectdojo-vs-openarchiver, deskpro-vs-glpi, glpi-vs-zendesk, chatwoot-vs-vitally, servicenow-vs-vitally, artboard-studio-vs-gimp, adobe-express-vs-gimp, adobe-express-vs-pencil-project, adobe-express-vs-scribus, chatsonic-vs-open-webui, chatgpt-vs-open-webui, drawpile-vs-microsoft-teams, etherpad-vs-microsoft-teams
-- Publishes 80 comparison page(s) with editorial content.

-- ── Cronofy vs hi (cronofy-vs-hi) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b', $q$cronofy-vs-hi$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$vs hi$q$, $q$/compare/cronofy-vs-hi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6' AND href = $q$/compare/cronofy-vs-hi$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b', $q$vs Cronofy$q$, $q$/compare/cronofy-vs-hi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b' AND href = $q$/compare/cronofy-vs-hi$q$);

-- ── alf vs hi (alf-vs-hi) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b', $q$alf-vs-hi$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$vs hi$q$, $q$/compare/alf-vs-hi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698' AND href = $q$/compare/alf-vs-hi$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b', $q$vs alf$q$, $q$/compare/alf-vs-hi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b' AND href = $q$/compare/alf-vs-hi$q$);

-- ── Mastodon vs Repurpose.io (mastodon-vs-repurpose-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', 'f07f9c22-d47c-4952-97ad-64f962870184', $q$mastodon-vs-repurpose-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$vs Repurpose.io$q$, $q$/compare/mastodon-vs-repurpose-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9fecdcd9-2620-4cdf-982f-3615b76750b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9fecdcd9-2620-4cdf-982f-3615b76750b1' AND href = $q$/compare/mastodon-vs-repurpose-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f07f9c22-d47c-4952-97ad-64f962870184', $q$vs Mastodon$q$, $q$/compare/mastodon-vs-repurpose-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f07f9c22-d47c-4952-97ad-64f962870184'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f07f9c22-d47c-4952-97ad-64f962870184' AND href = $q$/compare/mastodon-vs-repurpose-io$q$);

-- ── Mastodon vs postiz (mastodon-vs-postiz) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', '33dae73d-17f7-499b-8dd5-21323e77ee01', $q$mastodon-vs-postiz$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$vs postiz$q$, $q$/compare/mastodon-vs-postiz$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9fecdcd9-2620-4cdf-982f-3615b76750b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9fecdcd9-2620-4cdf-982f-3615b76750b1' AND href = $q$/compare/mastodon-vs-postiz$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '33dae73d-17f7-499b-8dd5-21323e77ee01', $q$vs Mastodon$q$, $q$/compare/mastodon-vs-postiz$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '33dae73d-17f7-499b-8dd5-21323e77ee01'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '33dae73d-17f7-499b-8dd5-21323e77ee01' AND href = $q$/compare/mastodon-vs-postiz$q$);

-- ── Firefly III vs Payhawk (firefly-iii-vs-payhawk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', '72083907-7b29-4e6e-80d3-6134cca542d6', $q$firefly-iii-vs-payhawk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1f92f756-1ddd-475c-a7ab-6671d8405485', $q$vs Payhawk$q$, $q$/compare/firefly-iii-vs-payhawk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1f92f756-1ddd-475c-a7ab-6671d8405485'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1f92f756-1ddd-475c-a7ab-6671d8405485' AND href = $q$/compare/firefly-iii-vs-payhawk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72083907-7b29-4e6e-80d3-6134cca542d6', $q$vs Firefly III$q$, $q$/compare/firefly-iii-vs-payhawk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72083907-7b29-4e6e-80d3-6134cca542d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72083907-7b29-4e6e-80d3-6134cca542d6' AND href = $q$/compare/firefly-iii-vs-payhawk$q$);

-- ── GoTo Meeting vs MiroTalk (goto-meeting-vs-mirotalk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c6868389-8d0e-4fab-b74c-b58f1badba46', 'f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$goto-meeting-vs-mirotalk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6868389-8d0e-4fab-b74c-b58f1badba46', $q$vs MiroTalk$q$, $q$/compare/goto-meeting-vs-mirotalk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46' AND href = $q$/compare/goto-meeting-vs-mirotalk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$vs GoTo Meeting$q$, $q$/compare/goto-meeting-vs-mirotalk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f5b98a61-eacf-4efe-aaf6-07eff41492b5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f5b98a61-eacf-4efe-aaf6-07eff41492b5' AND href = $q$/compare/goto-meeting-vs-mirotalk$q$);

-- ── Paperless-ngx vs Qwilr (paperless-ngx-vs-qwilr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a', $q$paperless-ngx-vs-qwilr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '833af197-f585-45d4-b9f9-cf879adb35d4', $q$vs Qwilr$q$, $q$/compare/paperless-ngx-vs-qwilr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '833af197-f585-45d4-b9f9-cf879adb35d4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '833af197-f585-45d4-b9f9-cf879adb35d4' AND href = $q$/compare/paperless-ngx-vs-qwilr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a', $q$vs Paperless-ngx$q$, $q$/compare/paperless-ngx-vs-qwilr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a' AND href = $q$/compare/paperless-ngx-vs-qwilr$q$);

-- ── Dropbox Sign vs Paperless-ngx (dropbox-sign-vs-paperless-ngx) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d81fd94a-547f-4b52-8585-6375a6414c6d', '833af197-f585-45d4-b9f9-cf879adb35d4', $q$dropbox-sign-vs-paperless-ngx$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd81fd94a-547f-4b52-8585-6375a6414c6d', $q$vs Paperless-ngx$q$, $q$/compare/dropbox-sign-vs-paperless-ngx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d' AND href = $q$/compare/dropbox-sign-vs-paperless-ngx$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '833af197-f585-45d4-b9f9-cf879adb35d4', $q$vs Dropbox Sign$q$, $q$/compare/dropbox-sign-vs-paperless-ngx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '833af197-f585-45d4-b9f9-cf879adb35d4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '833af197-f585-45d4-b9f9-cf879adb35d4' AND href = $q$/compare/dropbox-sign-vs-paperless-ngx$q$);

-- ── Dropbox Sign vs SignServer (dropbox-sign-vs-signserver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d81fd94a-547f-4b52-8585-6375a6414c6d', 'e17e182c-05b6-4b50-b6cc-283acedc783a', $q$dropbox-sign-vs-signserver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd81fd94a-547f-4b52-8585-6375a6414c6d', $q$vs SignServer$q$, $q$/compare/dropbox-sign-vs-signserver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d' AND href = $q$/compare/dropbox-sign-vs-signserver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e17e182c-05b6-4b50-b6cc-283acedc783a', $q$vs Dropbox Sign$q$, $q$/compare/dropbox-sign-vs-signserver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e17e182c-05b6-4b50-b6cc-283acedc783a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e17e182c-05b6-4b50-b6cc-283acedc783a' AND href = $q$/compare/dropbox-sign-vs-signserver$q$);

-- ── Form.io vs Youform (form-io-vs-youform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', 'acb5fd7b-7099-4d41-a28a-be19f1114546', $q$form-io-vs-youform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a141dc6c-48ce-4194-aa10-52dc5225f542', $q$vs Youform$q$, $q$/compare/form-io-vs-youform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a141dc6c-48ce-4194-aa10-52dc5225f542'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a141dc6c-48ce-4194-aa10-52dc5225f542' AND href = $q$/compare/form-io-vs-youform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'acb5fd7b-7099-4d41-a28a-be19f1114546', $q$vs Form.io$q$, $q$/compare/form-io-vs-youform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'acb5fd7b-7099-4d41-a28a-be19f1114546'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'acb5fd7b-7099-4d41-a28a-be19f1114546' AND href = $q$/compare/form-io-vs-youform$q$);

-- ── Form.io vs Google Forms (form-io-vs-google-forms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', 'db6b7ee1-78f4-46e7-8173-0f395de936ba', $q$form-io-vs-google-forms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a141dc6c-48ce-4194-aa10-52dc5225f542', $q$vs Google Forms$q$, $q$/compare/form-io-vs-google-forms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a141dc6c-48ce-4194-aa10-52dc5225f542'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a141dc6c-48ce-4194-aa10-52dc5225f542' AND href = $q$/compare/form-io-vs-google-forms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db6b7ee1-78f4-46e7-8173-0f395de936ba', $q$vs Form.io$q$, $q$/compare/form-io-vs-google-forms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db6b7ee1-78f4-46e7-8173-0f395de936ba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db6b7ee1-78f4-46e7-8173-0f395de936ba' AND href = $q$/compare/form-io-vs-google-forms$q$);

-- ── ownCloud vs ShareFile (owncloud-vs-sharefile) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '2708453f-26c2-4ab0-9cc3-e26e1734570d', $q$owncloud-vs-sharefile$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$vs ShareFile$q$, $q$/compare/owncloud-vs-sharefile$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6' AND href = $q$/compare/owncloud-vs-sharefile$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2708453f-26c2-4ab0-9cc3-e26e1734570d', $q$vs ownCloud$q$, $q$/compare/owncloud-vs-sharefile$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2708453f-26c2-4ab0-9cc3-e26e1734570d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2708453f-26c2-4ab0-9cc3-e26e1734570d' AND href = $q$/compare/owncloud-vs-sharefile$q$);

-- ── ownCloud vs WeTransfer (owncloud-vs-wetransfer) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$owncloud-vs-wetransfer$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$vs WeTransfer$q$, $q$/compare/owncloud-vs-wetransfer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6' AND href = $q$/compare/owncloud-vs-wetransfer$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$vs ownCloud$q$, $q$/compare/owncloud-vs-wetransfer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc' AND href = $q$/compare/owncloud-vs-wetransfer$q$);

-- ── LimeSurvey vs UserZoom (limesurvey-vs-userzoom) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', 'c692a937-f3e2-45ab-ad20-28a30d805a63', $q$limesurvey-vs-userzoom$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$vs UserZoom$q$, $q$/compare/limesurvey-vs-userzoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f' AND href = $q$/compare/limesurvey-vs-userzoom$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c692a937-f3e2-45ab-ad20-28a30d805a63', $q$vs LimeSurvey$q$, $q$/compare/limesurvey-vs-userzoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63' AND href = $q$/compare/limesurvey-vs-userzoom$q$);

-- ── LimeSurvey vs Qualtrics (limesurvey-vs-qualtrics) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', '3b111844-9cfa-4a96-813d-555779600f9d', $q$limesurvey-vs-qualtrics$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$vs Qualtrics$q$, $q$/compare/limesurvey-vs-qualtrics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f' AND href = $q$/compare/limesurvey-vs-qualtrics$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3b111844-9cfa-4a96-813d-555779600f9d', $q$vs LimeSurvey$q$, $q$/compare/limesurvey-vs-qualtrics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3b111844-9cfa-4a96-813d-555779600f9d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3b111844-9cfa-4a96-813d-555779600f9d' AND href = $q$/compare/limesurvey-vs-qualtrics$q$);

-- ── activepieces vs Woodpecker CI (activepieces-vs-woodpecker-ci) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'ff195225-a15d-4993-96da-c517414aa5f5', $q$activepieces-vs-woodpecker-ci$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Woodpecker CI$q$, $q$/compare/activepieces-vs-woodpecker-ci$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-woodpecker-ci$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ff195225-a15d-4993-96da-c517414aa5f5', $q$vs activepieces$q$, $q$/compare/activepieces-vs-woodpecker-ci$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ff195225-a15d-4993-96da-c517414aa5f5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ff195225-a15d-4993-96da-c517414aa5f5' AND href = $q$/compare/activepieces-vs-woodpecker-ci$q$);

-- ── activepieces vs OpenNebula (activepieces-vs-opennebula) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$activepieces-vs-opennebula$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs OpenNebula$q$, $q$/compare/activepieces-vs-opennebula$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-opennebula$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$vs activepieces$q$, $q$/compare/activepieces-vs-opennebula$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54' AND href = $q$/compare/activepieces-vs-opennebula$q$);

-- ── activepieces vs Portainer (activepieces-vs-portainer) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$activepieces-vs-portainer$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Portainer$q$, $q$/compare/activepieces-vs-portainer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-portainer$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$vs activepieces$q$, $q$/compare/activepieces-vs-portainer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '533ae83f-c4e9-4971-b328-0c6cb0ac3d10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '533ae83f-c4e9-4971-b328-0c6cb0ac3d10' AND href = $q$/compare/activepieces-vs-portainer$q$);

-- ── activepieces vs Harbor (activepieces-vs-harbor) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '2fda9f09-2141-4cc7-84c4-66606e716a87', $q$activepieces-vs-harbor$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Harbor$q$, $q$/compare/activepieces-vs-harbor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-harbor$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2fda9f09-2141-4cc7-84c4-66606e716a87', $q$vs activepieces$q$, $q$/compare/activepieces-vs-harbor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2fda9f09-2141-4cc7-84c4-66606e716a87'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2fda9f09-2141-4cc7-84c4-66606e716a87' AND href = $q$/compare/activepieces-vs-harbor$q$);

-- ── activepieces vs Bugsink (activepieces-vs-bugsink) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'b5e89d16-61c3-4ade-882a-138e2a553e12', $q$activepieces-vs-bugsink$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Bugsink$q$, $q$/compare/activepieces-vs-bugsink$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-bugsink$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b5e89d16-61c3-4ade-882a-138e2a553e12', $q$vs activepieces$q$, $q$/compare/activepieces-vs-bugsink$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12' AND href = $q$/compare/activepieces-vs-bugsink$q$);

-- ── activepieces vs Flux (activepieces-vs-flux) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$activepieces-vs-flux$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Flux$q$, $q$/compare/activepieces-vs-flux$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-flux$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$vs activepieces$q$, $q$/compare/activepieces-vs-flux$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6ffc4ecf-fd8f-435d-a80c-5753e1503951'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6ffc4ecf-fd8f-435d-a80c-5753e1503951' AND href = $q$/compare/activepieces-vs-flux$q$);

-- ── activepieces vs Snipe-IT (activepieces-vs-snipe-it) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '807b9f70-85d4-451c-836e-7da931db0f4d', $q$activepieces-vs-snipe-it$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Snipe-IT$q$, $q$/compare/activepieces-vs-snipe-it$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-snipe-it$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '807b9f70-85d4-451c-836e-7da931db0f4d', $q$vs activepieces$q$, $q$/compare/activepieces-vs-snipe-it$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '807b9f70-85d4-451c-836e-7da931db0f4d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '807b9f70-85d4-451c-836e-7da931db0f4d' AND href = $q$/compare/activepieces-vs-snipe-it$q$);

-- ── activepieces vs NetBox (activepieces-vs-netbox) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$activepieces-vs-netbox$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs NetBox$q$, $q$/compare/activepieces-vs-netbox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-netbox$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$vs activepieces$q$, $q$/compare/activepieces-vs-netbox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b' AND href = $q$/compare/activepieces-vs-netbox$q$);

-- ── activepieces vs Rancher (activepieces-vs-rancher) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '446aa6e7-9482-4a1a-b79a-0320f056b430', $q$activepieces-vs-rancher$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Rancher$q$, $q$/compare/activepieces-vs-rancher$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-rancher$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '446aa6e7-9482-4a1a-b79a-0320f056b430', $q$vs activepieces$q$, $q$/compare/activepieces-vs-rancher$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '446aa6e7-9482-4a1a-b79a-0320f056b430'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '446aa6e7-9482-4a1a-b79a-0320f056b430' AND href = $q$/compare/activepieces-vs-rancher$q$);

-- ── activepieces vs Graylog (activepieces-vs-graylog) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$activepieces-vs-graylog$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Graylog$q$, $q$/compare/activepieces-vs-graylog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-graylog$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$vs activepieces$q$, $q$/compare/activepieces-vs-graylog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5f805c48-e5b0-4af0-83dd-98deb8ee69d9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5f805c48-e5b0-4af0-83dd-98deb8ee69d9' AND href = $q$/compare/activepieces-vs-graylog$q$);

-- ── activepieces vs Nomad (activepieces-vs-nomad) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'd651e30f-02b4-4774-b024-a6a3d9d377ee', $q$activepieces-vs-nomad$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Nomad$q$, $q$/compare/activepieces-vs-nomad$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-nomad$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd651e30f-02b4-4774-b024-a6a3d9d377ee', $q$vs activepieces$q$, $q$/compare/activepieces-vs-nomad$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd651e30f-02b4-4774-b024-a6a3d9d377ee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd651e30f-02b4-4774-b024-a6a3d9d377ee' AND href = $q$/compare/activepieces-vs-nomad$q$);

-- ── activepieces vs Verdaccio (activepieces-vs-verdaccio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'e4836b9e-697c-4735-b03e-624cbcf6545f', $q$activepieces-vs-verdaccio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Verdaccio$q$, $q$/compare/activepieces-vs-verdaccio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-verdaccio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e4836b9e-697c-4735-b03e-624cbcf6545f', $q$vs activepieces$q$, $q$/compare/activepieces-vs-verdaccio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f' AND href = $q$/compare/activepieces-vs-verdaccio$q$);

-- ── activepieces vs HashiCorp Consul (activepieces-vs-hashicorp-consul) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$activepieces-vs-hashicorp-consul$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs HashiCorp Consul$q$, $q$/compare/activepieces-vs-hashicorp-consul$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-hashicorp-consul$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$vs activepieces$q$, $q$/compare/activepieces-vs-hashicorp-consul$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0' AND href = $q$/compare/activepieces-vs-hashicorp-consul$q$);

-- ── activepieces vs Gatus (activepieces-vs-gatus) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$activepieces-vs-gatus$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Gatus$q$, $q$/compare/activepieces-vs-gatus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-gatus$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$vs activepieces$q$, $q$/compare/activepieces-vs-gatus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a' AND href = $q$/compare/activepieces-vs-gatus$q$);

-- ── activepieces vs Gitea (activepieces-vs-gitea) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$activepieces-vs-gitea$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Gitea$q$, $q$/compare/activepieces-vs-gitea$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-gitea$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$vs activepieces$q$, $q$/compare/activepieces-vs-gitea$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5' AND href = $q$/compare/activepieces-vs-gitea$q$);

-- ── activepieces vs Harvester (activepieces-vs-harvester) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'a9e58a83-376b-4e93-b8f6-d707024da382', $q$activepieces-vs-harvester$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Harvester$q$, $q$/compare/activepieces-vs-harvester$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-harvester$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a9e58a83-376b-4e93-b8f6-d707024da382', $q$vs activepieces$q$, $q$/compare/activepieces-vs-harvester$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a9e58a83-376b-4e93-b8f6-d707024da382'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a9e58a83-376b-4e93-b8f6-d707024da382' AND href = $q$/compare/activepieces-vs-harvester$q$);

-- ── Infisical vs Parse Platform (infisical-vs-parse-platform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', '3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$infisical-vs-parse-platform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '870d8f7e-4a30-42b3-8999-2b52c10af200', $q$vs Parse Platform$q$, $q$/compare/infisical-vs-parse-platform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '870d8f7e-4a30-42b3-8999-2b52c10af200'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '870d8f7e-4a30-42b3-8999-2b52c10af200' AND href = $q$/compare/infisical-vs-parse-platform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$vs Infisical$q$, $q$/compare/infisical-vs-parse-platform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a' AND href = $q$/compare/infisical-vs-parse-platform$q$);

-- ── airflow vs Parse Platform (airflow-vs-parse-platform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$airflow-vs-parse-platform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Parse Platform$q$, $q$/compare/airflow-vs-parse-platform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-parse-platform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$vs airflow$q$, $q$/compare/airflow-vs-parse-platform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a' AND href = $q$/compare/airflow-vs-parse-platform$q$);

-- ── airflow vs Backstage (airflow-vs-backstage) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', 'e5009be9-697e-4348-8c21-f8adaa429ec5', $q$airflow-vs-backstage$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Backstage$q$, $q$/compare/airflow-vs-backstage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-backstage$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e5009be9-697e-4348-8c21-f8adaa429ec5', $q$vs airflow$q$, $q$/compare/airflow-vs-backstage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5' AND href = $q$/compare/airflow-vs-backstage$q$);

-- ── airflow vs Postal (airflow-vs-postal) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '23c53c70-2a21-4d74-b527-25a8f44a4362', $q$airflow-vs-postal$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Postal$q$, $q$/compare/airflow-vs-postal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-postal$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '23c53c70-2a21-4d74-b527-25a8f44a4362', $q$vs airflow$q$, $q$/compare/airflow-vs-postal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '23c53c70-2a21-4d74-b527-25a8f44a4362'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '23c53c70-2a21-4d74-b527-25a8f44a4362' AND href = $q$/compare/airflow-vs-postal$q$);

-- ── airflow vs Mailpit (airflow-vs-mailpit) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '75720a0f-3359-4066-8426-dccd1160a142', $q$airflow-vs-mailpit$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Mailpit$q$, $q$/compare/airflow-vs-mailpit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-mailpit$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '75720a0f-3359-4066-8426-dccd1160a142', $q$vs airflow$q$, $q$/compare/airflow-vs-mailpit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '75720a0f-3359-4066-8426-dccd1160a142'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '75720a0f-3359-4066-8426-dccd1160a142' AND href = $q$/compare/airflow-vs-mailpit$q$);

-- ── airflow vs Novu (airflow-vs-novu) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '555aaf18-6846-4042-ba95-cc4fd3189aec', $q$airflow-vs-novu$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Novu$q$, $q$/compare/airflow-vs-novu$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-novu$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '555aaf18-6846-4042-ba95-cc4fd3189aec', $q$vs airflow$q$, $q$/compare/airflow-vs-novu$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '555aaf18-6846-4042-ba95-cc4fd3189aec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '555aaf18-6846-4042-ba95-cc4fd3189aec' AND href = $q$/compare/airflow-vs-novu$q$);

-- ── airflow vs Hugo (airflow-vs-hugo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', 'a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$airflow-vs-hugo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Hugo$q$, $q$/compare/airflow-vs-hugo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-hugo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$vs airflow$q$, $q$/compare/airflow-vs-hugo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a46d19fe-50a3-4df2-8764-c03c06ff332b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a46d19fe-50a3-4df2-8764-c03c06ff332b' AND href = $q$/compare/airflow-vs-hugo$q$);

-- ── airflow vs archivebox (airflow-vs-archivebox) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '3dd438a5-8354-47f1-89d7-033079a89cc5', $q$airflow-vs-archivebox$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs archivebox$q$, $q$/compare/airflow-vs-archivebox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-archivebox$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3dd438a5-8354-47f1-89d7-033079a89cc5', $q$vs airflow$q$, $q$/compare/airflow-vs-archivebox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5' AND href = $q$/compare/airflow-vs-archivebox$q$);

-- ── airflow vs Nuxt (airflow-vs-nuxt) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$airflow-vs-nuxt$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Nuxt$q$, $q$/compare/airflow-vs-nuxt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-nuxt$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$vs airflow$q$, $q$/compare/airflow-vs-nuxt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '18d961a0-d3f8-4b71-86cc-965236f0cda6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '18d961a0-d3f8-4b71-86cc-965236f0cda6' AND href = $q$/compare/airflow-vs-nuxt$q$);

-- ── castopod vs Optimizely (castopod-vs-optimizely) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9de517df-9167-4f74-81ef-57b4e421d271', '5de91ee1-beae-41ba-afc9-53772c7393cb', $q$castopod-vs-optimizely$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9de517df-9167-4f74-81ef-57b4e421d271', $q$vs Optimizely$q$, $q$/compare/castopod-vs-optimizely$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9de517df-9167-4f74-81ef-57b4e421d271'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9de517df-9167-4f74-81ef-57b4e421d271' AND href = $q$/compare/castopod-vs-optimizely$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5de91ee1-beae-41ba-afc9-53772c7393cb', $q$vs castopod$q$, $q$/compare/castopod-vs-optimizely$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5de91ee1-beae-41ba-afc9-53772c7393cb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5de91ee1-beae-41ba-afc9-53772c7393cb' AND href = $q$/compare/castopod-vs-optimizely$q$);

-- ── castopod vs ghost (castopod-vs-ghost) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9de517df-9167-4f74-81ef-57b4e421d271', '079eef6a-7551-42f9-8218-0e4c4e82dc10', $q$castopod-vs-ghost$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9de517df-9167-4f74-81ef-57b4e421d271', $q$vs ghost$q$, $q$/compare/castopod-vs-ghost$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9de517df-9167-4f74-81ef-57b4e421d271'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9de517df-9167-4f74-81ef-57b4e421d271' AND href = $q$/compare/castopod-vs-ghost$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '079eef6a-7551-42f9-8218-0e4c4e82dc10', $q$vs castopod$q$, $q$/compare/castopod-vs-ghost$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '079eef6a-7551-42f9-8218-0e4c4e82dc10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '079eef6a-7551-42f9-8218-0e4c4e82dc10' AND href = $q$/compare/castopod-vs-ghost$q$);

-- ── Maizzle vs Vero (maizzle-vs-vero) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd', '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$maizzle-vs-vero$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd', $q$vs Vero$q$, $q$/compare/maizzle-vs-vero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd' AND href = $q$/compare/maizzle-vs-vero$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$vs Maizzle$q$, $q$/compare/maizzle-vs-vero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb' AND href = $q$/compare/maizzle-vs-vero$q$);

-- ── dittofeed vs Maizzle (dittofeed-vs-maizzle) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c39707a3-e756-48c8-929c-f10fe278ae92', '6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd', $q$dittofeed-vs-maizzle$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c39707a3-e756-48c8-929c-f10fe278ae92', $q$vs Maizzle$q$, $q$/compare/dittofeed-vs-maizzle$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c39707a3-e756-48c8-929c-f10fe278ae92'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c39707a3-e756-48c8-929c-f10fe278ae92' AND href = $q$/compare/dittofeed-vs-maizzle$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd', $q$vs dittofeed$q$, $q$/compare/dittofeed-vs-maizzle$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd' AND href = $q$/compare/dittofeed-vs-maizzle$q$);

-- ── GrowthBook vs GrowthLoop (growthbook-vs-growthloop) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', '45050474-ebf1-4a46-89d7-f47f4521c45f', $q$growthbook-vs-growthloop$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$vs GrowthLoop$q$, $q$/compare/growthbook-vs-growthloop$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0' AND href = $q$/compare/growthbook-vs-growthloop$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45050474-ebf1-4a46-89d7-f47f4521c45f', $q$vs GrowthBook$q$, $q$/compare/growthbook-vs-growthloop$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45050474-ebf1-4a46-89d7-f47f4521c45f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45050474-ebf1-4a46-89d7-f47f4521c45f' AND href = $q$/compare/growthbook-vs-growthloop$q$);

-- ── GrowthLoop vs matomo (growthloop-vs-matomo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$growthloop-vs-matomo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45050474-ebf1-4a46-89d7-f47f4521c45f', $q$vs matomo$q$, $q$/compare/growthloop-vs-matomo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45050474-ebf1-4a46-89d7-f47f4521c45f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45050474-ebf1-4a46-89d7-f47f4521c45f' AND href = $q$/compare/growthloop-vs-matomo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$vs GrowthLoop$q$, $q$/compare/growthloop-vs-matomo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f' AND href = $q$/compare/growthloop-vs-matomo$q$);

-- ── matomo vs ProfitWell (matomo-vs-profitwell) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', '2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$matomo-vs-profitwell$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$vs ProfitWell$q$, $q$/compare/matomo-vs-profitwell$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f' AND href = $q$/compare/matomo-vs-profitwell$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$vs matomo$q$, $q$/compare/matomo-vs-profitwell$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2a4f0fe3-b308-423c-aecf-cdff842abdcc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2a4f0fe3-b308-423c-aecf-cdff842abdcc' AND href = $q$/compare/matomo-vs-profitwell$q$);

-- ── Hurl vs SQD (hurl-vs-sqd) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$hurl-vs-sqd$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5db80a47-34dc-4c07-9969-53321dbed91e', $q$vs SQD$q$, $q$/compare/hurl-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5db80a47-34dc-4c07-9969-53321dbed91e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5db80a47-34dc-4c07-9969-53321dbed91e' AND href = $q$/compare/hurl-vs-sqd$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$vs Hurl$q$, $q$/compare/hurl-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425' AND href = $q$/compare/hurl-vs-sqd$q$);

-- ── PostgREST vs SQD (postgrest-vs-sqd) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$postgrest-vs-sqd$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dd33727e-2e57-4b2e-af05-7dee39588471', $q$vs SQD$q$, $q$/compare/postgrest-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dd33727e-2e57-4b2e-af05-7dee39588471'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dd33727e-2e57-4b2e-af05-7dee39588471' AND href = $q$/compare/postgrest-vs-sqd$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$vs PostgREST$q$, $q$/compare/postgrest-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425' AND href = $q$/compare/postgrest-vs-sqd$q$);

-- ── Convoy vs SQD (convoy-vs-sqd) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$convoy-vs-sqd$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$vs SQD$q$, $q$/compare/convoy-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb460c74-dce8-4856-9dc3-61f824bd3a75'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb460c74-dce8-4856-9dc3-61f824bd3a75' AND href = $q$/compare/convoy-vs-sqd$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$vs Convoy$q$, $q$/compare/convoy-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425' AND href = $q$/compare/convoy-vs-sqd$q$);

-- ── Craft vs Linkding (craft-vs-linkding) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c7ea5abe-ea46-4e4c-b5e4-246810a1c777', '8026be73-ac41-420c-b94b-3ca165f049ef', $q$craft-vs-linkding$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777', $q$vs Linkding$q$, $q$/compare/craft-vs-linkding$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777' AND href = $q$/compare/craft-vs-linkding$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8026be73-ac41-420c-b94b-3ca165f049ef', $q$vs Craft$q$, $q$/compare/craft-vs-linkding$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8026be73-ac41-420c-b94b-3ca165f049ef'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8026be73-ac41-420c-b94b-3ca165f049ef' AND href = $q$/compare/craft-vs-linkding$q$);

-- ── Linkding vs Notion (linkding-vs-notion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$linkding-vs-notion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8026be73-ac41-420c-b94b-3ca165f049ef', $q$vs Notion$q$, $q$/compare/linkding-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8026be73-ac41-420c-b94b-3ca165f049ef'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8026be73-ac41-420c-b94b-3ca165f049ef' AND href = $q$/compare/linkding-vs-notion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs Linkding$q$, $q$/compare/linkding-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/linkding-vs-notion$q$);

-- ── LibreOffice vs Notion (libreoffice-vs-notion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$libreoffice-vs-notion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$vs Notion$q$, $q$/compare/libreoffice-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '54c13dd3-4248-499f-8fcf-083dadd9d1bb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '54c13dd3-4248-499f-8fcf-083dadd9d1bb' AND href = $q$/compare/libreoffice-vs-notion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs LibreOffice$q$, $q$/compare/libreoffice-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/libreoffice-vs-notion$q$);

-- ── Notion vs wallabag (notion-vs-wallabag) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', '2d0559af-047f-4b10-a092-6965237ee798', $q$notion-vs-wallabag$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs wallabag$q$, $q$/compare/notion-vs-wallabag$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/notion-vs-wallabag$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d0559af-047f-4b10-a092-6965237ee798', $q$vs Notion$q$, $q$/compare/notion-vs-wallabag$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d0559af-047f-4b10-a092-6965237ee798'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d0559af-047f-4b10-a092-6965237ee798' AND href = $q$/compare/notion-vs-wallabag$q$);

-- ── EtherCalc vs Notion (ethercalc-vs-notion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$ethercalc-vs-notion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$vs Notion$q$, $q$/compare/ethercalc-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eddc5a12-a813-48d5-b150-695f5bfdf5f3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eddc5a12-a813-48d5-b150-695f5bfdf5f3' AND href = $q$/compare/ethercalc-vs-notion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs EtherCalc$q$, $q$/compare/ethercalc-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/ethercalc-vs-notion$q$);

-- ── Notion vs Webrecorder (notion-vs-webrecorder) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$notion-vs-webrecorder$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs Webrecorder$q$, $q$/compare/notion-vs-webrecorder$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/notion-vs-webrecorder$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$vs Notion$q$, $q$/compare/notion-vs-webrecorder$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29' AND href = $q$/compare/notion-vs-webrecorder$q$);

-- ── Permify vs Vanta (permify-vs-vanta) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', 'afc32d91-8855-4308-bcef-20828d9e78e2', $q$permify-vs-vanta$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b95ba4cb-96d7-4478-9722-2807aa591486', $q$vs Vanta$q$, $q$/compare/permify-vs-vanta$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b95ba4cb-96d7-4478-9722-2807aa591486'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b95ba4cb-96d7-4478-9722-2807aa591486' AND href = $q$/compare/permify-vs-vanta$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'afc32d91-8855-4308-bcef-20828d9e78e2', $q$vs Permify$q$, $q$/compare/permify-vs-vanta$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'afc32d91-8855-4308-bcef-20828d9e78e2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'afc32d91-8855-4308-bcef-20828d9e78e2' AND href = $q$/compare/permify-vs-vanta$q$);

-- ── openarchiver vs Permify (openarchiver-vs-permify) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('eb3daa84-88c9-499e-95e5-0b30eb01de90', 'b95ba4cb-96d7-4478-9722-2807aa591486', $q$openarchiver-vs-permify$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Permify$q$, $q$/compare/openarchiver-vs-permify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/openarchiver-vs-permify$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b95ba4cb-96d7-4478-9722-2807aa591486', $q$vs openarchiver$q$, $q$/compare/openarchiver-vs-permify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b95ba4cb-96d7-4478-9722-2807aa591486'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b95ba4cb-96d7-4478-9722-2807aa591486' AND href = $q$/compare/openarchiver-vs-permify$q$);

-- ── FleetDM vs openarchiver (fleetdm-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$fleetdm-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a79e35cf-f4a5-404f-8138-ace452376ebd', $q$vs openarchiver$q$, $q$/compare/fleetdm-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a79e35cf-f4a5-404f-8138-ace452376ebd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a79e35cf-f4a5-404f-8138-ace452376ebd' AND href = $q$/compare/fleetdm-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs FleetDM$q$, $q$/compare/fleetdm-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/fleetdm-vs-openarchiver$q$);

-- ── openarchiver vs Velociraptor (openarchiver-vs-velociraptor) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('eb3daa84-88c9-499e-95e5-0b30eb01de90', 'e37166a1-5273-4465-ae0c-fa12188ba286', $q$openarchiver-vs-velociraptor$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Velociraptor$q$, $q$/compare/openarchiver-vs-velociraptor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/openarchiver-vs-velociraptor$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e37166a1-5273-4465-ae0c-fa12188ba286', $q$vs openarchiver$q$, $q$/compare/openarchiver-vs-velociraptor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e37166a1-5273-4465-ae0c-fa12188ba286'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e37166a1-5273-4465-ae0c-fa12188ba286' AND href = $q$/compare/openarchiver-vs-velociraptor$q$);

-- ── Authelia vs openarchiver (authelia-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$authelia-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '82f44b81-1616-4e4f-99ec-891f86393804', $q$vs openarchiver$q$, $q$/compare/authelia-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804' AND href = $q$/compare/authelia-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Authelia$q$, $q$/compare/authelia-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/authelia-vs-openarchiver$q$);

-- ── openarchiver vs Suricata (openarchiver-vs-suricata) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('eb3daa84-88c9-499e-95e5-0b30eb01de90', '6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$openarchiver-vs-suricata$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Suricata$q$, $q$/compare/openarchiver-vs-suricata$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/openarchiver-vs-suricata$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$vs openarchiver$q$, $q$/compare/openarchiver-vs-suricata$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8' AND href = $q$/compare/openarchiver-vs-suricata$q$);

-- ── Conjur vs openarchiver (conjur-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0b888188-3d57-4941-b06a-2c4600263666', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$conjur-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0b888188-3d57-4941-b06a-2c4600263666', $q$vs openarchiver$q$, $q$/compare/conjur-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0b888188-3d57-4941-b06a-2c4600263666'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0b888188-3d57-4941-b06a-2c4600263666' AND href = $q$/compare/conjur-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Conjur$q$, $q$/compare/conjur-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/conjur-vs-openarchiver$q$);

-- ── openarchiver vs osquery (openarchiver-vs-osquery) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('eb3daa84-88c9-499e-95e5-0b30eb01de90', '2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$openarchiver-vs-osquery$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs osquery$q$, $q$/compare/openarchiver-vs-osquery$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/openarchiver-vs-osquery$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$vs openarchiver$q$, $q$/compare/openarchiver-vs-osquery$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2bf3de07-cc2a-49cd-8239-4d711fd37c68'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2bf3de07-cc2a-49cd-8239-4d711fd37c68' AND href = $q$/compare/openarchiver-vs-osquery$q$);

-- ── openarchiver vs TheHive (openarchiver-vs-thehive) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('eb3daa84-88c9-499e-95e5-0b30eb01de90', '257eca99-6ff2-4447-96da-fbf120b70160', $q$openarchiver-vs-thehive$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs TheHive$q$, $q$/compare/openarchiver-vs-thehive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/openarchiver-vs-thehive$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '257eca99-6ff2-4447-96da-fbf120b70160', $q$vs openarchiver$q$, $q$/compare/openarchiver-vs-thehive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '257eca99-6ff2-4447-96da-fbf120b70160'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '257eca99-6ff2-4447-96da-fbf120b70160' AND href = $q$/compare/openarchiver-vs-thehive$q$);

-- ── Dependency-Track vs openarchiver (dependency-track-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$dependency-track-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b102eee5-b364-47b7-9569-b256d99e7549', $q$vs openarchiver$q$, $q$/compare/dependency-track-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b102eee5-b364-47b7-9569-b256d99e7549'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b102eee5-b364-47b7-9569-b256d99e7549' AND href = $q$/compare/dependency-track-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Dependency-Track$q$, $q$/compare/dependency-track-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/dependency-track-vs-openarchiver$q$);

-- ── MISP vs openarchiver (misp-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$misp-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$vs openarchiver$q$, $q$/compare/misp-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72' AND href = $q$/compare/misp-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs MISP$q$, $q$/compare/misp-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/misp-vs-openarchiver$q$);

-- ── DefectDojo vs openarchiver (defectdojo-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$defectdojo-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '717823fe-8010-4821-a2b2-2263a7afbe21', $q$vs openarchiver$q$, $q$/compare/defectdojo-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '717823fe-8010-4821-a2b2-2263a7afbe21'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '717823fe-8010-4821-a2b2-2263a7afbe21' AND href = $q$/compare/defectdojo-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs DefectDojo$q$, $q$/compare/defectdojo-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/defectdojo-vs-openarchiver$q$);

-- ── Deskpro vs GLPI (deskpro-vs-glpi) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', 'b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$deskpro-vs-glpi$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$vs GLPI$q$, $q$/compare/deskpro-vs-glpi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc' AND href = $q$/compare/deskpro-vs-glpi$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$vs Deskpro$q$, $q$/compare/deskpro-vs-glpi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f' AND href = $q$/compare/deskpro-vs-glpi$q$);

-- ── GLPI vs Zendesk (glpi-vs-zendesk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', 'b87bf8ae-75dd-4294-97a0-45d392ce365a', $q$glpi-vs-zendesk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$vs Zendesk$q$, $q$/compare/glpi-vs-zendesk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f' AND href = $q$/compare/glpi-vs-zendesk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b87bf8ae-75dd-4294-97a0-45d392ce365a', $q$vs GLPI$q$, $q$/compare/glpi-vs-zendesk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b87bf8ae-75dd-4294-97a0-45d392ce365a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b87bf8ae-75dd-4294-97a0-45d392ce365a' AND href = $q$/compare/glpi-vs-zendesk$q$);

-- ── Chatwoot vs Vitally (chatwoot-vs-vitally) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', '354544ee-5844-47e0-abfb-03b3c7ee9886', $q$chatwoot-vs-vitally$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$vs Vitally$q$, $q$/compare/chatwoot-vs-vitally$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5' AND href = $q$/compare/chatwoot-vs-vitally$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '354544ee-5844-47e0-abfb-03b3c7ee9886', $q$vs Chatwoot$q$, $q$/compare/chatwoot-vs-vitally$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886' AND href = $q$/compare/chatwoot-vs-vitally$q$);

-- ── ServiceNow vs Vitally (servicenow-vs-vitally) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dba954e7-42de-4597-adda-d2b1563a9303', '354544ee-5844-47e0-abfb-03b3c7ee9886', $q$servicenow-vs-vitally$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dba954e7-42de-4597-adda-d2b1563a9303', $q$vs Vitally$q$, $q$/compare/servicenow-vs-vitally$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dba954e7-42de-4597-adda-d2b1563a9303'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dba954e7-42de-4597-adda-d2b1563a9303' AND href = $q$/compare/servicenow-vs-vitally$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '354544ee-5844-47e0-abfb-03b3c7ee9886', $q$vs ServiceNow$q$, $q$/compare/servicenow-vs-vitally$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886' AND href = $q$/compare/servicenow-vs-vitally$q$);

-- ── Artboard Studio vs GIMP (artboard-studio-vs-gimp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', '05fd9154-b81e-4108-87a9-fd64b03f828c', $q$artboard-studio-vs-gimp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$vs GIMP$q$, $q$/compare/artboard-studio-vs-gimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c' AND href = $q$/compare/artboard-studio-vs-gimp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '05fd9154-b81e-4108-87a9-fd64b03f828c', $q$vs Artboard Studio$q$, $q$/compare/artboard-studio-vs-gimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '05fd9154-b81e-4108-87a9-fd64b03f828c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '05fd9154-b81e-4108-87a9-fd64b03f828c' AND href = $q$/compare/artboard-studio-vs-gimp$q$);

-- ── Adobe Express vs GIMP (adobe-express-vs-gimp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', '05fd9154-b81e-4108-87a9-fd64b03f828c', $q$adobe-express-vs-gimp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4c800b98-87da-4392-80f8-cc8ac66f95be', $q$vs GIMP$q$, $q$/compare/adobe-express-vs-gimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be' AND href = $q$/compare/adobe-express-vs-gimp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '05fd9154-b81e-4108-87a9-fd64b03f828c', $q$vs Adobe Express$q$, $q$/compare/adobe-express-vs-gimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '05fd9154-b81e-4108-87a9-fd64b03f828c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '05fd9154-b81e-4108-87a9-fd64b03f828c' AND href = $q$/compare/adobe-express-vs-gimp$q$);

-- ── Adobe Express vs Pencil Project (adobe-express-vs-pencil-project) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', '00563610-94ad-4982-9919-0d497b31162d', $q$adobe-express-vs-pencil-project$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4c800b98-87da-4392-80f8-cc8ac66f95be', $q$vs Pencil Project$q$, $q$/compare/adobe-express-vs-pencil-project$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be' AND href = $q$/compare/adobe-express-vs-pencil-project$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '00563610-94ad-4982-9919-0d497b31162d', $q$vs Adobe Express$q$, $q$/compare/adobe-express-vs-pencil-project$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '00563610-94ad-4982-9919-0d497b31162d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '00563610-94ad-4982-9919-0d497b31162d' AND href = $q$/compare/adobe-express-vs-pencil-project$q$);

-- ── Adobe Express vs Scribus (adobe-express-vs-scribus) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4c800b98-87da-4392-80f8-cc8ac66f95be', '89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$adobe-express-vs-scribus$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4c800b98-87da-4392-80f8-cc8ac66f95be', $q$vs Scribus$q$, $q$/compare/adobe-express-vs-scribus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4c800b98-87da-4392-80f8-cc8ac66f95be' AND href = $q$/compare/adobe-express-vs-scribus$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$vs Adobe Express$q$, $q$/compare/adobe-express-vs-scribus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '89f1086c-860a-4405-8ba6-cdbbeb21675a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '89f1086c-860a-4405-8ba6-cdbbeb21675a' AND href = $q$/compare/adobe-express-vs-scribus$q$);

-- ── Chatsonic vs Open WebUI (chatsonic-vs-open-webui) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a148f101-9c66-4591-aec9-b3207ca40a0e', '362996ad-6cda-41f1-8ec2-066aa387a46c', $q$chatsonic-vs-open-webui$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a148f101-9c66-4591-aec9-b3207ca40a0e', $q$vs Open WebUI$q$, $q$/compare/chatsonic-vs-open-webui$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a148f101-9c66-4591-aec9-b3207ca40a0e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a148f101-9c66-4591-aec9-b3207ca40a0e' AND href = $q$/compare/chatsonic-vs-open-webui$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '362996ad-6cda-41f1-8ec2-066aa387a46c', $q$vs Chatsonic$q$, $q$/compare/chatsonic-vs-open-webui$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '362996ad-6cda-41f1-8ec2-066aa387a46c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '362996ad-6cda-41f1-8ec2-066aa387a46c' AND href = $q$/compare/chatsonic-vs-open-webui$q$);

-- ── ChatGPT vs Open WebUI (chatgpt-vs-open-webui) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dd2f89ec-7433-42f0-b381-627ffd6ed01f', '362996ad-6cda-41f1-8ec2-066aa387a46c', $q$chatgpt-vs-open-webui$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dd2f89ec-7433-42f0-b381-627ffd6ed01f', $q$vs Open WebUI$q$, $q$/compare/chatgpt-vs-open-webui$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f' AND href = $q$/compare/chatgpt-vs-open-webui$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '362996ad-6cda-41f1-8ec2-066aa387a46c', $q$vs ChatGPT$q$, $q$/compare/chatgpt-vs-open-webui$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '362996ad-6cda-41f1-8ec2-066aa387a46c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '362996ad-6cda-41f1-8ec2-066aa387a46c' AND href = $q$/compare/chatgpt-vs-open-webui$q$);

-- ── Drawpile vs Microsoft Teams (drawpile-vs-microsoft-teams) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$drawpile-vs-microsoft-teams$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$vs Microsoft Teams$q$, $q$/compare/drawpile-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4' AND href = $q$/compare/drawpile-vs-microsoft-teams$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$vs Drawpile$q$, $q$/compare/drawpile-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f' AND href = $q$/compare/drawpile-vs-microsoft-teams$q$);

-- ── Etherpad vs Microsoft Teams (etherpad-vs-microsoft-teams) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$etherpad-vs-microsoft-teams$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$vs Microsoft Teams$q$, $q$/compare/etherpad-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69a475e1-9bb8-4bf6-9842-69059a3261a0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69a475e1-9bb8-4bf6-9842-69059a3261a0' AND href = $q$/compare/etherpad-vs-microsoft-teams$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$vs Etherpad$q$, $q$/compare/etherpad-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f' AND href = $q$/compare/etherpad-vs-microsoft-teams$q$);


-- Comparison batch: diagrams-net-vs-microsoft-teams, excalidraw-vs-microsoft-teams, builder-io-vs-jimdo, builder-io-vs-wordpress, grapesjs-vs-wordpress, silex-vs-wordpress, cube-vs-microsoft-power-bi, make-vs-sqlmesh, minio-vs-wetransfer, immich-vs-wetransfer, final-cut-pro-vs-kdenlive, final-cut-pro-vs-handbrake, founderpath-vs-numeral, numeral-vs-taxjar, taxjar-vs-zenskar, sequence-vs-zenskar, dealhub-cpq-vs-qobra, captivateiq-vs-qobra, captivateiq-vs-plecto, gong-vs-plecto, gong-vs-jiminny, jiminny-vs-quickmail, suitecrm-vs-yetiforce, arc-vs-payem, avalara-vs-sequence, quickmail-vs-salesbricks, krayin-crm-vs-yetiforce, espocrm-vs-suitecrm, espocrm-vs-orocrm, stoplight-vs-webhook-site, starlight-vs-stoplight, nectar-hr-vs-pingboard, burp-suite-vs-psono, payem-vs-soldo, found-vs-soldo, found-vs-lili, bluevine-vs-lili, bluevine-vs-clearco, avalara-vs-quaderno, fonoa-vs-quaderno, fonoa-vs-lago, lago-vs-openmeter, amberflo-vs-openmeter, amberflo-vs-tabs, ordway-vs-tabs, monetizenow-vs-salesbricks, monetizenow-vs-nue, nue-vs-quotapath, everstage-vs-quotapath, everstage-vs-forma-ai, forma-ai-vs-performio, performio-vs-sales-cookie, ambition-vs-sales-cookie, ambition-vs-spinify, salesscreen-vs-spinify, clari-vs-salesscreen, aviso-vs-clari, aviso-vs-chorus-ai, chorus-ai-vs-outreach, outreach-vs-persistiq, contactout-vs-persistiq, contactout-vs-fullenrich, sharpcloud-vs-uservoice, monica-vs-orocrm, hoppscotch-vs-starlight, icehrm-vs-pingboard, grype-vs-psono, clearco-vs-pipe, anrok-vs-ordway, doctolib-vs-theranest, cloudlex-vs-harvey, juicebox-vs-opencats, fullenrich-vs-subskribe-cpq, airfocus-vs-uservoice, atomic-crm-vs-corteza-crm, atomic-crm-vs-krayin-crm, hyperping-vs-statuscake, cronitor-vs-hyperping, cronitor-vs-signoz, signoz-vs-victoriametrics
-- Publishes 80 comparison page(s) with editorial content.

-- ── Diagrams.net vs Microsoft Teams (diagrams-net-vs-microsoft-teams) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$diagrams-net-vs-microsoft-teams$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'af654930-837f-40c8-b359-6e2d826ad6ff', $q$vs Microsoft Teams$q$, $q$/compare/diagrams-net-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'af654930-837f-40c8-b359-6e2d826ad6ff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'af654930-837f-40c8-b359-6e2d826ad6ff' AND href = $q$/compare/diagrams-net-vs-microsoft-teams$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$vs Diagrams.net$q$, $q$/compare/diagrams-net-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f' AND href = $q$/compare/diagrams-net-vs-microsoft-teams$q$);

-- ── Excalidraw vs Microsoft Teams (excalidraw-vs-microsoft-teams) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$excalidraw-vs-microsoft-teams$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3ca5270f-e111-4975-805d-895270a05cb1', $q$vs Microsoft Teams$q$, $q$/compare/excalidraw-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3ca5270f-e111-4975-805d-895270a05cb1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3ca5270f-e111-4975-805d-895270a05cb1' AND href = $q$/compare/excalidraw-vs-microsoft-teams$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$vs Excalidraw$q$, $q$/compare/excalidraw-vs-microsoft-teams$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '38ae237b-78e7-4604-8a45-6bc26a5f678f' AND href = $q$/compare/excalidraw-vs-microsoft-teams$q$);

-- ── Builder.io vs Jimdo (builder-io-vs-jimdo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '4a66d624-b348-4934-a255-2bc306fdcf7b', $q$builder-io-vs-jimdo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f8a615cc-2733-4282-bb83-ea78b3682118', $q$vs Jimdo$q$, $q$/compare/builder-io-vs-jimdo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118' AND href = $q$/compare/builder-io-vs-jimdo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4a66d624-b348-4934-a255-2bc306fdcf7b', $q$vs Builder.io$q$, $q$/compare/builder-io-vs-jimdo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4a66d624-b348-4934-a255-2bc306fdcf7b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4a66d624-b348-4934-a255-2bc306fdcf7b' AND href = $q$/compare/builder-io-vs-jimdo$q$);

-- ── Builder.io vs WordPress (builder-io-vs-wordpress) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '8741e733-7b13-489c-8696-9d50fbf35b42', $q$builder-io-vs-wordpress$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f8a615cc-2733-4282-bb83-ea78b3682118', $q$vs WordPress$q$, $q$/compare/builder-io-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118' AND href = $q$/compare/builder-io-vs-wordpress$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8741e733-7b13-489c-8696-9d50fbf35b42', $q$vs Builder.io$q$, $q$/compare/builder-io-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42' AND href = $q$/compare/builder-io-vs-wordpress$q$);

-- ── GrapesJS vs WordPress (grapesjs-vs-wordpress) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', '8741e733-7b13-489c-8696-9d50fbf35b42', $q$grapesjs-vs-wordpress$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$vs WordPress$q$, $q$/compare/grapesjs-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '95c8082d-ffa9-4958-bc60-8f9f554f3f0a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '95c8082d-ffa9-4958-bc60-8f9f554f3f0a' AND href = $q$/compare/grapesjs-vs-wordpress$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8741e733-7b13-489c-8696-9d50fbf35b42', $q$vs GrapesJS$q$, $q$/compare/grapesjs-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42' AND href = $q$/compare/grapesjs-vs-wordpress$q$);

-- ── Silex vs WordPress (silex-vs-wordpress) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', '8741e733-7b13-489c-8696-9d50fbf35b42', $q$silex-vs-wordpress$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$vs WordPress$q$, $q$/compare/silex-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef' AND href = $q$/compare/silex-vs-wordpress$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8741e733-7b13-489c-8696-9d50fbf35b42', $q$vs Silex$q$, $q$/compare/silex-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42' AND href = $q$/compare/silex-vs-wordpress$q$);

-- ── Cube vs Microsoft Power BI (cube-vs-microsoft-power-bi) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', '1ae91efd-338e-4ef0-9f0b-3f2a51548062', $q$cube-vs-microsoft-power-bi$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$vs Microsoft Power BI$q$, $q$/compare/cube-vs-microsoft-power-bi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ae35df8-1db0-4f11-b030-bac3223a2cbe'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ae35df8-1db0-4f11-b030-bac3223a2cbe' AND href = $q$/compare/cube-vs-microsoft-power-bi$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1ae91efd-338e-4ef0-9f0b-3f2a51548062', $q$vs Cube$q$, $q$/compare/cube-vs-microsoft-power-bi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062' AND href = $q$/compare/cube-vs-microsoft-power-bi$q$);

-- ── Make vs SQLMesh (make-vs-sqlmesh) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bf487e99-d6ce-4329-b02b-a9efe905e265', '5c5bacf6-63dd-435b-b336-2b016854189b', $q$make-vs-sqlmesh$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bf487e99-d6ce-4329-b02b-a9efe905e265', $q$vs SQLMesh$q$, $q$/compare/make-vs-sqlmesh$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265' AND href = $q$/compare/make-vs-sqlmesh$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5c5bacf6-63dd-435b-b336-2b016854189b', $q$vs Make$q$, $q$/compare/make-vs-sqlmesh$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b' AND href = $q$/compare/make-vs-sqlmesh$q$);

-- ── MinIO vs WeTransfer (minio-vs-wetransfer) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$minio-vs-wetransfer$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$vs WeTransfer$q$, $q$/compare/minio-vs-wetransfer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7f20a0c9-52f8-4c2c-8723-46040d797c2b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7f20a0c9-52f8-4c2c-8723-46040d797c2b' AND href = $q$/compare/minio-vs-wetransfer$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$vs MinIO$q$, $q$/compare/minio-vs-wetransfer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc' AND href = $q$/compare/minio-vs-wetransfer$q$);

-- ── Immich vs WeTransfer (immich-vs-wetransfer) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$immich-vs-wetransfer$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$vs WeTransfer$q$, $q$/compare/immich-vs-wetransfer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5' AND href = $q$/compare/immich-vs-wetransfer$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$vs Immich$q$, $q$/compare/immich-vs-wetransfer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc' AND href = $q$/compare/immich-vs-wetransfer$q$);

-- ── Final Cut Pro vs Kdenlive (final-cut-pro-vs-kdenlive) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$final-cut-pro-vs-kdenlive$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', $q$vs Kdenlive$q$, $q$/compare/final-cut-pro-vs-kdenlive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa' AND href = $q$/compare/final-cut-pro-vs-kdenlive$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$vs Final Cut Pro$q$, $q$/compare/final-cut-pro-vs-kdenlive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec' AND href = $q$/compare/final-cut-pro-vs-kdenlive$q$);

-- ── Final Cut Pro vs HandBrake (final-cut-pro-vs-handbrake) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', '5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$final-cut-pro-vs-handbrake$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', $q$vs HandBrake$q$, $q$/compare/final-cut-pro-vs-handbrake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa' AND href = $q$/compare/final-cut-pro-vs-handbrake$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$vs Final Cut Pro$q$, $q$/compare/final-cut-pro-vs-handbrake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5193cb21-ed1a-4efa-8952-c3400dfcbad7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5193cb21-ed1a-4efa-8952-c3400dfcbad7' AND href = $q$/compare/final-cut-pro-vs-handbrake$q$);

-- ── Founderpath vs Numeral (founderpath-vs-numeral) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', 'c9efa528-a016-40bf-b672-db270aa7c09d', $q$founderpath-vs-numeral$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$vs Numeral$q$, $q$/compare/founderpath-vs-numeral$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '806674db-f3e6-419b-a6a4-aa3e4199d96e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '806674db-f3e6-419b-a6a4-aa3e4199d96e' AND href = $q$/compare/founderpath-vs-numeral$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c9efa528-a016-40bf-b672-db270aa7c09d', $q$vs Founderpath$q$, $q$/compare/founderpath-vs-numeral$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c9efa528-a016-40bf-b672-db270aa7c09d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c9efa528-a016-40bf-b672-db270aa7c09d' AND href = $q$/compare/founderpath-vs-numeral$q$);

-- ── Numeral vs TaxJar (numeral-vs-taxjar) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', '12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$numeral-vs-taxjar$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c9efa528-a016-40bf-b672-db270aa7c09d', $q$vs TaxJar$q$, $q$/compare/numeral-vs-taxjar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c9efa528-a016-40bf-b672-db270aa7c09d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c9efa528-a016-40bf-b672-db270aa7c09d' AND href = $q$/compare/numeral-vs-taxjar$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$vs Numeral$q$, $q$/compare/numeral-vs-taxjar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a' AND href = $q$/compare/numeral-vs-taxjar$q$);

-- ── TaxJar vs Zenskar (taxjar-vs-zenskar) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', 'de85e666-3a6a-4ce4-b304-a77397acde17', $q$taxjar-vs-zenskar$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$vs Zenskar$q$, $q$/compare/taxjar-vs-zenskar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a' AND href = $q$/compare/taxjar-vs-zenskar$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de85e666-3a6a-4ce4-b304-a77397acde17', $q$vs TaxJar$q$, $q$/compare/taxjar-vs-zenskar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de85e666-3a6a-4ce4-b304-a77397acde17'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de85e666-3a6a-4ce4-b304-a77397acde17' AND href = $q$/compare/taxjar-vs-zenskar$q$);

-- ── Sequence vs Zenskar (sequence-vs-zenskar) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', 'de85e666-3a6a-4ce4-b304-a77397acde17', $q$sequence-vs-zenskar$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$vs Zenskar$q$, $q$/compare/sequence-vs-zenskar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba' AND href = $q$/compare/sequence-vs-zenskar$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de85e666-3a6a-4ce4-b304-a77397acde17', $q$vs Sequence$q$, $q$/compare/sequence-vs-zenskar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de85e666-3a6a-4ce4-b304-a77397acde17'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de85e666-3a6a-4ce4-b304-a77397acde17' AND href = $q$/compare/sequence-vs-zenskar$q$);

-- ── DealHub CPQ vs Qobra (dealhub-cpq-vs-qobra) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', 'e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$dealhub-cpq-vs-qobra$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$vs Qobra$q$, $q$/compare/dealhub-cpq-vs-qobra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa' AND href = $q$/compare/dealhub-cpq-vs-qobra$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$vs DealHub CPQ$q$, $q$/compare/dealhub-cpq-vs-qobra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c' AND href = $q$/compare/dealhub-cpq-vs-qobra$q$);

-- ── CaptivateIQ vs Qobra (captivateiq-vs-qobra) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', 'e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$captivateiq-vs-qobra$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$vs Qobra$q$, $q$/compare/captivateiq-vs-qobra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '171030c2-a2f0-41bf-b969-187ee5d4f56b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '171030c2-a2f0-41bf-b969-187ee5d4f56b' AND href = $q$/compare/captivateiq-vs-qobra$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$vs CaptivateIQ$q$, $q$/compare/captivateiq-vs-qobra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c' AND href = $q$/compare/captivateiq-vs-qobra$q$);

-- ── CaptivateIQ vs Plecto (captivateiq-vs-plecto) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', '794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$captivateiq-vs-plecto$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$vs Plecto$q$, $q$/compare/captivateiq-vs-plecto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '171030c2-a2f0-41bf-b969-187ee5d4f56b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '171030c2-a2f0-41bf-b969-187ee5d4f56b' AND href = $q$/compare/captivateiq-vs-plecto$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$vs CaptivateIQ$q$, $q$/compare/captivateiq-vs-plecto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '794737f5-a11c-4c4b-bd01-c5bd60d80316'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '794737f5-a11c-4c4b-bd01-c5bd60d80316' AND href = $q$/compare/captivateiq-vs-plecto$q$);

-- ── Gong vs Plecto (gong-vs-plecto) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', '794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$gong-vs-plecto$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$vs Plecto$q$, $q$/compare/gong-vs-plecto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f' AND href = $q$/compare/gong-vs-plecto$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$vs Gong$q$, $q$/compare/gong-vs-plecto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '794737f5-a11c-4c4b-bd01-c5bd60d80316'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '794737f5-a11c-4c4b-bd01-c5bd60d80316' AND href = $q$/compare/gong-vs-plecto$q$);

-- ── Gong vs Jiminny (gong-vs-jiminny) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', '846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$gong-vs-jiminny$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$vs Jiminny$q$, $q$/compare/gong-vs-jiminny$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f' AND href = $q$/compare/gong-vs-jiminny$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$vs Gong$q$, $q$/compare/gong-vs-jiminny$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '846a442d-c466-4a1c-ae5e-3ccb660753fb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '846a442d-c466-4a1c-ae5e-3ccb660753fb' AND href = $q$/compare/gong-vs-jiminny$q$);

-- ── Jiminny vs QuickMail (jiminny-vs-quickmail) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', 'bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$jiminny-vs-quickmail$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$vs QuickMail$q$, $q$/compare/jiminny-vs-quickmail$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '846a442d-c466-4a1c-ae5e-3ccb660753fb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '846a442d-c466-4a1c-ae5e-3ccb660753fb' AND href = $q$/compare/jiminny-vs-quickmail$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$vs Jiminny$q$, $q$/compare/jiminny-vs-quickmail$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485' AND href = $q$/compare/jiminny-vs-quickmail$q$);

-- ── SuiteCRM vs YetiForce (suitecrm-vs-yetiforce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', 'ad091561-b390-481a-bf66-f43ea55efb9d', $q$suitecrm-vs-yetiforce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$vs YetiForce$q$, $q$/compare/suitecrm-vs-yetiforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375' AND href = $q$/compare/suitecrm-vs-yetiforce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ad091561-b390-481a-bf66-f43ea55efb9d', $q$vs SuiteCRM$q$, $q$/compare/suitecrm-vs-yetiforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ad091561-b390-481a-bf66-f43ea55efb9d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ad091561-b390-481a-bf66-f43ea55efb9d' AND href = $q$/compare/suitecrm-vs-yetiforce$q$);

-- ── Arc vs PayEm (arc-vs-payem) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$arc-vs-payem$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5b1475af-f4bc-459d-ac77-e29162361ec3', $q$vs PayEm$q$, $q$/compare/arc-vs-payem$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3' AND href = $q$/compare/arc-vs-payem$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$vs Arc$q$, $q$/compare/arc-vs-payem$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6' AND href = $q$/compare/arc-vs-payem$q$);

-- ── Avalara vs Sequence (avalara-vs-sequence) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$avalara-vs-sequence$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5e671dda-5728-40ae-ba4d-0e752a749848', $q$vs Sequence$q$, $q$/compare/avalara-vs-sequence$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848' AND href = $q$/compare/avalara-vs-sequence$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$vs Avalara$q$, $q$/compare/avalara-vs-sequence$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba' AND href = $q$/compare/avalara-vs-sequence$q$);

-- ── QuickMail vs Salesbricks (quickmail-vs-salesbricks) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', '8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$quickmail-vs-salesbricks$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$vs Salesbricks$q$, $q$/compare/quickmail-vs-salesbricks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485' AND href = $q$/compare/quickmail-vs-salesbricks$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$vs QuickMail$q$, $q$/compare/quickmail-vs-salesbricks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8ba708a7-67bb-4103-86f5-6ecb278ba497'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8ba708a7-67bb-4103-86f5-6ecb278ba497' AND href = $q$/compare/quickmail-vs-salesbricks$q$);

-- ── Krayin CRM vs YetiForce (krayin-crm-vs-yetiforce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', 'ad091561-b390-481a-bf66-f43ea55efb9d', $q$krayin-crm-vs-yetiforce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$vs YetiForce$q$, $q$/compare/krayin-crm-vs-yetiforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b' AND href = $q$/compare/krayin-crm-vs-yetiforce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ad091561-b390-481a-bf66-f43ea55efb9d', $q$vs Krayin CRM$q$, $q$/compare/krayin-crm-vs-yetiforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ad091561-b390-481a-bf66-f43ea55efb9d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ad091561-b390-481a-bf66-f43ea55efb9d' AND href = $q$/compare/krayin-crm-vs-yetiforce$q$);

-- ── EspoCRM vs SuiteCRM (espocrm-vs-suitecrm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', 'f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$espocrm-vs-suitecrm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$vs SuiteCRM$q$, $q$/compare/espocrm-vs-suitecrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0' AND href = $q$/compare/espocrm-vs-suitecrm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$vs EspoCRM$q$, $q$/compare/espocrm-vs-suitecrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375' AND href = $q$/compare/espocrm-vs-suitecrm$q$);

-- ── EspoCRM vs OroCRM (espocrm-vs-orocrm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', '63ad3ef7-5046-461f-a151-5b360a08cc61', $q$espocrm-vs-orocrm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$vs OroCRM$q$, $q$/compare/espocrm-vs-orocrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0' AND href = $q$/compare/espocrm-vs-orocrm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '63ad3ef7-5046-461f-a151-5b360a08cc61', $q$vs EspoCRM$q$, $q$/compare/espocrm-vs-orocrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '63ad3ef7-5046-461f-a151-5b360a08cc61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '63ad3ef7-5046-461f-a151-5b360a08cc61' AND href = $q$/compare/espocrm-vs-orocrm$q$);

-- ── Stoplight vs Webhook.site (stoplight-vs-webhook-site) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$stoplight-vs-webhook-site$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28f84c5e-8df6-4846-8228-5943ba6223e8', $q$vs Webhook.site$q$, $q$/compare/stoplight-vs-webhook-site$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28f84c5e-8df6-4846-8228-5943ba6223e8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28f84c5e-8df6-4846-8228-5943ba6223e8' AND href = $q$/compare/stoplight-vs-webhook-site$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$vs Stoplight$q$, $q$/compare/stoplight-vs-webhook-site$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8' AND href = $q$/compare/stoplight-vs-webhook-site$q$);

-- ── Starlight vs Stoplight (starlight-vs-stoplight) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', '28f84c5e-8df6-4846-8228-5943ba6223e8', $q$starlight-vs-stoplight$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ffe3fec8-5847-4750-b01a-593c7901730d', $q$vs Stoplight$q$, $q$/compare/starlight-vs-stoplight$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ffe3fec8-5847-4750-b01a-593c7901730d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ffe3fec8-5847-4750-b01a-593c7901730d' AND href = $q$/compare/starlight-vs-stoplight$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28f84c5e-8df6-4846-8228-5943ba6223e8', $q$vs Starlight$q$, $q$/compare/starlight-vs-stoplight$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28f84c5e-8df6-4846-8228-5943ba6223e8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28f84c5e-8df6-4846-8228-5943ba6223e8' AND href = $q$/compare/starlight-vs-stoplight$q$);

-- ── Nectar HR vs Pingboard (nectar-hr-vs-pingboard) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', '3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$nectar-hr-vs-pingboard$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$vs Pingboard$q$, $q$/compare/nectar-hr-vs-pingboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e' AND href = $q$/compare/nectar-hr-vs-pingboard$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$vs Nectar HR$q$, $q$/compare/nectar-hr-vs-pingboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac' AND href = $q$/compare/nectar-hr-vs-pingboard$q$);

-- ── Burp Suite vs Psono (burp-suite-vs-psono) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', '86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$burp-suite-vs-psono$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$vs Psono$q$, $q$/compare/burp-suite-vs-psono$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '753226c3-cede-4bbb-9fad-9d73dd9827e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '753226c3-cede-4bbb-9fad-9d73dd9827e4' AND href = $q$/compare/burp-suite-vs-psono$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$vs Burp Suite$q$, $q$/compare/burp-suite-vs-psono$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07' AND href = $q$/compare/burp-suite-vs-psono$q$);

-- ── PayEm vs Soldo (payem-vs-soldo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$payem-vs-soldo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$vs Soldo$q$, $q$/compare/payem-vs-soldo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6' AND href = $q$/compare/payem-vs-soldo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$vs PayEm$q$, $q$/compare/payem-vs-soldo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a' AND href = $q$/compare/payem-vs-soldo$q$);

-- ── Found vs Soldo (found-vs-soldo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$found-vs-soldo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '22c9265b-8d90-4eb5-973c-a18df96a2516', $q$vs Soldo$q$, $q$/compare/found-vs-soldo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '22c9265b-8d90-4eb5-973c-a18df96a2516'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '22c9265b-8d90-4eb5-973c-a18df96a2516' AND href = $q$/compare/found-vs-soldo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$vs Found$q$, $q$/compare/found-vs-soldo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a' AND href = $q$/compare/found-vs-soldo$q$);

-- ── Found vs Lili (found-vs-lili) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', '9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$found-vs-lili$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '22c9265b-8d90-4eb5-973c-a18df96a2516', $q$vs Lili$q$, $q$/compare/found-vs-lili$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '22c9265b-8d90-4eb5-973c-a18df96a2516'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '22c9265b-8d90-4eb5-973c-a18df96a2516' AND href = $q$/compare/found-vs-lili$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$vs Found$q$, $q$/compare/found-vs-lili$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9a9a8cf9-4012-4a32-af0c-34784bc34030'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9a9a8cf9-4012-4a32-af0c-34784bc34030' AND href = $q$/compare/found-vs-lili$q$);

-- ── Bluevine vs Lili (bluevine-vs-lili) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', '9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$bluevine-vs-lili$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7e483d96-1e11-493c-b7e9-c3b377066d91', $q$vs Lili$q$, $q$/compare/bluevine-vs-lili$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7e483d96-1e11-493c-b7e9-c3b377066d91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7e483d96-1e11-493c-b7e9-c3b377066d91' AND href = $q$/compare/bluevine-vs-lili$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$vs Bluevine$q$, $q$/compare/bluevine-vs-lili$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9a9a8cf9-4012-4a32-af0c-34784bc34030'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9a9a8cf9-4012-4a32-af0c-34784bc34030' AND href = $q$/compare/bluevine-vs-lili$q$);

-- ── Bluevine vs Clearco (bluevine-vs-clearco) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', 'dadc676c-ec7c-4645-a7c6-759360a99282', $q$bluevine-vs-clearco$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7e483d96-1e11-493c-b7e9-c3b377066d91', $q$vs Clearco$q$, $q$/compare/bluevine-vs-clearco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7e483d96-1e11-493c-b7e9-c3b377066d91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7e483d96-1e11-493c-b7e9-c3b377066d91' AND href = $q$/compare/bluevine-vs-clearco$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dadc676c-ec7c-4645-a7c6-759360a99282', $q$vs Bluevine$q$, $q$/compare/bluevine-vs-clearco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dadc676c-ec7c-4645-a7c6-759360a99282'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dadc676c-ec7c-4645-a7c6-759360a99282' AND href = $q$/compare/bluevine-vs-clearco$q$);

-- ── Avalara vs Quaderno (avalara-vs-quaderno) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', '3daa81ad-63b3-4469-9a34-5214e31502af', $q$avalara-vs-quaderno$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5e671dda-5728-40ae-ba4d-0e752a749848', $q$vs Quaderno$q$, $q$/compare/avalara-vs-quaderno$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848' AND href = $q$/compare/avalara-vs-quaderno$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3daa81ad-63b3-4469-9a34-5214e31502af', $q$vs Avalara$q$, $q$/compare/avalara-vs-quaderno$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3daa81ad-63b3-4469-9a34-5214e31502af'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3daa81ad-63b3-4469-9a34-5214e31502af' AND href = $q$/compare/avalara-vs-quaderno$q$);

-- ── Fonoa vs Quaderno (fonoa-vs-quaderno) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', '3daa81ad-63b3-4469-9a34-5214e31502af', $q$fonoa-vs-quaderno$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$vs Quaderno$q$, $q$/compare/fonoa-vs-quaderno$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d' AND href = $q$/compare/fonoa-vs-quaderno$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3daa81ad-63b3-4469-9a34-5214e31502af', $q$vs Fonoa$q$, $q$/compare/fonoa-vs-quaderno$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3daa81ad-63b3-4469-9a34-5214e31502af'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3daa81ad-63b3-4469-9a34-5214e31502af' AND href = $q$/compare/fonoa-vs-quaderno$q$);

-- ── Fonoa vs Lago (fonoa-vs-lago) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', 'cd422245-3239-421a-87c7-ef20ba5506e5', $q$fonoa-vs-lago$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$vs Lago$q$, $q$/compare/fonoa-vs-lago$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d' AND href = $q$/compare/fonoa-vs-lago$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd422245-3239-421a-87c7-ef20ba5506e5', $q$vs Fonoa$q$, $q$/compare/fonoa-vs-lago$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd422245-3239-421a-87c7-ef20ba5506e5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd422245-3239-421a-87c7-ef20ba5506e5' AND href = $q$/compare/fonoa-vs-lago$q$);

-- ── Lago vs OpenMeter (lago-vs-openmeter) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', '2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$lago-vs-openmeter$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd422245-3239-421a-87c7-ef20ba5506e5', $q$vs OpenMeter$q$, $q$/compare/lago-vs-openmeter$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd422245-3239-421a-87c7-ef20ba5506e5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd422245-3239-421a-87c7-ef20ba5506e5' AND href = $q$/compare/lago-vs-openmeter$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$vs Lago$q$, $q$/compare/lago-vs-openmeter$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2df1bf37-9d52-4951-9c51-d887b5e883c4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2df1bf37-9d52-4951-9c51-d887b5e883c4' AND href = $q$/compare/lago-vs-openmeter$q$);

-- ── Amberflo vs OpenMeter (amberflo-vs-openmeter) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', '2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$amberflo-vs-openmeter$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$vs OpenMeter$q$, $q$/compare/amberflo-vs-openmeter$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2' AND href = $q$/compare/amberflo-vs-openmeter$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$vs Amberflo$q$, $q$/compare/amberflo-vs-openmeter$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2df1bf37-9d52-4951-9c51-d887b5e883c4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2df1bf37-9d52-4951-9c51-d887b5e883c4' AND href = $q$/compare/amberflo-vs-openmeter$q$);

-- ── Amberflo vs Tabs (amberflo-vs-tabs) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', '97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$amberflo-vs-tabs$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$vs Tabs$q$, $q$/compare/amberflo-vs-tabs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2' AND href = $q$/compare/amberflo-vs-tabs$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$vs Amberflo$q$, $q$/compare/amberflo-vs-tabs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882' AND href = $q$/compare/amberflo-vs-tabs$q$);

-- ── Ordway vs Tabs (ordway-vs-tabs) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', '97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$ordway-vs-tabs$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$vs Tabs$q$, $q$/compare/ordway-vs-tabs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901' AND href = $q$/compare/ordway-vs-tabs$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$vs Ordway$q$, $q$/compare/ordway-vs-tabs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882' AND href = $q$/compare/ordway-vs-tabs$q$);

-- ── MonetizeNow vs Salesbricks (monetizenow-vs-salesbricks) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', '8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$monetizenow-vs-salesbricks$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$vs Salesbricks$q$, $q$/compare/monetizenow-vs-salesbricks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4' AND href = $q$/compare/monetizenow-vs-salesbricks$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$vs MonetizeNow$q$, $q$/compare/monetizenow-vs-salesbricks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8ba708a7-67bb-4103-86f5-6ecb278ba497'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8ba708a7-67bb-4103-86f5-6ecb278ba497' AND href = $q$/compare/monetizenow-vs-salesbricks$q$);

-- ── MonetizeNow vs Nue (monetizenow-vs-nue) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', 'ec4f000a-01b3-43af-b663-6371cea0d208', $q$monetizenow-vs-nue$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$vs Nue$q$, $q$/compare/monetizenow-vs-nue$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4' AND href = $q$/compare/monetizenow-vs-nue$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ec4f000a-01b3-43af-b663-6371cea0d208', $q$vs MonetizeNow$q$, $q$/compare/monetizenow-vs-nue$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ec4f000a-01b3-43af-b663-6371cea0d208'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ec4f000a-01b3-43af-b663-6371cea0d208' AND href = $q$/compare/monetizenow-vs-nue$q$);

-- ── Nue vs QuotaPath (nue-vs-quotapath) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$nue-vs-quotapath$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ec4f000a-01b3-43af-b663-6371cea0d208', $q$vs QuotaPath$q$, $q$/compare/nue-vs-quotapath$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ec4f000a-01b3-43af-b663-6371cea0d208'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ec4f000a-01b3-43af-b663-6371cea0d208' AND href = $q$/compare/nue-vs-quotapath$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$vs Nue$q$, $q$/compare/nue-vs-quotapath$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023' AND href = $q$/compare/nue-vs-quotapath$q$);

-- ── Everstage vs QuotaPath (everstage-vs-quotapath) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$everstage-vs-quotapath$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '087b7f82-9397-45ec-9b2b-8507a996af85', $q$vs QuotaPath$q$, $q$/compare/everstage-vs-quotapath$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '087b7f82-9397-45ec-9b2b-8507a996af85'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '087b7f82-9397-45ec-9b2b-8507a996af85' AND href = $q$/compare/everstage-vs-quotapath$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$vs Everstage$q$, $q$/compare/everstage-vs-quotapath$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023' AND href = $q$/compare/everstage-vs-quotapath$q$);

-- ── Everstage vs Forma.ai (everstage-vs-forma-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', 'd52f8727-8700-449a-a039-f5c8df0a1fe0', $q$everstage-vs-forma-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '087b7f82-9397-45ec-9b2b-8507a996af85', $q$vs Forma.ai$q$, $q$/compare/everstage-vs-forma-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '087b7f82-9397-45ec-9b2b-8507a996af85'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '087b7f82-9397-45ec-9b2b-8507a996af85' AND href = $q$/compare/everstage-vs-forma-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd52f8727-8700-449a-a039-f5c8df0a1fe0', $q$vs Everstage$q$, $q$/compare/everstage-vs-forma-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0' AND href = $q$/compare/everstage-vs-forma-ai$q$);

-- ── Forma.ai vs Performio (forma-ai-vs-performio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', '7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$forma-ai-vs-performio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd52f8727-8700-449a-a039-f5c8df0a1fe0', $q$vs Performio$q$, $q$/compare/forma-ai-vs-performio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0' AND href = $q$/compare/forma-ai-vs-performio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$vs Forma.ai$q$, $q$/compare/forma-ai-vs-performio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bac928b-8b56-4410-b495-f9ee3e28df6b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bac928b-8b56-4410-b495-f9ee3e28df6b' AND href = $q$/compare/forma-ai-vs-performio$q$);

-- ── Performio vs Sales Cookie (performio-vs-sales-cookie) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', 'a5b12745-37b0-4202-a0e1-39121d42e60e', $q$performio-vs-sales-cookie$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$vs Sales Cookie$q$, $q$/compare/performio-vs-sales-cookie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bac928b-8b56-4410-b495-f9ee3e28df6b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bac928b-8b56-4410-b495-f9ee3e28df6b' AND href = $q$/compare/performio-vs-sales-cookie$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a5b12745-37b0-4202-a0e1-39121d42e60e', $q$vs Performio$q$, $q$/compare/performio-vs-sales-cookie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a5b12745-37b0-4202-a0e1-39121d42e60e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a5b12745-37b0-4202-a0e1-39121d42e60e' AND href = $q$/compare/performio-vs-sales-cookie$q$);

-- ── Ambition vs Sales Cookie (ambition-vs-sales-cookie) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', 'a5b12745-37b0-4202-a0e1-39121d42e60e', $q$ambition-vs-sales-cookie$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$vs Sales Cookie$q$, $q$/compare/ambition-vs-sales-cookie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb' AND href = $q$/compare/ambition-vs-sales-cookie$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a5b12745-37b0-4202-a0e1-39121d42e60e', $q$vs Ambition$q$, $q$/compare/ambition-vs-sales-cookie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a5b12745-37b0-4202-a0e1-39121d42e60e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a5b12745-37b0-4202-a0e1-39121d42e60e' AND href = $q$/compare/ambition-vs-sales-cookie$q$);

-- ── Ambition vs Spinify (ambition-vs-spinify) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', '656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$ambition-vs-spinify$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$vs Spinify$q$, $q$/compare/ambition-vs-spinify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb' AND href = $q$/compare/ambition-vs-spinify$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$vs Ambition$q$, $q$/compare/ambition-vs-spinify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06' AND href = $q$/compare/ambition-vs-spinify$q$);

-- ── SalesScreen vs Spinify (salesscreen-vs-spinify) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', '656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$salesscreen-vs-spinify$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$vs Spinify$q$, $q$/compare/salesscreen-vs-spinify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7' AND href = $q$/compare/salesscreen-vs-spinify$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$vs SalesScreen$q$, $q$/compare/salesscreen-vs-spinify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06' AND href = $q$/compare/salesscreen-vs-spinify$q$);

-- ── Clari vs SalesScreen (clari-vs-salesscreen) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$clari-vs-salesscreen$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$vs SalesScreen$q$, $q$/compare/clari-vs-salesscreen$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c' AND href = $q$/compare/clari-vs-salesscreen$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$vs Clari$q$, $q$/compare/clari-vs-salesscreen$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7' AND href = $q$/compare/clari-vs-salesscreen$q$);

-- ── Aviso vs Clari (aviso-vs-clari) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', '6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$aviso-vs-clari$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$vs Clari$q$, $q$/compare/aviso-vs-clari$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7' AND href = $q$/compare/aviso-vs-clari$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$vs Aviso$q$, $q$/compare/aviso-vs-clari$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c' AND href = $q$/compare/aviso-vs-clari$q$);

-- ── Aviso vs Chorus.ai (aviso-vs-chorus-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', '0a2732f6-450c-43e0-9cb0-a1752605865d', $q$aviso-vs-chorus-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$vs Chorus.ai$q$, $q$/compare/aviso-vs-chorus-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7' AND href = $q$/compare/aviso-vs-chorus-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0a2732f6-450c-43e0-9cb0-a1752605865d', $q$vs Aviso$q$, $q$/compare/aviso-vs-chorus-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0a2732f6-450c-43e0-9cb0-a1752605865d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0a2732f6-450c-43e0-9cb0-a1752605865d' AND href = $q$/compare/aviso-vs-chorus-ai$q$);

-- ── Chorus.ai vs Outreach (chorus-ai-vs-outreach) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', '7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$chorus-ai-vs-outreach$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0a2732f6-450c-43e0-9cb0-a1752605865d', $q$vs Outreach$q$, $q$/compare/chorus-ai-vs-outreach$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0a2732f6-450c-43e0-9cb0-a1752605865d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0a2732f6-450c-43e0-9cb0-a1752605865d' AND href = $q$/compare/chorus-ai-vs-outreach$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$vs Chorus.ai$q$, $q$/compare/chorus-ai-vs-outreach$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7afd1993-2c5f-430d-bd16-ce044308f9b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7afd1993-2c5f-430d-bd16-ce044308f9b1' AND href = $q$/compare/chorus-ai-vs-outreach$q$);

-- ── Outreach vs PersistIQ (outreach-vs-persistiq) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$outreach-vs-persistiq$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$vs PersistIQ$q$, $q$/compare/outreach-vs-persistiq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7afd1993-2c5f-430d-bd16-ce044308f9b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7afd1993-2c5f-430d-bd16-ce044308f9b1' AND href = $q$/compare/outreach-vs-persistiq$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$vs Outreach$q$, $q$/compare/outreach-vs-persistiq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2' AND href = $q$/compare/outreach-vs-persistiq$q$);

-- ── ContactOut vs PersistIQ (contactout-vs-persistiq) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$contactout-vs-persistiq$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$vs PersistIQ$q$, $q$/compare/contactout-vs-persistiq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8a027b3c-fcee-43e5-9956-4c92e51917fc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8a027b3c-fcee-43e5-9956-4c92e51917fc' AND href = $q$/compare/contactout-vs-persistiq$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$vs ContactOut$q$, $q$/compare/contactout-vs-persistiq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2' AND href = $q$/compare/contactout-vs-persistiq$q$);

-- ── ContactOut vs FullEnrich (contactout-vs-fullenrich) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$contactout-vs-fullenrich$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$vs FullEnrich$q$, $q$/compare/contactout-vs-fullenrich$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8a027b3c-fcee-43e5-9956-4c92e51917fc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8a027b3c-fcee-43e5-9956-4c92e51917fc' AND href = $q$/compare/contactout-vs-fullenrich$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$vs ContactOut$q$, $q$/compare/contactout-vs-fullenrich$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6' AND href = $q$/compare/contactout-vs-fullenrich$q$);

-- ── SharpCloud vs UserVoice (sharpcloud-vs-uservoice) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', 'bd278a62-8daf-4a08-9776-46b01f241b6d', $q$sharpcloud-vs-uservoice$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$vs UserVoice$q$, $q$/compare/sharpcloud-vs-uservoice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc' AND href = $q$/compare/sharpcloud-vs-uservoice$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bd278a62-8daf-4a08-9776-46b01f241b6d', $q$vs SharpCloud$q$, $q$/compare/sharpcloud-vs-uservoice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d' AND href = $q$/compare/sharpcloud-vs-uservoice$q$);

-- ── Monica vs OroCRM (monica-vs-orocrm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', '63ad3ef7-5046-461f-a151-5b360a08cc61', $q$monica-vs-orocrm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$vs OroCRM$q$, $q$/compare/monica-vs-orocrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3ec2fcab-82e1-40ba-a312-37feb11695e6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3ec2fcab-82e1-40ba-a312-37feb11695e6' AND href = $q$/compare/monica-vs-orocrm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '63ad3ef7-5046-461f-a151-5b360a08cc61', $q$vs Monica$q$, $q$/compare/monica-vs-orocrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '63ad3ef7-5046-461f-a151-5b360a08cc61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '63ad3ef7-5046-461f-a151-5b360a08cc61' AND href = $q$/compare/monica-vs-orocrm$q$);

-- ── Hoppscotch vs Starlight (hoppscotch-vs-starlight) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9ad514b4-f42c-4a24-9984-a035b5cef0f3', 'ffe3fec8-5847-4750-b01a-593c7901730d', $q$hoppscotch-vs-starlight$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9ad514b4-f42c-4a24-9984-a035b5cef0f3', $q$vs Starlight$q$, $q$/compare/hoppscotch-vs-starlight$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9ad514b4-f42c-4a24-9984-a035b5cef0f3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9ad514b4-f42c-4a24-9984-a035b5cef0f3' AND href = $q$/compare/hoppscotch-vs-starlight$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ffe3fec8-5847-4750-b01a-593c7901730d', $q$vs Hoppscotch$q$, $q$/compare/hoppscotch-vs-starlight$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ffe3fec8-5847-4750-b01a-593c7901730d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ffe3fec8-5847-4750-b01a-593c7901730d' AND href = $q$/compare/hoppscotch-vs-starlight$q$);

-- ── IceHrm vs Pingboard (icehrm-vs-pingboard) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', '3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$icehrm-vs-pingboard$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$vs Pingboard$q$, $q$/compare/icehrm-vs-pingboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5' AND href = $q$/compare/icehrm-vs-pingboard$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$vs IceHrm$q$, $q$/compare/icehrm-vs-pingboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac' AND href = $q$/compare/icehrm-vs-pingboard$q$);

-- ── Grype vs Psono (grype-vs-psono) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', '86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$grype-vs-psono$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$vs Psono$q$, $q$/compare/grype-vs-psono$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9' AND href = $q$/compare/grype-vs-psono$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$vs Grype$q$, $q$/compare/grype-vs-psono$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07' AND href = $q$/compare/grype-vs-psono$q$);

-- ── Clearco vs Pipe (clearco-vs-pipe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', '61d2abfe-020b-44ad-8493-bab43284c852', $q$clearco-vs-pipe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dadc676c-ec7c-4645-a7c6-759360a99282', $q$vs Pipe$q$, $q$/compare/clearco-vs-pipe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dadc676c-ec7c-4645-a7c6-759360a99282'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dadc676c-ec7c-4645-a7c6-759360a99282' AND href = $q$/compare/clearco-vs-pipe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '61d2abfe-020b-44ad-8493-bab43284c852', $q$vs Clearco$q$, $q$/compare/clearco-vs-pipe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '61d2abfe-020b-44ad-8493-bab43284c852'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '61d2abfe-020b-44ad-8493-bab43284c852' AND href = $q$/compare/clearco-vs-pipe$q$);

-- ── Anrok vs Ordway (anrok-vs-ordway) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$anrok-vs-ordway$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$vs Ordway$q$, $q$/compare/anrok-vs-ordway$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3' AND href = $q$/compare/anrok-vs-ordway$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$vs Anrok$q$, $q$/compare/anrok-vs-ordway$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901' AND href = $q$/compare/anrok-vs-ordway$q$);

-- ── Doctolib vs TheraNest (doctolib-vs-theranest) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', '5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$doctolib-vs-theranest$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd3824531-7fee-4eb7-9d43-f3de065cb703', $q$vs TheraNest$q$, $q$/compare/doctolib-vs-theranest$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd3824531-7fee-4eb7-9d43-f3de065cb703'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd3824531-7fee-4eb7-9d43-f3de065cb703' AND href = $q$/compare/doctolib-vs-theranest$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$vs Doctolib$q$, $q$/compare/doctolib-vs-theranest$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5fbb1de8-79fd-408f-ab12-959b5b74f712'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5fbb1de8-79fd-408f-ab12-959b5b74f712' AND href = $q$/compare/doctolib-vs-theranest$q$);

-- ── CloudLex vs Harvey (cloudlex-vs-harvey) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', '27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$cloudlex-vs-harvey$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '963e1b92-071f-415e-9b5e-38f557ab5057', $q$vs Harvey$q$, $q$/compare/cloudlex-vs-harvey$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057' AND href = $q$/compare/cloudlex-vs-harvey$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$vs CloudLex$q$, $q$/compare/cloudlex-vs-harvey$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd' AND href = $q$/compare/cloudlex-vs-harvey$q$);

-- ── Juicebox vs OpenCATS (juicebox-vs-opencats) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', '448ec905-8c58-4b0c-931b-b7bedf89db12', $q$juicebox-vs-opencats$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4cc45ff7-31f0-4735-be09-538439350dbc', $q$vs OpenCATS$q$, $q$/compare/juicebox-vs-opencats$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4cc45ff7-31f0-4735-be09-538439350dbc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4cc45ff7-31f0-4735-be09-538439350dbc' AND href = $q$/compare/juicebox-vs-opencats$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '448ec905-8c58-4b0c-931b-b7bedf89db12', $q$vs Juicebox$q$, $q$/compare/juicebox-vs-opencats$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '448ec905-8c58-4b0c-931b-b7bedf89db12'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '448ec905-8c58-4b0c-931b-b7bedf89db12' AND href = $q$/compare/juicebox-vs-opencats$q$);

-- ── FullEnrich vs Subskribe CPQ (fullenrich-vs-subskribe-cpq) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', '989b012e-a050-497e-8c08-30d43f45ccd1', $q$fullenrich-vs-subskribe-cpq$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$vs Subskribe CPQ$q$, $q$/compare/fullenrich-vs-subskribe-cpq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6' AND href = $q$/compare/fullenrich-vs-subskribe-cpq$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '989b012e-a050-497e-8c08-30d43f45ccd1', $q$vs FullEnrich$q$, $q$/compare/fullenrich-vs-subskribe-cpq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1' AND href = $q$/compare/fullenrich-vs-subskribe-cpq$q$);

-- ── airfocus vs UserVoice (airfocus-vs-uservoice) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', 'bd278a62-8daf-4a08-9776-46b01f241b6d', $q$airfocus-vs-uservoice$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1630ac29-62d1-433c-a8cb-b173926de875', $q$vs UserVoice$q$, $q$/compare/airfocus-vs-uservoice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875' AND href = $q$/compare/airfocus-vs-uservoice$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bd278a62-8daf-4a08-9776-46b01f241b6d', $q$vs airfocus$q$, $q$/compare/airfocus-vs-uservoice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d' AND href = $q$/compare/airfocus-vs-uservoice$q$);

-- ── Atomic CRM vs Corteza CRM (atomic-crm-vs-corteza-crm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', '016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$atomic-crm-vs-corteza-crm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$vs Corteza CRM$q$, $q$/compare/atomic-crm-vs-corteza-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0' AND href = $q$/compare/atomic-crm-vs-corteza-crm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$vs Atomic CRM$q$, $q$/compare/atomic-crm-vs-corteza-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '016aac11-14a9-4e56-958c-3b361e5b1ef4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '016aac11-14a9-4e56-958c-3b361e5b1ef4' AND href = $q$/compare/atomic-crm-vs-corteza-crm$q$);

-- ── Atomic CRM vs Krayin CRM (atomic-crm-vs-krayin-crm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', 'a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$atomic-crm-vs-krayin-crm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$vs Krayin CRM$q$, $q$/compare/atomic-crm-vs-krayin-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0' AND href = $q$/compare/atomic-crm-vs-krayin-crm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$vs Atomic CRM$q$, $q$/compare/atomic-crm-vs-krayin-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b' AND href = $q$/compare/atomic-crm-vs-krayin-crm$q$);

-- ── Hyperping vs StatusCake (hyperping-vs-statuscake) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', 'c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$hyperping-vs-statuscake$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$vs StatusCake$q$, $q$/compare/hyperping-vs-statuscake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a' AND href = $q$/compare/hyperping-vs-statuscake$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$vs Hyperping$q$, $q$/compare/hyperping-vs-statuscake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0' AND href = $q$/compare/hyperping-vs-statuscake$q$);

-- ── Cronitor vs Hyperping (cronitor-vs-hyperping) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', '6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$cronitor-vs-hyperping$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$vs Hyperping$q$, $q$/compare/cronitor-vs-hyperping$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed' AND href = $q$/compare/cronitor-vs-hyperping$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$vs Cronitor$q$, $q$/compare/cronitor-vs-hyperping$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a' AND href = $q$/compare/cronitor-vs-hyperping$q$);

-- ── Cronitor vs SigNoz (cronitor-vs-signoz) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$cronitor-vs-signoz$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$vs SigNoz$q$, $q$/compare/cronitor-vs-signoz$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed' AND href = $q$/compare/cronitor-vs-signoz$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$vs Cronitor$q$, $q$/compare/cronitor-vs-signoz$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c' AND href = $q$/compare/cronitor-vs-signoz$q$);

-- ── SigNoz vs VictoriaMetrics (signoz-vs-victoriametrics) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', 'a800ff94-205d-4d00-9df5-8de02f912d82', $q$signoz-vs-victoriametrics$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$vs VictoriaMetrics$q$, $q$/compare/signoz-vs-victoriametrics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c' AND href = $q$/compare/signoz-vs-victoriametrics$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a800ff94-205d-4d00-9df5-8de02f912d82', $q$vs SigNoz$q$, $q$/compare/signoz-vs-victoriametrics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a800ff94-205d-4d00-9df5-8de02f912d82'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a800ff94-205d-4d00-9df5-8de02f912d82' AND href = $q$/compare/signoz-vs-victoriametrics$q$);


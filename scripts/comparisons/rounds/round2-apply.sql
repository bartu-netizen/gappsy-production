-- Comparison batch: algolia-vs-meilisearch, meilisearch-vs-typesense, appwrite-vs-convex, appwrite-vs-pocketbase, turso-vs-xata, turso-vs-upstash, tidb-cloud-vs-yugabytedb, influxdb-cloud-vs-timescale, dgraph-vs-surrealdb, convex-vs-nhost, rive-vs-spline, principle-vs-protopie, lunacy-vs-penpot, bugsnag-vs-sentry, rollbar-vs-sentry, fullstory-vs-logrocket, highlight-io-vs-logrocket, honeybadger-vs-rollbar, appsignal-vs-scout-apm, bugsnag-vs-raygun, fullstory-vs-mouseflow, highlight-io-vs-openreplay, doppler-vs-infisical, hookdeck-vs-svix, pingdom-vs-uptimerobot, better-stack-vs-checkly, instatus-vs-pulsetic, papertrail-vs-sematext, activepieces-vs-pipedream, kestra-vs-prefect, temporal-vs-trigger-dev, postmark-vs-resend, mailgun-vs-sendgrid, loops-vs-resend, encharge-vs-ortto, userlist-vs-vero, sender-vs-sendpulse, benchmark-email-vs-emailoctopus, mercury-vs-novo, payhawk-vs-pleo, airwallex-vs-mercury, moss-vs-spendesk, novo-vs-relay-financial, feathery-vs-fillout, formbricks-vs-formsort, heyflow-vs-outgrow, involve-me-vs-scoreapp, formcarry-vs-formspark, piktochart-vs-visme, piktochart-vs-venngage, artboard-studio-vs-kittl, deskpro-vs-liveagent, helpcrunch-vs-proprofs-help-desk, supportbee-vs-teamsupport, kinsta-vs-wp-engine, cloudways-vs-pantheon, fly-io-vs-northflank, koyeb-vs-qovery, hetzner-vs-linode, ovhcloud-vs-vultr, hostinger-vs-namecheap, hostinger-vs-siteground, scaleway-vs-upcloud, porter-vs-zeabur
-- Publishes 64 comparison page(s) with editorial content.

-- ── Algolia vs Meilisearch (algolia-vs-meilisearch) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0', $q$algolia-vs-meilisearch$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1da597ed-cb15-440d-b621-139ce7ffa976', $q$vs Meilisearch$q$, $q$/compare/algolia-vs-meilisearch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976' AND href = $q$/compare/algolia-vs-meilisearch$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0', $q$vs Algolia$q$, $q$/compare/algolia-vs-meilisearch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0' AND href = $q$/compare/algolia-vs-meilisearch$q$);

-- ── Meilisearch vs Typesense (meilisearch-vs-typesense) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0', '09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$meilisearch-vs-typesense$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0', $q$vs Typesense$q$, $q$/compare/meilisearch-vs-typesense$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0' AND href = $q$/compare/meilisearch-vs-typesense$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$vs Meilisearch$q$, $q$/compare/meilisearch-vs-typesense$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7' AND href = $q$/compare/meilisearch-vs-typesense$q$);

-- ── Appwrite vs Convex (appwrite-vs-convex) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159', $q$appwrite-vs-convex$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$vs Convex$q$, $q$/compare/appwrite-vs-convex$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681' AND href = $q$/compare/appwrite-vs-convex$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159', $q$vs Appwrite$q$, $q$/compare/appwrite-vs-convex$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159' AND href = $q$/compare/appwrite-vs-convex$q$);

-- ── Appwrite vs PocketBase (appwrite-vs-pocketbase) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', 'e6c72275-7cb5-4d25-b407-ad1b09e419ab', $q$appwrite-vs-pocketbase$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$vs PocketBase$q$, $q$/compare/appwrite-vs-pocketbase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681' AND href = $q$/compare/appwrite-vs-pocketbase$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e6c72275-7cb5-4d25-b407-ad1b09e419ab', $q$vs Appwrite$q$, $q$/compare/appwrite-vs-pocketbase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e6c72275-7cb5-4d25-b407-ad1b09e419ab'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e6c72275-7cb5-4d25-b407-ad1b09e419ab' AND href = $q$/compare/appwrite-vs-pocketbase$q$);

-- ── Turso vs Xata (turso-vs-xata) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8f8c6456-68f6-4f02-bd51-cf48403d7a42', '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5', $q$turso-vs-xata$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8f8c6456-68f6-4f02-bd51-cf48403d7a42', $q$vs Xata$q$, $q$/compare/turso-vs-xata$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42' AND href = $q$/compare/turso-vs-xata$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5', $q$vs Turso$q$, $q$/compare/turso-vs-xata$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5' AND href = $q$/compare/turso-vs-xata$q$);

-- ── Turso vs Upstash (turso-vs-upstash) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8f8c6456-68f6-4f02-bd51-cf48403d7a42', '72cd024d-3900-490c-976d-ace69724ddbb', $q$turso-vs-upstash$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8f8c6456-68f6-4f02-bd51-cf48403d7a42', $q$vs Upstash$q$, $q$/compare/turso-vs-upstash$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42' AND href = $q$/compare/turso-vs-upstash$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72cd024d-3900-490c-976d-ace69724ddbb', $q$vs Turso$q$, $q$/compare/turso-vs-upstash$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72cd024d-3900-490c-976d-ace69724ddbb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72cd024d-3900-490c-976d-ace69724ddbb' AND href = $q$/compare/turso-vs-upstash$q$);

-- ── TiDB Cloud vs YugabyteDB (tidb-cloud-vs-yugabytedb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('992455d6-9786-48b9-a8ac-bca905448c06', '78eada95-da81-4cfa-9a33-f04a9d8c15e0', $q$tidb-cloud-vs-yugabytedb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '992455d6-9786-48b9-a8ac-bca905448c06', $q$vs YugabyteDB$q$, $q$/compare/tidb-cloud-vs-yugabytedb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '992455d6-9786-48b9-a8ac-bca905448c06'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '992455d6-9786-48b9-a8ac-bca905448c06' AND href = $q$/compare/tidb-cloud-vs-yugabytedb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '78eada95-da81-4cfa-9a33-f04a9d8c15e0', $q$vs TiDB Cloud$q$, $q$/compare/tidb-cloud-vs-yugabytedb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '78eada95-da81-4cfa-9a33-f04a9d8c15e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '78eada95-da81-4cfa-9a33-f04a9d8c15e0' AND href = $q$/compare/tidb-cloud-vs-yugabytedb$q$);

-- ── InfluxDB Cloud vs Timescale (influxdb-cloud-vs-timescale) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5', '5979f62c-c68a-4875-ab66-878b6d196231', $q$influxdb-cloud-vs-timescale$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5', $q$vs Timescale$q$, $q$/compare/influxdb-cloud-vs-timescale$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5' AND href = $q$/compare/influxdb-cloud-vs-timescale$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5979f62c-c68a-4875-ab66-878b6d196231', $q$vs InfluxDB Cloud$q$, $q$/compare/influxdb-cloud-vs-timescale$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5979f62c-c68a-4875-ab66-878b6d196231'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5979f62c-c68a-4875-ab66-878b6d196231' AND href = $q$/compare/influxdb-cloud-vs-timescale$q$);

-- ── Dgraph vs SurrealDB (dgraph-vs-surrealdb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ed38eac2-96a6-4a42-b699-28e0cef88f69', '6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$dgraph-vs-surrealdb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ed38eac2-96a6-4a42-b699-28e0cef88f69', $q$vs SurrealDB$q$, $q$/compare/dgraph-vs-surrealdb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ed38eac2-96a6-4a42-b699-28e0cef88f69'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ed38eac2-96a6-4a42-b699-28e0cef88f69' AND href = $q$/compare/dgraph-vs-surrealdb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$vs Dgraph$q$, $q$/compare/dgraph-vs-surrealdb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0' AND href = $q$/compare/dgraph-vs-surrealdb$q$);

-- ── Convex vs Nhost (convex-vs-nhost) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fe42bb0d-0769-4be9-8240-7ea8c6d5d159', 'ea768a9c-a511-4333-8959-87593d0426a5', $q$convex-vs-nhost$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159', $q$vs Nhost$q$, $q$/compare/convex-vs-nhost$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159' AND href = $q$/compare/convex-vs-nhost$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ea768a9c-a511-4333-8959-87593d0426a5', $q$vs Convex$q$, $q$/compare/convex-vs-nhost$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ea768a9c-a511-4333-8959-87593d0426a5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ea768a9c-a511-4333-8959-87593d0426a5' AND href = $q$/compare/convex-vs-nhost$q$);

-- ── Rive vs Spline (rive-vs-spline) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', 'fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$rive-vs-spline$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dcc42744-8093-4da4-b78b-0290e5d5def0', $q$vs Spline$q$, $q$/compare/rive-vs-spline$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dcc42744-8093-4da4-b78b-0290e5d5def0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dcc42744-8093-4da4-b78b-0290e5d5def0' AND href = $q$/compare/rive-vs-spline$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$vs Rive$q$, $q$/compare/rive-vs-spline$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fdd5fb34-6747-4479-81aa-8ae793ce0279'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fdd5fb34-6747-4479-81aa-8ae793ce0279' AND href = $q$/compare/rive-vs-spline$q$);

-- ── Principle vs ProtoPie (principle-vs-protopie) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$principle-vs-protopie$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$vs ProtoPie$q$, $q$/compare/principle-vs-protopie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99ec53f2-7bec-4016-a54d-dea91440a5b5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99ec53f2-7bec-4016-a54d-dea91440a5b5' AND href = $q$/compare/principle-vs-protopie$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$vs Principle$q$, $q$/compare/principle-vs-protopie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4' AND href = $q$/compare/principle-vs-protopie$q$);

-- ── Lunacy vs Penpot (lunacy-vs-penpot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$lunacy-vs-penpot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$vs Penpot$q$, $q$/compare/lunacy-vs-penpot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc' AND href = $q$/compare/lunacy-vs-penpot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$vs Lunacy$q$, $q$/compare/lunacy-vs-penpot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92' AND href = $q$/compare/lunacy-vs-penpot$q$);

-- ── Bugsnag vs Sentry (bugsnag-vs-sentry) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', 'dcce3938-3a1a-4634-a545-31842a7651dc', $q$bugsnag-vs-sentry$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$vs Sentry$q$, $q$/compare/bugsnag-vs-sentry$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1' AND href = $q$/compare/bugsnag-vs-sentry$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dcce3938-3a1a-4634-a545-31842a7651dc', $q$vs Bugsnag$q$, $q$/compare/bugsnag-vs-sentry$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dcce3938-3a1a-4634-a545-31842a7651dc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dcce3938-3a1a-4634-a545-31842a7651dc' AND href = $q$/compare/bugsnag-vs-sentry$q$);

-- ── Rollbar vs Sentry (rollbar-vs-sentry) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3c7fb478-76a0-467c-ace5-e21d349568e4', 'dcce3938-3a1a-4634-a545-31842a7651dc', $q$rollbar-vs-sentry$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c7fb478-76a0-467c-ace5-e21d349568e4', $q$vs Sentry$q$, $q$/compare/rollbar-vs-sentry$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c7fb478-76a0-467c-ace5-e21d349568e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c7fb478-76a0-467c-ace5-e21d349568e4' AND href = $q$/compare/rollbar-vs-sentry$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dcce3938-3a1a-4634-a545-31842a7651dc', $q$vs Rollbar$q$, $q$/compare/rollbar-vs-sentry$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dcce3938-3a1a-4634-a545-31842a7651dc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dcce3938-3a1a-4634-a545-31842a7651dc' AND href = $q$/compare/rollbar-vs-sentry$q$);

-- ── FullStory vs LogRocket (fullstory-vs-logrocket) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('21c299f2-5f17-4888-a6ff-d3d047043f79', '462722d4-4165-434a-8b0c-980f54d3e95b', $q$fullstory-vs-logrocket$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '21c299f2-5f17-4888-a6ff-d3d047043f79', $q$vs LogRocket$q$, $q$/compare/fullstory-vs-logrocket$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '21c299f2-5f17-4888-a6ff-d3d047043f79'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '21c299f2-5f17-4888-a6ff-d3d047043f79' AND href = $q$/compare/fullstory-vs-logrocket$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '462722d4-4165-434a-8b0c-980f54d3e95b', $q$vs FullStory$q$, $q$/compare/fullstory-vs-logrocket$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '462722d4-4165-434a-8b0c-980f54d3e95b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '462722d4-4165-434a-8b0c-980f54d3e95b' AND href = $q$/compare/fullstory-vs-logrocket$q$);

-- ── Highlight.io vs LogRocket (highlight-io-vs-logrocket) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f6d6eb38-8f44-43cb-b351-fe77b22730dd', '462722d4-4165-434a-8b0c-980f54d3e95b', $q$highlight-io-vs-logrocket$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f6d6eb38-8f44-43cb-b351-fe77b22730dd', $q$vs LogRocket$q$, $q$/compare/highlight-io-vs-logrocket$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f6d6eb38-8f44-43cb-b351-fe77b22730dd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f6d6eb38-8f44-43cb-b351-fe77b22730dd' AND href = $q$/compare/highlight-io-vs-logrocket$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '462722d4-4165-434a-8b0c-980f54d3e95b', $q$vs Highlight.io$q$, $q$/compare/highlight-io-vs-logrocket$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '462722d4-4165-434a-8b0c-980f54d3e95b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '462722d4-4165-434a-8b0c-980f54d3e95b' AND href = $q$/compare/highlight-io-vs-logrocket$q$);

-- ── Honeybadger vs Rollbar (honeybadger-vs-rollbar) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7af487a9-50b6-47ff-94cd-63ca690c3618', '3c7fb478-76a0-467c-ace5-e21d349568e4', $q$honeybadger-vs-rollbar$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7af487a9-50b6-47ff-94cd-63ca690c3618', $q$vs Rollbar$q$, $q$/compare/honeybadger-vs-rollbar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7af487a9-50b6-47ff-94cd-63ca690c3618'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7af487a9-50b6-47ff-94cd-63ca690c3618' AND href = $q$/compare/honeybadger-vs-rollbar$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c7fb478-76a0-467c-ace5-e21d349568e4', $q$vs Honeybadger$q$, $q$/compare/honeybadger-vs-rollbar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c7fb478-76a0-467c-ace5-e21d349568e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c7fb478-76a0-467c-ace5-e21d349568e4' AND href = $q$/compare/honeybadger-vs-rollbar$q$);

-- ── AppSignal vs Scout APM (appsignal-vs-scout-apm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d', $q$appsignal-vs-scout-apm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$vs Scout APM$q$, $q$/compare/appsignal-vs-scout-apm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38' AND href = $q$/compare/appsignal-vs-scout-apm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d', $q$vs AppSignal$q$, $q$/compare/appsignal-vs-scout-apm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d' AND href = $q$/compare/appsignal-vs-scout-apm$q$);

-- ── Bugsnag vs Raygun (bugsnag-vs-raygun) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', '64fcba47-1f37-4b44-92d6-1d4880760b16', $q$bugsnag-vs-raygun$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$vs Raygun$q$, $q$/compare/bugsnag-vs-raygun$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1' AND href = $q$/compare/bugsnag-vs-raygun$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '64fcba47-1f37-4b44-92d6-1d4880760b16', $q$vs Bugsnag$q$, $q$/compare/bugsnag-vs-raygun$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '64fcba47-1f37-4b44-92d6-1d4880760b16'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '64fcba47-1f37-4b44-92d6-1d4880760b16' AND href = $q$/compare/bugsnag-vs-raygun$q$);

-- ── FullStory vs Mouseflow (fullstory-vs-mouseflow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('21c299f2-5f17-4888-a6ff-d3d047043f79', '3e44be36-57f9-4e4f-b5f8-22e6508f69b4', $q$fullstory-vs-mouseflow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '21c299f2-5f17-4888-a6ff-d3d047043f79', $q$vs Mouseflow$q$, $q$/compare/fullstory-vs-mouseflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '21c299f2-5f17-4888-a6ff-d3d047043f79'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '21c299f2-5f17-4888-a6ff-d3d047043f79' AND href = $q$/compare/fullstory-vs-mouseflow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3e44be36-57f9-4e4f-b5f8-22e6508f69b4', $q$vs FullStory$q$, $q$/compare/fullstory-vs-mouseflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3e44be36-57f9-4e4f-b5f8-22e6508f69b4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3e44be36-57f9-4e4f-b5f8-22e6508f69b4' AND href = $q$/compare/fullstory-vs-mouseflow$q$);

-- ── Highlight.io vs OpenReplay (highlight-io-vs-openreplay) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f6d6eb38-8f44-43cb-b351-fe77b22730dd', 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b', $q$highlight-io-vs-openreplay$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f6d6eb38-8f44-43cb-b351-fe77b22730dd', $q$vs OpenReplay$q$, $q$/compare/highlight-io-vs-openreplay$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f6d6eb38-8f44-43cb-b351-fe77b22730dd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f6d6eb38-8f44-43cb-b351-fe77b22730dd' AND href = $q$/compare/highlight-io-vs-openreplay$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b', $q$vs Highlight.io$q$, $q$/compare/highlight-io-vs-openreplay$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b' AND href = $q$/compare/highlight-io-vs-openreplay$q$);

-- ── Doppler vs Infisical (doppler-vs-infisical) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', '870d8f7e-4a30-42b3-8999-2b52c10af200', $q$doppler-vs-infisical$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b899dd8e-5a92-4424-9a3d-1964775af19a', $q$vs Infisical$q$, $q$/compare/doppler-vs-infisical$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b899dd8e-5a92-4424-9a3d-1964775af19a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b899dd8e-5a92-4424-9a3d-1964775af19a' AND href = $q$/compare/doppler-vs-infisical$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '870d8f7e-4a30-42b3-8999-2b52c10af200', $q$vs Doppler$q$, $q$/compare/doppler-vs-infisical$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '870d8f7e-4a30-42b3-8999-2b52c10af200'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '870d8f7e-4a30-42b3-8999-2b52c10af200' AND href = $q$/compare/doppler-vs-infisical$q$);

-- ── Hookdeck vs Svix (hookdeck-vs-svix) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$hookdeck-vs-svix$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$vs Svix$q$, $q$/compare/hookdeck-vs-svix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '36a47b1c-ff9a-44c4-8e50-572883c5348b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '36a47b1c-ff9a-44c4-8e50-572883c5348b' AND href = $q$/compare/hookdeck-vs-svix$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$vs Hookdeck$q$, $q$/compare/hookdeck-vs-svix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd' AND href = $q$/compare/hookdeck-vs-svix$q$);

-- ── Pingdom vs UptimeRobot (pingdom-vs-uptimerobot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0f7793fe-24f6-455d-942f-7c400a00d262', '40705dad-5bab-4f5b-a448-d25aaa9e4cbc', $q$pingdom-vs-uptimerobot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0f7793fe-24f6-455d-942f-7c400a00d262', $q$vs UptimeRobot$q$, $q$/compare/pingdom-vs-uptimerobot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0f7793fe-24f6-455d-942f-7c400a00d262'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0f7793fe-24f6-455d-942f-7c400a00d262' AND href = $q$/compare/pingdom-vs-uptimerobot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '40705dad-5bab-4f5b-a448-d25aaa9e4cbc', $q$vs Pingdom$q$, $q$/compare/pingdom-vs-uptimerobot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '40705dad-5bab-4f5b-a448-d25aaa9e4cbc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '40705dad-5bab-4f5b-a448-d25aaa9e4cbc' AND href = $q$/compare/pingdom-vs-uptimerobot$q$);

-- ── Better Stack vs Checkly (better-stack-vs-checkly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7ff22411-f622-417d-9bda-6ec2bdfd971c', '87089195-3dd1-46cf-905d-b16e26fbbd31', $q$better-stack-vs-checkly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ff22411-f622-417d-9bda-6ec2bdfd971c', $q$vs Checkly$q$, $q$/compare/better-stack-vs-checkly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ff22411-f622-417d-9bda-6ec2bdfd971c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ff22411-f622-417d-9bda-6ec2bdfd971c' AND href = $q$/compare/better-stack-vs-checkly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '87089195-3dd1-46cf-905d-b16e26fbbd31', $q$vs Better Stack$q$, $q$/compare/better-stack-vs-checkly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '87089195-3dd1-46cf-905d-b16e26fbbd31'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '87089195-3dd1-46cf-905d-b16e26fbbd31' AND href = $q$/compare/better-stack-vs-checkly$q$);

-- ── Instatus vs Pulsetic (instatus-vs-pulsetic) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f65f0d8b-0765-4d7b-b21b-657a547c6e7f', '9bfeb77a-1467-4d17-be6d-b78ad5d914b1', $q$instatus-vs-pulsetic$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f65f0d8b-0765-4d7b-b21b-657a547c6e7f', $q$vs Pulsetic$q$, $q$/compare/instatus-vs-pulsetic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f65f0d8b-0765-4d7b-b21b-657a547c6e7f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f65f0d8b-0765-4d7b-b21b-657a547c6e7f' AND href = $q$/compare/instatus-vs-pulsetic$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9bfeb77a-1467-4d17-be6d-b78ad5d914b1', $q$vs Instatus$q$, $q$/compare/instatus-vs-pulsetic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9bfeb77a-1467-4d17-be6d-b78ad5d914b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9bfeb77a-1467-4d17-be6d-b78ad5d914b1' AND href = $q$/compare/instatus-vs-pulsetic$q$);

-- ── Papertrail vs Sematext (papertrail-vs-sematext) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c326978a-2a64-44b7-a572-f9fb892fc271', 'f2373499-d34a-47fe-8420-a3176c8cceb3', $q$papertrail-vs-sematext$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c326978a-2a64-44b7-a572-f9fb892fc271', $q$vs Sematext$q$, $q$/compare/papertrail-vs-sematext$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c326978a-2a64-44b7-a572-f9fb892fc271'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c326978a-2a64-44b7-a572-f9fb892fc271' AND href = $q$/compare/papertrail-vs-sematext$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f2373499-d34a-47fe-8420-a3176c8cceb3', $q$vs Papertrail$q$, $q$/compare/papertrail-vs-sematext$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f2373499-d34a-47fe-8420-a3176c8cceb3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f2373499-d34a-47fe-8420-a3176c8cceb3' AND href = $q$/compare/papertrail-vs-sematext$q$);

-- ── activepieces vs Pipedream (activepieces-vs-pipedream) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d', $q$activepieces-vs-pipedream$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Pipedream$q$, $q$/compare/activepieces-vs-pipedream$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-pipedream$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d', $q$vs activepieces$q$, $q$/compare/activepieces-vs-pipedream$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d' AND href = $q$/compare/activepieces-vs-pipedream$q$);

-- ── kestra vs Prefect (kestra-vs-prefect) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ba1dde9-3a3c-4472-af05-215a5ccd715d', '2d51e95d-ce2a-4513-a287-44c9039f1a17', $q$kestra-vs-prefect$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ba1dde9-3a3c-4472-af05-215a5ccd715d', $q$vs Prefect$q$, $q$/compare/kestra-vs-prefect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ba1dde9-3a3c-4472-af05-215a5ccd715d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ba1dde9-3a3c-4472-af05-215a5ccd715d' AND href = $q$/compare/kestra-vs-prefect$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d51e95d-ce2a-4513-a287-44c9039f1a17', $q$vs kestra$q$, $q$/compare/kestra-vs-prefect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d51e95d-ce2a-4513-a287-44c9039f1a17'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d51e95d-ce2a-4513-a287-44c9039f1a17' AND href = $q$/compare/kestra-vs-prefect$q$);

-- ── Temporal vs Trigger.dev (temporal-vs-trigger-dev) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2efa5f1f-29da-4d6c-a300-8437c5445f15', 'caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$temporal-vs-trigger-dev$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2efa5f1f-29da-4d6c-a300-8437c5445f15', $q$vs Trigger.dev$q$, $q$/compare/temporal-vs-trigger-dev$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2efa5f1f-29da-4d6c-a300-8437c5445f15'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2efa5f1f-29da-4d6c-a300-8437c5445f15' AND href = $q$/compare/temporal-vs-trigger-dev$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$vs Temporal$q$, $q$/compare/temporal-vs-trigger-dev$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'caa46b4a-ddf7-473a-8793-845e45dd40b3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'caa46b4a-ddf7-473a-8793-845e45dd40b3' AND href = $q$/compare/temporal-vs-trigger-dev$q$);

-- ── Postmark vs Resend (postmark-vs-resend) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3180928a-7b88-4db5-a439-ca674656c46e', 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c', $q$postmark-vs-resend$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3180928a-7b88-4db5-a439-ca674656c46e', $q$vs Resend$q$, $q$/compare/postmark-vs-resend$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3180928a-7b88-4db5-a439-ca674656c46e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3180928a-7b88-4db5-a439-ca674656c46e' AND href = $q$/compare/postmark-vs-resend$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c', $q$vs Postmark$q$, $q$/compare/postmark-vs-resend$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c' AND href = $q$/compare/postmark-vs-resend$q$);

-- ── Mailgun vs SendGrid (mailgun-vs-sendgrid) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e42b88f9-4910-4f3d-aacc-b784e0b8f957', '9d6c91d2-4c18-4368-83f2-7ea2115662de', $q$mailgun-vs-sendgrid$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e42b88f9-4910-4f3d-aacc-b784e0b8f957', $q$vs SendGrid$q$, $q$/compare/mailgun-vs-sendgrid$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e42b88f9-4910-4f3d-aacc-b784e0b8f957'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e42b88f9-4910-4f3d-aacc-b784e0b8f957' AND href = $q$/compare/mailgun-vs-sendgrid$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9d6c91d2-4c18-4368-83f2-7ea2115662de', $q$vs Mailgun$q$, $q$/compare/mailgun-vs-sendgrid$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9d6c91d2-4c18-4368-83f2-7ea2115662de'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9d6c91d2-4c18-4368-83f2-7ea2115662de' AND href = $q$/compare/mailgun-vs-sendgrid$q$);

-- ── Loops vs Resend (loops-vs-resend) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6a0e0878-222a-49ef-85d7-6e633b7c96fc', 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c', $q$loops-vs-resend$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6a0e0878-222a-49ef-85d7-6e633b7c96fc', $q$vs Resend$q$, $q$/compare/loops-vs-resend$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6a0e0878-222a-49ef-85d7-6e633b7c96fc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6a0e0878-222a-49ef-85d7-6e633b7c96fc' AND href = $q$/compare/loops-vs-resend$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c', $q$vs Loops$q$, $q$/compare/loops-vs-resend$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c' AND href = $q$/compare/loops-vs-resend$q$);

-- ── Encharge vs Ortto (encharge-vs-ortto) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6af548d4-ec3e-4639-a001-7473d57669b6', '6216dfaa-05dd-4223-a596-dbb3ee514d3c', $q$encharge-vs-ortto$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6af548d4-ec3e-4639-a001-7473d57669b6', $q$vs Ortto$q$, $q$/compare/encharge-vs-ortto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6af548d4-ec3e-4639-a001-7473d57669b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6af548d4-ec3e-4639-a001-7473d57669b6' AND href = $q$/compare/encharge-vs-ortto$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6216dfaa-05dd-4223-a596-dbb3ee514d3c', $q$vs Encharge$q$, $q$/compare/encharge-vs-ortto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6216dfaa-05dd-4223-a596-dbb3ee514d3c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6216dfaa-05dd-4223-a596-dbb3ee514d3c' AND href = $q$/compare/encharge-vs-ortto$q$);

-- ── Userlist vs Vero (userlist-vs-vero) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('95a1cd47-8a75-47d2-b10b-b9d86a58c71c', '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$userlist-vs-vero$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '95a1cd47-8a75-47d2-b10b-b9d86a58c71c', $q$vs Vero$q$, $q$/compare/userlist-vs-vero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '95a1cd47-8a75-47d2-b10b-b9d86a58c71c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '95a1cd47-8a75-47d2-b10b-b9d86a58c71c' AND href = $q$/compare/userlist-vs-vero$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$vs Userlist$q$, $q$/compare/userlist-vs-vero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb' AND href = $q$/compare/userlist-vs-vero$q$);

-- ── Sender vs SendPulse (sender-vs-sendpulse) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('12459a1a-3818-4e4e-89a8-720e89fe4675', '3d598c49-9a29-4abb-82c3-8560ce7dd623', $q$sender-vs-sendpulse$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '12459a1a-3818-4e4e-89a8-720e89fe4675', $q$vs SendPulse$q$, $q$/compare/sender-vs-sendpulse$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '12459a1a-3818-4e4e-89a8-720e89fe4675'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '12459a1a-3818-4e4e-89a8-720e89fe4675' AND href = $q$/compare/sender-vs-sendpulse$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d598c49-9a29-4abb-82c3-8560ce7dd623', $q$vs Sender$q$, $q$/compare/sender-vs-sendpulse$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d598c49-9a29-4abb-82c3-8560ce7dd623'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d598c49-9a29-4abb-82c3-8560ce7dd623' AND href = $q$/compare/sender-vs-sendpulse$q$);

-- ── Benchmark Email vs EmailOctopus (benchmark-email-vs-emailoctopus) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', 'eb61be61-826d-402e-93f5-17aed2eb85a3', $q$benchmark-email-vs-emailoctopus$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$vs EmailOctopus$q$, $q$/compare/benchmark-email-vs-emailoctopus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a' AND href = $q$/compare/benchmark-email-vs-emailoctopus$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb61be61-826d-402e-93f5-17aed2eb85a3', $q$vs Benchmark Email$q$, $q$/compare/benchmark-email-vs-emailoctopus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb61be61-826d-402e-93f5-17aed2eb85a3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb61be61-826d-402e-93f5-17aed2eb85a3' AND href = $q$/compare/benchmark-email-vs-emailoctopus$q$);

-- ── Mercury vs Novo (mercury-vs-novo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', '596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$mercury-vs-novo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$vs Novo$q$, $q$/compare/mercury-vs-novo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd' AND href = $q$/compare/mercury-vs-novo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$vs Mercury$q$, $q$/compare/mercury-vs-novo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1' AND href = $q$/compare/mercury-vs-novo$q$);

-- ── Payhawk vs Pleo (payhawk-vs-pleo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', 'f4a927a2-feba-4930-ad55-823b90a5c145', $q$payhawk-vs-pleo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72083907-7b29-4e6e-80d3-6134cca542d6', $q$vs Pleo$q$, $q$/compare/payhawk-vs-pleo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72083907-7b29-4e6e-80d3-6134cca542d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72083907-7b29-4e6e-80d3-6134cca542d6' AND href = $q$/compare/payhawk-vs-pleo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f4a927a2-feba-4930-ad55-823b90a5c145', $q$vs Payhawk$q$, $q$/compare/payhawk-vs-pleo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f4a927a2-feba-4930-ad55-823b90a5c145'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f4a927a2-feba-4930-ad55-823b90a5c145' AND href = $q$/compare/payhawk-vs-pleo$q$);

-- ── Airwallex vs Mercury (airwallex-vs-mercury) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$airwallex-vs-mercury$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3f26fe2f-0d14-4d94-8521-de088090412c', $q$vs Mercury$q$, $q$/compare/airwallex-vs-mercury$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c' AND href = $q$/compare/airwallex-vs-mercury$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$vs Airwallex$q$, $q$/compare/airwallex-vs-mercury$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd' AND href = $q$/compare/airwallex-vs-mercury$q$);

-- ── Moss vs Spendesk (moss-vs-spendesk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', '7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$moss-vs-spendesk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '11cc6093-d880-4046-9b74-e055ae089a8e', $q$vs Spendesk$q$, $q$/compare/moss-vs-spendesk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '11cc6093-d880-4046-9b74-e055ae089a8e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '11cc6093-d880-4046-9b74-e055ae089a8e' AND href = $q$/compare/moss-vs-spendesk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$vs Moss$q$, $q$/compare/moss-vs-spendesk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca' AND href = $q$/compare/moss-vs-spendesk$q$);

-- ── Novo vs Relay Financial (novo-vs-relay-financial) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', '9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$novo-vs-relay-financial$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$vs Relay Financial$q$, $q$/compare/novo-vs-relay-financial$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1' AND href = $q$/compare/novo-vs-relay-financial$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$vs Novo$q$, $q$/compare/novo-vs-relay-financial$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9a668def-7d55-49ba-9faf-7c5b9537b7a6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9a668def-7d55-49ba-9faf-7c5b9537b7a6' AND href = $q$/compare/novo-vs-relay-financial$q$);

-- ── Feathery vs Fillout (feathery-vs-fillout) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$feathery-vs-fillout$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$vs Fillout$q$, $q$/compare/feathery-vs-fillout$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'acaa6370-6b47-4ce4-a037-fe2c52fd137b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'acaa6370-6b47-4ce4-a037-fe2c52fd137b' AND href = $q$/compare/feathery-vs-fillout$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$vs Feathery$q$, $q$/compare/feathery-vs-fillout$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17' AND href = $q$/compare/feathery-vs-fillout$q$);

-- ── Formbricks vs Formsort (formbricks-vs-formsort) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', '2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$formbricks-vs-formsort$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6b896e4-5bf3-4a3c-9f83-469792152818', $q$vs Formsort$q$, $q$/compare/formbricks-vs-formsort$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6b896e4-5bf3-4a3c-9f83-469792152818'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6b896e4-5bf3-4a3c-9f83-469792152818' AND href = $q$/compare/formbricks-vs-formsort$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$vs Formbricks$q$, $q$/compare/formbricks-vs-formsort$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2118c9da-01b6-493f-b26d-224cc4de5ba8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2118c9da-01b6-493f-b26d-224cc4de5ba8' AND href = $q$/compare/formbricks-vs-formsort$q$);

-- ── Heyflow vs Outgrow (heyflow-vs-outgrow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$heyflow-vs-outgrow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$vs Outgrow$q$, $q$/compare/heyflow-vs-outgrow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69056d48-f2a0-4191-ac9b-4a5b7c1c0412'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69056d48-f2a0-4191-ac9b-4a5b7c1c0412' AND href = $q$/compare/heyflow-vs-outgrow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$vs Heyflow$q$, $q$/compare/heyflow-vs-outgrow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8' AND href = $q$/compare/heyflow-vs-outgrow$q$);

-- ── involve.me vs ScoreApp (involve-me-vs-scoreapp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$involve-me-vs-scoreapp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$vs ScoreApp$q$, $q$/compare/involve-me-vs-scoreapp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd865b7df-50df-49c9-97ab-b4f5ff75a05c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd865b7df-50df-49c9-97ab-b4f5ff75a05c' AND href = $q$/compare/involve-me-vs-scoreapp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$vs involve.me$q$, $q$/compare/involve-me-vs-scoreapp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9' AND href = $q$/compare/involve-me-vs-scoreapp$q$);

-- ── Formcarry vs Formspark (formcarry-vs-formspark) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', '304e1389-15d6-4292-826c-3085c32d74e1', $q$formcarry-vs-formspark$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76d62d00-398c-4138-b919-379a5ca37c2b', $q$vs Formspark$q$, $q$/compare/formcarry-vs-formspark$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76d62d00-398c-4138-b919-379a5ca37c2b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76d62d00-398c-4138-b919-379a5ca37c2b' AND href = $q$/compare/formcarry-vs-formspark$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '304e1389-15d6-4292-826c-3085c32d74e1', $q$vs Formcarry$q$, $q$/compare/formcarry-vs-formspark$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '304e1389-15d6-4292-826c-3085c32d74e1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '304e1389-15d6-4292-826c-3085c32d74e1' AND href = $q$/compare/formcarry-vs-formspark$q$);

-- ── Piktochart vs Visme (piktochart-vs-visme) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$piktochart-vs-visme$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd5db9612-39d7-4c31-8562-b26cbfaca743', $q$vs Visme$q$, $q$/compare/piktochart-vs-visme$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd5db9612-39d7-4c31-8562-b26cbfaca743'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd5db9612-39d7-4c31-8562-b26cbfaca743' AND href = $q$/compare/piktochart-vs-visme$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$vs Piktochart$q$, $q$/compare/piktochart-vs-visme$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc' AND href = $q$/compare/piktochart-vs-visme$q$);

-- ── Piktochart vs Venngage (piktochart-vs-venngage) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', 'ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$piktochart-vs-venngage$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd5db9612-39d7-4c31-8562-b26cbfaca743', $q$vs Venngage$q$, $q$/compare/piktochart-vs-venngage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd5db9612-39d7-4c31-8562-b26cbfaca743'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd5db9612-39d7-4c31-8562-b26cbfaca743' AND href = $q$/compare/piktochart-vs-venngage$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$vs Piktochart$q$, $q$/compare/piktochart-vs-venngage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088' AND href = $q$/compare/piktochart-vs-venngage$q$);

-- ── Artboard Studio vs Kittl (artboard-studio-vs-kittl) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$artboard-studio-vs-kittl$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$vs Kittl$q$, $q$/compare/artboard-studio-vs-kittl$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c' AND href = $q$/compare/artboard-studio-vs-kittl$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$vs Artboard Studio$q$, $q$/compare/artboard-studio-vs-kittl$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9' AND href = $q$/compare/artboard-studio-vs-kittl$q$);

-- ── Deskpro vs LiveAgent (deskpro-vs-liveagent) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', '861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$deskpro-vs-liveagent$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$vs LiveAgent$q$, $q$/compare/deskpro-vs-liveagent$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc' AND href = $q$/compare/deskpro-vs-liveagent$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$vs Deskpro$q$, $q$/compare/deskpro-vs-liveagent$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '861123b5-2ddd-4c46-aa4f-eb2c58a34c58'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '861123b5-2ddd-4c46-aa4f-eb2c58a34c58' AND href = $q$/compare/deskpro-vs-liveagent$q$);

-- ── HelpCrunch vs ProProfs Help Desk (helpcrunch-vs-proprofs-help-desk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', '20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$helpcrunch-vs-proprofs-help-desk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$vs ProProfs Help Desk$q$, $q$/compare/helpcrunch-vs-proprofs-help-desk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4cf4770-d131-451c-a3a1-895ba3bfb0da'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4cf4770-d131-451c-a3a1-895ba3bfb0da' AND href = $q$/compare/helpcrunch-vs-proprofs-help-desk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$vs HelpCrunch$q$, $q$/compare/helpcrunch-vs-proprofs-help-desk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '20d62d48-b10a-49b7-a013-1df91c3f9d32'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '20d62d48-b10a-49b7-a013-1df91c3f9d32' AND href = $q$/compare/helpcrunch-vs-proprofs-help-desk$q$);

-- ── SupportBee vs TeamSupport (supportbee-vs-teamsupport) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', '3478a3af-daa1-4153-b114-3f47610904fd', $q$supportbee-vs-teamsupport$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '56724599-1872-4e62-b903-ed19a3916f2f', $q$vs TeamSupport$q$, $q$/compare/supportbee-vs-teamsupport$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '56724599-1872-4e62-b903-ed19a3916f2f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '56724599-1872-4e62-b903-ed19a3916f2f' AND href = $q$/compare/supportbee-vs-teamsupport$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3478a3af-daa1-4153-b114-3f47610904fd', $q$vs SupportBee$q$, $q$/compare/supportbee-vs-teamsupport$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd' AND href = $q$/compare/supportbee-vs-teamsupport$q$);

-- ── Kinsta vs WP Engine (kinsta-vs-wp-engine) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a0672926-1230-4fae-8c77-9a1304584c44', '0ed951ec-77f0-4b46-b0d3-dc10cc9de347', $q$kinsta-vs-wp-engine$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a0672926-1230-4fae-8c77-9a1304584c44', $q$vs WP Engine$q$, $q$/compare/kinsta-vs-wp-engine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a0672926-1230-4fae-8c77-9a1304584c44'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a0672926-1230-4fae-8c77-9a1304584c44' AND href = $q$/compare/kinsta-vs-wp-engine$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0ed951ec-77f0-4b46-b0d3-dc10cc9de347', $q$vs Kinsta$q$, $q$/compare/kinsta-vs-wp-engine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0ed951ec-77f0-4b46-b0d3-dc10cc9de347'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0ed951ec-77f0-4b46-b0d3-dc10cc9de347' AND href = $q$/compare/kinsta-vs-wp-engine$q$);

-- ── Cloudways vs Pantheon (cloudways-vs-pantheon) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4f36c751-0719-4122-8fe0-e1bd976404d2', '8dd02588-9e72-460d-8c15-9f28eeaf959d', $q$cloudways-vs-pantheon$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4f36c751-0719-4122-8fe0-e1bd976404d2', $q$vs Pantheon$q$, $q$/compare/cloudways-vs-pantheon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4f36c751-0719-4122-8fe0-e1bd976404d2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4f36c751-0719-4122-8fe0-e1bd976404d2' AND href = $q$/compare/cloudways-vs-pantheon$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8dd02588-9e72-460d-8c15-9f28eeaf959d', $q$vs Cloudways$q$, $q$/compare/cloudways-vs-pantheon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8dd02588-9e72-460d-8c15-9f28eeaf959d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8dd02588-9e72-460d-8c15-9f28eeaf959d' AND href = $q$/compare/cloudways-vs-pantheon$q$);

-- ── Fly.io vs Northflank (fly-io-vs-northflank) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('11db7b95-8347-45df-a13b-c3e8b6ea53f7', '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb', $q$fly-io-vs-northflank$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '11db7b95-8347-45df-a13b-c3e8b6ea53f7', $q$vs Northflank$q$, $q$/compare/fly-io-vs-northflank$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '11db7b95-8347-45df-a13b-c3e8b6ea53f7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '11db7b95-8347-45df-a13b-c3e8b6ea53f7' AND href = $q$/compare/fly-io-vs-northflank$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb', $q$vs Fly.io$q$, $q$/compare/fly-io-vs-northflank$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb' AND href = $q$/compare/fly-io-vs-northflank$q$);

-- ── Koyeb vs Qovery (koyeb-vs-qovery) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('32feccb0-a63d-4932-b0a2-8d2a9ed9dd66', '46c7eebc-d6a3-4c06-b0fb-74483d16333d', $q$koyeb-vs-qovery$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '32feccb0-a63d-4932-b0a2-8d2a9ed9dd66', $q$vs Qovery$q$, $q$/compare/koyeb-vs-qovery$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '32feccb0-a63d-4932-b0a2-8d2a9ed9dd66'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '32feccb0-a63d-4932-b0a2-8d2a9ed9dd66' AND href = $q$/compare/koyeb-vs-qovery$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '46c7eebc-d6a3-4c06-b0fb-74483d16333d', $q$vs Koyeb$q$, $q$/compare/koyeb-vs-qovery$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '46c7eebc-d6a3-4c06-b0fb-74483d16333d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '46c7eebc-d6a3-4c06-b0fb-74483d16333d' AND href = $q$/compare/koyeb-vs-qovery$q$);

-- ── Hetzner vs Linode (hetzner-vs-linode) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('651a0f94-72a0-43b1-b2b0-60746e97bceb', 'afcd955c-740d-4ea0-8ee5-e3052c431a5d', $q$hetzner-vs-linode$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '651a0f94-72a0-43b1-b2b0-60746e97bceb', $q$vs Linode$q$, $q$/compare/hetzner-vs-linode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '651a0f94-72a0-43b1-b2b0-60746e97bceb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '651a0f94-72a0-43b1-b2b0-60746e97bceb' AND href = $q$/compare/hetzner-vs-linode$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'afcd955c-740d-4ea0-8ee5-e3052c431a5d', $q$vs Hetzner$q$, $q$/compare/hetzner-vs-linode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'afcd955c-740d-4ea0-8ee5-e3052c431a5d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'afcd955c-740d-4ea0-8ee5-e3052c431a5d' AND href = $q$/compare/hetzner-vs-linode$q$);

-- ── OVHcloud vs Vultr (ovhcloud-vs-vultr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0290e212-4db0-41b8-bc28-0411526ba848', 'd97ca2f0-4073-4a93-a5de-d5b275efbb57', $q$ovhcloud-vs-vultr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0290e212-4db0-41b8-bc28-0411526ba848', $q$vs Vultr$q$, $q$/compare/ovhcloud-vs-vultr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0290e212-4db0-41b8-bc28-0411526ba848'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0290e212-4db0-41b8-bc28-0411526ba848' AND href = $q$/compare/ovhcloud-vs-vultr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd97ca2f0-4073-4a93-a5de-d5b275efbb57', $q$vs OVHcloud$q$, $q$/compare/ovhcloud-vs-vultr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd97ca2f0-4073-4a93-a5de-d5b275efbb57'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd97ca2f0-4073-4a93-a5de-d5b275efbb57' AND href = $q$/compare/ovhcloud-vs-vultr$q$);

-- ── Hostinger vs Namecheap (hostinger-vs-namecheap) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c25e7433-44ad-439d-a4df-0347e6f2e9c2', '4262ba7b-6a19-41ce-bc48-4ff58e432ce9', $q$hostinger-vs-namecheap$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c25e7433-44ad-439d-a4df-0347e6f2e9c2', $q$vs Namecheap$q$, $q$/compare/hostinger-vs-namecheap$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c25e7433-44ad-439d-a4df-0347e6f2e9c2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c25e7433-44ad-439d-a4df-0347e6f2e9c2' AND href = $q$/compare/hostinger-vs-namecheap$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4262ba7b-6a19-41ce-bc48-4ff58e432ce9', $q$vs Hostinger$q$, $q$/compare/hostinger-vs-namecheap$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4262ba7b-6a19-41ce-bc48-4ff58e432ce9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4262ba7b-6a19-41ce-bc48-4ff58e432ce9' AND href = $q$/compare/hostinger-vs-namecheap$q$);

-- ── Hostinger vs SiteGround (hostinger-vs-siteground) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c25e7433-44ad-439d-a4df-0347e6f2e9c2', 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4', $q$hostinger-vs-siteground$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c25e7433-44ad-439d-a4df-0347e6f2e9c2', $q$vs SiteGround$q$, $q$/compare/hostinger-vs-siteground$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c25e7433-44ad-439d-a4df-0347e6f2e9c2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c25e7433-44ad-439d-a4df-0347e6f2e9c2' AND href = $q$/compare/hostinger-vs-siteground$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4', $q$vs Hostinger$q$, $q$/compare/hostinger-vs-siteground$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4' AND href = $q$/compare/hostinger-vs-siteground$q$);

-- ── Scaleway vs UpCloud (scaleway-vs-upcloud) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('71f03e14-432c-435c-8c0e-ef2bed2b9907', 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a', $q$scaleway-vs-upcloud$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '71f03e14-432c-435c-8c0e-ef2bed2b9907', $q$vs UpCloud$q$, $q$/compare/scaleway-vs-upcloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '71f03e14-432c-435c-8c0e-ef2bed2b9907'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '71f03e14-432c-435c-8c0e-ef2bed2b9907' AND href = $q$/compare/scaleway-vs-upcloud$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a', $q$vs Scaleway$q$, $q$/compare/scaleway-vs-upcloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a' AND href = $q$/compare/scaleway-vs-upcloud$q$);

-- ── Porter vs Zeabur (porter-vs-zeabur) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef', 'd4c2db9c-c418-40cf-8387-d72c25bbc544', $q$porter-vs-zeabur$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef', $q$vs Zeabur$q$, $q$/compare/porter-vs-zeabur$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef' AND href = $q$/compare/porter-vs-zeabur$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd4c2db9c-c418-40cf-8387-d72c25bbc544', $q$vs Porter$q$, $q$/compare/porter-vs-zeabur$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd4c2db9c-c418-40cf-8387-d72c25bbc544'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd4c2db9c-c418-40cf-8387-d72c25bbc544' AND href = $q$/compare/porter-vs-zeabur$q$);


-- Comparison batch: nordvpn-vs-surfshark, mcafee-vs-norton-360, bitdefender-vs-norton-360, auth0-vs-okta, crowdstrike-falcon-vs-sentinelone, jamf-vs-kandji, ahrefs-vs-semrush, ahrefs-vs-moz-pro
-- Publishes 8 comparison page(s) with editorial content.

-- ── NordVPN vs Surfshark (nordvpn-vs-surfshark) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6b5e7fc6-540c-4a46-90c4-6e863ad1c70c', '99717d1e-0342-4761-94f2-a883ec1305b3', $q$nordvpn-vs-surfshark$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c', $q$vs Surfshark$q$, $q$/compare/nordvpn-vs-surfshark$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c' AND href = $q$/compare/nordvpn-vs-surfshark$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99717d1e-0342-4761-94f2-a883ec1305b3', $q$vs NordVPN$q$, $q$/compare/nordvpn-vs-surfshark$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99717d1e-0342-4761-94f2-a883ec1305b3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99717d1e-0342-4761-94f2-a883ec1305b3' AND href = $q$/compare/nordvpn-vs-surfshark$q$);

-- ── McAfee vs Norton 360 (mcafee-vs-norton-360) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('620140b0-3b84-4d9d-8196-7bb9344c797c', '0ef73c08-fc86-4679-b6fc-4e32b1333482', $q$mcafee-vs-norton-360$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '620140b0-3b84-4d9d-8196-7bb9344c797c', $q$vs Norton 360$q$, $q$/compare/mcafee-vs-norton-360$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '620140b0-3b84-4d9d-8196-7bb9344c797c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '620140b0-3b84-4d9d-8196-7bb9344c797c' AND href = $q$/compare/mcafee-vs-norton-360$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0ef73c08-fc86-4679-b6fc-4e32b1333482', $q$vs McAfee$q$, $q$/compare/mcafee-vs-norton-360$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0ef73c08-fc86-4679-b6fc-4e32b1333482'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0ef73c08-fc86-4679-b6fc-4e32b1333482' AND href = $q$/compare/mcafee-vs-norton-360$q$);

-- ── Bitdefender vs Norton 360 (bitdefender-vs-norton-360) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('71dcd814-d7ea-4382-b7e3-3238f93f3360', '0ef73c08-fc86-4679-b6fc-4e32b1333482', $q$bitdefender-vs-norton-360$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '71dcd814-d7ea-4382-b7e3-3238f93f3360', $q$vs Norton 360$q$, $q$/compare/bitdefender-vs-norton-360$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '71dcd814-d7ea-4382-b7e3-3238f93f3360'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '71dcd814-d7ea-4382-b7e3-3238f93f3360' AND href = $q$/compare/bitdefender-vs-norton-360$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0ef73c08-fc86-4679-b6fc-4e32b1333482', $q$vs Bitdefender$q$, $q$/compare/bitdefender-vs-norton-360$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0ef73c08-fc86-4679-b6fc-4e32b1333482'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0ef73c08-fc86-4679-b6fc-4e32b1333482' AND href = $q$/compare/bitdefender-vs-norton-360$q$);

-- ── Auth0 vs Okta (auth0-vs-okta) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', '3030433b-3418-43ac-aa59-beb69c92a481', $q$auth0-vs-okta$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$vs Okta$q$, $q$/compare/auth0-vs-okta$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a' AND href = $q$/compare/auth0-vs-okta$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3030433b-3418-43ac-aa59-beb69c92a481', $q$vs Auth0$q$, $q$/compare/auth0-vs-okta$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3030433b-3418-43ac-aa59-beb69c92a481'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3030433b-3418-43ac-aa59-beb69c92a481' AND href = $q$/compare/auth0-vs-okta$q$);

-- ── CrowdStrike Falcon vs SentinelOne (crowdstrike-falcon-vs-sentinelone) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('44c37134-11ad-4612-bb00-c445b91881e5', 'f8f6d9c2-d0cd-4055-9836-236ee79834a7', $q$crowdstrike-falcon-vs-sentinelone$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44c37134-11ad-4612-bb00-c445b91881e5', $q$vs SentinelOne$q$, $q$/compare/crowdstrike-falcon-vs-sentinelone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44c37134-11ad-4612-bb00-c445b91881e5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44c37134-11ad-4612-bb00-c445b91881e5' AND href = $q$/compare/crowdstrike-falcon-vs-sentinelone$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f8f6d9c2-d0cd-4055-9836-236ee79834a7', $q$vs CrowdStrike Falcon$q$, $q$/compare/crowdstrike-falcon-vs-sentinelone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f8f6d9c2-d0cd-4055-9836-236ee79834a7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f8f6d9c2-d0cd-4055-9836-236ee79834a7' AND href = $q$/compare/crowdstrike-falcon-vs-sentinelone$q$);

-- ── Jamf vs Kandji (jamf-vs-kandji) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('924c5694-cfb7-4b06-9d9d-b00e1afadb31', '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6', $q$jamf-vs-kandji$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '924c5694-cfb7-4b06-9d9d-b00e1afadb31', $q$vs Kandji$q$, $q$/compare/jamf-vs-kandji$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '924c5694-cfb7-4b06-9d9d-b00e1afadb31'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '924c5694-cfb7-4b06-9d9d-b00e1afadb31' AND href = $q$/compare/jamf-vs-kandji$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6', $q$vs Jamf$q$, $q$/compare/jamf-vs-kandji$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6' AND href = $q$/compare/jamf-vs-kandji$q$);

-- ── Ahrefs vs Semrush (ahrefs-vs-semrush) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', '3564d834-f51a-4718-9030-849e68652d1f', $q$ahrefs-vs-semrush$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$vs Semrush$q$, $q$/compare/ahrefs-vs-semrush$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943' AND href = $q$/compare/ahrefs-vs-semrush$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3564d834-f51a-4718-9030-849e68652d1f', $q$vs Ahrefs$q$, $q$/compare/ahrefs-vs-semrush$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3564d834-f51a-4718-9030-849e68652d1f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3564d834-f51a-4718-9030-849e68652d1f' AND href = $q$/compare/ahrefs-vs-semrush$q$);

-- ── Ahrefs vs Moz Pro (ahrefs-vs-moz-pro) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', $q$ahrefs-vs-moz-pro$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$vs Moz Pro$q$, $q$/compare/ahrefs-vs-moz-pro$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943' AND href = $q$/compare/ahrefs-vs-moz-pro$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', $q$vs Ahrefs$q$, $q$/compare/ahrefs-vs-moz-pro$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2' AND href = $q$/compare/ahrefs-vs-moz-pro$q$);


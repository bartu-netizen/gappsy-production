-- Comparison batch: acuity-scheduling-vs-calendly, homebase-vs-when-i-work, deputy-vs-when-i-work, hubstaff-vs-time-doctor, 7shifts-vs-homebase, 7shifts-vs-deputy, 1password-vs-lastpass, expressvpn-vs-nordvpn
-- Publishes 8 comparison page(s) with editorial content.

-- ── Acuity Scheduling vs Calendly (acuity-scheduling-vs-calendly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', 'a69c9e8e-2b63-4936-9731-f85ffcfa1860', $q$acuity-scheduling-vs-calendly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$vs Calendly$q$, $q$/compare/acuity-scheduling-vs-calendly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce' AND href = $q$/compare/acuity-scheduling-vs-calendly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a69c9e8e-2b63-4936-9731-f85ffcfa1860', $q$vs Acuity Scheduling$q$, $q$/compare/acuity-scheduling-vs-calendly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a69c9e8e-2b63-4936-9731-f85ffcfa1860'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a69c9e8e-2b63-4936-9731-f85ffcfa1860' AND href = $q$/compare/acuity-scheduling-vs-calendly$q$);

-- ── Homebase vs When I Work (homebase-vs-when-i-work) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('46a737e0-4328-492f-9496-68cfcc4a09f1', '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d', $q$homebase-vs-when-i-work$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '46a737e0-4328-492f-9496-68cfcc4a09f1', $q$vs When I Work$q$, $q$/compare/homebase-vs-when-i-work$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '46a737e0-4328-492f-9496-68cfcc4a09f1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '46a737e0-4328-492f-9496-68cfcc4a09f1' AND href = $q$/compare/homebase-vs-when-i-work$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d', $q$vs Homebase$q$, $q$/compare/homebase-vs-when-i-work$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d' AND href = $q$/compare/homebase-vs-when-i-work$q$);

-- ── Deputy vs When I Work (deputy-vs-when-i-work) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ebc6d4d6-9473-4cc7-b9e8-18f595f9b246', '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d', $q$deputy-vs-when-i-work$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246', $q$vs When I Work$q$, $q$/compare/deputy-vs-when-i-work$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246' AND href = $q$/compare/deputy-vs-when-i-work$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d', $q$vs Deputy$q$, $q$/compare/deputy-vs-when-i-work$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d' AND href = $q$/compare/deputy-vs-when-i-work$q$);

-- ── Hubstaff vs Time Doctor (hubstaff-vs-time-doctor) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6', 'e7ad17c3-2624-42dd-affe-a2105bd2af56', $q$hubstaff-vs-time-doctor$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6', $q$vs Time Doctor$q$, $q$/compare/hubstaff-vs-time-doctor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6' AND href = $q$/compare/hubstaff-vs-time-doctor$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e7ad17c3-2624-42dd-affe-a2105bd2af56', $q$vs Hubstaff$q$, $q$/compare/hubstaff-vs-time-doctor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e7ad17c3-2624-42dd-affe-a2105bd2af56'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e7ad17c3-2624-42dd-affe-a2105bd2af56' AND href = $q$/compare/hubstaff-vs-time-doctor$q$);

-- ── 7shifts vs Homebase (7shifts-vs-homebase) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', '46a737e0-4328-492f-9496-68cfcc4a09f1', $q$7shifts-vs-homebase$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$vs Homebase$q$, $q$/compare/7shifts-vs-homebase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1' AND href = $q$/compare/7shifts-vs-homebase$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '46a737e0-4328-492f-9496-68cfcc4a09f1', $q$vs 7shifts$q$, $q$/compare/7shifts-vs-homebase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '46a737e0-4328-492f-9496-68cfcc4a09f1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '46a737e0-4328-492f-9496-68cfcc4a09f1' AND href = $q$/compare/7shifts-vs-homebase$q$);

-- ── 7shifts vs Deputy (7shifts-vs-deputy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246', $q$7shifts-vs-deputy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$vs Deputy$q$, $q$/compare/7shifts-vs-deputy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1' AND href = $q$/compare/7shifts-vs-deputy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246', $q$vs 7shifts$q$, $q$/compare/7shifts-vs-deputy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246' AND href = $q$/compare/7shifts-vs-deputy$q$);

-- ── 1Password vs LastPass (1password-vs-lastpass) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', '442e0b90-c0fa-4f16-8c2e-e77ca49e1ccf', $q$1password-vs-lastpass$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$vs LastPass$q$, $q$/compare/1password-vs-lastpass$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a' AND href = $q$/compare/1password-vs-lastpass$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '442e0b90-c0fa-4f16-8c2e-e77ca49e1ccf', $q$vs 1Password$q$, $q$/compare/1password-vs-lastpass$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '442e0b90-c0fa-4f16-8c2e-e77ca49e1ccf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '442e0b90-c0fa-4f16-8c2e-e77ca49e1ccf' AND href = $q$/compare/1password-vs-lastpass$q$);

-- ── ExpressVPN vs NordVPN (expressvpn-vs-nordvpn) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b040c903-f544-4cf7-9de2-2af9f1ecddaa', '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c', $q$expressvpn-vs-nordvpn$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b040c903-f544-4cf7-9de2-2af9f1ecddaa', $q$vs NordVPN$q$, $q$/compare/expressvpn-vs-nordvpn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b040c903-f544-4cf7-9de2-2af9f1ecddaa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b040c903-f544-4cf7-9de2-2af9f1ecddaa' AND href = $q$/compare/expressvpn-vs-nordvpn$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c', $q$vs ExpressVPN$q$, $q$/compare/expressvpn-vs-nordvpn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c' AND href = $q$/compare/expressvpn-vs-nordvpn$q$);


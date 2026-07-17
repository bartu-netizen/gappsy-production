-- Comparison batch: netdata-vs-victoriametrics, nagios-xi-vs-netdata, logz-io-vs-nagios-xi, logz-io-vs-mezmo, airbrake-vs-mezmo, airbrake-vs-errbit, hoppscotch-vs-mockserver, httpie-vs-mockserver, httpie-vs-speakeasy, docusaurus-vs-speakeasy, docusaurus-vs-mkdocs, mkdocs-vs-storybook, applitools-vs-storybook, applitools-vs-browserstack, browserstack-vs-sonarqube, glassbox-vs-uxcam, glassbox-vs-quantum-metric, icehrm-vs-worktango, bonusly-vs-worktango, bonusly-vs-perkbox, perkbox-vs-ravio, shopware-vs-sylius, medusa-vs-sylius, medusa-vs-saleor, saleor-vs-vendure, bagisto-vs-vendure, bagisto-vs-opencart, opencart-vs-thirty-bees, spree-commerce-vs-thirty-bees, solidus-vs-spree-commerce, drupal-commerce-vs-solidus, drupal-commerce-vs-grandnode, grandnode-vs-nopcommerce, nopcommerce-vs-snipcart, grype-vs-openvas, checkmarx-vs-openvas, akeyless-vs-checkmarx, akeyless-vs-hashicorp-vault, hashicorp-vault-vs-vaultwarden, fusionauth-vs-vaultwarden, fusionauth-vs-workos, descope-vs-workos, clerk-vs-descope, clerk-vs-logto, frontegg-vs-logto, frontegg-vs-propelauth, casdoor-vs-propelauth, planka-vs-redmine, phorge-vs-redmine, capchase-vs-pipe, akaunting-vs-frappe-books, akaunting-vs-invoice-ninja, bigcapital-vs-invoice-ninja, anrok-vs-zamp, m3ter-vs-zamp, hyperline-vs-kill-bill, konnectzit-vs-latenode, carepatron-vs-theranest, carepatron-vs-halaxy, halaxy-vs-spruce-health, luma-health-vs-spruce-health, filevine-vs-harvey, bill4time-vs-filevine, bill4time-vs-logikcull, logikcull-vs-nextpoint, opencats-vs-seekout, subskribe-cpq-vs-xactly-incent, leveleleven-vs-xactly-incent, avoma-vs-leveleleven, avoma-vs-salesloft, dropcontact-vs-salesloft, airfocus-vs-dragonboat, dragonboat-vs-zeda-io, canny-vs-zeda-io, canny-vs-nolt, errbit-vs-healthchecks, inngest-vs-sonarqube, frappe-hr-vs-ravio, boundary-vs-burp-suite, casdoor-vs-crowdsec
-- Publishes 80 comparison page(s) with editorial content.

-- ── Netdata vs VictoriaMetrics (netdata-vs-victoriametrics) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', 'a800ff94-205d-4d00-9df5-8de02f912d82', $q$netdata-vs-victoriametrics$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$vs VictoriaMetrics$q$, $q$/compare/netdata-vs-victoriametrics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4' AND href = $q$/compare/netdata-vs-victoriametrics$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a800ff94-205d-4d00-9df5-8de02f912d82', $q$vs Netdata$q$, $q$/compare/netdata-vs-victoriametrics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a800ff94-205d-4d00-9df5-8de02f912d82'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a800ff94-205d-4d00-9df5-8de02f912d82' AND href = $q$/compare/netdata-vs-victoriametrics$q$);

-- ── Nagios XI vs Netdata (nagios-xi-vs-netdata) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', 'b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$nagios-xi-vs-netdata$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd7fda584-6240-4d2f-8353-32a67b19e197', $q$vs Netdata$q$, $q$/compare/nagios-xi-vs-netdata$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd7fda584-6240-4d2f-8353-32a67b19e197'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd7fda584-6240-4d2f-8353-32a67b19e197' AND href = $q$/compare/nagios-xi-vs-netdata$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$vs Nagios XI$q$, $q$/compare/nagios-xi-vs-netdata$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4' AND href = $q$/compare/nagios-xi-vs-netdata$q$);

-- ── Logz.io vs Nagios XI (logz-io-vs-nagios-xi) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', 'd7fda584-6240-4d2f-8353-32a67b19e197', $q$logz-io-vs-nagios-xi$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$vs Nagios XI$q$, $q$/compare/logz-io-vs-nagios-xi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0' AND href = $q$/compare/logz-io-vs-nagios-xi$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd7fda584-6240-4d2f-8353-32a67b19e197', $q$vs Logz.io$q$, $q$/compare/logz-io-vs-nagios-xi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd7fda584-6240-4d2f-8353-32a67b19e197'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd7fda584-6240-4d2f-8353-32a67b19e197' AND href = $q$/compare/logz-io-vs-nagios-xi$q$);

-- ── Logz.io vs Mezmo (logz-io-vs-mezmo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', '42e3325b-1211-486f-91fc-f675f017f411', $q$logz-io-vs-mezmo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$vs Mezmo$q$, $q$/compare/logz-io-vs-mezmo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0' AND href = $q$/compare/logz-io-vs-mezmo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '42e3325b-1211-486f-91fc-f675f017f411', $q$vs Logz.io$q$, $q$/compare/logz-io-vs-mezmo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '42e3325b-1211-486f-91fc-f675f017f411'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '42e3325b-1211-486f-91fc-f675f017f411' AND href = $q$/compare/logz-io-vs-mezmo$q$);

-- ── Airbrake vs Mezmo (airbrake-vs-mezmo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '42e3325b-1211-486f-91fc-f675f017f411', $q$airbrake-vs-mezmo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$vs Mezmo$q$, $q$/compare/airbrake-vs-mezmo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be' AND href = $q$/compare/airbrake-vs-mezmo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '42e3325b-1211-486f-91fc-f675f017f411', $q$vs Airbrake$q$, $q$/compare/airbrake-vs-mezmo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '42e3325b-1211-486f-91fc-f675f017f411'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '42e3325b-1211-486f-91fc-f675f017f411' AND href = $q$/compare/airbrake-vs-mezmo$q$);

-- ── Airbrake vs Errbit (airbrake-vs-errbit) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '3338502d-27fe-428c-9b82-985f4f0a73b4', $q$airbrake-vs-errbit$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$vs Errbit$q$, $q$/compare/airbrake-vs-errbit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be' AND href = $q$/compare/airbrake-vs-errbit$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3338502d-27fe-428c-9b82-985f4f0a73b4', $q$vs Airbrake$q$, $q$/compare/airbrake-vs-errbit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3338502d-27fe-428c-9b82-985f4f0a73b4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3338502d-27fe-428c-9b82-985f4f0a73b4' AND href = $q$/compare/airbrake-vs-errbit$q$);

-- ── Hoppscotch vs MockServer (hoppscotch-vs-mockserver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9ad514b4-f42c-4a24-9984-a035b5cef0f3', '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$hoppscotch-vs-mockserver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9ad514b4-f42c-4a24-9984-a035b5cef0f3', $q$vs MockServer$q$, $q$/compare/hoppscotch-vs-mockserver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9ad514b4-f42c-4a24-9984-a035b5cef0f3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9ad514b4-f42c-4a24-9984-a035b5cef0f3' AND href = $q$/compare/hoppscotch-vs-mockserver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$vs Hoppscotch$q$, $q$/compare/hoppscotch-vs-mockserver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc' AND href = $q$/compare/hoppscotch-vs-mockserver$q$);

-- ── HTTPie vs MockServer (httpie-vs-mockserver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$httpie-vs-mockserver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$vs MockServer$q$, $q$/compare/httpie-vs-mockserver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff' AND href = $q$/compare/httpie-vs-mockserver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$vs HTTPie$q$, $q$/compare/httpie-vs-mockserver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc' AND href = $q$/compare/httpie-vs-mockserver$q$);

-- ── HTTPie vs Speakeasy (httpie-vs-speakeasy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', 'a18645e2-a581-4fd2-afca-e3a533873c8b', $q$httpie-vs-speakeasy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$vs Speakeasy$q$, $q$/compare/httpie-vs-speakeasy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff' AND href = $q$/compare/httpie-vs-speakeasy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a18645e2-a581-4fd2-afca-e3a533873c8b', $q$vs HTTPie$q$, $q$/compare/httpie-vs-speakeasy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b' AND href = $q$/compare/httpie-vs-speakeasy$q$);

-- ── Docusaurus vs Speakeasy (docusaurus-vs-speakeasy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', 'a18645e2-a581-4fd2-afca-e3a533873c8b', $q$docusaurus-vs-speakeasy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$vs Speakeasy$q$, $q$/compare/docusaurus-vs-speakeasy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7736f4e7-14df-4b55-a27c-530d35d06fd1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7736f4e7-14df-4b55-a27c-530d35d06fd1' AND href = $q$/compare/docusaurus-vs-speakeasy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a18645e2-a581-4fd2-afca-e3a533873c8b', $q$vs Docusaurus$q$, $q$/compare/docusaurus-vs-speakeasy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b' AND href = $q$/compare/docusaurus-vs-speakeasy$q$);

-- ── Docusaurus vs MkDocs (docusaurus-vs-mkdocs) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', '1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$docusaurus-vs-mkdocs$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$vs MkDocs$q$, $q$/compare/docusaurus-vs-mkdocs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7736f4e7-14df-4b55-a27c-530d35d06fd1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7736f4e7-14df-4b55-a27c-530d35d06fd1' AND href = $q$/compare/docusaurus-vs-mkdocs$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$vs Docusaurus$q$, $q$/compare/docusaurus-vs-mkdocs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1bde5f50-16ca-4a06-bfe7-446daf35604f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1bde5f50-16ca-4a06-bfe7-446daf35604f' AND href = $q$/compare/docusaurus-vs-mkdocs$q$);

-- ── MkDocs vs Storybook (mkdocs-vs-storybook) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', '546237d7-afb6-42b7-8b01-ab03163155ce', $q$mkdocs-vs-storybook$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$vs Storybook$q$, $q$/compare/mkdocs-vs-storybook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1bde5f50-16ca-4a06-bfe7-446daf35604f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1bde5f50-16ca-4a06-bfe7-446daf35604f' AND href = $q$/compare/mkdocs-vs-storybook$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '546237d7-afb6-42b7-8b01-ab03163155ce', $q$vs MkDocs$q$, $q$/compare/mkdocs-vs-storybook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '546237d7-afb6-42b7-8b01-ab03163155ce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '546237d7-afb6-42b7-8b01-ab03163155ce' AND href = $q$/compare/mkdocs-vs-storybook$q$);

-- ── Applitools vs Storybook (applitools-vs-storybook) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '546237d7-afb6-42b7-8b01-ab03163155ce', $q$applitools-vs-storybook$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '56030237-fe9d-4c89-85b0-e8fc3b277439', $q$vs Storybook$q$, $q$/compare/applitools-vs-storybook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439' AND href = $q$/compare/applitools-vs-storybook$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '546237d7-afb6-42b7-8b01-ab03163155ce', $q$vs Applitools$q$, $q$/compare/applitools-vs-storybook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '546237d7-afb6-42b7-8b01-ab03163155ce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '546237d7-afb6-42b7-8b01-ab03163155ce' AND href = $q$/compare/applitools-vs-storybook$q$);

-- ── Applitools vs BrowserStack (applitools-vs-browserstack) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$applitools-vs-browserstack$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '56030237-fe9d-4c89-85b0-e8fc3b277439', $q$vs BrowserStack$q$, $q$/compare/applitools-vs-browserstack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439' AND href = $q$/compare/applitools-vs-browserstack$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$vs Applitools$q$, $q$/compare/applitools-vs-browserstack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42' AND href = $q$/compare/applitools-vs-browserstack$q$);

-- ── BrowserStack vs SonarQube (browserstack-vs-sonarqube) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', 'c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$browserstack-vs-sonarqube$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$vs SonarQube$q$, $q$/compare/browserstack-vs-sonarqube$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42' AND href = $q$/compare/browserstack-vs-sonarqube$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$vs BrowserStack$q$, $q$/compare/browserstack-vs-sonarqube$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693' AND href = $q$/compare/browserstack-vs-sonarqube$q$);

-- ── Glassbox vs UXCam (glassbox-vs-uxcam) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$glassbox-vs-uxcam$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$vs UXCam$q$, $q$/compare/glassbox-vs-uxcam$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4' AND href = $q$/compare/glassbox-vs-uxcam$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$vs Glassbox$q$, $q$/compare/glassbox-vs-uxcam$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77' AND href = $q$/compare/glassbox-vs-uxcam$q$);

-- ── Glassbox vs Quantum Metric (glassbox-vs-quantum-metric) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', '546750c3-813f-430c-a551-e76c5f6484f1', $q$glassbox-vs-quantum-metric$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$vs Quantum Metric$q$, $q$/compare/glassbox-vs-quantum-metric$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4' AND href = $q$/compare/glassbox-vs-quantum-metric$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '546750c3-813f-430c-a551-e76c5f6484f1', $q$vs Glassbox$q$, $q$/compare/glassbox-vs-quantum-metric$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '546750c3-813f-430c-a551-e76c5f6484f1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '546750c3-813f-430c-a551-e76c5f6484f1' AND href = $q$/compare/glassbox-vs-quantum-metric$q$);

-- ── IceHrm vs WorkTango (icehrm-vs-worktango) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', 'f693b898-12c0-4472-a7d3-8ed4219d2443', $q$icehrm-vs-worktango$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$vs WorkTango$q$, $q$/compare/icehrm-vs-worktango$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5' AND href = $q$/compare/icehrm-vs-worktango$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f693b898-12c0-4472-a7d3-8ed4219d2443', $q$vs IceHrm$q$, $q$/compare/icehrm-vs-worktango$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f693b898-12c0-4472-a7d3-8ed4219d2443'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f693b898-12c0-4472-a7d3-8ed4219d2443' AND href = $q$/compare/icehrm-vs-worktango$q$);

-- ── Bonusly vs WorkTango (bonusly-vs-worktango) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', 'f693b898-12c0-4472-a7d3-8ed4219d2443', $q$bonusly-vs-worktango$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6806207d-501f-442f-81f0-3c146ec0fedc', $q$vs WorkTango$q$, $q$/compare/bonusly-vs-worktango$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6806207d-501f-442f-81f0-3c146ec0fedc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6806207d-501f-442f-81f0-3c146ec0fedc' AND href = $q$/compare/bonusly-vs-worktango$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f693b898-12c0-4472-a7d3-8ed4219d2443', $q$vs Bonusly$q$, $q$/compare/bonusly-vs-worktango$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f693b898-12c0-4472-a7d3-8ed4219d2443'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f693b898-12c0-4472-a7d3-8ed4219d2443' AND href = $q$/compare/bonusly-vs-worktango$q$);

-- ── Bonusly vs Perkbox (bonusly-vs-perkbox) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', '42ee2d70-9cde-4237-84bd-e916bc055119', $q$bonusly-vs-perkbox$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6806207d-501f-442f-81f0-3c146ec0fedc', $q$vs Perkbox$q$, $q$/compare/bonusly-vs-perkbox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6806207d-501f-442f-81f0-3c146ec0fedc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6806207d-501f-442f-81f0-3c146ec0fedc' AND href = $q$/compare/bonusly-vs-perkbox$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '42ee2d70-9cde-4237-84bd-e916bc055119', $q$vs Bonusly$q$, $q$/compare/bonusly-vs-perkbox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '42ee2d70-9cde-4237-84bd-e916bc055119'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '42ee2d70-9cde-4237-84bd-e916bc055119' AND href = $q$/compare/bonusly-vs-perkbox$q$);

-- ── Perkbox vs Ravio (perkbox-vs-ravio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', '240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$perkbox-vs-ravio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '42ee2d70-9cde-4237-84bd-e916bc055119', $q$vs Ravio$q$, $q$/compare/perkbox-vs-ravio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '42ee2d70-9cde-4237-84bd-e916bc055119'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '42ee2d70-9cde-4237-84bd-e916bc055119' AND href = $q$/compare/perkbox-vs-ravio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$vs Perkbox$q$, $q$/compare/perkbox-vs-ravio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '240f9156-e0ab-42ca-b567-928a9cab1bb2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '240f9156-e0ab-42ca-b567-928a9cab1bb2' AND href = $q$/compare/perkbox-vs-ravio$q$);

-- ── Shopware vs Sylius (shopware-vs-sylius) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4129c50a-55d6-450e-8940-28027dd14508', '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$shopware-vs-sylius$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4129c50a-55d6-450e-8940-28027dd14508', $q$vs Sylius$q$, $q$/compare/shopware-vs-sylius$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508' AND href = $q$/compare/shopware-vs-sylius$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$vs Shopware$q$, $q$/compare/shopware-vs-sylius$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90' AND href = $q$/compare/shopware-vs-sylius$q$);

-- ── Medusa vs Sylius (medusa-vs-sylius) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$medusa-vs-sylius$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8c235fd0-f6aa-40a1-a259-80552567229d', $q$vs Sylius$q$, $q$/compare/medusa-vs-sylius$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8c235fd0-f6aa-40a1-a259-80552567229d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8c235fd0-f6aa-40a1-a259-80552567229d' AND href = $q$/compare/medusa-vs-sylius$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$vs Medusa$q$, $q$/compare/medusa-vs-sylius$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90' AND href = $q$/compare/medusa-vs-sylius$q$);

-- ── Medusa vs Saleor (medusa-vs-saleor) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', 'fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$medusa-vs-saleor$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8c235fd0-f6aa-40a1-a259-80552567229d', $q$vs Saleor$q$, $q$/compare/medusa-vs-saleor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8c235fd0-f6aa-40a1-a259-80552567229d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8c235fd0-f6aa-40a1-a259-80552567229d' AND href = $q$/compare/medusa-vs-saleor$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$vs Medusa$q$, $q$/compare/medusa-vs-saleor$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef' AND href = $q$/compare/medusa-vs-saleor$q$);

-- ── Saleor vs Vendure (saleor-vs-vendure) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', '1b6f6733-ef4d-4430-95f2-717f687caf82', $q$saleor-vs-vendure$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$vs Vendure$q$, $q$/compare/saleor-vs-vendure$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef' AND href = $q$/compare/saleor-vs-vendure$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1b6f6733-ef4d-4430-95f2-717f687caf82', $q$vs Saleor$q$, $q$/compare/saleor-vs-vendure$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82' AND href = $q$/compare/saleor-vs-vendure$q$);

-- ── Bagisto vs Vendure (bagisto-vs-vendure) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '1b6f6733-ef4d-4430-95f2-717f687caf82', $q$bagisto-vs-vendure$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$vs Vendure$q$, $q$/compare/bagisto-vs-vendure$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b' AND href = $q$/compare/bagisto-vs-vendure$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1b6f6733-ef4d-4430-95f2-717f687caf82', $q$vs Bagisto$q$, $q$/compare/bagisto-vs-vendure$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82' AND href = $q$/compare/bagisto-vs-vendure$q$);

-- ── Bagisto vs OpenCart (bagisto-vs-opencart) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$bagisto-vs-opencart$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$vs OpenCart$q$, $q$/compare/bagisto-vs-opencart$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b' AND href = $q$/compare/bagisto-vs-opencart$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$vs Bagisto$q$, $q$/compare/bagisto-vs-opencart$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7d420822-07a5-41e5-ace9-e3a4a6821dee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7d420822-07a5-41e5-ace9-e3a4a6821dee' AND href = $q$/compare/bagisto-vs-opencart$q$);

-- ── OpenCart vs Thirty Bees (opencart-vs-thirty-bees) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', '54196510-1549-49ef-8799-53017ed6e08f', $q$opencart-vs-thirty-bees$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$vs Thirty Bees$q$, $q$/compare/opencart-vs-thirty-bees$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7d420822-07a5-41e5-ace9-e3a4a6821dee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7d420822-07a5-41e5-ace9-e3a4a6821dee' AND href = $q$/compare/opencart-vs-thirty-bees$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '54196510-1549-49ef-8799-53017ed6e08f', $q$vs OpenCart$q$, $q$/compare/opencart-vs-thirty-bees$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '54196510-1549-49ef-8799-53017ed6e08f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '54196510-1549-49ef-8799-53017ed6e08f' AND href = $q$/compare/opencart-vs-thirty-bees$q$);

-- ── Spree Commerce vs Thirty Bees (spree-commerce-vs-thirty-bees) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', '54196510-1549-49ef-8799-53017ed6e08f', $q$spree-commerce-vs-thirty-bees$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '80d28886-f2f5-4191-a617-3ed3234eb862', $q$vs Thirty Bees$q$, $q$/compare/spree-commerce-vs-thirty-bees$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '80d28886-f2f5-4191-a617-3ed3234eb862'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '80d28886-f2f5-4191-a617-3ed3234eb862' AND href = $q$/compare/spree-commerce-vs-thirty-bees$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '54196510-1549-49ef-8799-53017ed6e08f', $q$vs Spree Commerce$q$, $q$/compare/spree-commerce-vs-thirty-bees$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '54196510-1549-49ef-8799-53017ed6e08f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '54196510-1549-49ef-8799-53017ed6e08f' AND href = $q$/compare/spree-commerce-vs-thirty-bees$q$);

-- ── Solidus vs Spree Commerce (solidus-vs-spree-commerce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', '80d28886-f2f5-4191-a617-3ed3234eb862', $q$solidus-vs-spree-commerce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c34caf13-187c-4852-8539-3e8297879c3d', $q$vs Spree Commerce$q$, $q$/compare/solidus-vs-spree-commerce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c34caf13-187c-4852-8539-3e8297879c3d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c34caf13-187c-4852-8539-3e8297879c3d' AND href = $q$/compare/solidus-vs-spree-commerce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '80d28886-f2f5-4191-a617-3ed3234eb862', $q$vs Solidus$q$, $q$/compare/solidus-vs-spree-commerce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '80d28886-f2f5-4191-a617-3ed3234eb862'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '80d28886-f2f5-4191-a617-3ed3234eb862' AND href = $q$/compare/solidus-vs-spree-commerce$q$);

-- ── Drupal Commerce vs Solidus (drupal-commerce-vs-solidus) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', 'c34caf13-187c-4852-8539-3e8297879c3d', $q$drupal-commerce-vs-solidus$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$vs Solidus$q$, $q$/compare/drupal-commerce-vs-solidus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2' AND href = $q$/compare/drupal-commerce-vs-solidus$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c34caf13-187c-4852-8539-3e8297879c3d', $q$vs Drupal Commerce$q$, $q$/compare/drupal-commerce-vs-solidus$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c34caf13-187c-4852-8539-3e8297879c3d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c34caf13-187c-4852-8539-3e8297879c3d' AND href = $q$/compare/drupal-commerce-vs-solidus$q$);

-- ── Drupal Commerce vs GrandNode (drupal-commerce-vs-grandnode) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', '8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$drupal-commerce-vs-grandnode$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$vs GrandNode$q$, $q$/compare/drupal-commerce-vs-grandnode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2' AND href = $q$/compare/drupal-commerce-vs-grandnode$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$vs Drupal Commerce$q$, $q$/compare/drupal-commerce-vs-grandnode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e' AND href = $q$/compare/drupal-commerce-vs-grandnode$q$);

-- ── GrandNode vs nopCommerce (grandnode-vs-nopcommerce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', 'a28c91f9-301a-4413-8b14-a58c3ee344df', $q$grandnode-vs-nopcommerce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$vs nopCommerce$q$, $q$/compare/grandnode-vs-nopcommerce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e' AND href = $q$/compare/grandnode-vs-nopcommerce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a28c91f9-301a-4413-8b14-a58c3ee344df', $q$vs GrandNode$q$, $q$/compare/grandnode-vs-nopcommerce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a28c91f9-301a-4413-8b14-a58c3ee344df'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a28c91f9-301a-4413-8b14-a58c3ee344df' AND href = $q$/compare/grandnode-vs-nopcommerce$q$);

-- ── nopCommerce vs Snipcart (nopcommerce-vs-snipcart) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', '33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$nopcommerce-vs-snipcart$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a28c91f9-301a-4413-8b14-a58c3ee344df', $q$vs Snipcart$q$, $q$/compare/nopcommerce-vs-snipcart$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a28c91f9-301a-4413-8b14-a58c3ee344df'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a28c91f9-301a-4413-8b14-a58c3ee344df' AND href = $q$/compare/nopcommerce-vs-snipcart$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$vs nopCommerce$q$, $q$/compare/nopcommerce-vs-snipcart$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '33d8b578-c949-41fd-b5e1-f9c8acf9190a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '33d8b578-c949-41fd-b5e1-f9c8acf9190a' AND href = $q$/compare/nopcommerce-vs-snipcart$q$);

-- ── Grype vs OpenVAS (grype-vs-openvas) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', '2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$grype-vs-openvas$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$vs OpenVAS$q$, $q$/compare/grype-vs-openvas$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9' AND href = $q$/compare/grype-vs-openvas$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$vs Grype$q$, $q$/compare/grype-vs-openvas$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d037963-f9fb-4d88-bcc4-228a333d83cf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d037963-f9fb-4d88-bcc4-228a333d83cf' AND href = $q$/compare/grype-vs-openvas$q$);

-- ── Checkmarx vs OpenVAS (checkmarx-vs-openvas) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', '2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$checkmarx-vs-openvas$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$vs OpenVAS$q$, $q$/compare/checkmarx-vs-openvas$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec' AND href = $q$/compare/checkmarx-vs-openvas$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$vs Checkmarx$q$, $q$/compare/checkmarx-vs-openvas$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d037963-f9fb-4d88-bcc4-228a333d83cf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d037963-f9fb-4d88-bcc4-228a333d83cf' AND href = $q$/compare/checkmarx-vs-openvas$q$);

-- ── Akeyless vs Checkmarx (akeyless-vs-checkmarx) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$akeyless-vs-checkmarx$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$vs Checkmarx$q$, $q$/compare/akeyless-vs-checkmarx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a' AND href = $q$/compare/akeyless-vs-checkmarx$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$vs Akeyless$q$, $q$/compare/akeyless-vs-checkmarx$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec' AND href = $q$/compare/akeyless-vs-checkmarx$q$);

-- ── Akeyless vs HashiCorp Vault (akeyless-vs-hashicorp-vault) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', '7bf2641e-776f-49ba-814c-30d9468c54c8', $q$akeyless-vs-hashicorp-vault$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$vs HashiCorp Vault$q$, $q$/compare/akeyless-vs-hashicorp-vault$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a' AND href = $q$/compare/akeyless-vs-hashicorp-vault$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bf2641e-776f-49ba-814c-30d9468c54c8', $q$vs Akeyless$q$, $q$/compare/akeyless-vs-hashicorp-vault$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bf2641e-776f-49ba-814c-30d9468c54c8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bf2641e-776f-49ba-814c-30d9468c54c8' AND href = $q$/compare/akeyless-vs-hashicorp-vault$q$);

-- ── HashiCorp Vault vs Vaultwarden (hashicorp-vault-vs-vaultwarden) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', '72bf9a68-6a9a-4412-9612-8de0644c372e', $q$hashicorp-vault-vs-vaultwarden$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bf2641e-776f-49ba-814c-30d9468c54c8', $q$vs Vaultwarden$q$, $q$/compare/hashicorp-vault-vs-vaultwarden$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bf2641e-776f-49ba-814c-30d9468c54c8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bf2641e-776f-49ba-814c-30d9468c54c8' AND href = $q$/compare/hashicorp-vault-vs-vaultwarden$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72bf9a68-6a9a-4412-9612-8de0644c372e', $q$vs HashiCorp Vault$q$, $q$/compare/hashicorp-vault-vs-vaultwarden$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72bf9a68-6a9a-4412-9612-8de0644c372e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72bf9a68-6a9a-4412-9612-8de0644c372e' AND href = $q$/compare/hashicorp-vault-vs-vaultwarden$q$);

-- ── FusionAuth vs Vaultwarden (fusionauth-vs-vaultwarden) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', '72bf9a68-6a9a-4412-9612-8de0644c372e', $q$fusionauth-vs-vaultwarden$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '53f62fac-4ecb-4373-8264-0094d3faebee', $q$vs Vaultwarden$q$, $q$/compare/fusionauth-vs-vaultwarden$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '53f62fac-4ecb-4373-8264-0094d3faebee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '53f62fac-4ecb-4373-8264-0094d3faebee' AND href = $q$/compare/fusionauth-vs-vaultwarden$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72bf9a68-6a9a-4412-9612-8de0644c372e', $q$vs FusionAuth$q$, $q$/compare/fusionauth-vs-vaultwarden$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72bf9a68-6a9a-4412-9612-8de0644c372e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72bf9a68-6a9a-4412-9612-8de0644c372e' AND href = $q$/compare/fusionauth-vs-vaultwarden$q$);

-- ── FusionAuth vs WorkOS (fusionauth-vs-workos) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', '3455877b-59ac-4ce9-8371-d5101e680c67', $q$fusionauth-vs-workos$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '53f62fac-4ecb-4373-8264-0094d3faebee', $q$vs WorkOS$q$, $q$/compare/fusionauth-vs-workos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '53f62fac-4ecb-4373-8264-0094d3faebee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '53f62fac-4ecb-4373-8264-0094d3faebee' AND href = $q$/compare/fusionauth-vs-workos$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3455877b-59ac-4ce9-8371-d5101e680c67', $q$vs FusionAuth$q$, $q$/compare/fusionauth-vs-workos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3455877b-59ac-4ce9-8371-d5101e680c67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3455877b-59ac-4ce9-8371-d5101e680c67' AND href = $q$/compare/fusionauth-vs-workos$q$);

-- ── Descope vs WorkOS (descope-vs-workos) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', '3455877b-59ac-4ce9-8371-d5101e680c67', $q$descope-vs-workos$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$vs WorkOS$q$, $q$/compare/descope-vs-workos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298' AND href = $q$/compare/descope-vs-workos$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3455877b-59ac-4ce9-8371-d5101e680c67', $q$vs Descope$q$, $q$/compare/descope-vs-workos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3455877b-59ac-4ce9-8371-d5101e680c67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3455877b-59ac-4ce9-8371-d5101e680c67' AND href = $q$/compare/descope-vs-workos$q$);

-- ── Clerk vs Descope (clerk-vs-descope) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$clerk-vs-descope$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '84902cee-488e-4583-aad3-f2fbf318cb9e', $q$vs Descope$q$, $q$/compare/clerk-vs-descope$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '84902cee-488e-4583-aad3-f2fbf318cb9e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '84902cee-488e-4583-aad3-f2fbf318cb9e' AND href = $q$/compare/clerk-vs-descope$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$vs Clerk$q$, $q$/compare/clerk-vs-descope$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298' AND href = $q$/compare/clerk-vs-descope$q$);

-- ── Clerk vs Logto (clerk-vs-logto) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', 'e0668898-096e-49d0-a80e-31cce8d69397', $q$clerk-vs-logto$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '84902cee-488e-4583-aad3-f2fbf318cb9e', $q$vs Logto$q$, $q$/compare/clerk-vs-logto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '84902cee-488e-4583-aad3-f2fbf318cb9e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '84902cee-488e-4583-aad3-f2fbf318cb9e' AND href = $q$/compare/clerk-vs-logto$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e0668898-096e-49d0-a80e-31cce8d69397', $q$vs Clerk$q$, $q$/compare/clerk-vs-logto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e0668898-096e-49d0-a80e-31cce8d69397'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e0668898-096e-49d0-a80e-31cce8d69397' AND href = $q$/compare/clerk-vs-logto$q$);

-- ── Frontegg vs Logto (frontegg-vs-logto) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', 'e0668898-096e-49d0-a80e-31cce8d69397', $q$frontegg-vs-logto$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd5eaaad6-9ac2-4633-a29e-68531875f434', $q$vs Logto$q$, $q$/compare/frontegg-vs-logto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd5eaaad6-9ac2-4633-a29e-68531875f434'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd5eaaad6-9ac2-4633-a29e-68531875f434' AND href = $q$/compare/frontegg-vs-logto$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e0668898-096e-49d0-a80e-31cce8d69397', $q$vs Frontegg$q$, $q$/compare/frontegg-vs-logto$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e0668898-096e-49d0-a80e-31cce8d69397'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e0668898-096e-49d0-a80e-31cce8d69397' AND href = $q$/compare/frontegg-vs-logto$q$);

-- ── Frontegg vs PropelAuth (frontegg-vs-propelauth) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', '789f97be-c510-457a-8f6f-591187e6b959', $q$frontegg-vs-propelauth$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd5eaaad6-9ac2-4633-a29e-68531875f434', $q$vs PropelAuth$q$, $q$/compare/frontegg-vs-propelauth$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd5eaaad6-9ac2-4633-a29e-68531875f434'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd5eaaad6-9ac2-4633-a29e-68531875f434' AND href = $q$/compare/frontegg-vs-propelauth$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '789f97be-c510-457a-8f6f-591187e6b959', $q$vs Frontegg$q$, $q$/compare/frontegg-vs-propelauth$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '789f97be-c510-457a-8f6f-591187e6b959'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '789f97be-c510-457a-8f6f-591187e6b959' AND href = $q$/compare/frontegg-vs-propelauth$q$);

-- ── Casdoor vs PropelAuth (casdoor-vs-propelauth) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', '789f97be-c510-457a-8f6f-591187e6b959', $q$casdoor-vs-propelauth$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$vs PropelAuth$q$, $q$/compare/casdoor-vs-propelauth$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '698be4be-d4e5-4e9b-8413-12a637e83e7c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '698be4be-d4e5-4e9b-8413-12a637e83e7c' AND href = $q$/compare/casdoor-vs-propelauth$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '789f97be-c510-457a-8f6f-591187e6b959', $q$vs Casdoor$q$, $q$/compare/casdoor-vs-propelauth$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '789f97be-c510-457a-8f6f-591187e6b959'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '789f97be-c510-457a-8f6f-591187e6b959' AND href = $q$/compare/casdoor-vs-propelauth$q$);

-- ── Planka vs Redmine (planka-vs-redmine) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', '82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$planka-vs-redmine$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$vs Redmine$q$, $q$/compare/planka-vs-redmine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b' AND href = $q$/compare/planka-vs-redmine$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$vs Planka$q$, $q$/compare/planka-vs-redmine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43' AND href = $q$/compare/planka-vs-redmine$q$);

-- ── Phorge vs Redmine (phorge-vs-redmine) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', '82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$phorge-vs-redmine$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$vs Redmine$q$, $q$/compare/phorge-vs-redmine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085' AND href = $q$/compare/phorge-vs-redmine$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$vs Phorge$q$, $q$/compare/phorge-vs-redmine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43' AND href = $q$/compare/phorge-vs-redmine$q$);

-- ── Capchase vs Pipe (capchase-vs-pipe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', '61d2abfe-020b-44ad-8493-bab43284c852', $q$capchase-vs-pipe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '53147b31-f2fc-40d8-abf5-b79accdf962a', $q$vs Pipe$q$, $q$/compare/capchase-vs-pipe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '53147b31-f2fc-40d8-abf5-b79accdf962a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '53147b31-f2fc-40d8-abf5-b79accdf962a' AND href = $q$/compare/capchase-vs-pipe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '61d2abfe-020b-44ad-8493-bab43284c852', $q$vs Capchase$q$, $q$/compare/capchase-vs-pipe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '61d2abfe-020b-44ad-8493-bab43284c852'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '61d2abfe-020b-44ad-8493-bab43284c852' AND href = $q$/compare/capchase-vs-pipe$q$);

-- ── Akaunting vs Frappe Books (akaunting-vs-frappe-books) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '99b0c7e3-3443-428c-9117-bae2653976d1', $q$akaunting-vs-frappe-books$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$vs Frappe Books$q$, $q$/compare/akaunting-vs-frappe-books$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869' AND href = $q$/compare/akaunting-vs-frappe-books$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99b0c7e3-3443-428c-9117-bae2653976d1', $q$vs Akaunting$q$, $q$/compare/akaunting-vs-frappe-books$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99b0c7e3-3443-428c-9117-bae2653976d1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99b0c7e3-3443-428c-9117-bae2653976d1' AND href = $q$/compare/akaunting-vs-frappe-books$q$);

-- ── Akaunting vs Invoice Ninja (akaunting-vs-invoice-ninja) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$akaunting-vs-invoice-ninja$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$vs Invoice Ninja$q$, $q$/compare/akaunting-vs-invoice-ninja$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869' AND href = $q$/compare/akaunting-vs-invoice-ninja$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$vs Akaunting$q$, $q$/compare/akaunting-vs-invoice-ninja$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec' AND href = $q$/compare/akaunting-vs-invoice-ninja$q$);

-- ── Bigcapital vs Invoice Ninja (bigcapital-vs-invoice-ninja) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', '7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$bigcapital-vs-invoice-ninja$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$vs Invoice Ninja$q$, $q$/compare/bigcapital-vs-invoice-ninja$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0ef7337-a5e2-4799-a976-3b354b927eaf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0ef7337-a5e2-4799-a976-3b354b927eaf' AND href = $q$/compare/bigcapital-vs-invoice-ninja$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$vs Bigcapital$q$, $q$/compare/bigcapital-vs-invoice-ninja$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec' AND href = $q$/compare/bigcapital-vs-invoice-ninja$q$);

-- ── Anrok vs Zamp (anrok-vs-zamp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', 'ca461870-55b1-4c9b-a8d8-8006576315c0', $q$anrok-vs-zamp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$vs Zamp$q$, $q$/compare/anrok-vs-zamp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3' AND href = $q$/compare/anrok-vs-zamp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca461870-55b1-4c9b-a8d8-8006576315c0', $q$vs Anrok$q$, $q$/compare/anrok-vs-zamp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca461870-55b1-4c9b-a8d8-8006576315c0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca461870-55b1-4c9b-a8d8-8006576315c0' AND href = $q$/compare/anrok-vs-zamp$q$);

-- ── m3ter vs Zamp (m3ter-vs-zamp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', 'ca461870-55b1-4c9b-a8d8-8006576315c0', $q$m3ter-vs-zamp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$vs Zamp$q$, $q$/compare/m3ter-vs-zamp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263' AND href = $q$/compare/m3ter-vs-zamp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca461870-55b1-4c9b-a8d8-8006576315c0', $q$vs m3ter$q$, $q$/compare/m3ter-vs-zamp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca461870-55b1-4c9b-a8d8-8006576315c0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca461870-55b1-4c9b-a8d8-8006576315c0' AND href = $q$/compare/m3ter-vs-zamp$q$);

-- ── Hyperline vs Kill Bill (hyperline-vs-kill-bill) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', '07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$hyperline-vs-kill-bill$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$vs Kill Bill$q$, $q$/compare/hyperline-vs-kill-bill$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92' AND href = $q$/compare/hyperline-vs-kill-bill$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$vs Hyperline$q$, $q$/compare/hyperline-vs-kill-bill$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '07fb8b20-d497-452b-ab9e-d61603e77eb7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '07fb8b20-d497-452b-ab9e-d61603e77eb7' AND href = $q$/compare/hyperline-vs-kill-bill$q$);

-- ── KonnectzIT vs Latenode (konnectzit-vs-latenode) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', 'f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$konnectzit-vs-latenode$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26b90793-47fc-44e2-b4ed-aaab363f429f', $q$vs Latenode$q$, $q$/compare/konnectzit-vs-latenode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26b90793-47fc-44e2-b4ed-aaab363f429f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26b90793-47fc-44e2-b4ed-aaab363f429f' AND href = $q$/compare/konnectzit-vs-latenode$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$vs KonnectzIT$q$, $q$/compare/konnectzit-vs-latenode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f' AND href = $q$/compare/konnectzit-vs-latenode$q$);

-- ── Carepatron vs TheraNest (carepatron-vs-theranest) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', '5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$carepatron-vs-theranest$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$vs TheraNest$q$, $q$/compare/carepatron-vs-theranest$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01' AND href = $q$/compare/carepatron-vs-theranest$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$vs Carepatron$q$, $q$/compare/carepatron-vs-theranest$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5fbb1de8-79fd-408f-ab12-959b5b74f712'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5fbb1de8-79fd-408f-ab12-959b5b74f712' AND href = $q$/compare/carepatron-vs-theranest$q$);

-- ── Carepatron vs Halaxy (carepatron-vs-halaxy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', 'fddf95b3-6124-4cb3-8919-8d1df1119657', $q$carepatron-vs-halaxy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$vs Halaxy$q$, $q$/compare/carepatron-vs-halaxy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01' AND href = $q$/compare/carepatron-vs-halaxy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fddf95b3-6124-4cb3-8919-8d1df1119657', $q$vs Carepatron$q$, $q$/compare/carepatron-vs-halaxy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fddf95b3-6124-4cb3-8919-8d1df1119657'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fddf95b3-6124-4cb3-8919-8d1df1119657' AND href = $q$/compare/carepatron-vs-halaxy$q$);

-- ── Halaxy vs Spruce Health (halaxy-vs-spruce-health) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', '1de08da2-3fe6-4896-9da1-03448621c680', $q$halaxy-vs-spruce-health$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fddf95b3-6124-4cb3-8919-8d1df1119657', $q$vs Spruce Health$q$, $q$/compare/halaxy-vs-spruce-health$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fddf95b3-6124-4cb3-8919-8d1df1119657'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fddf95b3-6124-4cb3-8919-8d1df1119657' AND href = $q$/compare/halaxy-vs-spruce-health$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1de08da2-3fe6-4896-9da1-03448621c680', $q$vs Halaxy$q$, $q$/compare/halaxy-vs-spruce-health$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680' AND href = $q$/compare/halaxy-vs-spruce-health$q$);

-- ── Luma Health vs Spruce Health (luma-health-vs-spruce-health) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', '1de08da2-3fe6-4896-9da1-03448621c680', $q$luma-health-vs-spruce-health$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$vs Spruce Health$q$, $q$/compare/luma-health-vs-spruce-health$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df' AND href = $q$/compare/luma-health-vs-spruce-health$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1de08da2-3fe6-4896-9da1-03448621c680', $q$vs Luma Health$q$, $q$/compare/luma-health-vs-spruce-health$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680' AND href = $q$/compare/luma-health-vs-spruce-health$q$);

-- ── Filevine vs Harvey (filevine-vs-harvey) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', '27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$filevine-vs-harvey$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$vs Harvey$q$, $q$/compare/filevine-vs-harvey$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '15c3e1d1-3978-4b9a-82fd-8517048b2955'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '15c3e1d1-3978-4b9a-82fd-8517048b2955' AND href = $q$/compare/filevine-vs-harvey$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$vs Filevine$q$, $q$/compare/filevine-vs-harvey$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd' AND href = $q$/compare/filevine-vs-harvey$q$);

-- ── Bill4Time vs Filevine (bill4time-vs-filevine) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', '15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$bill4time-vs-filevine$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '20f8795e-e405-44d9-8790-07ffa387bbf6', $q$vs Filevine$q$, $q$/compare/bill4time-vs-filevine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '20f8795e-e405-44d9-8790-07ffa387bbf6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '20f8795e-e405-44d9-8790-07ffa387bbf6' AND href = $q$/compare/bill4time-vs-filevine$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$vs Bill4Time$q$, $q$/compare/bill4time-vs-filevine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '15c3e1d1-3978-4b9a-82fd-8517048b2955'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '15c3e1d1-3978-4b9a-82fd-8517048b2955' AND href = $q$/compare/bill4time-vs-filevine$q$);

-- ── Bill4Time vs Logikcull (bill4time-vs-logikcull) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', '440d249d-d889-40ff-bcf3-14b8168ba59e', $q$bill4time-vs-logikcull$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '20f8795e-e405-44d9-8790-07ffa387bbf6', $q$vs Logikcull$q$, $q$/compare/bill4time-vs-logikcull$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '20f8795e-e405-44d9-8790-07ffa387bbf6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '20f8795e-e405-44d9-8790-07ffa387bbf6' AND href = $q$/compare/bill4time-vs-logikcull$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '440d249d-d889-40ff-bcf3-14b8168ba59e', $q$vs Bill4Time$q$, $q$/compare/bill4time-vs-logikcull$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '440d249d-d889-40ff-bcf3-14b8168ba59e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '440d249d-d889-40ff-bcf3-14b8168ba59e' AND href = $q$/compare/bill4time-vs-logikcull$q$);

-- ── Logikcull vs Nextpoint (logikcull-vs-nextpoint) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', '5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$logikcull-vs-nextpoint$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '440d249d-d889-40ff-bcf3-14b8168ba59e', $q$vs Nextpoint$q$, $q$/compare/logikcull-vs-nextpoint$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '440d249d-d889-40ff-bcf3-14b8168ba59e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '440d249d-d889-40ff-bcf3-14b8168ba59e' AND href = $q$/compare/logikcull-vs-nextpoint$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$vs Logikcull$q$, $q$/compare/logikcull-vs-nextpoint$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392' AND href = $q$/compare/logikcull-vs-nextpoint$q$);

-- ── OpenCATS vs SeekOut (opencats-vs-seekout) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$opencats-vs-seekout$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '448ec905-8c58-4b0c-931b-b7bedf89db12', $q$vs SeekOut$q$, $q$/compare/opencats-vs-seekout$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '448ec905-8c58-4b0c-931b-b7bedf89db12'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '448ec905-8c58-4b0c-931b-b7bedf89db12' AND href = $q$/compare/opencats-vs-seekout$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$vs OpenCATS$q$, $q$/compare/opencats-vs-seekout$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1' AND href = $q$/compare/opencats-vs-seekout$q$);

-- ── Subskribe CPQ vs Xactly Incent (subskribe-cpq-vs-xactly-incent) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', 'be3d358d-02c4-42e2-b373-1d918d655065', $q$subskribe-cpq-vs-xactly-incent$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '989b012e-a050-497e-8c08-30d43f45ccd1', $q$vs Xactly Incent$q$, $q$/compare/subskribe-cpq-vs-xactly-incent$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1' AND href = $q$/compare/subskribe-cpq-vs-xactly-incent$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'be3d358d-02c4-42e2-b373-1d918d655065', $q$vs Subskribe CPQ$q$, $q$/compare/subskribe-cpq-vs-xactly-incent$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'be3d358d-02c4-42e2-b373-1d918d655065'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'be3d358d-02c4-42e2-b373-1d918d655065' AND href = $q$/compare/subskribe-cpq-vs-xactly-incent$q$);

-- ── LevelEleven vs Xactly Incent (leveleleven-vs-xactly-incent) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', 'be3d358d-02c4-42e2-b373-1d918d655065', $q$leveleleven-vs-xactly-incent$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$vs Xactly Incent$q$, $q$/compare/leveleleven-vs-xactly-incent$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6' AND href = $q$/compare/leveleleven-vs-xactly-incent$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'be3d358d-02c4-42e2-b373-1d918d655065', $q$vs LevelEleven$q$, $q$/compare/leveleleven-vs-xactly-incent$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'be3d358d-02c4-42e2-b373-1d918d655065'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'be3d358d-02c4-42e2-b373-1d918d655065' AND href = $q$/compare/leveleleven-vs-xactly-incent$q$);

-- ── Avoma vs LevelEleven (avoma-vs-leveleleven) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', 'db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$avoma-vs-leveleleven$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$vs LevelEleven$q$, $q$/compare/avoma-vs-leveleleven$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19' AND href = $q$/compare/avoma-vs-leveleleven$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$vs Avoma$q$, $q$/compare/avoma-vs-leveleleven$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6' AND href = $q$/compare/avoma-vs-leveleleven$q$);

-- ── Avoma vs Salesloft (avoma-vs-salesloft) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$avoma-vs-salesloft$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$vs Salesloft$q$, $q$/compare/avoma-vs-salesloft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19' AND href = $q$/compare/avoma-vs-salesloft$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$vs Avoma$q$, $q$/compare/avoma-vs-salesloft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b' AND href = $q$/compare/avoma-vs-salesloft$q$);

-- ── Dropcontact vs Salesloft (dropcontact-vs-salesloft) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', '0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$dropcontact-vs-salesloft$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$vs Salesloft$q$, $q$/compare/dropcontact-vs-salesloft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38' AND href = $q$/compare/dropcontact-vs-salesloft$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$vs Dropcontact$q$, $q$/compare/dropcontact-vs-salesloft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b' AND href = $q$/compare/dropcontact-vs-salesloft$q$);

-- ── airfocus vs Dragonboat (airfocus-vs-dragonboat) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$airfocus-vs-dragonboat$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1630ac29-62d1-433c-a8cb-b173926de875', $q$vs Dragonboat$q$, $q$/compare/airfocus-vs-dragonboat$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875' AND href = $q$/compare/airfocus-vs-dragonboat$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$vs airfocus$q$, $q$/compare/airfocus-vs-dragonboat$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76' AND href = $q$/compare/airfocus-vs-dragonboat$q$);

-- ── Dragonboat vs Zeda.io (dragonboat-vs-zeda-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', '7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$dragonboat-vs-zeda-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$vs Zeda.io$q$, $q$/compare/dragonboat-vs-zeda-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76' AND href = $q$/compare/dragonboat-vs-zeda-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$vs Dragonboat$q$, $q$/compare/dragonboat-vs-zeda-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e' AND href = $q$/compare/dragonboat-vs-zeda-io$q$);

-- ── Canny vs Zeda.io (canny-vs-zeda-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('de66f380-8299-4b3a-b413-b14569d70119', '7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$canny-vs-zeda-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de66f380-8299-4b3a-b413-b14569d70119', $q$vs Zeda.io$q$, $q$/compare/canny-vs-zeda-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de66f380-8299-4b3a-b413-b14569d70119'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de66f380-8299-4b3a-b413-b14569d70119' AND href = $q$/compare/canny-vs-zeda-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$vs Canny$q$, $q$/compare/canny-vs-zeda-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e' AND href = $q$/compare/canny-vs-zeda-io$q$);

-- ── Canny vs Nolt (canny-vs-nolt) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('de66f380-8299-4b3a-b413-b14569d70119', '464182df-a73e-41ff-88d0-d38b16891925', $q$canny-vs-nolt$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de66f380-8299-4b3a-b413-b14569d70119', $q$vs Nolt$q$, $q$/compare/canny-vs-nolt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de66f380-8299-4b3a-b413-b14569d70119'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de66f380-8299-4b3a-b413-b14569d70119' AND href = $q$/compare/canny-vs-nolt$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '464182df-a73e-41ff-88d0-d38b16891925', $q$vs Canny$q$, $q$/compare/canny-vs-nolt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '464182df-a73e-41ff-88d0-d38b16891925'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '464182df-a73e-41ff-88d0-d38b16891925' AND href = $q$/compare/canny-vs-nolt$q$);

-- ── Errbit vs healthchecks (errbit-vs-healthchecks) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', '24aa6862-35d5-4811-b145-17e35cd64036', $q$errbit-vs-healthchecks$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3338502d-27fe-428c-9b82-985f4f0a73b4', $q$vs healthchecks$q$, $q$/compare/errbit-vs-healthchecks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3338502d-27fe-428c-9b82-985f4f0a73b4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3338502d-27fe-428c-9b82-985f4f0a73b4' AND href = $q$/compare/errbit-vs-healthchecks$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '24aa6862-35d5-4811-b145-17e35cd64036', $q$vs Errbit$q$, $q$/compare/errbit-vs-healthchecks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '24aa6862-35d5-4811-b145-17e35cd64036'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '24aa6862-35d5-4811-b145-17e35cd64036' AND href = $q$/compare/errbit-vs-healthchecks$q$);

-- ── Inngest vs SonarQube (inngest-vs-sonarqube) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', 'c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$inngest-vs-sonarqube$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3acb1b38-990d-4851-be0b-cc32baa33857', $q$vs SonarQube$q$, $q$/compare/inngest-vs-sonarqube$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3acb1b38-990d-4851-be0b-cc32baa33857'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3acb1b38-990d-4851-be0b-cc32baa33857' AND href = $q$/compare/inngest-vs-sonarqube$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$vs Inngest$q$, $q$/compare/inngest-vs-sonarqube$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693' AND href = $q$/compare/inngest-vs-sonarqube$q$);

-- ── Frappe HR vs Ravio (frappe-hr-vs-ravio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', '240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$frappe-hr-vs-ravio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$vs Ravio$q$, $q$/compare/frappe-hr-vs-ravio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0' AND href = $q$/compare/frappe-hr-vs-ravio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$vs Frappe HR$q$, $q$/compare/frappe-hr-vs-ravio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '240f9156-e0ab-42ca-b567-928a9cab1bb2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '240f9156-e0ab-42ca-b567-928a9cab1bb2' AND href = $q$/compare/frappe-hr-vs-ravio$q$);

-- ── Boundary vs Burp Suite (boundary-vs-burp-suite) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', '753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$boundary-vs-burp-suite$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$vs Burp Suite$q$, $q$/compare/boundary-vs-burp-suite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64' AND href = $q$/compare/boundary-vs-burp-suite$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$vs Boundary$q$, $q$/compare/boundary-vs-burp-suite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '753226c3-cede-4bbb-9fad-9d73dd9827e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '753226c3-cede-4bbb-9fad-9d73dd9827e4' AND href = $q$/compare/boundary-vs-burp-suite$q$);

-- ── Casdoor vs CrowdSec (casdoor-vs-crowdsec) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', '521d7edd-be93-4cc5-b678-97bf55389e62', $q$casdoor-vs-crowdsec$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$vs CrowdSec$q$, $q$/compare/casdoor-vs-crowdsec$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '698be4be-d4e5-4e9b-8413-12a637e83e7c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '698be4be-d4e5-4e9b-8413-12a637e83e7c' AND href = $q$/compare/casdoor-vs-crowdsec$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '521d7edd-be93-4cc5-b678-97bf55389e62', $q$vs Casdoor$q$, $q$/compare/casdoor-vs-crowdsec$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '521d7edd-be93-4cc5-b678-97bf55389e62'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '521d7edd-be93-4cc5-b678-97bf55389e62' AND href = $q$/compare/casdoor-vs-crowdsec$q$);


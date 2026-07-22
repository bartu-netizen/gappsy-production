-- Comparison batch: railway-vs-render, datadog-vs-new-relic, activepieces-vs-zapier, automatisch-vs-zapier, ilovepdf-vs-smallpdf, docusign-vs-dropbox-sign, docusign-vs-signnow, better-proposals-vs-proposify
-- Publishes 8 comparison page(s) with editorial content.

-- ── Railway vs Render (railway-vs-render) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b696da65-5315-4c8c-b34f-3a2fe6617f10', '87cb32a2-9663-4c3e-a003-f1735380ac01', $q$railway-vs-render$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b696da65-5315-4c8c-b34f-3a2fe6617f10', $q$vs Render$q$, $q$/compare/railway-vs-render$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b696da65-5315-4c8c-b34f-3a2fe6617f10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b696da65-5315-4c8c-b34f-3a2fe6617f10' AND href = $q$/compare/railway-vs-render$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '87cb32a2-9663-4c3e-a003-f1735380ac01', $q$vs Railway$q$, $q$/compare/railway-vs-render$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '87cb32a2-9663-4c3e-a003-f1735380ac01'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '87cb32a2-9663-4c3e-a003-f1735380ac01' AND href = $q$/compare/railway-vs-render$q$);

-- ── Datadog vs New Relic (datadog-vs-new-relic) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b7e3de09-3d1f-4cf2-8337-c269090981c8', 'f36057a5-8bfe-46d6-b430-56cb10cd464c', $q$datadog-vs-new-relic$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b7e3de09-3d1f-4cf2-8337-c269090981c8', $q$vs New Relic$q$, $q$/compare/datadog-vs-new-relic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b7e3de09-3d1f-4cf2-8337-c269090981c8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b7e3de09-3d1f-4cf2-8337-c269090981c8' AND href = $q$/compare/datadog-vs-new-relic$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f36057a5-8bfe-46d6-b430-56cb10cd464c', $q$vs Datadog$q$, $q$/compare/datadog-vs-new-relic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f36057a5-8bfe-46d6-b430-56cb10cd464c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f36057a5-8bfe-46d6-b430-56cb10cd464c' AND href = $q$/compare/datadog-vs-new-relic$q$);

-- ── activepieces vs Zapier (activepieces-vs-zapier) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '925daab1-05f1-463d-acca-f58f8cdc0978', $q$activepieces-vs-zapier$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Zapier$q$, $q$/compare/activepieces-vs-zapier$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-zapier$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '925daab1-05f1-463d-acca-f58f8cdc0978', $q$vs activepieces$q$, $q$/compare/activepieces-vs-zapier$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '925daab1-05f1-463d-acca-f58f8cdc0978'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '925daab1-05f1-463d-acca-f58f8cdc0978' AND href = $q$/compare/activepieces-vs-zapier$q$);

-- ── automatisch vs Zapier (automatisch-vs-zapier) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', '925daab1-05f1-463d-acca-f58f8cdc0978', $q$automatisch-vs-zapier$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$vs Zapier$q$, $q$/compare/automatisch-vs-zapier$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead' AND href = $q$/compare/automatisch-vs-zapier$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '925daab1-05f1-463d-acca-f58f8cdc0978', $q$vs automatisch$q$, $q$/compare/automatisch-vs-zapier$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '925daab1-05f1-463d-acca-f58f8cdc0978'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '925daab1-05f1-463d-acca-f58f8cdc0978' AND href = $q$/compare/automatisch-vs-zapier$q$);

-- ── iLovePDF vs Smallpdf (ilovepdf-vs-smallpdf) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('40bbcaf4-84e3-47b8-9d27-074bedb96236', 'ba837227-8967-47be-bd65-e9a86eafe9e3', $q$ilovepdf-vs-smallpdf$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '40bbcaf4-84e3-47b8-9d27-074bedb96236', $q$vs Smallpdf$q$, $q$/compare/ilovepdf-vs-smallpdf$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '40bbcaf4-84e3-47b8-9d27-074bedb96236'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '40bbcaf4-84e3-47b8-9d27-074bedb96236' AND href = $q$/compare/ilovepdf-vs-smallpdf$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ba837227-8967-47be-bd65-e9a86eafe9e3', $q$vs iLovePDF$q$, $q$/compare/ilovepdf-vs-smallpdf$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ba837227-8967-47be-bd65-e9a86eafe9e3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ba837227-8967-47be-bd65-e9a86eafe9e3' AND href = $q$/compare/ilovepdf-vs-smallpdf$q$);

-- ── DocuSign vs Dropbox Sign (docusign-vs-dropbox-sign) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('21b62640-e209-4a01-b000-4e8484a033b6', 'd81fd94a-547f-4b52-8585-6375a6414c6d', $q$docusign-vs-dropbox-sign$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '21b62640-e209-4a01-b000-4e8484a033b6', $q$vs Dropbox Sign$q$, $q$/compare/docusign-vs-dropbox-sign$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '21b62640-e209-4a01-b000-4e8484a033b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '21b62640-e209-4a01-b000-4e8484a033b6' AND href = $q$/compare/docusign-vs-dropbox-sign$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd81fd94a-547f-4b52-8585-6375a6414c6d', $q$vs DocuSign$q$, $q$/compare/docusign-vs-dropbox-sign$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d' AND href = $q$/compare/docusign-vs-dropbox-sign$q$);

-- ── DocuSign vs SignNow (docusign-vs-signnow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('21b62640-e209-4a01-b000-4e8484a033b6', '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$docusign-vs-signnow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '21b62640-e209-4a01-b000-4e8484a033b6', $q$vs SignNow$q$, $q$/compare/docusign-vs-signnow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '21b62640-e209-4a01-b000-4e8484a033b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '21b62640-e209-4a01-b000-4e8484a033b6' AND href = $q$/compare/docusign-vs-signnow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$vs DocuSign$q$, $q$/compare/docusign-vs-signnow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00' AND href = $q$/compare/docusign-vs-signnow$q$);

-- ── Better Proposals vs Proposify (better-proposals-vs-proposify) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('95c9d0a5-64da-46ca-b8b7-a7245a366020', '95f3299d-181e-4436-824f-a995c9317a92', $q$better-proposals-vs-proposify$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '95c9d0a5-64da-46ca-b8b7-a7245a366020', $q$vs Proposify$q$, $q$/compare/better-proposals-vs-proposify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '95c9d0a5-64da-46ca-b8b7-a7245a366020'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '95c9d0a5-64da-46ca-b8b7-a7245a366020' AND href = $q$/compare/better-proposals-vs-proposify$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '95f3299d-181e-4436-824f-a995c9317a92', $q$vs Better Proposals$q$, $q$/compare/better-proposals-vs-proposify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '95f3299d-181e-4436-824f-a995c9317a92'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '95f3299d-181e-4436-824f-a995c9317a92' AND href = $q$/compare/better-proposals-vs-proposify$q$);


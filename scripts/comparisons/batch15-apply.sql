-- Comparison batch: autodesk-construction-cloud-vs-procore, housecall-pro-vs-jobber, buildertrend-vs-coconstruct, housecall-pro-vs-servicetitan, toast-vs-touchbistro, spoton-vs-toast, clover-vs-lightspeed-retail, clover-vs-square
-- Publishes 8 comparison page(s) with editorial content.

-- ── Autodesk Construction Cloud vs Procore (autodesk-construction-cloud-vs-procore) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', 'bc3b8540-7633-45e3-8bb9-3540341f319d', $q$autodesk-construction-cloud-vs-procore$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c9aff19f-2369-4d96-b80f-e33c932398f4', $q$vs Procore$q$, $q$/compare/autodesk-construction-cloud-vs-procore$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4' AND href = $q$/compare/autodesk-construction-cloud-vs-procore$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bc3b8540-7633-45e3-8bb9-3540341f319d', $q$vs Autodesk Construction Cloud$q$, $q$/compare/autodesk-construction-cloud-vs-procore$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bc3b8540-7633-45e3-8bb9-3540341f319d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bc3b8540-7633-45e3-8bb9-3540341f319d' AND href = $q$/compare/autodesk-construction-cloud-vs-procore$q$);

-- ── Housecall Pro vs Jobber (housecall-pro-vs-jobber) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bbbaf42a-877b-4574-bbcf-56a9d704be00', 'c23b8837-4a75-4e45-83cf-8a217ebf06ae', $q$housecall-pro-vs-jobber$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bbbaf42a-877b-4574-bbcf-56a9d704be00', $q$vs Jobber$q$, $q$/compare/housecall-pro-vs-jobber$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bbbaf42a-877b-4574-bbcf-56a9d704be00'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bbbaf42a-877b-4574-bbcf-56a9d704be00' AND href = $q$/compare/housecall-pro-vs-jobber$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c23b8837-4a75-4e45-83cf-8a217ebf06ae', $q$vs Housecall Pro$q$, $q$/compare/housecall-pro-vs-jobber$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c23b8837-4a75-4e45-83cf-8a217ebf06ae'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c23b8837-4a75-4e45-83cf-8a217ebf06ae' AND href = $q$/compare/housecall-pro-vs-jobber$q$);

-- ── Buildertrend vs CoConstruct (buildertrend-vs-coconstruct) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', 'eb149729-5f83-425f-8d50-05c96971bdf3', $q$buildertrend-vs-coconstruct$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$vs CoConstruct$q$, $q$/compare/buildertrend-vs-coconstruct$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88' AND href = $q$/compare/buildertrend-vs-coconstruct$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb149729-5f83-425f-8d50-05c96971bdf3', $q$vs Buildertrend$q$, $q$/compare/buildertrend-vs-coconstruct$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb149729-5f83-425f-8d50-05c96971bdf3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb149729-5f83-425f-8d50-05c96971bdf3' AND href = $q$/compare/buildertrend-vs-coconstruct$q$);

-- ── Housecall Pro vs ServiceTitan (housecall-pro-vs-servicetitan) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bbbaf42a-877b-4574-bbcf-56a9d704be00', '6fc3837d-ade3-437f-ac16-1a4ee783c3f8', $q$housecall-pro-vs-servicetitan$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bbbaf42a-877b-4574-bbcf-56a9d704be00', $q$vs ServiceTitan$q$, $q$/compare/housecall-pro-vs-servicetitan$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bbbaf42a-877b-4574-bbcf-56a9d704be00'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bbbaf42a-877b-4574-bbcf-56a9d704be00' AND href = $q$/compare/housecall-pro-vs-servicetitan$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6fc3837d-ade3-437f-ac16-1a4ee783c3f8', $q$vs Housecall Pro$q$, $q$/compare/housecall-pro-vs-servicetitan$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6fc3837d-ade3-437f-ac16-1a4ee783c3f8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6fc3837d-ade3-437f-ac16-1a4ee783c3f8' AND href = $q$/compare/housecall-pro-vs-servicetitan$q$);

-- ── Toast vs TouchBistro (toast-vs-touchbistro) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cd25a08d-37be-447e-ac4c-280238739e44', '4fba1a19-3d7b-4619-b54f-30bc07736976', $q$toast-vs-touchbistro$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd25a08d-37be-447e-ac4c-280238739e44', $q$vs TouchBistro$q$, $q$/compare/toast-vs-touchbistro$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd25a08d-37be-447e-ac4c-280238739e44'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd25a08d-37be-447e-ac4c-280238739e44' AND href = $q$/compare/toast-vs-touchbistro$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4fba1a19-3d7b-4619-b54f-30bc07736976', $q$vs Toast$q$, $q$/compare/toast-vs-touchbistro$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4fba1a19-3d7b-4619-b54f-30bc07736976'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4fba1a19-3d7b-4619-b54f-30bc07736976' AND href = $q$/compare/toast-vs-touchbistro$q$);

-- ── SpotOn vs Toast (spoton-vs-toast) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('17484540-c7ef-4a3f-b23f-5866c0cdd5ac', 'cd25a08d-37be-447e-ac4c-280238739e44', $q$spoton-vs-toast$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '17484540-c7ef-4a3f-b23f-5866c0cdd5ac', $q$vs Toast$q$, $q$/compare/spoton-vs-toast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '17484540-c7ef-4a3f-b23f-5866c0cdd5ac'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '17484540-c7ef-4a3f-b23f-5866c0cdd5ac' AND href = $q$/compare/spoton-vs-toast$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd25a08d-37be-447e-ac4c-280238739e44', $q$vs SpotOn$q$, $q$/compare/spoton-vs-toast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd25a08d-37be-447e-ac4c-280238739e44'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd25a08d-37be-447e-ac4c-280238739e44' AND href = $q$/compare/spoton-vs-toast$q$);

-- ── Clover vs Lightspeed Retail (clover-vs-lightspeed-retail) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e19def59-87a1-4c56-8c4c-42d792e37cfd', '6395be6b-6a6a-42ae-a6f6-77c85ea825f2', $q$clover-vs-lightspeed-retail$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e19def59-87a1-4c56-8c4c-42d792e37cfd', $q$vs Lightspeed Retail$q$, $q$/compare/clover-vs-lightspeed-retail$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e19def59-87a1-4c56-8c4c-42d792e37cfd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e19def59-87a1-4c56-8c4c-42d792e37cfd' AND href = $q$/compare/clover-vs-lightspeed-retail$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6395be6b-6a6a-42ae-a6f6-77c85ea825f2', $q$vs Clover$q$, $q$/compare/clover-vs-lightspeed-retail$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6395be6b-6a6a-42ae-a6f6-77c85ea825f2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6395be6b-6a6a-42ae-a6f6-77c85ea825f2' AND href = $q$/compare/clover-vs-lightspeed-retail$q$);

-- ── Clover vs Square (clover-vs-square) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e19def59-87a1-4c56-8c4c-42d792e37cfd', '9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$clover-vs-square$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e19def59-87a1-4c56-8c4c-42d792e37cfd', $q$vs Square$q$, $q$/compare/clover-vs-square$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e19def59-87a1-4c56-8c4c-42d792e37cfd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e19def59-87a1-4c56-8c4c-42d792e37cfd' AND href = $q$/compare/clover-vs-square$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$vs Clover$q$, $q$/compare/clover-vs-square$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84' AND href = $q$/compare/clover-vs-square$q$);


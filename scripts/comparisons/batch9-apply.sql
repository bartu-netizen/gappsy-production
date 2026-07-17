-- Comparison batch: shopify-vs-woocommerce, bigcommerce-vs-shopify, teachable-vs-thinkific, kajabi-vs-teachable, gumroad-vs-sellfy, klaviyo-vs-mailchimp, klaviyo-vs-omnisend, kit-vs-mailchimp
-- Publishes 8 comparison page(s) with editorial content.

-- ── Shopify vs WooCommerce (shopify-vs-woocommerce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57', $q$shopify-vs-woocommerce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8feedd41-747b-469b-a7e6-60d22adde1c3', $q$vs WooCommerce$q$, $q$/compare/shopify-vs-woocommerce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3' AND href = $q$/compare/shopify-vs-woocommerce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57', $q$vs Shopify$q$, $q$/compare/shopify-vs-woocommerce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57' AND href = $q$/compare/shopify-vs-woocommerce$q$);

-- ── BigCommerce vs Shopify (bigcommerce-vs-shopify) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c3103af2-b89a-4cb2-ac57-83030df19efa', '8feedd41-747b-469b-a7e6-60d22adde1c3', $q$bigcommerce-vs-shopify$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c3103af2-b89a-4cb2-ac57-83030df19efa', $q$vs Shopify$q$, $q$/compare/bigcommerce-vs-shopify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c3103af2-b89a-4cb2-ac57-83030df19efa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c3103af2-b89a-4cb2-ac57-83030df19efa' AND href = $q$/compare/bigcommerce-vs-shopify$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8feedd41-747b-469b-a7e6-60d22adde1c3', $q$vs BigCommerce$q$, $q$/compare/bigcommerce-vs-shopify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3' AND href = $q$/compare/bigcommerce-vs-shopify$q$);

-- ── Teachable vs Thinkific (teachable-vs-thinkific) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', '6f813de0-d2a3-471f-a9eb-5435220544a4', $q$teachable-vs-thinkific$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$vs Thinkific$q$, $q$/compare/teachable-vs-thinkific$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb' AND href = $q$/compare/teachable-vs-thinkific$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6f813de0-d2a3-471f-a9eb-5435220544a4', $q$vs Teachable$q$, $q$/compare/teachable-vs-thinkific$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6f813de0-d2a3-471f-a9eb-5435220544a4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6f813de0-d2a3-471f-a9eb-5435220544a4' AND href = $q$/compare/teachable-vs-thinkific$q$);

-- ── Kajabi vs Teachable (kajabi-vs-teachable) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c36767cb-32ab-4d26-8f68-e5a87e160f08', '331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$kajabi-vs-teachable$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c36767cb-32ab-4d26-8f68-e5a87e160f08', $q$vs Teachable$q$, $q$/compare/kajabi-vs-teachable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c36767cb-32ab-4d26-8f68-e5a87e160f08'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c36767cb-32ab-4d26-8f68-e5a87e160f08' AND href = $q$/compare/kajabi-vs-teachable$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$vs Kajabi$q$, $q$/compare/kajabi-vs-teachable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb' AND href = $q$/compare/kajabi-vs-teachable$q$);

-- ── Gumroad vs Sellfy (gumroad-vs-sellfy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3755468e-f104-4abb-9bde-b2e658eb3053', 'c936aee7-ae75-49ba-bdd8-c809f3dbe535', $q$gumroad-vs-sellfy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3755468e-f104-4abb-9bde-b2e658eb3053', $q$vs Sellfy$q$, $q$/compare/gumroad-vs-sellfy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3755468e-f104-4abb-9bde-b2e658eb3053'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3755468e-f104-4abb-9bde-b2e658eb3053' AND href = $q$/compare/gumroad-vs-sellfy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c936aee7-ae75-49ba-bdd8-c809f3dbe535', $q$vs Gumroad$q$, $q$/compare/gumroad-vs-sellfy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c936aee7-ae75-49ba-bdd8-c809f3dbe535'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c936aee7-ae75-49ba-bdd8-c809f3dbe535' AND href = $q$/compare/gumroad-vs-sellfy$q$);

-- ── Klaviyo vs Mailchimp (klaviyo-vs-mailchimp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d3223547-1bc9-472d-8449-260dc6b88988', '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$klaviyo-vs-mailchimp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd3223547-1bc9-472d-8449-260dc6b88988', $q$vs Mailchimp$q$, $q$/compare/klaviyo-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd3223547-1bc9-472d-8449-260dc6b88988'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd3223547-1bc9-472d-8449-260dc6b88988' AND href = $q$/compare/klaviyo-vs-mailchimp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$vs Klaviyo$q$, $q$/compare/klaviyo-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927' AND href = $q$/compare/klaviyo-vs-mailchimp$q$);

-- ── Klaviyo vs Omnisend (klaviyo-vs-omnisend) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d3223547-1bc9-472d-8449-260dc6b88988', '902d8b1b-af39-4cdf-a2b7-db0c5672b059', $q$klaviyo-vs-omnisend$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd3223547-1bc9-472d-8449-260dc6b88988', $q$vs Omnisend$q$, $q$/compare/klaviyo-vs-omnisend$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd3223547-1bc9-472d-8449-260dc6b88988'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd3223547-1bc9-472d-8449-260dc6b88988' AND href = $q$/compare/klaviyo-vs-omnisend$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '902d8b1b-af39-4cdf-a2b7-db0c5672b059', $q$vs Klaviyo$q$, $q$/compare/klaviyo-vs-omnisend$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '902d8b1b-af39-4cdf-a2b7-db0c5672b059'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '902d8b1b-af39-4cdf-a2b7-db0c5672b059' AND href = $q$/compare/klaviyo-vs-omnisend$q$);

-- ── Kit (formerly ConvertKit) vs Mailchimp (kit-vs-mailchimp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('86565576-9938-418e-8b55-ba39e12ff033', '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$kit-vs-mailchimp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '86565576-9938-418e-8b55-ba39e12ff033', $q$vs Mailchimp$q$, $q$/compare/kit-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '86565576-9938-418e-8b55-ba39e12ff033'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '86565576-9938-418e-8b55-ba39e12ff033' AND href = $q$/compare/kit-vs-mailchimp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$vs Kit (formerly ConvertKit)$q$, $q$/compare/kit-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927' AND href = $q$/compare/kit-vs-mailchimp$q$);


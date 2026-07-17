-- Comparison batch: squarespace-vs-wordpress-com, livechat-vs-tidio, salesforce-service-cloud-vs-servicenow, gainsight-vs-totango, crisp-vs-tidio, bigquery-vs-snowflake, amazon-redshift-vs-snowflake, mysql-vs-postgresql
-- Publishes 8 comparison page(s) with editorial content.

-- ── Squarespace vs WordPress.com (squarespace-vs-wordpress-com) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', '6b5c71e6-e1cf-4f55-9339-d6d644c3f1a6', $q$squarespace-vs-wordpress-com$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$vs WordPress.com$q$, $q$/compare/squarespace-vs-wordpress-com$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0' AND href = $q$/compare/squarespace-vs-wordpress-com$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b5c71e6-e1cf-4f55-9339-d6d644c3f1a6', $q$vs Squarespace$q$, $q$/compare/squarespace-vs-wordpress-com$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b5c71e6-e1cf-4f55-9339-d6d644c3f1a6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b5c71e6-e1cf-4f55-9339-d6d644c3f1a6' AND href = $q$/compare/squarespace-vs-wordpress-com$q$);

-- ── LiveChat vs Tidio (livechat-vs-tidio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('00ba7518-5599-46d0-b82c-32563e1bac39', '6e610684-65a5-4699-9418-e1149b45dc11', $q$livechat-vs-tidio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '00ba7518-5599-46d0-b82c-32563e1bac39', $q$vs Tidio$q$, $q$/compare/livechat-vs-tidio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '00ba7518-5599-46d0-b82c-32563e1bac39'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '00ba7518-5599-46d0-b82c-32563e1bac39' AND href = $q$/compare/livechat-vs-tidio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6e610684-65a5-4699-9418-e1149b45dc11', $q$vs LiveChat$q$, $q$/compare/livechat-vs-tidio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6e610684-65a5-4699-9418-e1149b45dc11'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6e610684-65a5-4699-9418-e1149b45dc11' AND href = $q$/compare/livechat-vs-tidio$q$);

-- ── Salesforce Service Cloud vs ServiceNow (salesforce-service-cloud-vs-servicenow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ad6b4961-5c42-461f-8aa7-a80fba6f7c50', 'dba954e7-42de-4597-adda-d2b1563a9303', $q$salesforce-service-cloud-vs-servicenow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ad6b4961-5c42-461f-8aa7-a80fba6f7c50', $q$vs ServiceNow$q$, $q$/compare/salesforce-service-cloud-vs-servicenow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ad6b4961-5c42-461f-8aa7-a80fba6f7c50'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ad6b4961-5c42-461f-8aa7-a80fba6f7c50' AND href = $q$/compare/salesforce-service-cloud-vs-servicenow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dba954e7-42de-4597-adda-d2b1563a9303', $q$vs Salesforce Service Cloud$q$, $q$/compare/salesforce-service-cloud-vs-servicenow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dba954e7-42de-4597-adda-d2b1563a9303'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dba954e7-42de-4597-adda-d2b1563a9303' AND href = $q$/compare/salesforce-service-cloud-vs-servicenow$q$);

-- ── Gainsight vs Totango (gainsight-vs-totango) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ca7516a2-730d-48ae-b2cd-54a3da886bac', '42178daa-c8ed-41d0-b8b7-d8e53057a2ce', $q$gainsight-vs-totango$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca7516a2-730d-48ae-b2cd-54a3da886bac', $q$vs Totango$q$, $q$/compare/gainsight-vs-totango$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca7516a2-730d-48ae-b2cd-54a3da886bac'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca7516a2-730d-48ae-b2cd-54a3da886bac' AND href = $q$/compare/gainsight-vs-totango$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '42178daa-c8ed-41d0-b8b7-d8e53057a2ce', $q$vs Gainsight$q$, $q$/compare/gainsight-vs-totango$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '42178daa-c8ed-41d0-b8b7-d8e53057a2ce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '42178daa-c8ed-41d0-b8b7-d8e53057a2ce' AND href = $q$/compare/gainsight-vs-totango$q$);

-- ── Crisp vs Tidio (crisp-vs-tidio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b1f76735-5538-4701-8d39-11c92919d1d4', '6e610684-65a5-4699-9418-e1149b45dc11', $q$crisp-vs-tidio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b1f76735-5538-4701-8d39-11c92919d1d4', $q$vs Tidio$q$, $q$/compare/crisp-vs-tidio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b1f76735-5538-4701-8d39-11c92919d1d4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b1f76735-5538-4701-8d39-11c92919d1d4' AND href = $q$/compare/crisp-vs-tidio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6e610684-65a5-4699-9418-e1149b45dc11', $q$vs Crisp$q$, $q$/compare/crisp-vs-tidio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6e610684-65a5-4699-9418-e1149b45dc11'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6e610684-65a5-4699-9418-e1149b45dc11' AND href = $q$/compare/crisp-vs-tidio$q$);

-- ── BigQuery vs Snowflake (bigquery-vs-snowflake) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fb9ac50a-5d37-4f5c-a9c6-8693d7deb334', '548f9382-785a-42f4-972b-c64402b145c7', $q$bigquery-vs-snowflake$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fb9ac50a-5d37-4f5c-a9c6-8693d7deb334', $q$vs Snowflake$q$, $q$/compare/bigquery-vs-snowflake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fb9ac50a-5d37-4f5c-a9c6-8693d7deb334'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fb9ac50a-5d37-4f5c-a9c6-8693d7deb334' AND href = $q$/compare/bigquery-vs-snowflake$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '548f9382-785a-42f4-972b-c64402b145c7', $q$vs BigQuery$q$, $q$/compare/bigquery-vs-snowflake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '548f9382-785a-42f4-972b-c64402b145c7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '548f9382-785a-42f4-972b-c64402b145c7' AND href = $q$/compare/bigquery-vs-snowflake$q$);

-- ── Amazon Redshift vs Snowflake (amazon-redshift-vs-snowflake) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', '548f9382-785a-42f4-972b-c64402b145c7', $q$amazon-redshift-vs-snowflake$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$vs Snowflake$q$, $q$/compare/amazon-redshift-vs-snowflake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c' AND href = $q$/compare/amazon-redshift-vs-snowflake$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '548f9382-785a-42f4-972b-c64402b145c7', $q$vs Amazon Redshift$q$, $q$/compare/amazon-redshift-vs-snowflake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '548f9382-785a-42f4-972b-c64402b145c7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '548f9382-785a-42f4-972b-c64402b145c7' AND href = $q$/compare/amazon-redshift-vs-snowflake$q$);

-- ── MySQL vs PostgreSQL (mysql-vs-postgresql) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('76f0c5ad-2a6b-4da7-9d21-98785efc0c74', 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f', $q$mysql-vs-postgresql$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76f0c5ad-2a6b-4da7-9d21-98785efc0c74', $q$vs PostgreSQL$q$, $q$/compare/mysql-vs-postgresql$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76f0c5ad-2a6b-4da7-9d21-98785efc0c74'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76f0c5ad-2a6b-4da7-9d21-98785efc0c74' AND href = $q$/compare/mysql-vs-postgresql$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f', $q$vs MySQL$q$, $q$/compare/mysql-vs-postgresql$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f' AND href = $q$/compare/mysql-vs-postgresql$q$);


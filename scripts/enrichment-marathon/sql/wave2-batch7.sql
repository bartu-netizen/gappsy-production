-- Enrichment marathon batch: All in One SEO, Alteryx, Amazing Marvin, AmazingHiring, Amazon Q Developer, Amazon Redshift, Amazon S3, Amberflo

-- ── All in One SEO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$All in One SEO (AIOSEO) is a WordPress SEO plugin offering on-page analysis, schema markup, sitemaps, rank tracking, and AI-assisted content tools.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Lite); paid plans from $99/year$q$, starting_price),
  founded_year = COALESCE(2007, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$All in One SEO: WordPress SEO Plugin & Toolkit$q$, seo_title),
  seo_meta_description = COALESCE($q$AIOSEO is a WordPress plugin for on-page SEO, schema markup, sitemaps, rank tracking, and AI content tools. Free and paid plans from $99/year.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$All in One SEO (AIOSEO) is a WordPress SEO plugin originally released in 2007 by Michael Torbert and, since 2020, owned and developed by Awesome Motive (the company behind WPBeginner and OptinMonster). It helps WordPress site owners optimize content for search engines without requiring coding or prior SEO expertise. Core capabilities include TruSEO on-page analysis with actionable optimization checklists, a schema markup generator for rich snippets, smart XML sitemaps, a redirection manager for fixing 404 errors, local SEO tools (business hours, locations, Google Maps), WooCommerce product SEO, and an AI assistant for generating SEO-optimized content, images, and FAQs. Paid tiers also add a keyword rank tracker and Google Search Console integration inside the WordPress dashboard. AIOSEO ships as a free 'Lite' plugin on WordPress.org, with paid Basic, Plus, Pro, and Elite licenses (annual billing, starting around $99/year list price) unlocking more sites, AI credits, and advanced features like advanced sitemaps and internal link suggestions. The company states the plugin has over 3 million active users and lists customers such as Vogue, Nestlé, and Carnegie Mellon University. It is aimed at bloggers, business owners, e-commerce stores, and marketing agencies running WordPress sites who want guided, automated SEO improvements.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '945d46de-1541-423b-ad90-a8381853daad';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '945d46de-1541-423b-ad90-a8381853daad' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$TruSEO On-Page Analysis$q$, $q$Actionable checklist that scores and guides SEO optimization for each post or page.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Schema Generator$q$, $q$Creates schema markup for rich snippets to improve how pages appear in search results.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Smart XML Sitemaps$q$, $q$Automatically generates and maintains XML sitemaps for search engine crawlers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Redirection Manager$q$, $q$Detects and fixes broken links and 404 errors with automated redirects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Keyword Rank Tracker$q$, $q$Monitors keyword rankings over time (available on higher-tier plans).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$WooCommerce SEO$q$, $q$Optimizes product pages, categories, and feeds for e-commerce stores.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$AI Assistant$q$, $q$Generates SEO-oriented blog content, alt text, and FAQs using AI credits included in each plan.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Long-established plugin (since 2007) with a large, active WordPress user base$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Covers on-page, technical, local, and e-commerce SEO in one plugin$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Free Lite version available for basic use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Built-in Google Search Console integration and rank tracking on paid tiers$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$WordPress-only; not usable on other CMS or platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Advanced features (rank tracking, unlimited revisions) are locked behind higher-priced annual tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Renewal pricing reverts to full list price after introductory discounts$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Is All in One SEO free?$q$, $q$Yes, a free 'Lite' version is available on WordPress.org. Paid Basic, Plus, Pro, and Elite plans unlock additional features like rank tracking and advanced schema options.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Does AIOSEO work with WooCommerce?$q$, $q$Yes, it includes dedicated WooCommerce SEO tools for optimizing product pages and feeds.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Who owns All in One SEO today?$q$, $q$AIOSEO is owned and developed by Awesome Motive, which acquired the plugin brand in 2020 and rebuilt it.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Can AIOSEO track keyword rankings?$q$, $q$Yes, keyword rank tracking is included on the Elite plan and available as an add-on capability on some other tiers.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Blog and content SEO$q$, $q$Use TruSEO checklists and schema markup to optimize blog posts for search visibility.$q$, $q$Bloggers and content marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$E-commerce product optimization$q$, $q$Optimize WooCommerce product pages, feeds, and structured data for shopping search results.$q$, $q$Online store owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Multi-site agency management$q$, $q$Manage SEO across many client WordPress sites from higher-tier plans supporting up to 100 sites.$q$, $q$SEO and marketing agencies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Basic$q$, $q$$99/year$q$, $q$annual$q$, NULL, $q$["1 website","10,000 AI credits","Schema markup","WooCommerce SEO","XML sitemaps","Automatic redirects"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Plus$q$, $q$$199/year$q$, $q$annual$q$, NULL, $q$["3 websites","25,000 AI credits","Local business SEO","Image SEO automation","15 SEO revisions"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Pro$q$, $q$$399/year$q$, $q$annual$q$, NULL, $q$["10 websites","50,000 AI credits","Advanced sitemaps","Internal Link Assistant","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$Elite$q$, $q$$599/year$q$, $q$annual$q$, NULL, $q$["100 websites","200,000 AI credits","Unlimited SEO revisions","Keyword rank tracking","Client management","Premium support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$All in One SEO (AIOSEO) is one of the original WordPress SEO plugins, first released in 2007. Since Awesome Motive acquired the brand and rebuilt the plugin in 2020, it has focused on giving WordPress users automated, checklist-driven SEO guidance without requiring technical SEO knowledge.$q$, $q$The plugin runs entirely inside the WordPress dashboard and covers on-page optimization, technical SEO (sitemaps, redirects), schema markup, and local and e-commerce SEO for WooCommerce stores.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$TruSEO on-page analysis provides an actionable checklist for optimizing individual posts and pages. The Schema Generator creates structured data for rich snippets, while Smart XML Sitemaps and a Redirection Manager handle technical SEO housekeeping. Higher tiers add a Keyword Rank Tracker, Google Search Console statistics inside WordPress, a Link Assistant for internal linking, and an AI Assistant for drafting SEO-oriented content.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$A free 'Lite' version is available on WordPress.org. Paid plans are billed annually across four tiers — Basic, Plus, Pro, and Elite — priced by number of connected sites, AI credit allowance, and feature depth, with list prices ranging from $99/year up to $599/year.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('945d46de-1541-423b-ad90-a8381853daad', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('945d46de-1541-423b-ad90-a8381853daad', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('945d46de-1541-423b-ad90-a8381853daad', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('945d46de-1541-423b-ad90-a8381853daad', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('945d46de-1541-423b-ad90-a8381853daad', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('945d46de-1541-423b-ad90-a8381853daad', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Alteryx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Alteryx is an enterprise data analytics platform for connecting, preparing, analyzing, and automating data workflows with low-code and AI tools.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(1997, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Irvine, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Alteryx: Enterprise Data Analytics & Automation Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Alteryx is an enterprise platform for data prep, analytics, and automation with low-code workflows and AI. Used by 8,000+ organizations worldwide.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Alteryx is an enterprise data and analytics platform founded in 1997 (originally as SRC, LLC) and headquartered in Irvine, California. It went public via IPO on the NYSE in 2017 and was taken private in 2024 in a $4.4 billion acquisition by Clearlake Capital and Insight Partners. The platform helps organizations connect to more than 100 data sources, clean and transform data, and build repeatable analytics workflows using low-code/no-code tools alongside AI-assisted and generative capabilities. Key features include automated data preparation, self-service analytics with natural-language prompts, predictive analytics, workflow automation and orchestration, and governance features such as role-based access, version control, and lineage tracking. Alteryx offers native integrations with platforms like Snowflake, Databricks, AWS, Google Cloud, SAP, and Salesforce. Pricing is not published on the website; prospective customers can start a free trial or contact sales for enterprise pricing. The company states it serves more than 8,000 organizations across over 90 countries, spanning industries such as retail, financial services, manufacturing, insurance, and the public sector. Alteryx is aimed primarily at analytics, finance, IT, and supply chain teams within mid-size to large enterprises that need to operationalize data analysis and reduce reliance on manual, code-heavy data preparation.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Data Preparation$q$, $q$Connects to 100+ data sources and automates cleaning and transformation of raw data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Low-Code Workflow Automation$q$, $q$Visual, low-code tools for building and orchestrating repeatable analytics processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$AI-Assisted Analytics$q$, $q$Natural-language prompts and generative AI features support self-service analysis and predictive analytics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Governance & Lineage$q$, $q$Role-based access, version control, and lineage tracking to support enterprise compliance requirements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Enterprise Integrations$q$, $q$Native connectors to Snowflake, Databricks, AWS, Google Cloud, SAP, and Salesforce.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Broad data source connectivity and strong data preparation automation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Low-code interface makes advanced analytics accessible to non-programmers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Established enterprise vendor with a long operating history since 1997$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Deep integrations with major cloud and enterprise data platforms$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$No public self-serve pricing; requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Primarily built for enterprise scale, which may be more than smaller teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Full platform capabilities likely require training given its breadth of features$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Is Alteryx pricing publicly available?$q$, $q$No, Alteryx does not publish pricing on its website. Interested organizations can start a free trial or contact sales for a quote.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Is Alteryx a low-code tool?$q$, $q$Yes, Alteryx provides low-code/no-code visual workflows for data preparation and analytics automation, alongside more advanced scripting options.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$What data sources does Alteryx connect to?$q$, $q$Alteryx connects to over 100 data sources and integrates natively with platforms including Snowflake, Databricks, AWS, Google Cloud, SAP, and Salesforce.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Who owns Alteryx?$q$, $q$Alteryx was a publicly traded company until Clearlake Capital and Insight Partners acquired it and took it private in a 2024 deal valued at $4.4 billion.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Enterprise data preparation$q$, $q$Automate cleaning and blending of data from many sources ahead of analysis or reporting.$q$, $q$Data analysts and BI teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Self-service analytics$q$, $q$Enable business users to explore and analyze data using low-code workflows and natural-language prompts.$q$, $q$Finance, supply chain, and operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$Analytics governance at scale$q$, $q$Apply role-based access and lineage tracking to analytics workflows across large organizations.$q$, $q$IT and data governance teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Alteryx is an enterprise data and analytics platform founded in 1997 and headquartered in Irvine, California. It unifies data integration, preparation, analytics, and AI capabilities so organizations can automate workflows that would otherwise require manual scripting or multiple disconnected tools.$q$, $q$The company was publicly traded on the NYSE from 2017 until it was acquired and taken private by Clearlake Capital and Insight Partners in 2024.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Alteryx connects to over 100 data sources and automates data cleaning and transformation. Its low-code/no-code workflow builder lets users of varying technical skill design and orchestrate repeatable analytics processes, while AI-assisted analytics and natural-language prompts support self-service analysis. Governance features include role-based access control, version control, and data lineage tracking to support compliance needs.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$The platform offers native connections to major enterprise data and cloud systems, including Snowflake, Databricks, AWS, Google Cloud, SAP, and Salesforce.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Alteryx does not publish self-serve pricing. Prospective customers can start a free trial or contact sales for enterprise quotes, which are typically scoped to organization size and usage.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Amazing Marvin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amazing Marvin is a highly customizable task management and productivity app built specifically for people with ADHD and chronic procrastination.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$8/month$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amazing Marvin: Productivity App Built for ADHD$q$, seo_title),
  seo_meta_description = COALESCE($q$Amazing Marvin is a customizable to-do and productivity app for ADHD and procrastination, with 100+ features. Plans from $8/month, 14-day free trial.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amazing Marvin is a personal productivity and task management application specifically designed for people with ADHD and those who struggle with procrastination. It combines to-do lists, day planning, calendar views, habit tracking, and goal management into a single, deeply customizable system with more than 100 optional features and settings that users can turn on or off to build their own workflow. Distinctive features include Super Focus Mode (which surfaces one task at a time to reduce overwhelm), an Accountability Pledge (financial stakes tied to deadlines), a Task Jar for random task selection, Spotlight sessions for focused 1-3 hour work blocks, day planning with capacity estimation, a built-in Pomodoro timer, time tracking, and a Procrastination Wizard that helps users get unstuck. Amazing Marvin is available on web, macOS, Windows, iOS, and Android, syncing across devices. It uses a single-tier subscription model called Marvin Pro, priced at $8/month or $96/year, with a 14-day free trial requiring no credit card. The company offers a 50% student discount and a 'pay what you can' option for users facing financial hardship, and states it has no permanent free plan. The product is positioned as community-driven, with the team reading user support messages personally and shaping the roadmap around user feedback. It is best suited for individuals — rather than teams — who have found conventional to-do list apps ineffective for managing ADHD-related executive function challenges.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '43183bc9-0de0-415c-ba7d-2669401c12df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '43183bc9-0de0-415c-ba7d-2669401c12df' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '43183bc9-0de0-415c-ba7d-2669401c12df';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Super Focus Mode$q$, $q$Displays only one task at a time to reduce overwhelm and decision fatigue.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Accountability Pledge$q$, $q$Attaches financial stakes to deadlines to increase follow-through.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Day Planning with Capacity Estimation$q$, $q$Plans each day around realistic available time rather than an unlimited task list.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Procrastination Wizard$q$, $q$Guided prompts to help users break through procrastination on a specific task.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Pomodoro Timer & Time Tracking$q$, $q$Built-in focused work timer and tracking of time spent on tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Habit and Goal Tracking$q$, $q$Tracks habits and longer-term goals alongside daily tasks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$100+ Customizable Settings$q$, $q$Users can enable or disable individual features to build a personalized workflow.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '43183bc9-0de0-415c-ba7d-2669401c12df';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Purpose-built for ADHD and procrastination rather than generic task management$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Extremely customizable with 100+ optional features$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Available across web, macOS, Windows, iOS, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Flexible pricing options including student discount and pay-what-you-can$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '43183bc9-0de0-415c-ba7d-2669401c12df';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$No permanent free plan; full access requires a paid subscription after the trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$The sheer number of customizable settings can itself be overwhelming for new users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Built for individual use rather than team collaboration$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '43183bc9-0de0-415c-ba7d-2669401c12df';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Is Amazing Marvin free?$q$, $q$There is no permanent free plan, but Amazing Marvin offers a 14-day free trial with full access and no credit card required.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$What platforms does Amazing Marvin support?$q$, $q$Amazing Marvin is available on the web and as apps for macOS, Windows, iOS, and Android.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$How much does Amazing Marvin cost?$q$, $q$Marvin Pro costs $8/month or $96/year. Students get a 50% discount, and a pay-what-you-can option exists for those with financial constraints.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Is Amazing Marvin designed for ADHD?$q$, $q$Yes, it is specifically designed and marketed for people with ADHD and chronic procrastination, with features like Super Focus Mode and the Procrastination Wizard.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '43183bc9-0de0-415c-ba7d-2669401c12df';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Managing ADHD-related task overwhelm$q$, $q$Use Super Focus Mode and day planning with capacity estimation to reduce overwhelm from long task lists.$q$, $q$Individuals with ADHD$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Breaking through procrastination$q$, $q$Use the Procrastination Wizard and Accountability Pledge to start and finish tasks that get repeatedly delayed.$q$, $q$Chronic procrastinators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Personalized productivity workflows$q$, $q$Combine and toggle 100+ features to build a task management system tailored to individual working style.$q$, $q$Individuals dissatisfied with generic to-do apps$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '43183bc9-0de0-415c-ba7d-2669401c12df';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Marvin Pro (Monthly)$q$, $q$$8/month$q$, $q$monthly$q$, NULL, $q$["All 100+ features","Unlimited tasks and projects","Multi-platform sync","Personal email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Marvin Pro (Annual)$q$, $q$$96/year$q$, $q$annual$q$, NULL, $q$["All 100+ features","Unlimited tasks and projects","Multi-platform sync","Personal email support","33% savings vs. monthly"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '43183bc9-0de0-415c-ba7d-2669401c12df';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amazing Marvin is a personal productivity application built specifically for people with ADHD and chronic procrastination, rather than being a general-purpose to-do list. It combines task management, day planning, calendar, habit tracking, and goal setting into one highly customizable system.$q$, $q$The app is built around the idea that no single productivity method works for everyone, so it exposes over 100 optional features and settings that users can enable individually to construct a workflow suited to how their mind works.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Notable features include Super Focus Mode, which shows only one task at a time to reduce decision overwhelm; the Accountability Pledge, which attaches financial stakes to deadlines; a Task Jar for randomly selecting what to work on; Spotlight sessions for structured 1-3 hour focus blocks; day planning with time-capacity estimation; a built-in Pomodoro timer and time tracking; and a Procrastination Wizard designed to help users get unstuck on a task.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$Amazing Marvin is available on the web and as native apps for macOS, Windows, iOS, and Android, with data syncing across devices.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Amazing Marvin uses a single subscription tier, Marvin Pro, priced at $8/month or $96/year, unlocking all features with no upsells. A 14-day free trial requires no credit card. Students receive a 50% discount, and a 'pay what you can' option is available for users facing financial barriers; there is no permanent free plan.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── AmazingHiring ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AmazingHiring is an AI-powered talent sourcing platform that helps technical recruiters find and engage candidates across 50+ professional networks.$q$, short_description),
  pricing_model = COALESCE(NULL, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Redwood City, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AmazingHiring: AI Sourcing for Technical Recruiters$q$, seo_title),
  seo_meta_description = COALESCE($q$AmazingHiring is an AI sourcing platform that searches 50+ networks like GitHub and LinkedIn to help recruiters find and engage technical talent.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AmazingHiring is a talent sourcing platform founded in 2013 and headquartered in Redwood City, California, built specifically for technical recruiting. It aggregates candidate search across more than 50 professional and developer networks, including GitHub, StackOverflow, Kaggle, and LinkedIn, letting recruiters filter candidates by skills, experience, open-to-work status, and location from a single interface. The platform includes a Chrome extension that surfaces candidates' social and professional profile links, email campaign and messaging tools for outreach automation, integrations with existing applicant tracking systems (ATS), and market insights and analytics for recruitment intelligence. AmazingHiring markets itself to technical recruiters and talent acquisition teams responsible for filling hard-to-hire engineering and data roles, citing internal customer figures such as reduced time spent on active sourcing, more candidates added to pipelines, and improved candidate response rates. Pricing is not published on the company's website; prospective customers must request a demo to receive a quote, suggesting a sales-led, likely per-seat or subscription-based commercial model typical of B2B recruiting software, though the exact structure is not publicly confirmed. The company states it is trusted by 500+ talent acquisition teams. It is best suited for recruiting teams at technology companies and staffing agencies that need to source niche technical talent beyond what a single job board or LinkedIn Recruiter seat can surface.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c209af5-e769-4601-8b16-169d41b98725';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c209af5-e769-4601-8b16-169d41b98725' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Multi-Network Candidate Search$q$, $q$Searches across 50+ networks including GitHub, StackOverflow, Kaggle, and LinkedIn for technical candidates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Advanced Candidate Filtering$q$, $q$Filters by skills, experience, open-to-work status, and location.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Chrome Extension$q$, $q$Surfaces candidates' social and professional profile links directly in the browser.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Outreach & Email Campaigns$q$, $q$Automates candidate messaging and outreach campaigns.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$ATS Integrations$q$, $q$Connects with existing applicant tracking systems used by recruiting teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Market Insights & Analytics$q$, $q$Provides recruiting intelligence and market data to inform sourcing strategy.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Aggregates search across 50+ technical and professional networks in one tool$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Purpose-built for hard-to-source technical and engineering roles$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Includes outreach and ATS integration alongside sourcing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Established vendor operating since 2013$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$No public pricing; requires a sales demo to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Focused specifically on technical recruiting, less suited to general hiring needs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Effectiveness depends on the breadth and freshness of the underlying network data$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$What is AmazingHiring used for?$q$, $q$It's a sourcing platform that helps technical recruiters find candidates by searching across 50+ networks like GitHub, StackOverflow, and LinkedIn from one interface.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Is AmazingHiring pricing public?$q$, $q$No, pricing is not published on the website. Prospective customers need to request a demo for a quote.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Does AmazingHiring integrate with an ATS?$q$, $q$Yes, the platform offers integrations with existing applicant tracking systems.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$When was AmazingHiring founded?$q$, $q$AmazingHiring was founded in 2013 and is headquartered in Redwood City, California.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Sourcing hard-to-find technical talent$q$, $q$Search across developer-focused networks like GitHub, StackOverflow, and Kaggle to find candidates with niche technical skills.$q$, $q$Technical recruiters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Recruiting agency candidate pipelines$q$, $q$Build and maintain candidate pipelines for technical roles across multiple clients.$q$, $q$Staffing and recruiting agencies$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AmazingHiring is a talent sourcing platform founded in 2013 and headquartered in Redwood City, California. It is built specifically for technical recruiting, aggregating candidate search across more than 50 professional and developer networks such as GitHub, StackOverflow, Kaggle, and LinkedIn.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform lets recruiters filter candidates by skills, experience, open-to-work status, and location. A Chrome extension surfaces candidates' social and professional profile links while browsing, and the product includes email campaign and outreach messaging tools, ATS integrations, and market insights and analytics for recruiting intelligence.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AmazingHiring targets technical recruiters and talent acquisition teams, particularly those responsible for filling hard-to-source engineering and data roles at technology companies and staffing agencies. The company states it is used by 500+ talent acquisition teams.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$AmazingHiring does not publish pricing on its website. Prospective customers must request a demo to receive a quote.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Amazon Q Developer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amazon Q Developer is AWS's AI-powered coding assistant offering code suggestions, agentic tasks, security scanning, and AWS-integrated support.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Pro plan from $19/user/month)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Seattle, Washington, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amazon Q Developer: AWS AI Coding Assistant$q$, seo_title),
  seo_meta_description = COALESCE($q$Amazon Q Developer is AWS's AI coding assistant with code suggestions, agentic automation, and security scanning. Free tier available; Pro from $19/user/mo.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amazon Q Developer is an AI-powered coding assistant built by Amazon Web Services (AWS). It provides real-time code suggestions ranging from short snippets to complete functions, along with agentic capabilities that can autonomously handle tasks such as unit test generation, code reviews, and documentation. It integrates AWS-specific expertise directly into workflows, including the AWS Management Console, Microsoft Teams, and Slack, and supports code security scanning that AWS states outperforms other publicly benchmarkable tools on vulnerability detection. Q Developer also offers application transformation features for tasks like porting .NET applications and upgrading Java versions, and can be customized via secure connections to an organization's private code repositories. It integrates with major IDEs including JetBrains, VS Code, Visual Studio, and Eclipse, as well as command-line environments, GitHub, and GitLab Duo. Amazon Q Developer follows a freemium pricing model: a free tier includes 50 agentic chat interactions per month and 1,000 lines of Java code transformation, while the Pro tier costs $19 per user per month and adds higher agentic request limits, admin dashboards, AWS Identity Center support, IP indemnity coverage, and automatic opt-out of data collection for model training. It targets individual developers, enterprise engineering teams (especially those managing legacy systems), and organizations building on AWS who want AI assistance woven into their existing toolchain.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2a22c6c2-59c3-4413-a1b0-00a743efb872' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Real-Time Code Suggestions$q$, $q$Suggests code ranging from short snippets to complete functions as developers type.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Agentic Task Automation$q$, $q$Autonomously handles multi-step tasks like unit test generation, code review, and documentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Security Scanning$q$, $q$Scans code for vulnerabilities as part of the development workflow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Application Transformation$q$, $q$Assists with .NET porting and Java version upgrades for legacy applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Multi-IDE Support$q$, $q$Works within JetBrains, VS Code, Visual Studio, Eclipse, and CLI environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$AWS Console & Chat Integration$q$, $q$Provides AWS-specific expertise inside the AWS Console, Microsoft Teams, and Slack.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Free tier available with no cost to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Deep integration with AWS services and the AWS Management Console$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Agentic capabilities go beyond autocomplete into test generation and code review$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Supports legacy application modernization (.NET and Java transformation)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Deepest value is realized within the AWS ecosystem, less compelling for non-AWS shops$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Free tier usage limits (50 agentic interactions/month) are relatively low for heavy users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Per-user Pro pricing can add up for larger engineering teams$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Is Amazon Q Developer free?$q$, $q$Yes, a free tier is available with 50 agentic chat interactions per month and 1,000 lines of Java code transformation. A Pro tier costs $19 per user per month for higher limits and admin features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Which IDEs does Amazon Q Developer support?$q$, $q$It supports JetBrains IDEs, VS Code, Visual Studio, Eclipse, and command-line environments, alongside GitHub and GitLab Duo integrations.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Can Amazon Q Developer help modernize legacy code?$q$, $q$Yes, it includes application transformation features for tasks like porting .NET applications and upgrading Java versions.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Does Amazon Q Developer require an AWS account?$q$, $q$It is built and offered by AWS and integrates with the AWS Management Console, though it also works within standalone IDEs and CLIs.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$AI-assisted coding$q$, $q$Get real-time code suggestions and completions while writing software in supported IDEs.$q$, $q$Individual developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Legacy application modernization$q$, $q$Use application transformation features to port .NET applications or upgrade Java versions at scale.$q$, $q$Enterprise engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Automated code review and testing$q$, $q$Use agentic capabilities to generate unit tests and perform code reviews automatically.$q$, $q$Engineering teams practicing CI/CD$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["50 agentic chat interactions/month","1,000 lines of Java code transformation/month","Access to latest Claude models","IDE and CLI use","Reference tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$Pro$q$, $q$$19/user/month$q$, $q$monthly$q$, NULL, $q$["Everything in Free","Higher agentic request limits","4,000 lines/month pooled Java transformation","Admin dashboard","AWS Identity Center support","IP indemnity coverage"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '2a22c6c2-59c3-4413-a1b0-00a743efb872';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amazon Q Developer is AWS's AI-powered coding assistant, designed to support the full software development lifecycle from writing code through testing, documentation, and deployment. It combines inline code suggestions with agentic features that can autonomously perform multi-step development tasks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Q Developer offers real-time code suggestions, agentic task automation for unit testing, code review, and documentation, and security scanning for vulnerability detection. It provides AWS-specific expertise inside the AWS Management Console, Microsoft Teams, and Slack, and supports application transformation features such as .NET porting and Java version upgrades. Organizations can customize suggestions by securely connecting their private repositories.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Amazon Q Developer integrates with JetBrains IDEs, VS Code, Visual Studio, Eclipse, command-line interfaces, GitHub, GitLab Duo, Microsoft Teams, Slack, and the AWS Management Console.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$A free tier includes 50 agentic chat interactions per month and 1,000 lines of monthly Java code transformation. The Pro tier costs $19 per user per month, billed monthly, and adds higher usage limits, admin dashboards, AWS Identity Center support, and IP indemnity coverage.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Amazon Redshift ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amazon Redshift is AWS's cloud data warehouse for SQL analytics and AI/ML workloads, with serverless and provisioned, usage-based pricing options.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based$q$, pricing_model),
  starting_price = COALESCE($q$$0.375 per RPU-hour (Serverless)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Seattle, Washington, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amazon Redshift: Cloud Data Warehouse by AWS$q$, seo_title),
  seo_meta_description = COALESCE($q$Amazon Redshift is AWS's cloud data warehouse for SQL analytics and AI/ML. Serverless pricing from $0.375/RPU-hour, with a $300 trial credit.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amazon Redshift is a cloud-based data warehouse service offered by Amazon Web Services (AWS) for SQL analytics and AI/ML workloads. It lets organizations query and analyze data unified from multiple sources without managing the underlying infrastructure. AWS states Redshift delivers up to 2.2x better price-performance and 7x better throughput than other cloud data warehouses it benchmarks against, and its RG (Graviton-powered) instances offer roughly 2.4x faster performance than prior RA3 instances at about 30% lower per-vCPU cost. Redshift offers a serverless option that scales automatically without infrastructure management, alongside traditional provisioned clusters. It supports a lakehouse architecture with native access to open table formats like Apache Iceberg and Parquet, zero-ETL integrations with services such as Aurora, RDS, DynamoDB, Kinesis, and MSK for near-real-time data, and connects to Amazon SageMaker and Amazon Bedrock for machine learning and generative AI use cases, including natural-language-to-SQL generation. Security features include row- and column-level permissions and network isolation. Pricing is usage-based: Redshift Serverless is billed per Redshift Processing Unit (RPU) starting at $0.375 per RPU-hour with per-second billing, while provisioned on-demand pricing starts around $0.543 per hour depending on node type; storage in provisioned clusters is billed separately (around $0.024/GB-month in US East). New users can start with a $300 credit valid for 90 days. Redshift is aimed at business intelligence teams, financial forecasting, ML practitioners, and enterprises needing near-real-time analytics at scale.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Serverless Data Warehousing$q$, $q$Automatically scales compute without infrastructure management, billed per RPU-hour.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Lakehouse Architecture$q$, $q$Unified access to data warehouses, S3-based data lakes, and open table formats like Apache Iceberg and Parquet.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Zero-ETL Integrations$q$, $q$Near-real-time data integration with Aurora, RDS, DynamoDB, Kinesis, and MSK without building ETL pipelines.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$AI/ML Integration$q$, $q$Connects to Amazon SageMaker and Amazon Bedrock for ML model development and generative AI, including natural-language SQL generation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Fine-Grained Security$q$, $q$Row- and column-level permissions plus network isolation for data access control.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Graviton-Powered RG Instances$q$, $q$Newer instance generation offering faster performance at lower per-vCPU cost than prior RA3 instances.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Usage-based pricing avoids upfront infrastructure investment$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Serverless option removes the need to manage cluster capacity$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Deep native integrations with the AWS data and AI ecosystem (S3, SageMaker, Bedrock)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Zero-ETL integrations reduce pipeline engineering for near-real-time analytics$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Usage-based billing can be harder to predict/budget than flat-rate pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Deepest value is realized within the AWS ecosystem$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Provisioned cluster tuning and RPU sizing require some AWS data warehousing expertise$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$How is Amazon Redshift priced?$q$, $q$Redshift uses usage-based pricing. Serverless starts at $0.375 per RPU-hour with per-second billing; provisioned on-demand instances start around $0.543/hour, with storage billed separately.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Is there a free trial for Amazon Redshift?$q$, $q$New Redshift Serverless users get a $300 credit valid for 90 days; provisioned clusters may offer a two-month free trial in regions without Serverless.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Does Redshift support open table formats?$q$, $q$Yes, it natively supports open formats like Apache Iceberg and Parquet as part of its lakehouse architecture.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Can Redshift be used for AI/ML workloads?$q$, $q$Yes, it integrates with Amazon SageMaker for ML development and Amazon Bedrock for generative AI, including natural-language SQL generation.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Enterprise business intelligence$q$, $q$Run SQL analytics across unified data sources to power BI dashboards and reporting.$q$, $q$Business intelligence and analytics teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Near-real-time analytics$q$, $q$Use zero-ETL integrations with Aurora, RDS, DynamoDB, and streaming services for up-to-date reporting.$q$, $q$Data engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$ML-driven analytics$q$, $q$Combine Redshift data with SageMaker and Bedrock for predictive modeling and generative AI applications.$q$, $q$ML practitioners and data scientists$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Serverless$q$, $q$From $0.375/RPU-hour$q$, $q$usage-based (per-second billing)$q$, NULL, $q$["Automatic scaling","No idle-time charges","$300 trial credit for 90 days"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Provisioned On-Demand$q$, $q$From $0.543/hour$q$, $q$usage-based (hourly)$q$, NULL, $q$["Choice of node type and quantity","RG (Graviton) instances","Separate managed storage billing (~$0.024/GB-month)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$Reserved Instances$q$, $q$Discounted vs. on-demand$q$, $q$1- or 3-year commitment$q$, NULL, $q$["Significant discount for upfront commitment","Available for provisioned clusters"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amazon Redshift is AWS's cloud data warehouse, enabling SQL analytics and AI/ML workloads across data unified from multiple sources without customers managing the underlying infrastructure. It offers both a serverless option that scales automatically and traditional provisioned clusters for workloads with predictable resource needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Redshift supports a lakehouse architecture with native access to open table formats such as Apache Iceberg and Parquet, and offers zero-ETL integrations with services including Aurora, RDS, DynamoDB, Kinesis, and MSK for near-real-time data availability. It integrates with Amazon SageMaker for ML model development and Amazon Bedrock for generative AI use cases, including natural-language SQL generation. Security features include row- and column-level permissions and network isolation. AWS states its RG (Graviton-based) instances deliver roughly 2.4x faster performance than prior-generation RA3 instances at about 30% lower per-vCPU cost.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Redshift uses usage-based pricing. Serverless is billed per Redshift Processing Unit (RPU) starting at $0.375 per RPU-hour with per-second billing and no charges during idle periods; optional reservations can reduce serverless costs by up to 45% for 3-year commitments. Provisioned on-demand instances start around $0.543 per hour, with managed storage billed separately (around $0.024/GB-month in US East). New Redshift Serverless users receive a $300 credit valid for 90 days.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Amazon S3 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amazon S3 is AWS's object storage service, offering scalable, durable cloud storage with usage-based pricing starting at $0.023/GB-month.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based$q$, pricing_model),
  starting_price = COALESCE($q$$0.023/GB-month (S3 Standard, first 50TB)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Seattle, Washington, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amazon S3: Cloud Object Storage by AWS$q$, seo_title),
  seo_meta_description = COALESCE($q$Amazon S3 is AWS's object storage service with 11 nines of durability. Pay-as-you-go pricing starts at $0.023/GB-month for S3 Standard.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amazon S3 (Simple Storage Service) is a cloud object storage service offered by Amazon Web Services (AWS). It lets organizations and developers store and retrieve virtually unlimited amounts of data from anywhere, scaling automatically without any provisioning required. AWS states S3 provides 99.999999999% (11 nines) data durability and 99.99% availability. The service offers multiple storage classes to balance cost and access patterns, including S3 Standard for frequently accessed data, S3 Express One Zone for single-digit-millisecond latency (up to 10x faster access for latency-sensitive workloads), and S3 Glacier for low-cost archival storage. Newer capabilities include S3 Tables, which adds native support for the Apache Iceberg open table format, and S3 Vectors, native vector storage designed for AI/ML similarity search. Security is handled through default encryption and fine-grained access controls with auditing. S3 integrates with AWS Backup for data protection, with AWS's broader analytics and AI/ML services, and supports the Apache Iceberg open table format alongside a wide range of AWS Partner Network solutions and third-party analytics engines. Pricing is strictly usage-based (pay only for what you use, no minimum charge): S3 Standard storage starts at $0.023 per GB per month for the first 50TB in the US East (N. Virginia) region, with declining per-GB rates at higher volumes and additional charges for requests and data transfer. S3 is used for data lakes and analytics, AI/ML training and inference data, backup and archival, and storage behind cloud-native and mobile applications.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Massively Scalable Storage$q$, $q$Stores virtually unlimited data, scaling automatically without provisioning.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$High Durability & Availability$q$, $q$99.999999999% (11 nines) data durability and 99.99% availability.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Multiple Storage Classes$q$, $q$Includes S3 Standard, S3 Express One Zone for low-latency access, and S3 Glacier for archival storage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$S3 Tables (Apache Iceberg)$q$, $q$Native support for the Apache Iceberg open table format for analytics workloads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$S3 Vectors$q$, $q$Native vector storage for AI similarity search use cases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Default Encryption & Access Controls$q$, $q$Data encrypted by default with fine-tuned access controls and auditing.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Pay-as-you-go pricing with no minimum charge$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Very high stated durability (11 nines) and availability$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Multiple storage classes for cost optimization across access patterns$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Deep integration with the broader AWS analytics and AI/ML ecosystem$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Costs can become complex to predict due to separate request and data transfer charges$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Choosing the optimal storage class requires understanding access patterns$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Best value realized when paired with other AWS services$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$How much does Amazon S3 cost?$q$, $q$S3 Standard storage starts at $0.023 per GB per month for the first 50TB in the US East region, with pricing that varies by storage class, request volume, and data transfer.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$What is S3 used for?$q$, $q$S3 is used for data lakes and analytics, AI/ML training and inference data, backup and archival storage, and as storage for cloud-native and mobile applications.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Does S3 support AI/ML use cases?$q$, $q$Yes, S3 Vectors adds native vector storage for AI similarity search, and S3 integrates with AWS's broader analytics and AI/ML services.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$What durability does Amazon S3 offer?$q$, $q$AWS states S3 provides 99.999999999% (11 nines) data durability and 99.99% availability.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Data lakes and analytics$q$, $q$Store and analyze large volumes of structured and unstructured data using S3 alongside AWS analytics services.$q$, $q$Data engineering and analytics teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$AI/ML data storage$q$, $q$Store training and inference data, including vector data for similarity search via S3 Vectors.$q$, $q$ML engineers and data scientists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Backup and archival$q$, $q$Use S3 Glacier and lifecycle policies for long-term, low-cost data retention and compliance.$q$, $q$IT and compliance teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$Application storage backend$q$, $q$Store user-generated content, assets, and files for cloud-native and mobile applications.$q$, $q$Application developers$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$S3 Standard$q$, $q$From $0.023/GB-month$q$, $q$usage-based$q$, NULL, $q$["Frequently accessed data","First 50TB tier pricing","11 nines durability"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$S3 Express One Zone$q$, $q$Usage-based$q$, $q$usage-based$q$, NULL, $q$["Single-digit-millisecond latency","Up to 10x faster access than S3 Standard"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$S3 Glacier$q$, $q$Usage-based$q$, $q$usage-based$q$, NULL, $q$["Low-cost archival storage","For infrequently accessed or long-term retention data"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amazon S3 is AWS's object storage service, designed to store and retrieve any volume of data with high durability and availability. It scales automatically and requires no infrastructure provisioning, making it a foundational storage layer for a wide range of applications, from data lakes to application backends.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$S3 offers 99.999999999% (11 nines) data durability and 99.99% availability. Multiple storage classes address different access patterns and cost needs, including S3 Standard, S3 Express One Zone (single-digit-millisecond latency, up to 10x faster access), and S3 Glacier for archival storage. Newer additions include S3 Tables for native Apache Iceberg support and S3 Vectors for native vector storage used in AI similarity search. Data is encrypted by default with fine-grained access controls and auditing.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$S3 is billed on a strict pay-as-you-go basis with no minimum charge. S3 Standard storage starts at $0.023 per GB per month for the first 50TB in the US East (N. Virginia) region, with lower per-GB rates at higher usage tiers, plus separate charges for requests and data transfer. AWS states S3 Intelligent-Tiering has saved customers a combined $6 billion+ by automatically moving data to lower-cost tiers.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Amberflo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amberflo is a usage metering and monetization platform for tracking, governing, and billing AI and cloud costs in real time, including an AI Gateway.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Santa Clara, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amberflo: Real-Time Usage Metering & AI Cost Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Amberflo is a metering and monetization platform for tracking AI/cloud costs, usage-based billing, and an AI Gateway across 1,500+ LLM models.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amberflo is a usage metering and monetization infrastructure platform founded in 2020 and headquartered in Santa Clara, California. It is built for companies, particularly AI-native and SaaS businesses, that need to track usage, control costs, and automate billing at scale. The platform can ingest millions to billions of high-cardinality usage events in real time across services and customers, providing FinOps-level cost tracking and governance through features like Cost Guards and budgets designed to prevent overspend. A core component is its AI Gateway, a unified interface to more than 1,500 LLM models with automatic fallbacks and intelligent routing, paired with an Intelligent Model Router that optimizes model selection for cost and accuracy. Amberflo supports flexible monetization models including credits, usage-based, outcome-based, and hybrid pricing, and automates revenue recognition schedules to support compliance and audit readiness. Customer-facing dashboards give end users interactive visibility into their own usage, costs, and invoices. The company has raised over $20 million in funding, including a Series A led by Norwest Venture Partners, with other investors including Homebrew, Bessemer Venture Partners, and Bossa Invest. Amberflo does not publish pricing on its website but offers a free trial. Publicly referenced customers include Firebolt, Support Logic, Equinix, and Intermax. It is aimed at AI infrastructure providers, SaaS platforms, and any company that needs to meter variable usage and bill customers under modern, usage-based pricing models.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Real-Time Usage Metering$q$, $q$Ingests millions to billions of high-cardinality events across services and customers in real time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Cost Governance (Cost Guards & Budgets)$q$, $q$FinOps-level visibility and budget controls designed to prevent AI/cloud cost overspend.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$AI Gateway$q$, $q$Unified interface to 1,500+ LLM models with automatic fallbacks and intelligent routing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Intelligent Model Router$q$, $q$Optimizes LLM model selection for cost and accuracy.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Flexible Monetization Models$q$, $q$Supports credits, usage-based, outcome-based, and hybrid pricing structures.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Automated Revenue Recognition$q$, $q$Automates revenue schedules to support financial compliance and audit readiness.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Customer Usage Dashboards$q$, $q$Interactive dashboards for end customers to view their usage, costs, and invoices.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Purpose-built for the specific challenge of metering and monetizing AI/LLM usage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$AI Gateway offers access to 1,500+ models with routing and fallback in one integration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Supports multiple modern monetization models (usage-based, outcome-based, hybrid)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Backed by significant venture funding ($20M+), suggesting ongoing product investment$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$No public pricing; requires contacting sales or starting a trial to learn costs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$As a metering/billing infrastructure product, integration effort is likely nontrivial$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Newer company (founded 2020) with less operating history than legacy billing platforms$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$What does Amberflo do?$q$, $q$Amberflo is a usage metering and monetization platform that helps companies track, govern, and bill for usage-based costs in real time, with particular focus on AI/LLM spend.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$What is Amberflo's AI Gateway?$q$, $q$It's a unified interface to more than 1,500 LLM models with automatic fallbacks and intelligent routing, plus a model router that optimizes for cost and accuracy.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Is Amberflo pricing public?$q$, $q$No, Amberflo does not publish pricing on its website, though it offers a free trial.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$When was Amberflo founded?$q$, $q$Amberflo was founded in 2020 and is headquartered in Santa Clara, California.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$AI cost governance$q$, $q$Track and control spend across LLM providers using Cost Guards, budgets, and the Intelligent Model Router.$q$, $q$AI infrastructure and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Usage-based billing for SaaS$q$, $q$Meter product usage in real time and bill customers under credits, usage-based, or hybrid pricing models.$q$, $q$SaaS companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$LLM routing and fallback management$q$, $q$Route requests across 1,500+ models via a single AI Gateway integration with automatic fallbacks.$q$, $q$Engineering teams building AI products$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amberflo is a usage metering and monetization infrastructure platform founded in 2020 and headquartered in Santa Clara, California. It targets AI-native and SaaS companies that need to meter usage, control costs, and automate billing at scale, particularly around variable AI/LLM spend.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Amberflo can ingest millions to billions of high-cardinality usage events in real time across services and customers, with FinOps-style cost tracking and governance tools such as Cost Guards and budgets to prevent overspend. Its AI Gateway provides a unified interface to more than 1,500 LLM models with automatic fallbacks and intelligent routing, alongside an Intelligent Model Router that optimizes model selection for cost and accuracy. It supports credits, usage-based, outcome-based, and hybrid billing models, and automates revenue recognition for compliance and audit readiness. Customer-facing dashboards give end users visibility into their own usage, costs, and invoices.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Amberflo does not publish pricing on its website. It offers a free trial, with paid plans presumably scoped to usage volume and features, available on request.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;


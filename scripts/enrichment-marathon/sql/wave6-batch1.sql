-- Enrichment marathon batch: Close, CloudBeaver, Cloudflare, Cloudflare Zero Trust, CloudLex, Cloudlog, Cloudreve, Cloudron

-- ── Close ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Close is an all-in-one sales CRM with built-in calling, SMS, email, and an AI assistant, built for small and mid-sized teams that want to sell without a stack of add-on tools.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$9/user/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$~200 employees (fully remote)$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, US (fully distributed team, remote since 2016)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Close CRM Review 2026: Pricing, Features & Plans$q$, seo_title),
  seo_meta_description = COALESCE($q$Close is a sales CRM with built-in calling, email, and SMS automation. See 2026 pricing plans, key features, pros, cons, and FAQs before you buy.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Close is a sales CRM founded in 2013, built specifically for small and mid-sized sales teams that want to run their entire outbound and inbound sales process without stitching together separate calling, email, and SMS tools. The company is bootstrapped and profitable, has been 100% remote since 2016, and operates with a distributed team of roughly 200 people, with San Francisco commonly cited as its home base. Unlike traditional CRMs that require a dialer or email add-on, Close bundles calling, SMS, and email natively into the product, along with an AI assistant called Chloe that helps summarize calls, draft follow-ups, and surface next steps. Core sales features include a Power Dialer for high-volume outbound calling, a Predictive Dialer (on the top Scale plan) that auto-dials multiple numbers per rep, Workflows for multi-step sales sequence automation, a shared team inbox, and built-in pipeline and reporting dashboards. Close offers native mobile apps for iOS and Android that support placing calls, replying to texts, and viewing lead activity from a phone, plus an open API and Zapier integration for connecting to other business tools. Pricing is subscription-based per user, with four published tiers: Solo at $9/user/month (annual) or $19/month billed monthly, aimed at individual operators with a 10,000-lead cap; Essentials at $35/user/month (annual) or $49/month, which unlocks unlimited leads and team collaboration for small teams; Growth at $99/user/month (annual) or $109/month, which adds Workflows and the Power Dialer for scaling teams; and Scale at $139/user/month (annual) or $149/month, which adds the Predictive Dialer and unlimited call recording retention. All plans include calling, email, SMS, and the Chloe AI assistant, though calling minutes and SMS are billed on a usage basis at roughly $0.02/minute on top of the subscription, and phone numbers start around $1/month. Close offers a 14-day free trial that requires no credit card and includes starter calling and AI enrichment credits, plus a 30-day money-back guarantee on new purchases. The product targets outbound-heavy sales organizations, solo founders and consultants managing their own pipeline, and sales teams that have outgrown spreadsheet-based tracking or a generic CRM that lacks native calling.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '63a64c42-cc4a-45fb-b461-783e43ab44aa' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Power Dialer$q$, $q$Lets reps place calls in rapid succession from a queued list of leads, available from the Growth plan up.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Predictive Dialer$q$, $q$Auto-dials multiple numbers simultaneously and connects agents only to answered calls; available on the Scale plan.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Built-in calling, SMS & email$q$, $q$Native calling, text messaging, and email sending are included in every plan without third-party add-ons.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Chloe AI assistant$q$, $q$AI assistant that summarizes calls, drafts follow-ups, and highlights next steps across leads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Workflows$q$, $q$Multi-step, trigger-based sequences that automate follow-up calls, emails, and tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Pipeline & reporting dashboards$q$, $q$Visual pipeline views and built-in analytics for tracking rep and team performance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Mobile apps$q$, $q$Native iOS and Android apps for calling, texting, and managing leads from a phone.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$API & Zapier integration$q$, $q$Open API and Zapier support for connecting Close to other sales and marketing tools.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Calling, SMS, and email are native to the product, removing the need for a separate dialer tool$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Predictive and Power Dialers can meaningfully increase outbound call volume per rep$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Transparent, publicly published pricing with no forced sales calls to see costs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Fast setup compared to heavier enterprise CRMs$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Calling and SMS usage costs are billed on top of the monthly subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Predictive Dialer and Workflows are locked to the two highest-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Fewer built-in marketing-automation features than some all-in-one revenue platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Notable price jump from the Solo plan to the team-oriented Essentials plan$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Does Close have a free plan?$q$, $q$No, Close does not offer a permanently free plan, but it offers a 14-day free trial with no credit card required.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Does Close include calling and texting?$q$, $q$Yes, calling, SMS, and email are built into every plan, though call minutes and SMS messages are billed on a usage basis on top of the subscription.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Is Close good for a solo user?$q$, $q$Yes, the Solo plan is designed for individual operators and starts at $9/user/month billed annually.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Can I cancel a Close subscription anytime?$q$, $q$Monthly subscriptions can be upgraded, downgraded, or cancelled at any time; annual plans offer discounted pricing in exchange for a yearly commitment.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Does Close integrate with other tools?$q$, $q$Yes, Close offers a public API and a Zapier integration for connecting to other sales and marketing software.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$What is Chloe in Close?$q$, $q$Chloe is Close's built-in AI assistant that summarizes calls, drafts follow-up messages, and surfaces next steps for reps.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Outbound cold-calling teams$q$, $q$Use the Power or Predictive Dialer to run high-volume outbound calling campaigns directly from the CRM.$q$, $q$SDR and BDR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Solo founders and consultants$q$, $q$Manage a personal sales pipeline with built-in calling and email without paying for a full team plan.$q$, $q$Solo operators and independent consultants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Scaling B2B sales teams$q$, $q$Replace a patchwork of separate dialer, email, and CRM tools with one connected system as the team grows.$q$, $q$Sales managers and revenue operations leaders$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Solo$q$, $q$$9/user/month (annual) / $19/user/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Up to 10,000 leads","Built-in calling, email, SMS","Chloe AI assistant","30-day call recording retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Essentials$q$, $q$$35/user/month (annual) / $49/user/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited leads","Team collaboration","30-day call recording retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Growth$q$, $q$$99/user/month (annual) / $109/user/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Workflows automation","Power Dialer","90-day call recording retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$Scale$q$, $q$$139/user/month (annual) / $149/user/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Predictive Dialer","Unlimited call recording retention","Highest AI credit allowance"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '63a64c42-cc4a-45fb-b461-783e43ab44aa';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Close is a sales CRM founded in 2013 with a specific focus on small and mid-sized teams that sell over the phone, email, and text. Rather than requiring a separate dialer, email tool, or SMS platform bolted onto a generic CRM, Close builds calling, SMS, and email directly into the product.$q$, $q$The company is bootstrapped, profitable, and has operated as a fully remote, globally distributed team since 2016. Close positions itself as an alternative to heavier enterprise CRMs like Salesforce for teams that want to be selling within minutes of signing up rather than spending weeks on implementation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Close's core toolset includes a Power Dialer and, on higher plans, a Predictive Dialer for high-volume outbound calling, multi-step Workflow automation for follow-up sequences, a shared team inbox, and built-in pipeline reporting. Chloe, Close's AI assistant, summarizes calls, drafts messages, and helps reps identify next steps without leaving the CRM.$q$, $q$The product includes native iOS and Android apps for calling, texting, and managing leads on the go, along with a public API and Zapier support for connecting to other business systems.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Close has four published subscription tiers priced per user per month, cheaper when billed annually: Solo, Essentials, Growth, and Scale. Team collaboration features unlock starting on Essentials, Workflow automation and the Power Dialer unlock on Growth, and the Predictive Dialer is exclusive to Scale.$q$, $q$Calling minutes and SMS are billed on a usage basis on top of the subscription price across all plans. A 14-day free trial with no credit card required and a 30-day money-back guarantee are both available.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── CloudBeaver ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$CloudBeaver is a free, open-source, web-based database manager from the makers of DBeaver, letting teams browse, query, and edit 20+ databases from a browser.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Community Edition, self-hosted)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$CloudBeaver: Free Web-Based Database Manager$q$, seo_title),
  seo_meta_description = COALESCE($q$CloudBeaver is DBeaver's open-source web database manager. Learn its features, self-hosted setup, Enterprise pricing, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$CloudBeaver is a web-based database management tool built by DBeaver Corp, the company behind the widely used DBeaver desktop database client. Where DBeaver runs as a local desktop application, CloudBeaver runs as a self-hosted web server, giving teams browser-based access to databases from any device without installing local software. The Community Edition is free and open source under the Apache 2.0 license, with source code hosted publicly on GitHub. It supports 20+ database systems, including PostgreSQL, MySQL, ClickHouse, and DuckDB, and shares much of the underlying engine and feature set with the DBeaver desktop client. Key capabilities include a SQL Editor with fuzzy-search autocomplete for object names, a Data Editor supporting find-and-replace and multi-cell copy-paste, a References panel that lets users navigate related records through foreign-key relationships, SSH tunneling support with administrator-configurable restrictions, and the ability to view and edit saved SQL scripts without an active database connection. CloudBeaver is distributed as a Docker container for self-hosted deployment, and DBeaver Corp runs a public demo instance for evaluation before installing. Beyond the free Community Edition, DBeaver Corp sells paid CloudBeaver Enterprise and Team editions that add role-based access control (RBAC) and real-time multi-user collaboration; Enterprise pricing starts near $1,025/year for a minimum of five users, while Team Edition uses role-based per-user annual pricing. CloudBeaver is aimed at organizations that want to give developers, analysts, or external stakeholders shared, centrally managed access to databases through a browser instead of distributing and licensing desktop database clients to every user, and at teams that already use DBeaver and want a web-accessible complement to it.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Web-based SQL Editor$q$, $q$Browser-based SQL editing with fuzzy-search autocomplete for tables and other database objects.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Broad database support$q$, $q$Connects to 20+ database systems including PostgreSQL, MySQL, ClickHouse, and DuckDB.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Data Editor$q$, $q$Inline data editing with find-and-replace and multi-cell copy-paste support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$References panel$q$, $q$Navigate related records across tables connected by foreign keys directly in the data view.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$SSH tunneling$q$, $q$Connect to databases behind a firewall via SSH, with configurable admin restrictions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Docker-based deployment$q$, $q$Self-hosted deployment via an official Docker container for on-premises or cloud hosting.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Enterprise RBAC & collaboration$q$, $q$Paid editions add role-based access control and real-time multi-user collaboration.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Community Edition is free and open source with no licensing fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$No local installation needed; access databases from any browser$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Built on the mature, widely used DBeaver engine$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Supports a broad range of relational and analytical databases$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Community Edition lacks role-based access control and team collaboration, which require a paid edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Requires self-hosting and server administration (Docker, updates, backups)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Enterprise/Team pricing is aimed at organizations rather than individuals$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Browser UI has a smaller feature surface than the full DBeaver desktop application for some advanced tasks$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Is CloudBeaver free?$q$, $q$Yes, the Community Edition is free and open source under the Apache 2.0 license. Paid Enterprise and Team editions with additional access-control and collaboration features are also available.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$How is CloudBeaver different from DBeaver?$q$, $q$DBeaver is a desktop application installed locally, while CloudBeaver is a self-hosted web server that gives browser-based access to databases from any device.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$What databases does CloudBeaver support?$q$, $q$CloudBeaver supports 20+ database systems, including PostgreSQL, MySQL, ClickHouse, and DuckDB.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$How is CloudBeaver deployed?$q$, $q$CloudBeaver is typically deployed as a Docker container on a server, either on-premises or in the cloud.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Does CloudBeaver support multiple users with different permissions?$q$, $q$Fine-grained role-based access control and real-time collaboration require the paid Enterprise or Team edition; the free Community Edition has more limited access management.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Shared team database access$q$, $q$Give developers or analysts browser-based access to shared databases without installing desktop clients.$q$, $q$Engineering and data teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Client or stakeholder query access$q$, $q$Grant external stakeholders limited, controlled access to query data without distributing software licenses.$q$, $q$Agencies and consultancies$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Self-hosted via Docker","20+ database connections","SQL Editor & Data Editor","Apache 2.0 open source license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Enterprise Edition$q$, $q$From ~$1,025/year (5-user minimum)$q$, $q$annual$q$, NULL, $q$["Role-based access control","Centralized connection management","Admin-restricted SSH tunneling"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Team Edition$q$, $q$Per-role annual pricing (~$82-$810/user/year)$q$, $q$annual$q$, NULL, $q$["Real-time collaboration","Granular role-based permissions"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CloudBeaver is a self-hosted, web-based database management tool built by DBeaver Corp, the team behind the popular DBeaver desktop SQL client. It brings much of DBeaver's functionality into a browser, so teams can connect to and manage databases without installing a local application.$q$, $q$The Community Edition is free and open source under the Apache 2.0 license. DBeaver Corp also sells paid Enterprise and Team editions that add access control and collaboration features on top of the free core.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$CloudBeaver supports 20+ database systems, including PostgreSQL, MySQL, ClickHouse, and DuckDB. It includes a SQL Editor with fuzzy-search autocomplete, a Data Editor with find-and-replace and multi-cell copy-paste, a References panel for navigating foreign-key relationships, and SSH tunneling support that administrators can restrict.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The Community Edition is free to self-host under an open-source license, deployed via Docker. Paid Enterprise and Team editions add role-based access control and real-time collaboration; Enterprise pricing starts around $1,025/year for a minimum of five users, while Team Edition is priced per user role on an annual basis.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cloudflare ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Cloudflare is a global network platform providing CDN, DNS, DDoS protection, WAF, and edge computing (Workers), used to secure and accelerate millions of websites.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Free plan); Pro plan from $20/month$q$, starting_price),
  founded_year = COALESCE(2009, founded_year),
  company_size = COALESCE($q$~4,900 employees (public company, NYSE: NET)$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Cloudflare: CDN, DNS & Security Platform Overview$q$, seo_title),
  seo_meta_description = COALESCE($q$Cloudflare provides CDN, DNS, DDoS protection, and edge computing (Workers). See 2026 pricing, key products, pros, cons, and FAQs for NYSE: NET.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Cloudflare is a publicly traded (NYSE: NET) global network and web infrastructure company founded in 2009 by Matthew Prince, Lee Holloway, and Michelle Zatlyn, and headquartered in San Francisco, California. As of late 2025 it employed roughly 4,900 people, though the company announced plans in 2026 to reduce headcount by about 20% as part of a shift toward an AI-first product strategy. Cloudflare operates one of the largest networks on the public internet, spanning 300+ cities worldwide, and its products span content delivery, security, and edge computing. Core offerings include a global CDN for caching and accelerating web content, authoritative and recursive DNS services (including the free 1.1.1.1 public DNS resolver), DDoS mitigation, a web application firewall (WAF), and SSL/TLS certificate management. Cloudflare also operates a serverless edge computing platform called Workers, an S3-compatible object storage product called R2, and WARP, a consumer and enterprise VPN-like client for routing device traffic through Cloudflare's network. For enterprise security, Cloudflare Zero Trust (sold under the Cloudflare One SASE platform) provides Zero Trust Network Access, a secure web gateway, and related services as a distinct product line. Cloudflare's business/website plans follow a freemium, per-domain pricing model: a Free plan covers basic CDN, DNS, and security features for any website at no cost; a Pro plan starts at $20/month billed annually ($25/month billed monthly) and adds image optimization and mobile performance features; a Business plan starts at $200/month billed annually ($250/month billed monthly) and adds a more advanced WAF and faster cache purges; and an Enterprise plan is custom-priced and billed annually, adding SLAs, dedicated support, and advanced security controls. Many of Cloudflare's developer products, including Workers and R2, are billed separately on a usage basis. Cloudflare targets a very broad customer base, from individual website owners and small businesses using the free tier to large enterprises relying on its network for DDoS protection, CDN performance, and edge compute at global scale.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Global CDN$q$, $q$Caches and accelerates website content across a network spanning 300+ cities.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$DNS management$q$, $q$Fast authoritative DNS hosting, plus the free 1.1.1.1 public DNS resolver.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$DDoS protection$q$, $q$Network- and application-layer DDoS mitigation built into every plan, including the free tier.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Web Application Firewall (WAF)$q$, $q$Rule-based and managed protection against common web application attacks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Workers$q$, $q$Serverless platform for running JavaScript and other languages at the network edge.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$R2 object storage$q$, $q$S3-compatible object storage with no egress fees, built for use with Workers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$SSL/TLS management$q$, $q$Automated certificate issuance and renewal for HTTPS.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$WARP client$q$, $q$Device-level app for routing traffic through Cloudflare's network, available on desktop and mobile.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Generous free tier includes CDN, DNS, and DDoS protection for any website$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$One of the largest, most geographically distributed networks in the industry$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Broad product portfolio covering CDN, security, and edge compute under one vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Developer platform (Workers, R2) enables building and running applications at the edge$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Advanced security and performance features are gated behind Business or custom Enterprise pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Product breadth can be overwhelming for teams that only need one specific service$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Zero Trust, Workers, and other products are billed as separate line items from the core website plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$As critical internet infrastructure at massive scale, occasional outages can affect a large share of dependent websites simultaneously$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Is Cloudflare free?$q$, $q$Yes, Cloudflare offers a Free plan for websites that includes CDN, DNS, and basic DDoS and security protection, with paid Pro, Business, and Enterprise plans available for more advanced features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$What is Cloudflare used for?$q$, $q$Cloudflare is used for content delivery (CDN), DNS management, DDoS protection, web application firewalling, SSL/TLS, and edge computing via its Workers platform.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Is Cloudflare a public company?$q$, $q$Yes, Cloudflare, Inc. trades on the NYSE under the ticker NET and has been publicly traded since its 2019 IPO.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$What is 1.1.1.1?$q$, $q$1.1.1.1 is Cloudflare's free, privacy-focused public DNS resolver.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$What is Cloudflare Workers?$q$, $q$Workers is Cloudflare's serverless platform for running application code across its global edge network.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Website performance and security$q$, $q$Add CDN caching, DNS, and DDoS/WAF protection to a website without managing your own infrastructure.$q$, $q$Website owners and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Edge application development$q$, $q$Build and deploy applications and APIs that run close to users on Cloudflare's global network using Workers and R2.$q$, $q$Developers and platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Enterprise network security$q$, $q$Protect large-scale web properties and internal networks against DDoS attacks and application-layer threats.$q$, $q$Enterprises and high-traffic web platforms$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Global CDN","DNS management","Basic DDoS protection","Shared SSL certificate"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Pro$q$, $q$$20/month (annual) / $25/month (monthly)$q$, $q$monthly or annual, per domain$q$, NULL, $q$["Image optimization","Mobile performance tools","Enhanced WAF rules"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Business$q$, $q$$200/month (annual) / $250/month (monthly)$q$, $q$monthly or annual, per domain$q$, NULL, $q$["Advanced WAF","100% uptime SLA","Faster cache purges"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Dedicated support","Advanced security controls","Custom SLAs"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cloudflare is a global network and web infrastructure company founded in 2009 by Matthew Prince, Lee Holloway, and Michelle Zatlyn, headquartered in San Francisco, California. It is publicly traded on the NYSE under the ticker NET.$q$, $q$Cloudflare operates a network spanning 300+ cities worldwide and is best known for making enterprise-grade CDN, DNS, and DDoS protection accessible to websites of any size, including a widely used free tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Cloudflare's product line spans a global CDN, authoritative and recursive DNS (including the free 1.1.1.1 resolver), DDoS mitigation, a web application firewall, and SSL/TLS certificate management. Its developer platform includes Workers, a serverless edge compute product, and R2, an S3-compatible object storage service. Cloudflare also offers WARP, a device-level network client, and a domain registrar.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Cloudflare's website plans are billed per domain: Free ($0), Pro ($20/month annual, $25/month monthly), Business ($200/month annual, $250/month monthly), and custom-priced Enterprise. Developer products such as Workers and R2 are billed separately on a usage basis, and the Zero Trust/Cloudflare One security suite is sold as its own product line with its own pricing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Cloudflare Zero Trust ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Cloudflare Zero Trust is a SASE security suite from Cloudflare offering Zero Trust Network Access, a secure web gateway, CASB, and DLP to replace VPN-based access.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (up to 50 users); Pay-as-you-go from $7/user/month$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE($q$~4,900 employees (Cloudflare, Inc., public company, NYSE: NET)$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, US (Cloudflare, Inc.)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Cloudflare Zero Trust: Pricing, Features & FAQs$q$, seo_title),
  seo_meta_description = COALESCE($q$Cloudflare Zero Trust bundles ZTNA, secure web gateway, CASB, and DLP into one platform. See 2026 pricing, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Cloudflare Zero Trust is a security product suite from Cloudflare, Inc., the San Francisco-based network company founded in 2009 (NYSE: NET). It is sold as part of Cloudflare One, Cloudflare's single-vendor SASE (Secure Access Service Edge) platform, which converges security services with network services like Magic WAN and Magic Firewall. Cloudflare Zero Trust replaces traditional perimeter VPN architecture with identity-aware, per-application access controls enforced at Cloudflare's global edge network, covering more than 300 cities. Its core components include Zero Trust Network Access (Access), which grants per-application, identity-verified access instead of full network-level VPN access; a Secure Web Gateway (Gateway) for DNS, HTTP, and network-layer filtering; Cloud Access Security Broker (CASB) functionality for monitoring SaaS application usage; Data Loss Prevention (DLP) policies to prevent sensitive data exfiltration; and, on higher tiers, Remote Browser Isolation (RBI), email security, and Digital Experience Monitoring. Access is enforced through the Cloudflare One Client (formerly WARP), a device agent available for Windows, macOS, Linux, iOS, and Android that can also evaluate device posture signals like disk encryption, OS version, and location as part of access policies. Cloudflare Zero Trust uses a three-tier pricing structure: a Free plan covers up to 50 users with full ZTNA and secure web gateway capabilities, 24 hours of log retention, and limited DLP; a Pay-as-you-go plan costs $7 per user per month (billed annually), removes the user cap, and extends log retention to 30 days with predefined DLP policies; and a custom-priced Enterprise plan adds expanded CASB, custom DLP policies, Remote Browser Isolation, email security, dedicated egress IPs, and up to six months of log retention. Cloudflare Zero Trust is aimed at IT and security teams at organizations of any size that want to move away from traditional VPNs toward identity-based, application-level access control for remote and hybrid workforces, and at enterprises consolidating multiple point security products (VPN, CASB, DLP, RBI) under a single vendor.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Zero Trust Network Access (Access)$q$, $q$Grants identity-verified, per-application access to internal resources instead of full-network VPN access.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Secure Web Gateway$q$, $q$DNS, HTTP, and network-layer filtering to enforce web access policies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$CASB$q$, $q$Monitors SaaS application usage to detect shadow IT and misconfigurations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Data Loss Prevention (DLP)$q$, $q$Policies that detect and block exfiltration of sensitive data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Remote Browser Isolation$q$, $q$Isolates risky web browsing sessions in the cloud rather than on the local device (Enterprise tier).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Cloudflare One Client$q$, $q$Cross-platform device agent (Windows, macOS, Linux, iOS, Android) that enforces policies and checks device posture.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Cloudflare One SASE integration$q$, $q$Combines Zero Trust security services with network services like Magic WAN and Magic Firewall.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Free plan covers up to 50 users with full ZTNA and secure web gateway functionality$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Enforced across a large global network, reducing latency versus traditional VPN concentrators$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Converges ZTNA, SWG, CASB, and DLP in a single dashboard instead of separate point products$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Cross-platform device client supports Windows, macOS, Linux, iOS, and Android$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Advanced features like Remote Browser Isolation and email security require the custom-priced Enterprise tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Log retention is limited to 24 hours on Free and 30 days on Pay-as-you-go$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Enterprise pricing is not publicly listed and requires contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Full SASE capabilities (Magic WAN, Magic Firewall) are sold as part of the broader Cloudflare One platform, not Zero Trust alone$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Is Cloudflare Zero Trust free?$q$, $q$Yes, Cloudflare offers a Free plan covering up to 50 users with full ZTNA and secure web gateway functionality; paid plans start at $7/user/month for unlimited users.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$How does Cloudflare Zero Trust differ from a VPN?$q$, $q$Instead of granting full network access like a traditional VPN, it grants identity-verified, per-application access enforced at Cloudflare's edge network.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$What operating systems does the Cloudflare One Client support?$q$, $q$The client supports Windows, macOS, Linux, iOS, and Android.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Is Cloudflare Zero Trust the same company as Cloudflare?$q$, $q$Yes, Cloudflare Zero Trust is a product suite from Cloudflare, Inc., sold as part of the Cloudflare One SASE platform.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$What does the Enterprise plan add?$q$, $q$The Enterprise plan adds expanded CASB, custom DLP policies, Remote Browser Isolation, email security, dedicated egress IPs, and up to six months of log retention.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Replacing corporate VPN access$q$, $q$Give remote and hybrid employees identity-based access to internal applications without a traditional VPN.$q$, $q$IT and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$SaaS usage monitoring and DLP$q$, $q$Monitor SaaS application usage and enforce data loss prevention policies across a workforce.$q$, $q$Security and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Consolidating security point products$q$, $q$Replace separate VPN, CASB, and DLP vendors with a single Zero Trust platform.$q$, $q$Enterprises simplifying their security stack$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Up to 50 users","Full ZTNA and Secure Web Gateway","24-hour log retention","Limited DLP"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Pay-as-you-go$q$, $q$$7/user/month$q$, $q$annual$q$, NULL, $q$["No user limit","30-day log retention","Predefined DLP policies"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Expanded CASB","Custom DLP","Remote Browser Isolation","Email security","Dedicated egress IPs","Up to 6 months log retention"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cloudflare Zero Trust is a security product suite from Cloudflare, Inc., sold as part of the broader Cloudflare One SASE platform. It replaces traditional VPN-based network access with identity-aware, per-application access controls enforced across Cloudflare's global network of 300+ cities.$q$, $q$The suite is distinct from Cloudflare's core CDN/DNS products, focusing specifically on securing remote and hybrid workforce access to internal applications, SaaS tools, and the public internet.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Cloudflare Zero Trust combines Zero Trust Network Access (Access), a Secure Web Gateway, CASB, and DLP in one dashboard, with Remote Browser Isolation and email security available on higher tiers. Access is enforced through the Cloudflare One Client, a device agent for Windows, macOS, Linux, iOS, and Android that also supports device posture checks such as disk encryption and OS version.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Cloudflare Zero Trust offers a Free plan for up to 50 users, a Pay-as-you-go plan at $7/user/month (billed annually) with no user cap, and a custom-priced Enterprise plan that adds expanded CASB, custom DLP, Remote Browser Isolation, and dedicated egress IPs.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── CloudLex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$CloudLex is cloud-based case management software built exclusively for plaintiff personal injury law firms, covering intake through settlement in one platform.$q$, short_description),
  pricing_model = COALESCE($q$Custom/Quote-based$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$New York, New York, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$CloudLex: Personal Injury Case Management Software$q$, seo_title),
  seo_meta_description = COALESCE($q$CloudLex is cloud-based case management software for personal injury law firms, covering intake, deadlines, documents, and settlement in one system.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$CloudLex, marketed as 'The Legal Cloud,' is cloud-based case management software founded in 2015 and headquartered in New York City, built exclusively for plaintiff personal injury law firms rather than general legal practice management. The platform, referred to as LegalCloud, unifies the full personal injury case lifecycle in one system: shareable client intake forms that collect injury checklists and case details, one-click conversion of accepted intakes into a case matter, centralized document and medical record management, task and deadline tracking with configurable mandatory statute-of-limitations fields at matter creation, client communication tools, and case negotiation and settlement tracking. Financial features include native handling of matter-level disbursements, expenses, and liens, along with integration with QuickBooks Online for firm-wide accounting. CloudLex also offers automated legal document template generation and an AI layer, including a built-in AI assistant called Lexee, that helps with tasks such as document search and drafting. The company positions itself as providing more than software alone, pairing the platform with optional integrated paralegal services so firms can supplement in-house staff. Data is hosted on Microsoft Azure with HIPAA-certified security, relevant given the medical records personal injury firms handle. CloudLex does not publish standard per-user pricing; costs are customized based on firm size, selected package, number of users, storage needs, integrations, AI feature usage, and optional paralegal services, and prospective customers must request a demo or quote to get exact figures. CloudLex is aimed specifically at plaintiff-side personal injury law firms, from small practices to larger firms managing high case volumes, that want a purpose-built system rather than a general-purpose legal practice management tool.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '963e1b92-071f-415e-9b5e-38f557ab5057';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '963e1b92-071f-415e-9b5e-38f557ab5057' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Client intake management$q$, $q$Shareable intake forms that capture case details and injury checklists, convertible into a matter with one click.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Statute of limitations tracking$q$, $q$Configurable, mandatory SOL date fields at matter creation with shared team visibility on deadlines.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Document & medical record management$q$, $q$Centralized storage and organization of case documents and medical records with AI-assisted search.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Trust accounting & disbursements$q$, $q$Native handling of matter-level disbursements, expenses, and liens, with QuickBooks Online integration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Lexee AI assistant$q$, $q$Built-in AI assistant that helps with document search, drafting, and case-related tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Document automation$q$, $q$Automatically generates legal document templates to reduce manual drafting errors.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Integrated paralegal services$q$, $q$Optional add-on human paralegal support alongside the software platform.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Purpose-built specifically for plaintiff personal injury practice, not a generic legal tool$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Unifies intake, case management, documents, and settlement in one system$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$HIPAA-certified hosting on Microsoft Azure, relevant for medical record handling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Optional integrated paralegal services alongside the software$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Pricing is not publicly listed and requires a sales demo to obtain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Narrow focus on personal injury means it is not suited to other practice areas$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Onboarding and migration from another case management system can take time for larger firms$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$What type of law firm is CloudLex for?$q$, $q$CloudLex is built exclusively for plaintiff personal injury law firms, not general legal practice management.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$How much does CloudLex cost?$q$, $q$CloudLex does not publish standard pricing; costs are customized per firm based on package, user count, and add-ons like AI features or paralegal services. A demo or quote is required for exact pricing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$What is Lexee?$q$, $q$Lexee is CloudLex's built-in AI assistant that helps with document search, drafting, and other case-related tasks.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Is CloudLex HIPAA compliant?$q$, $q$Yes, CloudLex is hosted on Microsoft Azure with HIPAA-certified data security.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$When was CloudLex founded?$q$, $q$CloudLex was founded in 2015 and is headquartered in New York City.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Personal injury case intake to settlement$q$, $q$Manage a case from client intake through negotiation and settlement in one connected platform.$q$, $q$Plaintiff personal injury law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Deadline and statute of limitations compliance$q$, $q$Track case deadlines and SOL dates with shared visibility across the legal team.$q$, $q$Attorneys and paralegals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Firm financial management$q$, $q$Track matter-level disbursements, expenses, and liens integrated with QuickBooks Online.$q$, $q$Law firm administrators and bookkeepers$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CloudLex is cloud-based case management software founded in 2015 and headquartered in New York City. Unlike general legal practice management tools, it is built exclusively for plaintiff personal injury law firms, covering the full case lifecycle from client intake through settlement.$q$, $q$The platform, marketed as LegalCloud, is hosted on Microsoft Azure with HIPAA-certified security, reflecting the sensitivity of the medical records that personal injury cases typically involve.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$CloudLex covers client intake forms, one-click conversion of intakes into case matters, document and medical record management, task and statute-of-limitations deadline tracking, and negotiation and settlement tracking. Financial features include native handling of disbursements, expenses, and liens, plus QuickBooks Online integration, along with automated legal document generation and an AI assistant called Lexee.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$CloudLex does not publish standard pricing. Costs are customized based on the firm's selected package, number of users, storage and integration needs, AI feature usage, and whether optional integrated paralegal services are added. Firms need to request a demo or quote for exact pricing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Cloudlog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Cloudlog is a free, open-source, web-based amateur radio logbook for logging QSOs from any browser, with CAT control, LoTW/QRZ sync, and awards tracking.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) / optional hosted subscription$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted); hosted plans from £4/month$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Cloudlog: Free Open-Source Ham Radio Logbook$q$, seo_title),
  seo_meta_description = COALESCE($q$Cloudlog is an open-source, web-based amateur radio logbook with CAT control, LoTW/QRZ sync, and awards tracking. Self-host free or use hosted plans.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Cloudlog is a free, open-source, web-based amateur radio logging application built with PHP and MySQL/MariaDB, created by Peter Goodhall (callsign MM9SQL) as a personal amateur radio project that grew into a widely used community tool. It lets operators log contacts (QSOs) from any web browser on any device, covering frequency bands from HF through microwave. Cloudlog integrates with station equipment via CAT control, can sync logs automatically from WSJT-X for digital modes, and supports satellite operators through SatPC32 integration. It offers full integration with Logbook of the World (LoTW), including automated upload and QSL matching, plus integration with eQSL and the QRZ Logbook. Built-in awards tracking covers DXCC, WAS, VUCC, IOTA, DOK, SOTA, and other award programs, and the application includes analytics such as QSO graphs by year, pie charts by mode/band/satellite, and a grid-square map showing worked, confirmed, and needed grid squares. Because it runs in a browser, logs are accessible from any internet-connected device once installed. Cloudlog can be self-hosted for free on any server running PHP 7.0+ and MySQL or MariaDB, with source code available on GitHub. For operators who don't want to self-host, Cloudlog's creator (magicbug) offers a paid hosted subscription starting around £4/month or £48/year, which includes 24/7 uptime, automated data backups, and 5GB of storage for QSL and eQSL card images. Cloudlog is aimed at amateur (ham) radio operators of all experience levels who want a modern, accessible logbook rather than desktop-only logging software. Notably, a group of former Cloudlog contributors forked the project at the end of 2023 to create Wavelog, a free, self-hosted successor that has continued active development.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1f86602f-2198-4b4a-ae20-0793534244a7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1f86602f-2198-4b4a-ae20-0793534244a7' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1f86602f-2198-4b4a-ae20-0793534244a7';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Browser-based logging$q$, $q$Log contacts from any device with a browser and internet connection, no desktop software required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$CAT control$q$, $q$Interfaces directly with amateur radio equipment for real-time frequency and mode tracking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$WSJT-X sync$q$, $q$Automatically syncs digital-mode contacts logged in WSJT-X.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$LoTW, eQSL & QRZ integration$q$, $q$Automated upload and confirmation matching with Logbook of the World, eQSL, and QRZ Logbook.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Awards tracking$q$, $q$Tracks progress toward DXCC, WAS, VUCC, IOTA, DOK, SOTA, and other amateur radio awards.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Analytics & grid mapping$q$, $q$QSO graphs by year/mode/band and a grid-square map of worked, confirmed, and needed squares.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '1f86602f-2198-4b4a-ae20-0793534244a7';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Free and open source with full self-hosting option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Accessible from any browser on any device, no desktop install required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Deep integration with LoTW, eQSL, QRZ, and WSJT-X$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Covers HF through microwave and satellite logging$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1f86602f-2198-4b4a-ae20-0793534244a7';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Self-hosting requires a server with PHP and MySQL/MariaDB and some technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Hosted subscription is a paid add-on rather than included free$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Active development has shifted partly toward the Wavelog fork since 2023$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Web-based, browser-dependent UI rather than a native desktop application$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '1f86602f-2198-4b4a-ae20-0793534244a7';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Is Cloudlog free?$q$, $q$Yes, Cloudlog is free and open source for self-hosting. A paid hosted subscription is also available for those who don't want to run their own server.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Who created Cloudlog?$q$, $q$Cloudlog was created by Peter Goodhall (callsign MM9SQL) as an amateur radio hobby project.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Does Cloudlog support Logbook of the World?$q$, $q$Yes, Cloudlog offers full LoTW integration, including automated upload and QSL matching, along with eQSL and QRZ Logbook syncing.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$What is Wavelog?$q$, $q$Wavelog is a free, self-hosted fork of Cloudlog started in late 2023 by former Cloudlog contributors, continuing active development independently.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$What do I need to self-host Cloudlog?$q$, $q$A web server running PHP 7.0 or later and MySQL or MariaDB.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1f86602f-2198-4b4a-ae20-0793534244a7';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Personal ham radio logging$q$, $q$Log QSOs from a home shack across HF to microwave bands from any browser.$q$, $q$Individual amateur radio operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Awards chasing$q$, $q$Track progress toward DXCC, WAS, VUCC, IOTA, and other amateur radio awards.$q$, $q$Award-chasing hobbyists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Multi-device or club logging$q$, $q$Access a shared or personal logbook from multiple devices without desktop software.$q$, $q$Radio clubs and mobile/portable operators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1f86602f-2198-4b4a-ae20-0793534244a7';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full source code on GitHub","Requires own PHP/MySQL server","All core logging features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Hosted subscription$q$, $q$From £4/month (£48/year)$q$, $q$monthly or annual$q$, NULL, $q$["24/7 hosted uptime","Automated data backups","5GB QSL/eQSL card storage"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '1f86602f-2198-4b4a-ae20-0793534244a7';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cloudlog is a free, open-source amateur radio logging application built with PHP and MySQL, created by Peter Goodhall (MM9SQL) as a hobby project for the amateur radio community. It lets operators log contacts from any web browser, covering HF through microwave.$q$, $q$The software can be self-hosted for free on a server with PHP and MySQL/MariaDB, or run through a paid hosted subscription offered by its creator for operators who prefer not to manage their own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Cloudlog integrates with radio equipment via CAT control, syncs logs automatically from WSJT-X, and supports satellite operation through SatPC32. It offers full Logbook of the World integration with automated upload and matching, plus eQSL and QRZ Logbook syncing, awards tracking for DXCC, WAS, VUCC, IOTA, DOK, and SOTA, and analytics including QSO graphs and a grid-square map.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Self-hosting Cloudlog is completely free and open source. A paid hosted subscription is available from the creator starting around £4/month or £48/year, covering 24/7 uptime, automated backups, and 5GB of QSL/eQSL card storage.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Cloudreve ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Cloudreve is a free, open-source, self-hosted file management and sharing system with multi-cloud storage support, built in Go and licensed under GPLv3.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) / optional paid Pro license$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted, GPLv3)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Cloudreve: Free Self-Hosted Cloud Storage Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Cloudreve is an open-source, self-hosted file management and sharing system with multi-cloud storage support and WebDAV. Free under GPLv3.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Cloudreve is a free, open-source, self-hosted file management and sharing system, built primarily by developer HFO4 (AaronLiu) with contributions from an active community, using Go for the backend. It is distributed under the GPLv3 license and is free to self-host with no storage fees, per-user charges, or forced premium tier for core functionality. Cloudreve can connect to multiple storage backends simultaneously, including local disk, a remote Cloudreve node, Amazon S3-compatible object storage, Microsoft OneDrive, and several Chinese cloud storage providers (Qiniu Kodo, Aliyun OSS, Tencent COS, Huawei Cloud OBS, Kingsoft Cloud KS3, and Upyun). Core capabilities include direct client-to-storage-provider uploads and downloads, resumable and drag-and-drop uploads, batch file compression, extraction, and download, in-browser preview for videos, images, audio, and ePub files, and online editing of text, Markdown, diagrams, images, and Office documents. It integrates with Aria2 and qBittorrent to offload downloads to background download nodes, supports WebDAV across all connected storage providers, and offers multi-user, multi-group account management with expiring share links. Cloudreve V4, a major rewrite of both frontend and backend released in 2025, added collaborative editing on shared links, more granular sharing permissions for specific users, groups, or anonymous visitors, file locking for concurrent Office/WOPI editing, and the ability to sell paid share links to anonymous visitors without requiring them to log in. Alongside the free Community edition, Cloudreve sells an optional Pro edition license that is domain-locked (covering one root domain and its subdomains) and unlocks features such as assigning multiple storage providers per user group and AI-powered semantic search using OpenAI, Hugging Face, or AWS Bedrock embeddings; Pro licensing details and exact pricing are published on Cloudreve's own site and are not publicly aggregated elsewhere. Cloudreve is aimed at individuals and organizations that want to run their own private cloud storage and file-sharing service instead of relying on a third-party provider like Dropbox or Google Drive.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Multi-cloud storage support$q$, $q$Connects to local disk, S3-compatible storage, OneDrive, and several Chinese cloud providers simultaneously.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Direct client-to-storage transfer$q$, $q$Uploads and downloads move directly between the client and storage provider rather than through the app server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$WebDAV support$q$, $q$Access files over WebDAV across all connected storage backends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$In-browser preview & editing$q$, $q$Preview videos, images, audio, and ePub files, and edit text, Markdown, diagrams, and Office documents online.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Download node integration$q$, $q$Offloads downloads to Aria2 or qBittorrent nodes to distribute load.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Granular sharing permissions$q$, $q$Share links with expiration dates and permission settings for specific users, groups, or anonymous visitors.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Multi-user, multi-group accounts$q$, $q$Manage multiple users and permission groups within a single Cloudreve instance.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Free and open source under GPLv3 with no storage or per-user fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Supports multiple storage backends in one installation, including S3-compatible and OneDrive$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Rich file preview and online editing without extra plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Active development, with a major V4 rewrite released in 2025$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Self-hosting requires server setup, maintenance, and your own storage costs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Some advanced features, like multi-provider user groups and AI semantic search, require the paid Pro license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Pro license is domain-locked, with a fee to change the root domain$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Primary documentation and community discussion are largely in Chinese, though the interface supports English$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Is Cloudreve free?$q$, $q$Yes, the Community edition is free and open source under the GPLv3 license, with no storage fees or per-user charges. A separate paid Pro license adds optional advanced features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$What storage providers does Cloudreve support?$q$, $q$Cloudreve supports local disk, a remote Cloudreve node, S3-compatible object storage, OneDrive, and several Chinese cloud storage providers including Aliyun OSS and Tencent COS.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Does Cloudreve support WebDAV?$q$, $q$Yes, WebDAV is supported across all connected storage providers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Who develops Cloudreve?$q$, $q$Cloudreve is developed primarily by HFO4 (AaronLiu) with contributions from an open-source community, with source code available on GitHub.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$What's new in Cloudreve V4?$q$, $q$V4, released in 2025, is a major rewrite of the frontend and backend that added collaborative share-link editing, more granular sharing permissions, and file locking for concurrent document editing.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Private cloud storage$q$, $q$Self-host a personal or family alternative to Dropbox or Google Drive with full control over data.$q$, $q$Privacy-conscious individuals and home lab users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Multi-cloud file gateway$q$, $q$Present multiple storage backends (S3, OneDrive, local disk) through one unified interface.$q$, $q$Developers and small teams managing distributed storage$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$File sharing with access control$q$, $q$Share files or folders with expiring links and granular permissions for specific users or groups.$q$, $q$Small teams and organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Community$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["GPLv3 open source","Multi-cloud storage support","WebDAV","Self-hosted, unlimited users/storage (subject to own infrastructure)"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cloudreve is a free, open-source, self-hosted file management and sharing system built in Go, primarily developed by HFO4 (AaronLiu) with an active open-source community. It is licensed under GPLv3 and free to self-host with no storage fees or per-user charges for the core Community edition.$q$, $q$The project has gone through multiple major versions, with Cloudreve V4 (released 2025) representing a significant rewrite of both the frontend and backend and adding collaborative sharing and permission features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Cloudreve connects to multiple storage backends at once, including local disk, S3-compatible object storage, OneDrive, and several Chinese cloud storage providers. It supports direct client-to-storage uploads, resumable uploads, batch compression/extraction, in-browser preview and editing of common file types, WebDAV, and integration with Aria2/qBittorrent for background downloads.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The Community edition is completely free and open source under GPLv3, with no storage fees or premium tiers required for core functionality. Cloudreve also sells an optional, domain-locked Pro edition license that adds features like multi-storage-provider user groups and AI-powered semantic search; pricing for Pro is set on Cloudreve's own site.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cloudron ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Cloudron is a self-hosted platform for installing and managing web apps like WordPress, Nextcloud, and GitLab, with automatic updates, backups, and email setup.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (up to 2 apps); Pro from €15/month$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Berlin, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Cloudron: Self-Hosted App Platform Pricing & Review$q$, seo_title),
  seo_meta_description = COALESCE($q$Cloudron is a self-hosted platform for running apps like WordPress and Nextcloud, with automatic updates, backups, and email setup. See pricing and features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Cloudron is a self-hosted platform for installing, running, and maintaining web applications on a private server, founded in 2015 by a team that met at Nokia and first prototyped the product at NodeConf 2013, and headquartered in Berlin, Germany. Rather than being a hosted SaaS product, Cloudron runs entirely on infrastructure the user controls (a VPS or dedicated server), with the company stating it has no access to that server once deployed. Cloudron maintains a curated app catalog of roughly 100-200+ pre-configured applications, including WordPress, Nextcloud, GitLab, Rocket.Chat, Discourse, Mastodon, and OpenVPN, that can typically be installed in one click. Beyond app installation, Cloudron automates the operational work of self-hosting: it provisions databases for each app, sets up DNS records and TLS certificates automatically, applies automatic app updates, runs periodic encrypted per-app backups, and provides centralized user management with Single Sign-On via OpenID Connect and LDAP across all installed apps. It also includes a built-in firewall and a fully functional email server with automated DKIM, SPF, and DMARC configuration for reliable outbound mail delivery, which is often one of the hardest parts of self-hosting to get right. Cloudron's pricing follows a freemium model billed per server: a Free plan allows up to two apps at no cost; a Pro plan costs €15/month (or a higher annual-equivalent rate) and unlocks unlimited apps and unlimited users on a single server; a Max plan costs €25/month and adds user groups and roles, a directory server, and support for multiple backup destinations; and a Service Provider plan at €150/month supports unlimited apps and users across up to 10 servers, aimed at agencies and hosting providers managing Cloudron for multiple clients. Priority support is available as a separate add-on around $720/year. Cloudron is aimed at individuals, small businesses, and IT-literate teams who want the convenience of a managed app platform while keeping full ownership of their data and server, as an alternative to public SaaS versions of the same open-source applications.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '63b900b3-a299-4585-b839-c8a5c321ef6b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '63b900b3-a299-4585-b839-c8a5c321ef6b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '63b900b3-a299-4585-b839-c8a5c321ef6b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$One-click app catalog$q$, $q$Install a curated catalog of 100-200+ apps like WordPress, Nextcloud, and GitLab with one click.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Automatic app updates$q$, $q$Keeps installed applications updated automatically without manual intervention.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Encrypted per-app backups$q$, $q$Runs periodic encrypted backups for each installed application.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Automated DNS & TLS setup$q$, $q$Configures DNS records and TLS certificates automatically for each app.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Single Sign-On$q$, $q$Centralized user management with SSO via OpenID Connect and LDAP across all apps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Built-in email server$q$, $q$Fully functional mail server with automated DKIM, SPF, and DMARC configuration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Built-in firewall$q$, $q$Server-level firewall included as part of the platform for baseline security.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '63b900b3-a299-4585-b839-c8a5c321ef6b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Automates the hardest parts of self-hosting: backups, updates, TLS, DNS, and email deliverability$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Large, curated app catalog covering popular open-source tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Free plan available for testing with up to two apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Runs on infrastructure fully controlled by the user, with no vendor access to the server$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '63b900b3-a299-4585-b839-c8a5c321ef6b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Requires renting and managing your own VPS or server, which is a separate ongoing cost from the Cloudron subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Paid tiers are billed per server, which can add up for organizations running multiple deployments$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Advanced features like directory server and multi-site backups require the higher Max tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Not a fully managed SaaS product, so some server/infrastructure knowledge is still useful$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '63b900b3-a299-4585-b839-c8a5c321ef6b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Is Cloudron free?$q$, $q$Yes, Cloudron offers a free plan that supports up to two apps on a server; paid plans starting at €15/month unlock unlimited apps.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$What apps can I install with Cloudron?$q$, $q$Cloudron's catalog includes roughly 100-200+ apps, including WordPress, Nextcloud, GitLab, Rocket.Chat, Discourse, and Mastodon, most installable in one click.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Does Cloudron handle backups and updates automatically?$q$, $q$Yes, Cloudron automates per-app encrypted backups and automatic app updates.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Do I need my own server to use Cloudron?$q$, $q$Yes, Cloudron is self-hosted software that runs on a VPS or dedicated server that you control; Cloudron itself does not host the server for you.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Where is Cloudron based?$q$, $q$Cloudron was founded in 2015 and is headquartered in Berlin, Germany.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '63b900b3-a299-4585-b839-c8a5c321ef6b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Self-hosting multiple open-source apps$q$, $q$Run WordPress, Nextcloud, GitLab, and other apps on one server with automated maintenance.$q$, $q$Individuals and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Agency or reseller hosting$q$, $q$Manage Cloudron deployments for multiple clients across several servers under the Service Provider plan.$q$, $q$Hosting agencies and IT service providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Private company collaboration tools$q$, $q$Self-host chat, file sharing, and project tools with centralized SSO for a team.$q$, $q$Privacy-conscious teams and organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '63b900b3-a299-4585-b839-c8a5c321ef6b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Free$q$, $q$€0/month$q$, $q$N/A$q$, NULL, $q$["Up to 2 apps","Single server"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Pro$q$, $q$€15/month$q$, $q$monthly (annual billing available)$q$, NULL, $q$["Unlimited apps","Unlimited users","Single server"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Max$q$, $q$€25/month$q$, $q$monthly (annual billing available)$q$, NULL, $q$["Unlimited apps and users","User groups and roles","Directory server","Multiple backup destinations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Service Provider$q$, $q$€150/month$q$, $q$monthly$q$, NULL, $q$["Unlimited apps and users","Up to 10 servers"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '63b900b3-a299-4585-b839-c8a5c321ef6b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cloudron is a self-hosted platform for installing and managing web applications on a private server, founded in 2015 and headquartered in Berlin, Germany. The founders met at Nokia in 2012 and built the first prototype at NodeConf 2013 out of their own interest in running private servers.$q$, $q$Unlike SaaS competitors, Cloudron runs entirely on infrastructure the user controls, with the company stating it has no access to the server once the platform is deployed.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Cloudron offers a curated catalog of roughly 100-200+ apps, including WordPress, Nextcloud, GitLab, Rocket.Chat, Discourse, and Mastodon, most installable in one click. It automates database provisioning, DNS and TLS certificate setup, automatic app updates, encrypted per-app backups, centralized Single Sign-On (OpenID Connect and LDAP), a built-in firewall, and a full email server with automated DKIM, SPF, and DMARC configuration.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Cloudron's plans are billed per server: Free (up to 2 apps), Pro at €15/month (unlimited apps and users on one server), Max at €25/month (adds user groups/roles, a directory server, and multiple backup destinations), and Service Provider at €150/month (unlimited apps and users across up to 10 servers). Priority support is available as an add-on around $720/year.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


-- Enrichment marathon batch: Automad, automatisch, Autumn, Avalara, Avast, AvidXchange, Aviso, Avoma

-- ── Automad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Automad is a free, open-source, flat-file CMS built in PHP that requires no database, using simple text files for content and its own templating toolkit.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Automad: Free Flat-File CMS Without a Database$q$, seo_title),
  seo_meta_description = COALESCE($q$Automad is a free, open-source, database-free flat-file CMS built in PHP, with a page-tree structure and a lightweight in-browser editor.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Automad is a free, open-source flat-file content management system built in PHP, developed by Marc Anton Dahmen and maintained as a community open-source project on GitHub. Unlike traditional CMS platforms such as WordPress, Automad stores all content in plain text files and a simple folder structure rather than a database, so a site's content can be edited, version-controlled, and moved without needing MySQL or similar database software. It uses its own lightweight templating toolkit for building themes, along with a lightweight in-browser editing interface for non-technical content editors. Automad organizes content in a page-tree structure that mirrors a site's navigation, and supports custom fields, multilingual sites, and a searchable file/asset system. Because it has no database dependency, Automad sites are simple to back up, deploy, and host on standard PHP web hosting without special server configuration. The software is distributed under the MIT license with no cost or licensing fees. Automad is best suited to developers and small businesses building brochure sites, blogs, or portfolios who want a lightweight, git-friendly, dependency-light CMS alternative to database-driven systems, particularly in cases where hosting simplicity and long-term content portability matter more than the extensive plugin ecosystems of larger CMS platforms.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Flat-file storage$q$, $q$Content is stored as plain text files instead of a database, simplifying backup and portability.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$No database required$q$, $q$Runs on standard PHP hosting without MySQL or similar database setup.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$In-browser editor$q$, $q$Lightweight visual editor for content editors to update pages without touching files directly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Page-tree structure$q$, $q$Content is organized in a tree that mirrors the site's navigation hierarchy.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Custom templating toolkit$q$, $q$Build custom themes using Automad's own lightweight templating system.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Multilingual support$q$, $q$Build and manage content in multiple languages within one Automad site.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$No database dependency simplifies hosting, backup, and version control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Lightweight and fast, well-suited to small-to-medium brochure sites$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Git-friendly since content lives in plain text files$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Smaller plugin/theme ecosystem than database-driven CMS platforms like WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Flat-file architecture can be less efficient at very large scale with thousands of pages$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Requires PHP hosting knowledge to install and maintain$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Is Automad free?$q$, $q$Yes, Automad is free and open source under the MIT license with no licensing fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Does Automad require a database?$q$, $q$No, Automad is a flat-file CMS that stores content in plain text files instead of a database.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Can non-technical users edit content in Automad?$q$, $q$Yes, Automad includes a lightweight in-browser editing interface for updating content without editing files directly.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Is Automad good for large websites?$q$, $q$Automad is best suited to small-to-medium sites; very large sites with thousands of pages may be better served by a database-driven CMS.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Brochure and portfolio websites$q$, $q$Building simple, fast-loading marketing or portfolio sites without database overhead.$q$, $q$Freelancers and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Developer-friendly content sites$q$, $q$Managing content as plain text files for easy Git version control and deployment.$q$, $q$Developers and technical teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Automad is a free, open-source, flat-file content management system built in PHP by developer Marc Anton Dahmen. Instead of relying on a database like MySQL, Automad stores all page content as plain text files organized in a simple folder structure.$q$, $q$This flat-file architecture makes Automad sites easy to back up, version-control with Git, and move between hosting environments, since there is no database to migrate or configure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Automad organizes content in a page-tree structure that mirrors site navigation, and includes a lightweight in-browser editing interface so non-technical users can update content without touching the file system directly.$q$, $q$The platform uses its own templating toolkit for building custom themes, and supports custom fields, multilingual content, and a built-in file/asset management system.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Automad is free and open source under the MIT license, with no licensing fees or paid tiers. Users only pay for their own PHP-capable web hosting.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── automatisch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Automatisch is an open-source workflow automation platform, self-hostable as an alternative to Zapier or Make, connecting apps without writing code.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) + paid cloud plans$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted); Cloud plans from paid tiers$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Automatisch: Open-Source Zapier Alternative$q$, seo_title),
  seo_meta_description = COALESCE($q$Automatisch is an open-source, self-hostable workflow automation tool connecting apps with no-code triggers and actions, an alternative to Zapier.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Automatisch is an open-source business automation platform positioned as a self-hostable alternative to proprietary tools like Zapier and Make. It lets users connect different apps and automate repetitive workflows using trigger-and-action flows without writing code, and is distributed under an open-core model: the core platform is free and open source (licensed under a fair-source-style license), with an official managed Cloud version and a paid Enterprise self-hosted edition available for teams that want additional support, integrations, or hosting convenience. Because the core software can be self-hosted on a company's own infrastructure, Automatisch appeals to organizations with data privacy or compliance requirements that make sending data through third-party SaaS automation platforms undesirable. It supports connecting popular business apps and services via pre-built integrations, with new connectors added by an active open-source contributor community. Automatisch is aimed at developers, IT teams, and privacy-conscious businesses that want Zapier-style automation capabilities while retaining full control over where their workflow data is processed and stored, as well as teams looking to avoid per-task or per-zap pricing common among proprietary automation SaaS platforms.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$No-code automation builder$q$, $q$Build trigger-and-action workflows connecting apps without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Self-hostable core$q$, $q$Run the open-source platform on your own infrastructure for full data control.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$App integrations$q$, $q$Pre-built connectors for popular business apps, maintained by the open-source community.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Managed Cloud option$q$, $q$Official hosted Cloud version for teams that don't want to self-host.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Enterprise edition$q$, $q$Paid self-hosted tier with added support and features for larger organizations.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Free, open-source core that can be self-hosted for full data control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Avoids per-task/per-zap pricing common with proprietary automation SaaS tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Managed Cloud option available for teams that don't want to self-host$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Actively developed with community-contributed integrations$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Integration library is smaller than established platforms like Zapier or Make$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Self-hosting requires infrastructure setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Enterprise features and support require a paid tier$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Is Automatisch free?$q$, $q$The core platform is free and open source to self-host; a managed Cloud version and paid Enterprise edition are also available.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Can Automatisch be self-hosted?$q$, $q$Yes, Automatisch is designed to be self-hostable on your own infrastructure.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$What is Automatisch an alternative to?$q$, $q$Automatisch is positioned as an open-source alternative to workflow automation tools like Zapier and Make.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Does Automatisch require coding?$q$, $q$No, it uses a no-code flow builder for defining triggers and actions between apps.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Privacy-conscious workflow automation$q$, $q$Organizations with data privacy requirements that need to self-host their automation workflows.$q$, $q$IT teams and compliance-focused businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$Cost-effective app automation$q$, $q$Teams wanting to avoid per-task pricing common in proprietary automation SaaS tools.$q$, $q$Startups and cost-conscious teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Automatisch is an open-source workflow automation platform built as a self-hostable alternative to tools like Zapier and Make. It lets users build no-code automations that connect different apps through trigger-and-action flows.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform supports connecting business apps via pre-built integrations maintained by an active open-source community, with a no-code flow builder for defining triggers and actions.$q$, $q$Because the core is open source and self-hostable, teams can run Automatisch entirely on their own infrastructure, keeping workflow data under their own control rather than routing it through a third-party SaaS platform.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Automatisch's core platform is free to self-host. The company also offers an official managed Cloud version and a paid Enterprise self-hosted edition with additional support and features for teams that want a more turnkey experience.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Autumn ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Autumn is a billing infrastructure layer built on top of Stripe that lets SaaS companies manage pricing plans, feature entitlements, and usage-based billing via API.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2024, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Autumn: Pricing & Billing Infrastructure on Stripe$q$, seo_title),
  seo_meta_description = COALESCE($q$Autumn is a billing layer on top of Stripe for managing SaaS pricing plans, feature entitlements, and usage-based billing without custom billing code.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Autumn (useautumn.com) is a billing infrastructure platform built on top of Stripe, designed to let SaaS companies manage pricing plans, feature entitlements, and usage-based billing logic without building custom billing code in-house. Rather than replacing Stripe, Autumn sits as a layer above it, letting engineering teams define pricing plans and feature access rules through a dashboard and SDK, then handles plan changes, upgrades/downgrades, proration, usage tracking, and entitlement checks (e.g., 'has this customer hit their usage limit?') via API calls, reducing the amount of custom billing logic teams need to write and maintain. It targets developers and founders at early-stage and growth-stage SaaS companies who want to iterate quickly on pricing models — including seat-based, usage-based, and tiered/credit-based pricing — without repeatedly rewriting billing infrastructure each time pricing changes. Autumn offers a free tier for getting started, with paid plans scaling based on usage/revenue processed through the platform for companies that need higher limits, priority support, or advanced features. Because it still uses Stripe as the underlying payment processor, customers retain compliance and payment-processing guarantees from Stripe while gaining a simpler, more flexible way to model and change pricing over time.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Pricing plan management$q$, $q$Define seat-based, usage-based, tiered, or credit-based pricing plans through a dashboard and SDK.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Feature entitlements$q$, $q$Check whether a customer has access to a feature or has hit a usage limit via API.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Automated plan changes$q$, $q$Handles upgrades, downgrades, and proration logic automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Usage tracking$q$, $q$Tracks metered usage for usage-based billing plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Built on Stripe$q$, $q$Uses Stripe as the underlying payment processor for compliance and reliability.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Reduces custom billing engineering work for SaaS teams$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Free tier available to get started$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Built on Stripe, retaining Stripe's payment compliance and reliability$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Supports multiple pricing models (seat, usage, tiered, credit-based)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$As a newer platform (founded 2024), long-term ecosystem maturity is still developing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Requires a Stripe account since Autumn is a layer on top of Stripe rather than a standalone processor$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Paid tier pricing details require checking current plans as the product evolves$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Does Autumn replace Stripe?$q$, $q$No, Autumn is a billing layer built on top of Stripe; Stripe still processes payments while Autumn manages pricing plans and entitlements.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Is Autumn free?$q$, $q$Yes, Autumn offers a free tier to get started, with paid plans scaling based on usage or revenue processed.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$What pricing models does Autumn support?$q$, $q$Autumn supports seat-based, usage-based, tiered, and credit-based pricing models.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Who is Autumn for?$q$, $q$Autumn is aimed at developers and founders at SaaS companies who want to manage and iterate on pricing without custom billing code.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$SaaS pricing plan management$q$, $q$Defining and updating pricing plans without rewriting billing code each time.$q$, $q$SaaS founders and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Usage-based billing$q$, $q$Tracking metered usage and enforcing feature limits via API.$q$, $q$Developers building usage-based products$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Autumn is a billing infrastructure platform built on top of Stripe, founded in 2024 and headquartered in San Francisco, California. It lets SaaS companies manage pricing plans, feature entitlements, and usage-based billing without building custom billing logic from scratch.$q$, $q$Rather than replacing Stripe, Autumn acts as a layer above it — Stripe still processes payments, while Autumn manages the pricing plan configuration, entitlement checks, and billing logic that would otherwise require custom engineering work.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Autumn lets teams define pricing plans (seat-based, usage-based, tiered, or credit-based) through a dashboard and SDK, and handles plan upgrades/downgrades, proration, and usage tracking automatically via API.$q$, $q$Feature entitlement checks let applications query whether a customer has access to a feature or has hit a usage limit, without teams writing and maintaining that billing logic themselves.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Autumn offers a free tier for getting started, with paid plans scaling based on usage or revenue processed through the platform for companies needing higher limits, priority support, or advanced features.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Autumn is aimed at developers and founders at early-stage and growth-stage SaaS companies who want to iterate quickly on pricing models without repeatedly rebuilding billing infrastructure.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Avalara ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Avalara is a cloud-based tax compliance platform that automates sales tax, VAT, and cross-border tax calculation, filing, and remittance for businesses.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2004, founded_year),
  company_size = COALESCE($q$5,000+ employees$q$, company_size),
  headquarters = COALESCE($q$Seattle, Washington, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Avalara: Automated Tax Compliance Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Avalara automates sales tax, VAT, and cross-border tax calculation, filing, and remittance for businesses of all sizes, integrating with 1,200+ systems.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Avalara is a cloud-based tax compliance platform founded in 2004 by Rory Rawlings and Jared Vogt, headquartered in Seattle, Washington, with more than 5,000 employees. It automates tax determination, calculation, filing, and remittance across sales tax, VAT/GST, and cross-border trade compliance for businesses selling in the US and internationally. Avalara's core products include AvaTax for real-time sales tax calculation, Returns for automated tax return filing and remittance, and cross-border tools that calculate duties and tariffs for international shipments. The platform integrates with more than 1,200 accounting, ERP, and e-commerce systems, including Shopify, NetSuite, Salesforce, QuickBooks, and Microsoft Dynamics, so tax logic can be embedded directly into existing checkout and billing workflows rather than calculated manually. Avalara went public on the NYSE in 2018 and was later taken private in 2022 by Vista Equity Partners in a roughly $8.4 billion acquisition. Pricing is not published on Avalara's website and is customized based on transaction volume, jurisdictions, and which products a business needs; prospective customers must request a quote. Avalara serves businesses of all sizes, from small e-commerce sellers to large multinational enterprises, that need to stay compliant with constantly changing tax rates and rules across thousands of US and international jurisdictions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e671dda-5728-40ae-ba4d-0e752a749848';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e671dda-5728-40ae-ba4d-0e752a749848' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$AvaTax Real-Time Calculation$q$, $q$Calculates accurate sales tax rates at checkout across US and international jurisdictions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Automated Tax Filing (Returns)$q$, $q$Automates tax return preparation, filing, and remittance to tax authorities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Cross-Border Compliance$q$, $q$Calculates duties, tariffs, and import taxes for international shipments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$1,200+ Integrations$q$, $q$Connects with major accounting, ERP, and e-commerce platforms including Shopify, NetSuite, and QuickBooks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Exemption Certificate Management$q$, $q$Manages and validates tax exemption certificates for B2B transactions.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Extensive integration library covering major accounting, ERP, and e-commerce platforms$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Automates complex, constantly-changing tax rules across thousands of jurisdictions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Backed by two decades of operation and a large enterprise customer base$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Covers both domestic sales tax and international cross-border compliance$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Pricing is not published and requires a custom sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Implementation and integration setup can require significant configuration for complex businesses$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Cost may be high for very small businesses with simple, single-jurisdiction tax needs$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$What does Avalara do?$q$, $q$Avalara automates sales tax, VAT, and cross-border tax calculation, filing, and remittance for businesses selling domestically and internationally.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$How much does Avalara cost?$q$, $q$Avalara does not publish pricing; costs are customized based on transaction volume, jurisdictions, and products needed, requiring a quote from sales.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Does Avalara integrate with e-commerce platforms?$q$, $q$Yes, Avalara integrates with more than 1,200 systems including Shopify, NetSuite, Salesforce, QuickBooks, and Microsoft Dynamics.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Is Avalara publicly traded?$q$, $q$Avalara was publicly traded on the NYSE starting in 2018 but was taken private in 2022 by Vista Equity Partners.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$E-commerce sales tax automation$q$, $q$Automatically calculating and applying correct sales tax at checkout across jurisdictions.$q$, $q$E-commerce businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Multinational tax compliance$q$, $q$Managing VAT, GST, and cross-border duties for international sales and shipping.$q$, $q$Multinational enterprises$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '5e671dda-5728-40ae-ba4d-0e752a749848';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Avalara is a cloud-based tax compliance platform founded in 2004 and headquartered in Seattle, Washington, with more than 5,000 employees. It automates sales tax, VAT/GST, and cross-border trade compliance for businesses operating in the US and internationally.$q$, $q$Avalara went public on the NYSE in 2018 and was taken private in 2022 by Vista Equity Partners in an acquisition valued at roughly $8.4 billion.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AvaTax provides real-time sales tax calculation at checkout, while Avalara Returns automates tax return filing and remittance across jurisdictions. Cross-border tools calculate duties and tariffs for international shipments.$q$, $q$Avalara integrates with more than 1,200 accounting, ERP, and e-commerce platforms, including Shopify, NetSuite, Salesforce, QuickBooks, and Microsoft Dynamics, embedding tax calculation directly into existing billing and checkout workflows.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Avalara does not publish pricing on its website. Costs are customized based on transaction volume, the number of tax jurisdictions covered, and which Avalara products a business needs; prospective customers must request a quote.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Avast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Avast is a cybersecurity company offering antivirus, VPN, and online privacy software for consumers and businesses, now part of Gen Digital.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans vary by product)$q$, starting_price),
  founded_year = COALESCE(1988, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Prague, Czech Republic$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Avast: Antivirus, VPN & Online Security Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Avast offers free and paid antivirus, VPN, and privacy protection software for Windows, Mac, Android, and iOS, now part of Gen Digital.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Avast is a cybersecurity software company founded in 1988 by Eduard Kučera and Pavel Baudiš in Prague, Czechoslovakia (now the Czech Republic), where it remains headquartered. Avast is best known for Avast Free Antivirus, one of the most widely used free antivirus products globally, alongside paid products covering premium antivirus/internet security, a VPN (Avast SecureLine VPN), a password manager, and performance optimization tools (Avast Cleanup). The company also offers Avast One, a consolidated all-in-one subscription bundling antivirus, VPN, and privacy/identity protection features. Avast software runs on Windows, macOS, Android, and iOS. The company went public on the London Stock Exchange in 2018 and merged with NortonLifeLock in 2022 to form Gen Digital Inc., a publicly traded cybersecurity conglomerate that also owns Norton, LifeLock, and CCleaner; Avast continues to operate as one of Gen Digital's core consumer security brands. Avast has faced past scrutiny over data practices at its former Jumpshot analytics subsidiary (shut down in 2020) and paid an FTC settlement in 2024 related to historical data-sharing practices, which the company addressed through subsequent policy and product changes. Avast serves individual consumers seeking free or affordable malware protection, as well as small businesses through Avast Business product lines.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e4677d7e-e466-487b-b39f-1841d9797908';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e4677d7e-e466-487b-b39f-1841d9797908' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e4677d7e-e466-487b-b39f-1841d9797908';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Free Antivirus$q$, $q$Core malware and virus protection available at no cost.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Avast SecureLine VPN$q$, $q$Paid VPN service for encrypting internet traffic and masking location.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Password Manager$q$, $q$Stores and manages passwords securely across devices.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Avast Cleanup$q$, $q$Performance optimization tools for cleaning up device storage and speed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Avast One$q$, $q$All-in-one subscription bundling antivirus, VPN, and identity protection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Multi-platform support$q$, $q$Available across Windows, macOS, Android, and iOS.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'e4677d7e-e466-487b-b39f-1841d9797908';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Widely used, well-established free antivirus tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Broad product ecosystem covering antivirus, VPN, and privacy tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Available across all major desktop and mobile platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Backed by Gen Digital, a large publicly traded cybersecurity company$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e4677d7e-e466-487b-b39f-1841d9797908';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Past controversy over data-sharing practices via its former Jumpshot subsidiary led to an FTC settlement in 2024$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Free tier includes upsell prompts for paid products$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Premium features require separate or bundled paid subscriptions$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e4677d7e-e466-487b-b39f-1841d9797908';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Is Avast free?$q$, $q$Yes, Avast offers a free antivirus tier, with paid subscriptions available for premium security, VPN, and identity protection features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Who owns Avast?$q$, $q$Avast is part of Gen Digital Inc., formed by Avast's 2022 merger with NortonLifeLock, which also owns Norton, LifeLock, and CCleaner.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$What platforms does Avast support?$q$, $q$Avast software is available for Windows, macOS, Android, and iOS.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Did Avast have data privacy issues?$q$, $q$Yes, Avast's former Jumpshot analytics subsidiary (shut down in 2020) faced scrutiny over data practices, and Avast reached an FTC settlement in 2024 related to historical data-sharing.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e4677d7e-e466-487b-b39f-1841d9797908';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$Free consumer antivirus protection$q$, $q$Individuals seeking no-cost malware and virus protection.$q$, $q$Individual consumers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$All-in-one privacy and security$q$, $q$Users wanting bundled antivirus, VPN, and identity protection in one subscription.$q$, $q$Privacy-conscious consumers$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'e4677d7e-e466-487b-b39f-1841d9797908';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Avast is a cybersecurity software company founded in 1988 by Eduard Kučera and Pavel Baudiš in Prague, where it remains headquartered. It is best known for Avast Free Antivirus, one of the most widely used free antivirus products worldwide.$q$, $q$In 2022, Avast merged with NortonLifeLock to form Gen Digital Inc., a publicly traded cybersecurity conglomerate that also owns Norton, LifeLock, and CCleaner, with Avast continuing to operate as one of its core consumer security brands.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Avast's product line spans free and premium antivirus/internet security, Avast SecureLine VPN, a password manager, and Avast Cleanup performance optimization tools, alongside Avast One, an all-in-one subscription bundling antivirus, VPN, and identity protection.$q$, $q$Avast software is available across Windows, macOS, Android, and iOS, and the company also offers Avast Business product lines for small and medium businesses.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Avast offers a free antivirus tier for individual consumers, with paid subscriptions for premium security suites, VPN, and Avast One bundles. Pricing varies by product and region, with annual subscription plans being the most common billing structure.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── AvidXchange ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AvidXchange is an accounts payable and payment automation platform that helps mid-market businesses digitize invoice processing and B2B payments.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2000, founded_year),
  company_size = COALESCE($q$1,500+ employees$q$, company_size),
  headquarters = COALESCE($q$Charlotte, North Carolina, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AvidXchange: AP Automation & B2B Payments Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$AvidXchange automates accounts payable and B2B payments for mid-market businesses, integrating with 220+ accounting and ERP systems.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AvidXchange is a publicly traded (NASDAQ: AVDX) accounts payable and B2B payment automation platform founded in 2000 by Michael Praeger, Walter Hoff, and William Fung, headquartered in Charlotte, North Carolina, with more than 1,500 employees. The company digitizes and automates the invoice-to-pay process for mid-market businesses, including invoice capture and data extraction, approval workflow routing, purchase order matching, and electronic payment processing to suppliers. AvidXchange integrates with more than 220 accounting and ERP systems, and offers industry-specific solutions tailored to sectors such as real estate, construction, financial services, media, homeowners associations (HOAs), and healthcare. The platform processes payments through multiple methods, including virtual cards, ACH, and checks, and provides suppliers with a portal to track payment status. AvidXchange went public via IPO on NASDAQ in 2021. Pricing is not publicly listed and is provided through a custom quote based on transaction volume, integrations needed, and company size. It is best suited to mid-market companies processing a high volume of vendor invoices and payments that want to reduce manual AP processing time, improve visibility into cash flow, and eliminate paper-based invoice workflows.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5893a7aa-99e0-4440-9c42-21e023145c91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5893a7aa-99e0-4440-9c42-21e023145c91' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Invoice Capture & Data Extraction$q$, $q$Automatically captures and extracts data from incoming vendor invoices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Approval Workflow Automation$q$, $q$Routes invoices through configurable approval chains.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Electronic Payments$q$, $q$Processes B2B payments via virtual cards, ACH, and checks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Purchase Order Matching$q$, $q$Matches invoices against purchase orders to catch discrepancies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$220+ Integrations$q$, $q$Connects with major accounting and ERP systems used by mid-market businesses.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Industry-Specific Solutions$q$, $q$Tailored AP workflows for real estate, construction, HOAs, healthcare, and more.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Deep industry-specific customization for sectors like real estate and construction$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Broad integration library with 220+ accounting/ERP systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Established public company (NASDAQ: AVDX) with a long operating history$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Reduces manual, paper-based invoice processing at scale$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Pricing is not published and requires a custom sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Primarily built for mid-market invoice volumes, which may be more than very small businesses need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Implementation and integration setup can take time for complex accounting environments$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$What does AvidXchange do?$q$, $q$AvidXchange automates accounts payable and B2B payment processes, including invoice capture, approval routing, and electronic payments to suppliers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$How much does AvidXchange cost?$q$, $q$AvidXchange does not publish pricing; costs are determined through a custom quote based on transaction volume and integrations needed.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$What industries does AvidXchange serve?$q$, $q$AvidXchange offers industry-specific solutions for real estate, construction, financial services, media, homeowners associations, and healthcare.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Is AvidXchange publicly traded?$q$, $q$Yes, AvidXchange trades on NASDAQ under the ticker AVDX after its 2021 IPO.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$AP process automation$q$, $q$Mid-market companies automating invoice capture, approvals, and payments.$q$, $q$Finance and accounting teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Industry-specific invoice workflows$q$, $q$Businesses in real estate, construction, or healthcare needing tailored AP workflows.$q$, $q$Industry-specific finance operations$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AvidXchange is a publicly traded accounts payable and B2B payment automation platform (NASDAQ: AVDX), founded in 2000 and headquartered in Charlotte, North Carolina, with more than 1,500 employees. It digitizes the invoice-to-pay process for mid-market businesses.$q$, $q$AvidXchange went public via IPO on NASDAQ in 2021 and has grown into one of the larger dedicated AP automation providers in the US mid-market segment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform automates invoice capture and data extraction, approval workflow routing, and purchase order matching, alongside electronic payment processing via virtual cards, ACH, and checks. Suppliers get access to a portal for tracking payment status.$q$, $q$AvidXchange integrates with more than 220 accounting and ERP systems and offers industry-specific solutions for real estate, construction, financial services, media, HOAs, and healthcare.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$AvidXchange does not publish pricing on its website. Costs are determined through a custom quote based on transaction volume, required integrations, and company size.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Aviso ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Aviso is an AI-powered revenue intelligence and forecasting platform that helps sales teams predict pipeline outcomes and optimize deal execution.$q$, short_description),
  pricing_model = COALESCE(NULL, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Redwood City, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Aviso: AI Revenue Intelligence & Forecasting$q$, seo_title),
  seo_meta_description = COALESCE($q$Aviso is an AI-powered revenue intelligence platform for sales forecasting, pipeline management, and deal execution, used by enterprise sales teams.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Aviso is an AI-powered revenue intelligence and sales forecasting platform founded in 2012 by Andrew Abrahams, Nagaraj Kuppuswamy, and K.V. Rao, headquartered in Redwood City, California. It uses AI and machine learning to analyze CRM data, sales activity, and rep behavior to generate sales forecasts, flag at-risk deals, and surface pipeline insights intended to be more accurate than manually assembled spreadsheet forecasts. Core capabilities include AI-driven revenue forecasting, deal inspection and risk scoring, conversation intelligence for analyzing sales calls, pipeline management dashboards, and guided selling recommendations that suggest next-best actions for reps. Aviso integrates with major CRM platforms such as Salesforce and Microsoft Dynamics, along with email, calendar, and conferencing tools used in the sales process. The company reports serving large enterprise sales organizations across industries including technology, financial services, and manufacturing, with customers such as Dell Technologies, Splunk, and Genesys cited in various case studies. Pricing is not publicly disclosed and is provided through a custom sales quote based on team size and modules needed. Aviso is best suited to enterprise and mid-market sales operations and revenue leadership teams that manage complex, multi-stage B2B sales pipelines and want AI-assisted forecasting accuracy and deal risk visibility beyond what native CRM reporting provides.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$AI Revenue Forecasting$q$, $q$Generates sales forecasts using AI analysis of CRM and activity data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Deal Risk Scoring$q$, $q$Flags at-risk deals in the pipeline based on engagement and activity signals.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Conversation Intelligence$q$, $q$Analyzes sales calls for insights into deal health and rep performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Pipeline Management Dashboards$q$, $q$Visual dashboards for tracking pipeline health and progress.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Guided Selling$q$, $q$AI-suggested next-best actions for sales reps on active deals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$CRM Integrations$q$, $q$Connects with Salesforce, Microsoft Dynamics, and other sales tools.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$AI-driven forecasting can improve accuracy over manual spreadsheet forecasting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Deep integration with major CRM platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Used by large enterprise sales organizations across multiple industries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Combines forecasting, deal risk, and conversation intelligence in one platform$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Pricing is not publicly available and requires a custom sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Primarily built for enterprise/mid-market complexity, which may be more than small sales teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Effectiveness depends on data quality and consistent CRM/activity logging by reps$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$What does Aviso do?$q$, $q$Aviso is an AI-powered revenue intelligence platform that generates sales forecasts, flags at-risk deals, and provides pipeline visibility for sales teams.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$How much does Aviso cost?$q$, $q$Aviso does not publish pricing; costs are provided through a custom sales quote based on team size and modules needed.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Does Aviso integrate with Salesforce?$q$, $q$Yes, Aviso integrates with major CRM platforms including Salesforce and Microsoft Dynamics.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Who uses Aviso?$q$, $q$Aviso is used by enterprise and mid-market sales operations and revenue leadership teams managing complex B2B sales pipelines.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Enterprise sales forecasting$q$, $q$Revenue leaders generating AI-assisted forecasts more accurate than manual spreadsheets.$q$, $q$Sales operations and revenue leadership$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Deal risk and pipeline management$q$, $q$Sales managers identifying at-risk deals before they slip.$q$, $q$Sales managers and enterprise sales teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aviso is an AI-powered revenue intelligence and forecasting platform founded in 2012 and headquartered in Redwood City, California. It analyzes CRM data, sales activity, and rep behavior to generate sales forecasts and surface pipeline risk beyond what manual spreadsheet forecasting typically catches.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Aviso's core capabilities include AI-driven revenue forecasting, deal inspection and risk scoring, conversation intelligence for analyzing sales calls, and pipeline management dashboards.$q$, $q$Guided selling recommendations suggest next-best actions for reps, and the platform integrates with major CRM systems like Salesforce and Microsoft Dynamics, plus email, calendar, and conferencing tools.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Aviso is aimed at enterprise and mid-market sales operations and revenue leadership teams managing complex, multi-stage B2B sales pipelines who need AI-assisted forecasting accuracy and deal risk visibility.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Avoma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Avoma is an AI meeting assistant and revenue intelligence platform that records, transcribes, and analyzes sales and customer-facing calls.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from ~$19/user/month)$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Los Altos, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Avoma: AI Meeting Assistant & Revenue Intelligence$q$, seo_title),
  seo_meta_description = COALESCE($q$Avoma records, transcribes, and analyzes sales and customer meetings with AI, offering conversation intelligence, coaching, and CRM integrations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Avoma is an AI-powered meeting assistant and revenue intelligence platform founded in 2017 by Rammohan Reddy Gaddam and Vishal Naik, headquartered in Los Altos, California. It automatically records, transcribes, and summarizes sales calls, customer success meetings, and other business conversations, then applies conversation intelligence to surface talk-time ratios, sentiment, competitor mentions, objection handling patterns, and topic trends across a team's calls. Avoma includes AI-generated meeting notes and action items, deal collaboration tools, coaching scorecards for managers to evaluate rep performance, and automated CRM logging so call insights and notes sync directly into Salesforce, HubSpot, and other CRM systems. It integrates with video conferencing platforms including Zoom, Google Meet, and Microsoft Teams, as well as calendar and dialer tools. Avoma offers a freemium pricing model with a free plan for basic call recording and transcription, and paid plans (Starter, Plus, Business, and Enterprise tiers, generally priced per user per month) that unlock conversation intelligence, coaching, forecasting, and advanced CRM integration features. It is aimed at sales, customer success, and revenue operations teams that want to reduce manual note-taking, improve deal visibility, and coach reps using objective conversation data rather than relying on self-reported call summaries.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$AI Call Transcription$q$, $q$Automatically records and transcribes sales and customer meetings.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Conversation Intelligence$q$, $q$Surfaces talk-time ratios, sentiment, competitor mentions, and objection patterns.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$AI Meeting Notes & Action Items$q$, $q$Generates automatic summaries and follow-up action items from calls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Coaching Scorecards$q$, $q$Lets managers evaluate rep performance using objective call data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$CRM Auto-Logging$q$, $q$Syncs call notes and insights directly into Salesforce, HubSpot, and other CRMs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Video Conferencing Integrations$q$, $q$Works with Zoom, Google Meet, and Microsoft Teams.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Free plan available for basic recording and transcription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Combines meeting notes, coaching, and CRM logging in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Broad integrations with major video conferencing and CRM tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Objective conversation data supports more consistent rep coaching$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Advanced conversation intelligence and coaching features require paid tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Per-user pricing can add up for larger sales teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Effectiveness depends on consistent adoption of recorded/integrated meetings across the team$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Is Avoma free?$q$, $q$Avoma offers a free plan for basic call recording and transcription, with paid plans unlocking conversation intelligence, coaching, and deeper CRM integration.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$What does Avoma do?$q$, $q$Avoma is an AI meeting assistant that records, transcribes, and analyzes sales and customer meetings, providing conversation intelligence and coaching insights.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Does Avoma integrate with Zoom?$q$, $q$Yes, Avoma integrates with Zoom, Google Meet, and Microsoft Teams for meeting recording.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Does Avoma sync with CRMs?$q$, $q$Yes, Avoma automatically logs call notes and insights into Salesforce, HubSpot, and other CRM systems.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Sales call analysis and coaching$q$, $q$Sales managers reviewing recorded calls and coaching reps using objective data.$q$, $q$Sales managers and reps$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Customer success meeting notes$q$, $q$CS teams automatically capturing and summarizing customer meetings.$q$, $q$Customer success teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Avoma is an AI-powered meeting assistant and revenue intelligence platform founded in 2017 and headquartered in Los Altos, California. It records, transcribes, and summarizes sales and customer-facing meetings automatically.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Avoma applies conversation intelligence to surface talk-time ratios, sentiment, competitor mentions, and objection-handling patterns across a team's calls, alongside AI-generated meeting notes and action items.$q$, $q$The platform includes coaching scorecards for managers, deal collaboration tools, and automated CRM logging that syncs call insights into Salesforce, HubSpot, and other CRM systems, plus integrations with Zoom, Google Meet, and Microsoft Teams.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Avoma offers a free plan covering basic call recording and transcription, with paid Starter, Plus, Business, and Enterprise tiers (generally priced per user per month) unlocking conversation intelligence, coaching, forecasting, and deeper CRM integration.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


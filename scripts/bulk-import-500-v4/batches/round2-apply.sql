-- Enrichment batch: Bagisto, OpenCart, Thirty Bees, Spree Commerce, Solidus, Drupal Commerce, GrandNode, nopCommerce, Snipcart, Kill Bill, Hyperline, Autumn, ProfitWell, Vitally, Planhat, Custify, ClientSuccess, FreeScout, Zammad, UVdesk, Helpy, osTicket, Request Tracker, OTOBO, GLPI, iTop, Snipe-IT, Ralph, NetBox, Nautobot, phpIPAM, RackTables, Device42, Freshservice, InvGate Service Desk, HaloITSM, ManageEngine ServiceDesk Plus, OTRS, Horilla, MintHCM, Open HRMS, Kimai, ActivityWatch, Traggo, Solidtime, TMetric, TimeCamp, DeskTime, Jibble, OpenTimeClock, SignServer, LibreSign, Paperless-ngx, Papermerge, Mayan EDMS, Docspell, Teedy, LogicalDOC, OpenKM, SeedDMS, Alfresco, ownCloud, Seafile, Pydio Cells, FileRun, Peergos, Filestash, FileBrowser, MinIO, Garage, Ceph, SeaweedFS, GlusterFS, Restic, BorgBackup, Kopia
-- Publishes 76 bulk-imported tool(s) with full editorial content.

-- ── Bagisto ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bagisto is a free, open-source Laravel e-commerce platform for building online stores, multi-vendor marketplaces, and B2B shops.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Arabic$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$German$q$, $q$Vietnamese$q$, $q$Turkish$q$]::text[],
  seo_meta_description = $q$Bagisto is an open-source Laravel e-commerce platform for marketplaces and B2B stores, with optional managed Bagisto Cloud Hosting.$q$,
  og_description = $q$Bagisto is an open-source Laravel e-commerce platform for marketplaces and B2B stores, with optional managed Bagisto Cloud Hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Multi-vendor marketplace$q$, $q$Built-in tools for running a marketplace with multiple sellers on a single storefront.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$B2B and B2C commerce$q$, $q$Supports both direct-to-consumer storefronts and B2B selling scenarios from the same codebase.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Headless, API-first architecture$q$, $q$Exposes an API layer so the storefront can be decoupled from the commerce backend.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Point of Sale (POS)$q$, $q$Includes a POS module for selling through physical/in-person channels alongside the online store.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Omnichannel selling$q$, $q$Lets merchants sell across website, mobile, and POS channels from one admin.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Multi-tenant SaaS support$q$, $q$Can be configured to run as a multi-tenant SaaS deployment for hosting multiple stores.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Free and open source with full source code access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Large GitHub community (26K+ stars)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Built on the widely used Laravel PHP framework, easing customization for Laravel developers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Supports multi-vendor, B2B, and headless use cases out of the box$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Optional managed Bagisto Cloud Hosting removes the need to self-host$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Self-hosting requires PHP/Laravel server administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Bagisto Cloud Hosting pricing is not published on the public site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Advanced enterprise features typically require paid services from Webkul$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Is Bagisto free to use?$q$, $q$Yes, Bagisto's core platform is open source and free to download and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$What framework is Bagisto built on?$q$, $q$Bagisto is built on the Laravel PHP framework.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Can Bagisto run a multi-vendor marketplace?$q$, $q$Yes, Bagisto includes multi-vendor marketplace functionality.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Does Bagisto offer hosting?$q$, $q$Yes, Webkul offers Bagisto Cloud Hosting as a managed alternative to self-hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Multi-vendor marketplaces$q$, $q$Merchants can launch a marketplace where multiple sellers list and manage their own products.$q$, $q$Marketplace operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$B2B storefronts$q$, $q$Businesses can set up B2B-specific pricing, catalogs, and workflows.$q$, $q$B2B sellers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Headless commerce projects$q$, $q$Development teams can use Bagisto's API layer to power custom frontends.$q$, $q$Developers and agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Full source code access","Community support","Unlimited use"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Bagisto Cloud Hosting$q$, NULL, NULL, $q$["Managed hosting","Support via Webkul"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$overview$q$, $q$What is Bagisto?$q$, 2, ARRAY[$q$Bagisto is an open-source e-commerce platform built on the Laravel PHP framework. It is designed for building online stores, multi-vendor marketplaces, and B2B shops, and can also be deployed in a headless, API-first configuration.$q$, $q$The project is maintained by Webkul and is distributed as free, self-hostable software, with an optional managed Bagisto Cloud Hosting service for merchants who don't want to run their own servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$who-its-for$q$, $q$Who Bagisto is for$q$, 2, ARRAY[$q$Bagisto suits developers and agencies comfortable with Laravel who want a customizable, self-hosted e-commerce foundation, as well as merchants launching multi-vendor marketplaces or B2B storefronts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OpenCart ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenCart is a free, open-source PHP shopping cart platform with a marketplace of over 13,000 extensions and themes.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2009,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenCart is a free, open-source PHP e-commerce platform with a large marketplace of extensions, themes, and payment gateways.$q$,
  og_description = $q$OpenCart is a free, open-source PHP e-commerce platform with a large marketplace of extensions, themes, and payment gateways.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7d420822-07a5-41e5-ace9-e3a4a6821dee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7d420822-07a5-41e5-ace9-e3a4a6821dee' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Extension marketplace$q$, $q$Official marketplace offering over 13,000 modules and themes to extend store functionality.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Multi-language and multi-currency$q$, $q$Built-in support for running stores in multiple languages and currencies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Multiple payment gateways$q$, $q$Integrates with gateways including PayPal, Authorize.Net, Amazon Payments, and Klarna.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Order and catalog management$q$, $q$Core admin tools for managing products, orders, and customers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$GPL open-source license$q$, $q$Distributed under the GNU General Public License, free to download, modify, and self-host.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Completely free, open-source core software with no licensing fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$One of the largest e-commerce extension marketplaces (13,000+ listings)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$No monthly platform fees for the base software$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Long-running project with an active developer community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$GPL license permits full source code modification$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Requires self-hosting and ongoing PHP/server maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Many advanced features depend on paid third-party extensions and themes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$No official managed hosting or cloud plan from OpenCart itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Is OpenCart free?$q$, $q$Yes, OpenCart's core software is free to download and use under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Does OpenCart charge transaction fees?$q$, $q$OpenCart itself does not charge monthly platform or transaction fees; costs come from hosting, extensions, and themes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$How many extensions does OpenCart have?$q$, $q$OpenCart's official marketplace lists over 13,000 extensions and themes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$What language is OpenCart written in?$q$, $q$OpenCart is written in PHP and supports MySQL, MariaDB, and PostgreSQL databases.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Self-hosted online stores$q$, $q$Merchants who want full control over hosting and infrastructure can run OpenCart on their own servers.$q$, $q$Small to mid-sized online retailers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$Agency-built storefronts$q$, $q$Agencies can use OpenCart's extension marketplace to assemble custom stores for clients.$q$, $q$Web agencies and freelance developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$overview$q$, $q$What is OpenCart?$q$, 2, ARRAY[$q$OpenCart is a free, open-source PHP shopping cart platform originally revived and rewritten by Daniel Kerr, with its first stable release in 2009. It is self-hosted and distributed under the GNU General Public License.$q$, $q$The platform is supported by a large marketplace of over 13,000 extensions and themes, allowing merchants to add payment gateways, shipping methods, and storefront customizations without core code changes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$who-its-for$q$, $q$Who OpenCart is for$q$, 2, ARRAY[$q$OpenCart fits merchants and agencies who want a free, self-hosted PHP e-commerce foundation and are willing to manage their own server and select extensions to fill in additional functionality.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Thirty Bees ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Thirty Bees is a free, open-source e-commerce platform forked from PrestaShop 1.6, offering 500+ built-in features.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Thirty Bees is an open-source e-commerce platform forked from PrestaShop 1.6, with over 500 built-in features and an add-on marketplace.$q$,
  og_description = $q$Thirty Bees is an open-source e-commerce platform forked from PrestaShop 1.6, with over 500 built-in features and an add-on marketplace.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '54196510-1549-49ef-8799-53017ed6e08f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '54196510-1549-49ef-8799-53017ed6e08f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Flexible checkout options$q$, $q$Supports both one-page and five-step checkout flows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Responsive Bootstrap design$q$, $q$Storefronts are built on Bootstrap for responsive display across devices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Multi-site and multi-currency$q$, $q$Supports running multiple sites and currencies from one installation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Built-in SEO tools$q$, $q$Includes SEO-oriented configuration options for storefronts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$PDF invoice generation$q$, $q$Generates PDF invoices for orders natively.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$PrestaShop 1.6 module compatibility$q$, $q$Retains compatibility with many modules and themes built for PrestaShop 1.6.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Forked from the stable PrestaShop 1.6 codebase, retaining much of its module/theme ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Ships with 500+ built-in features$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Actively maintained, with a version 1.6 release in November 2024$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Emphasizes speed and security in its architecture$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Smaller community and ecosystem than PrestaShop or larger platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Some modules, themes, and support are paid add-ons via its marketplace$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Self-hosting requires ongoing server and PHP maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Is Thirty Bees related to PrestaShop?$q$, $q$Yes, Thirty Bees is an open-source fork of PrestaShop 1.6, created in 2017 to maintain a stable, compatible alternative.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Is Thirty Bees free?$q$, $q$Yes, the core platform is free and open source; paid modules, themes, and support are available through its marketplace.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Is Thirty Bees still maintained?$q$, $q$Yes, the project released version 1.6 in November 2024, indicating ongoing development.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Can I use PrestaShop 1.6 modules with Thirty Bees?$q$, $q$Thirty Bees is designed to remain compatible with many PrestaShop 1.6 modules and themes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Migrating off PrestaShop 1.6$q$, $q$Merchants on PrestaShop 1.6 who want continued stability can migrate using Thirty Bees' built-in migration tooling.$q$, $q$PrestaShop 1.6 merchants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$Self-hosted online stores$q$, $q$Merchants who want a free, self-hosted store with a large built-in feature set.$q$, $q$Small to mid-sized online retailers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$overview$q$, $q$What is Thirty Bees?$q$, 2, ARRAY[$q$Thirty Bees is an open-source e-commerce platform that began in 2017 as a fork of PrestaShop 1.6, created by developers who wanted to keep building on that stable codebase after PrestaShop moved to a less backward-compatible 1.7 release.$q$, $q$The platform ships with over 500 built-in features and remains compatible with many PrestaShop 1.6 modules and themes, while continuing its own independent development, including a version 1.6 release in November 2024.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$who-its-for$q$, $q$Who Thirty Bees is for$q$, 2, ARRAY[$q$Thirty Bees is aimed at merchants and developers who used PrestaShop 1.6 and want a compatible, actively maintained, free open-source alternative.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54196510-1549-49ef-8799-53017ed6e08f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Spree Commerce ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Spree Commerce is an open-source, headless Ruby on Rails e-commerce platform with a Next.js storefront and an optional Enterprise support tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Spree Commerce is an open-source, headless e-commerce platform built on Ruby on Rails with a Next.js storefront and enterprise support option.$q$,
  og_description = $q$Spree Commerce is an open-source, headless e-commerce platform built on Ruby on Rails with a Next.js storefront and enterprise support option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '80d28886-f2f5-4191-a617-3ed3234eb862';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '80d28886-f2f5-4191-a617-3ed3234eb862' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$REST API and TypeScript SDK$q$, $q$Exposes REST APIs and a TypeScript SDK for building custom storefronts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Next.js storefront$q$, $q$Ships with a production-ready Next.js storefront that connects to the Rails backend.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$B2B wholesale portals$q$, $q$Supports custom price lists and approval workflows for B2B buyers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Multi-vendor marketplace support$q$, $q$Can be configured to run multi-vendor marketplace scenarios.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Multi-tenant architecture$q$, $q$Supports multi-tenant deployments for embedding commerce into SaaS products.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Payment gateway abstraction$q$, $q$Integrates with gateways including Stripe, Adyen, and PayPal.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Configurable promotions engine$q$, $q$Includes a pricing and promotions engine for discounts and campaigns.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$BSD 3-Clause open-source license with full source code access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$No GMV cuts or per-transaction platform fees on the Community Edition$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Large community: 15K+ GitHub stars and 2M+ downloads$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Used by notable brands including Bookshop, Bonobos, and GoDaddy$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Headless architecture with a ready-made Next.js storefront$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Requires Ruby on Rails development expertise to self-host and customize$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Enterprise Edition pricing is not published publicly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Setting up the Next.js storefront adds implementation complexity beyond the API backend$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Is Spree Commerce free?$q$, $q$The Community Edition is free and open source under a BSD 3-Clause license; an Enterprise Edition with dedicated support is available separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$What tech stack does Spree use?$q$, $q$Spree's backend is built on Ruby on Rails, with a Next.js storefront and TypeScript SDKs for integration.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Does Spree charge transaction fees?$q$, $q$Spree states the Community Edition has no GMV cuts or transaction fees.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Who uses Spree Commerce?$q$, $q$Spree lists customers including Bookshop, Bonobos, GoDaddy, and KFC among its adopters.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Headless B2C storefronts$q$, $q$Teams can build custom storefronts against Spree's REST API and TypeScript SDK, or use its Next.js starter.$q$, $q$Developers and enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$B2B wholesale portals$q$, $q$Businesses can run B2B ordering with custom price lists and approval workflows.$q$, $q$B2B sellers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Embedded multi-tenant commerce$q$, $q$SaaS products can embed Spree's multi-tenant commerce engine.$q$, $q$SaaS platform builders$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source core","Self-hosted","BSD 3-Clause license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$Enterprise Edition$q$, NULL, NULL, $q$["Dedicated support","Mission-critical deployment assistance"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$overview$q$, $q$What is Spree Commerce?$q$, 2, ARRAY[$q$Spree Commerce is an open-source, headless e-commerce platform with a Ruby on Rails backend, a REST API, a TypeScript SDK, and a production-ready Next.js storefront. The Community Edition is BSD 3-Clause licensed and free to self-host.$q$, $q$For businesses that need dedicated support, Spree also offers an Enterprise Edition. The project reports 15K+ GitHub stars, 2M+ downloads, and use by brands such as Bookshop, Bonobos, and GoDaddy.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$who-its-for$q$, $q$Who Spree Commerce is for$q$, 2, ARRAY[$q$Spree suits developers and enterprises building headless, API-driven commerce, including B2B wholesale, multi-vendor marketplace, and multi-tenant SaaS scenarios, who are comfortable with a Ruby on Rails backend.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Solidus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Solidus is a free, open-source Ruby on Rails e-commerce framework forked from Spree in 2015, maintained by Nebulab and the community.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Solidus is an open-source Ruby on Rails e-commerce framework forked from Spree, with an optional fully hosted Solidus Cloud Enterprise plan.$q$,
  og_description = $q$Solidus is an open-source Ruby on Rails e-commerce framework forked from Spree, with an optional fully hosted Solidus Cloud Enterprise plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c34caf13-187c-4852-8539-3e8297879c3d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c34caf13-187c-4852-8539-3e8297879c3d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Merchandising and personalization$q$, $q$Supports personalization using first-party data, upsells, and content integration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Native subscriptions engine$q$, $q$Includes a subscription engine for curated boxes and recurring purchase models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Custom promotions logic$q$, $q$Allows custom promotion rules beyond simple discount codes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Internationalization$q$, $q$Supports multi-language and localization for global storefronts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$REST and GraphQL APIs$q$, $q$Provides both REST and GraphQL APIs for building custom frontends and integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Starter theme and admin dashboard$q$, $q$Ships with a starter storefront theme and an admin dashboard for store management.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Free and open source with full source code access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Highly customizable Ruby on Rails framework aimed at complex/custom commerce needs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Native subscriptions support built in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Both REST and GraphQL APIs available$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Maintained by Nebulab and an active open-source community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Requires Ruby on Rails development expertise to implement and customize$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Solidus Cloud (Enterprise) pricing is not publicly listed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Smaller ecosystem than larger hosted platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Is Solidus free to use?$q$, $q$Yes, Solidus is a free, open-source framework that can be self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$What is Solidus built on?$q$, $q$Solidus is built on Ruby on Rails and was forked from Spree in 2015.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Does Solidus offer managed hosting?$q$, $q$Yes, Solidus Cloud is offered as a fully hosted Enterprise option with dedicated support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Who maintains Solidus?$q$, $q$Solidus is maintained by Nebulab and the open-source community.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Custom-built brand storefronts$q$, $q$DTC and CPG brands needing deep customization beyond standard platforms can build on Solidus.$q$, $q$DTC and CPG brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Subscription commerce$q$, $q$Merchants running curated-box or recurring subscription models can use Solidus' native subscriptions engine.$q$, $q$Subscription-based merchants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Fully hosted enterprise commerce$q$, $q$Larger organizations can use Solidus Cloud for a fully hosted deployment with dedicated support.$q$, $q$Enterprise retailers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted","Full source code access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$Solidus Cloud (Enterprise)$q$, NULL, NULL, $q$["Fully hosted","24/7 support","Unlimited usage"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$overview$q$, $q$What is Solidus?$q$, 2, ARRAY[$q$Solidus is an open-source e-commerce framework built on Ruby on Rails. It was created in 2015 as a fork of Spree by the team behind the Bonobos store, after Spree's development direction changed, and it is now maintained by Nebulab and the open-source community.$q$, $q$Solidus targets brands that need deep customization, offering merchandising/personalization tools, a native subscriptions engine, custom promotions logic, and both REST and GraphQL APIs. A fully hosted Solidus Cloud Enterprise option is also available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$who-its-for$q$, $q$Who Solidus is for$q$, 2, ARRAY[$q$Solidus is aimed at DTC, CPG, fashion, subscription, and marketplace brands that need custom commerce logic beyond what standard SaaS platforms offer, and have (or can hire) Ruby on Rails development capacity.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Drupal Commerce ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Drupal Commerce is a free, open-source e-commerce module for the Drupal CMS, maintained by Centarro since 2010.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Drupal Commerce is a free, open-source e-commerce module that integrates content, product, and order management within the Drupal CMS.$q$,
  og_description = $q$Drupal Commerce is a free, open-source e-commerce module that integrates content, product, and order management within the Drupal CMS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Multi-site, multi-language, multi-currency$q$, $q$Supports running multiple sites, languages, and currencies from a Drupal installation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Advanced product display pages$q$, $q$Leverages Drupal's media library and layout builder for product pages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Search API integration$q$, $q$Integrates with Drupal's Search API for keyword search and faceted filtering.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Promotion and coupon management$q$, $q$Includes tools for configuring promotions and coupon codes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Custom fields and layouts$q$, $q$Merchants can configure custom fields and page layouts using Drupal's field and layout systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Third-party API integrations$q$, $q$Integrates with external applications via APIs and Drupal's event system.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Deep integration with Drupal's content management and layout tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Actively maintained, with Commerce Core 3.2.0 released in September 2025$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Flexible custom field and layout configuration for merchandising$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Paid consulting and support available through maintainer Centarro$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Requires Drupal CMS knowledge to implement and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Smaller dedicated e-commerce community compared to standalone commerce platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Self-hosting and Drupal maintenance are the merchant's responsibility$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Is Drupal Commerce free?$q$, $q$Yes, Drupal Commerce is free, open-source software; paid consulting and development services are available separately through Centarro.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$What platform does Drupal Commerce run on?$q$, $q$Drupal Commerce is a module that runs on top of the Drupal content management system.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Who maintains Drupal Commerce?$q$, $q$Drupal Commerce is maintained by Centarro, which has been involved with the project since its creation in 2010.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$What was the latest Drupal Commerce release?$q$, $q$Commerce Core 3.2.0 was released on September 10, 2025.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Content-driven commerce sites$q$, $q$Organizations that already run Drupal for content can add commerce without switching platforms.$q$, $q$Drupal-based organizations and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$Multi-site, multi-language stores$q$, $q$Businesses needing multiple storefronts in different languages/currencies from one codebase.$q$, $q$Global merchants$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$overview$q$, $q$What is Drupal Commerce?$q$, 2, ARRAY[$q$Drupal Commerce is a free, open-source e-commerce module for the Drupal content management system, maintained by Centarro since the project's creation in 2010. It integrates product, content, and order management within a single Drupal site.$q$, $q$The platform supports multi-site, multi-language, and multi-currency stores, and takes advantage of Drupal's media library, layout builder, and Search API for product display and search. Centarro also offers paid consulting and development services.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$who-its-for$q$, $q$Who Drupal Commerce is for$q$, 2, ARRAY[$q$Drupal Commerce fits agencies and organizations already building on Drupal who want to add e-commerce capability using the same CMS, content, and layout tooling they already use.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── GrandNode ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GrandNode is a free, open-source ASP.NET Core e-commerce platform released under the GPL-3 license, with optional paid support packages.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GrandNode is a free, open-source ASP.NET Core e-commerce platform under GPL-3, supporting B2B, B2C, marketplace, and headless commerce.$q$,
  og_description = $q$GrandNode is a free, open-source ASP.NET Core e-commerce platform under GPL-3, supporting B2B, B2C, marketplace, and headless commerce.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$B2C and B2B store management$q$, $q$Supports customer grouping and custom pricing for both B2C and B2B selling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Multi-vendor marketplace$q$, $q$Includes marketplace functionality for running multi-vendor storefronts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Cross-channel integration$q$, $q$Integrates with channels such as Amazon and eBay, including inventory sync.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Booking and reservation system$q$, $q$Supports booking/reservation-based products such as accommodations and services.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$E-learning and digital products$q$, $q$Supports selling digital products and paid courses.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Headless commerce API$q$, $q$Provides an API architecture for headless commerce implementations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Free and open source under the GPL-3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Built on the modern ASP.NET Core / .NET stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Covers multiple business models (B2B, marketplace, bookings, digital products) in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Headless API architecture for custom frontends$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Optional premium support packages available for teams that want vendor support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Requires .NET development expertise to self-host and customize$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Smaller community than PHP-based open-source e-commerce platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Specific premium support pricing is not published on the public site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Is GrandNode free?$q$, $q$Yes, GrandNode's core platform is free and open source under the GPL-3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$What technology is GrandNode built on?$q$, $q$GrandNode is built on ASP.NET Core (.NET).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Does GrandNode support B2B selling?$q$, $q$Yes, GrandNode supports B2B store management including customer grouping and custom pricing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Is paid support available for GrandNode?$q$, $q$Yes, GrandNode offers premium support packages and custom services in addition to its free open-source core.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Multi-model commerce on .NET$q$, $q$Teams standardized on .NET can run B2B, B2C, marketplace, or booking-based commerce from one platform.$q$, $q$.NET development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$Headless commerce backends$q$, $q$Developers can use GrandNode's API to power custom storefronts.$q$, $q$Developers and agencies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$overview$q$, $q$What is GrandNode?$q$, 2, ARRAY[$q$GrandNode is a free, open-source e-commerce platform built on ASP.NET Core and released under the GPL-3 license. It is designed to support multiple business models, including B2B, B2C, multi-vendor marketplace, bookings/reservations, and digital products/e-learning.$q$, $q$The core platform is self-hosted and free to use, with optional premium support packages and custom implementation services available for teams that need vendor support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$who-its-for$q$, $q$Who GrandNode is for$q$, 2, ARRAY[$q$GrandNode fits developers and agencies working in the .NET ecosystem who want a single open-source platform capable of handling B2B, marketplace, booking, or digital-product commerce.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── nopCommerce ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$nopCommerce is a free, open-source ASP.NET Core e-commerce platform first released in 2008, downloaded more than 3 million times.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$nopCommerce is a free, open-source ASP.NET Core e-commerce platform released under the nopCommerce Public License, with optional paid support.$q$,
  og_description = $q$nopCommerce is a free, open-source ASP.NET Core e-commerce platform released under the nopCommerce Public License, with optional paid support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a28c91f9-301a-4413-8b14-a58c3ee344df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a28c91f9-301a-4413-8b14-a58c3ee344df' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$ASP.NET Core architecture$q$, $q$Built on ASP.NET Core with an MS SQL Server backend.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Multi-store support$q$, $q$Supports running multiple stores from a single installation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Plugin and theme marketplace$q$, $q$Offers a marketplace of plugins and themes to extend store functionality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Built-in SEO tools$q$, $q$Includes SEO-friendly URL and metadata configuration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Discount and promotion engine$q$, $q$Includes tools for configuring discounts and promotional campaigns.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Multi-currency and multi-language$q$, $q$Supports selling in multiple currencies and languages.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Free to download and use commercially, with no license fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Long-running project first released in 2008, with 3M+ downloads$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Actively developed, with version 4.90.6 released in July 2026$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Extensive plugin and theme marketplace$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Optional premium support available for teams that need it$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Requires ASP.NET Core / .NET hosting expertise to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Many themes and plugins in the marketplace are paid add-ons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Distributed under a custom nopCommerce Public License rather than a standard OSI license$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Is nopCommerce free?$q$, $q$Yes, nopCommerce is free to download, install, and use commercially, released under the nopCommerce Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$What technology does nopCommerce use?$q$, $q$nopCommerce is built on ASP.NET Core with an MS SQL Server backend.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$How long has nopCommerce been around?$q$, $q$Development started in 2008, and the platform has been downloaded more than 3 million times.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Does nopCommerce offer paid support?$q$, $q$Yes, optional premium support and paid plugins/themes are available alongside the free core platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Self-hosted .NET storefronts$q$, $q$Merchants and agencies standardized on Microsoft/.NET infrastructure can run nopCommerce as their store platform.$q$, $q$.NET-based merchants and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$Multi-store retail operations$q$, $q$Businesses running several storefronts can manage them from a single nopCommerce installation.$q$, $q$Multi-brand retailers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$overview$q$, $q$What is nopCommerce?$q$, 2, ARRAY[$q$nopCommerce is a free, open-source e-commerce platform built on ASP.NET Core with an MS SQL Server backend. Development began in 2008, and the platform has since been downloaded more than 3 million times.$q$, $q$The software is distributed under the nopCommerce Public License and is free to download and use commercially. An ecosystem of plugins, themes, and optional premium support is available for merchants who want additional functionality or vendor assistance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$who-its-for$q$, $q$Who nopCommerce is for$q$, 2, ARRAY[$q$nopCommerce suits merchants and development teams working within a Microsoft/.NET technology stack who want a free, self-hosted, actively maintained e-commerce platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Snipcart ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Snipcart is a drop-in shopping cart and checkout platform for any website, priced at 2% per transaction with a $20/month minimum.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$2% per transaction (minimum $20/month for stores under $1,000 USD in monthly sales)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Snipcart is a drop-in shopping cart and checkout platform for any website, charging 2% per transaction with a free testing environment.$q$,
  og_description = $q$Snipcart is a drop-in shopping cart and checkout platform for any website, charging 2% per transaction with a free testing environment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '33d8b578-c949-41fd-b5e1-f9c8acf9190a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '33d8b578-c949-41fd-b5e1-f9c8acf9190a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Drop-in cart snippet$q$, $q$Add a shopping cart and checkout flow to an existing site with an HTML/JS snippet, no redirect required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Physical and digital products$q$, $q$Supports selling both physical goods and digital products.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Abandoned cart recovery$q$, $q$Includes tools to recover abandoned shopping carts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Multi-currency and tax management$q$, $q$Handles multiple currencies and tax calculation for orders.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Multiple payment gateways$q$, $q$Integrates with several payment gateways for checkout.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$API and webhooks$q$, $q$Provides an API and webhooks for custom integrations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Works with virtually any tech stack, including Jamstack, React, Vue, WordPress, and Laravel sites$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Free, unlimited testing environment with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Pure usage-based pricing with no separate platform subscription fee$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Unlimited products, variants, and domains on the single plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Built-in abandoned cart recovery and tax handling$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$2% transaction fee applies on top of payment gateway fees$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$$20/month minimum fee for stores under $1,000 in monthly sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Requires developer integration into an existing site rather than providing a full storefront builder$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$How much does Snipcart cost?$q$, $q$Snipcart charges 2% per transaction, with a $20/month minimum fee for stores generating under $1,000 USD in monthly sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Is Snipcart free to test?$q$, $q$Yes, Snipcart's testing/development environment is free with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$What platforms does Snipcart work with?$q$, $q$Snipcart is designed to work with any tech stack, including Jamstack, React, Vue, WordPress, and Laravel.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Can Snipcart sell digital products?$q$, $q$Yes, Snipcart supports selling both physical and digital products.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Adding a cart to a custom-built site$q$, $q$Developers can add checkout functionality to a static or custom site without building a cart from scratch.$q$, $q$Developers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Selling on a Jamstack or headless site$q$, $q$Sites built with static site generators or headless CMSs can add commerce via Snipcart's drop-in cart.$q$, $q$Jamstack/headless site owners$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$Pay-as-you-go$q$, $q$2% per transaction ($20/month minimum)$q$, $q$monthly$q$, $q$["Unlimited products, variants, and domains","Full API and webhooks access","Multiple payment gateways","Free testing environment"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$overview$q$, $q$What is Snipcart?$q$, 2, ARRAY[$q$Snipcart is a shopping cart and checkout platform that developers add to an existing website via an HTML/JS snippet, rather than requiring a full storefront rebuild. It supports physical and digital products, abandoned cart recovery, multi-currency and tax handling, and multiple payment gateways.$q$, $q$Pricing is usage-based: Snipcart charges 2% per transaction, with a $20/month minimum for stores under $1,000 in monthly sales, and offers a free, unlimited testing environment with no credit card required.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$who-its-for$q$, $q$Who Snipcart is for$q$, 2, ARRAY[$q$Snipcart is built for developers and agencies who want to bolt e-commerce functionality onto an existing site — including Jamstack, React, Vue, WordPress, and Laravel builds — without adopting a full standalone e-commerce platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Kill Bill ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source subscription billing and payments platform you self-host for full data control.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kill Bill is a free, open-source (Apache 2.0) billing platform for subscription, usage-based, and multi-tenant billing you self-host.$q$,
  og_description = $q$Kill Bill is a free, open-source (Apache 2.0) billing platform for subscription, usage-based, and multi-tenant billing you self-host.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '07fb8b20-d497-452b-ab9e-d61603e77eb7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '07fb8b20-d497-452b-ab9e-d61603e77eb7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Subscription billing engine$q$, $q$Supports usage-based, prepaid, postpaid, and multi-tenant subscription models.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Payment gateway plugins$q$, $q$Native plugin support for Stripe, Adyen, PayPal, Braintree, and other gateways.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Kaui admin UI$q$, $q$A back-office web interface for managing subscriptions and payments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Plugin architecture$q$, $q$An extensible framework for building custom integrations and modifications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Tax engine integrations$q$, $q$Connects to tax and compliance engines such as Avalara and Vertex.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Self-hosted deployment$q$, $q$Deploys via Docker or Kubernetes in your own infrastructure, avoiding SaaS lock-in.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Core platform is free and fully open source under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Full data ownership since it runs in your own infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$No per-transaction or revenue-percentage fees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Long track record, in production for over 15 years$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Plugin architecture supports many payment gateways and tax engines$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Requires engineering resources to deploy, operate, and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$No official low-code hosted option from the core project itself (managed hosting is via third parties)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Enterprise accelerator (Aviate) is a separate proprietary offering, not part of the free core$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Is Kill Bill free?$q$, $q$Yes, the core Kill Bill platform is open source under the Apache License 2.0 and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Do I need to host Kill Bill myself?$q$, $q$Kill Bill is designed to be self-hosted via Docker or Kubernetes; third-party providers such as ChaChing offer managed hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$What payment gateways does Kill Bill support?$q$, $q$It has native plugin support for Stripe, Adyen, PayPal, Braintree, and other gateways.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$What language is Kill Bill written in?$q$, $q$The codebase is primarily Java, with smaller portions in JavaScript, CSS, Shell, and PL/pgSQL.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Custom subscription billing$q$, $q$Engineering teams that need full control over billing logic build on Kill Bill instead of a black-box SaaS billing vendor.$q$, $q$Engineering and finance teams at growth-stage startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Regulated or high-volume billing$q$, $q$Enterprises with compliance or data-residency requirements self-host Kill Bill to keep billing data in-house.$q$, $q$Enterprises with compliance requirements$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$overview$q$, $q$What is Kill Bill?$q$, 2, ARRAY[$q$Kill Bill is an open-source billing and payments platform, released under the Apache 2.0 license, that handles subscription billing, usage-based billing, and payment processing.$q$, $q$It was founded independently in 2010 and is designed to be self-hosted, giving teams full control over their billing data and logic instead of relying on a third-party SaaS billing vendor.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$who-its-for$q$, $q$Who Kill Bill is for$q$, 2, ARRAY[$q$Kill Bill suits engineering teams that want to build custom billing logic without vendor lock-in or per-transaction fees, and organizations with compliance or data-residency needs that require self-hosted billing infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Hyperline ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Revenue management platform that automates quote-to-cash billing, invoicing, and usage metering for SaaS companies.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$199/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Paris, France$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Hyperline automates SaaS billing, CPQ, invoicing, and usage-based metering, starting at $199/month plus a percentage of revenue.$q$,
  og_description = $q$Hyperline automates SaaS billing, CPQ, invoicing, and usage-based metering, starting at $199/month plus a percentage of revenue.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$CPQ (Configure, Price, Quote)$q$, $q$Streamlines quote creation and contract management for sales teams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Automated billing and invoicing$q$, $q$Handles flexible pricing models, invoicing automation, and revenue recognition.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Usage-based billing$q$, $q$Real-time event ingestion, metering, and consumption-based pricing rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Global invoicing compliance$q$, $q$Supports compliant invoicing and e-invoicing certification across 100+ countries.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Native payment integrations$q$, $q$Connects to Stripe, GoCardless, Mollie, and Airwallex for payment collection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$CRM and accounting integrations$q$, $q$Integrates with tools such as HubSpot, Salesforce, and Attio (add-on pricing applies).$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Combines CPQ, billing, and usage metering in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Global invoicing compliance across 100+ countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Offers a free trial with 10 invoices and no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$SOC2, ISO27001, and GDPR certified$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Pricing includes a percentage-of-revenue fee on top of the monthly base price$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$CRM and accounting integrations cost extra per integration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$High-volume tier requires contacting sales for custom pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$How much does Hyperline cost?$q$, $q$The Quote to Cash plan starts at $199/month plus 0.6% of revenue; a usage-billing tier is $299/month plus 0.7% of revenue, and a high-volume enterprise tier is custom-priced.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Does Hyperline offer a free trial?$q$, $q$Yes, the Quote to Cash plan includes 10 free invoices to start, with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$What payment providers does Hyperline integrate with?$q$, $q$It natively integrates with Stripe, GoCardless, Mollie, and Airwallex.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Where is Hyperline based?$q$, $q$Hyperline is headquartered in Paris, France.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$SaaS quote-to-cash automation$q$, $q$Sales and finance teams use Hyperline to move from quote creation to invoicing and revenue recognition in one workflow.$q$, $q$Finance and revenue operations teams at SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Usage-based billing$q$, $q$Companies with metered or seat-based pricing use Hyperline to track consumption in real time and bill accurately.$q$, $q$Engineering and finance teams billing on usage$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Quote to Cash$q$, $q$$199/month + 0.6% of revenue$q$, $q$monthly$q$, $q$["10 free invoices to start","CPQ and subscriptions","Compliant invoicing and payment collection","Tax management and customer portal","Native Stripe, GoCardless, Mollie, Airwallex integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Quote to Cash + Usage$q$, $q$$299/month + 0.7% of revenue$q$, $q$monthly$q$, $q$["All Quote to Cash features","Unlimited event ingestion","Real-time consumption tracking","Metered and seat-based billing","Prepaid credit management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Quote to Cash + High Volume$q$, $q$Custom$q$, NULL, $q$["For companies with >$5M ARR","Unlimited invoices","Premium support","Migration and onboarding assistance"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$overview$q$, $q$What is Hyperline?$q$, 2, ARRAY[$q$Hyperline is a revenue management platform, based in Paris, that automates the quote-to-cash process for subscription businesses, combining CPQ, billing, invoicing, and usage-based metering.$q$, $q$It connects to CRMs and payment providers to automate the flow from a sales quote through to compliant global invoicing and revenue recognition.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$who-its-for$q$, $q$Who Hyperline is for$q$, 2, ARRAY[$q$Hyperline is built for finance and revenue operations teams at SaaS and subscription companies that need to automate billing across complex pricing models, including usage-based and seat-based plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Autumn ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source billing platform that sits between Stripe and your app to handle plans, usage tracking, and AI credits.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Autumn is an open-source (Apache 2.0) billing layer over Stripe for usage tracking, feature gating, and AI credit billing.$q$,
  og_description = $q$Autumn is an open-source (Apache 2.0) billing layer over Stripe for usage tracking, feature gating, and AI credit billing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Unified billing API$q$, $q$One API for managing plans, usage tracking, and AI credit systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Stripe integration layer$q$, $q$Sits on top of Stripe to handle upgrades, downgrades, cancellations, and failed payments without manual webhook handling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Feature gating (check)$q$, $q$Verifies whether a customer has access to a given feature before granting it.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Usage tracking (track)$q$, $q$Records usage-based events for metered billing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Self-serve and enterprise billing$q$, $q$Supports both self-serve payment flows and custom enterprise deals from one source of truth.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Open-source self-hosting$q$, $q$The full platform is open source (Apache 2.0) on GitHub and can be self-hosted.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Fully open source under Apache 2.0, with source available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Removes the need to build custom usage-tracking and billing logic$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Purpose-built for AI startups billing on usage and AI credits$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Used in production by companies including Mintlify and Firecrawl$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Detailed cloud pricing tiers are not fully published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Best suited to teams already built around Stripe$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Newer project with a smaller ecosystem than established billing platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Is Autumn open source?$q$, $q$Yes, Autumn is open source under the Apache 2.0 license, with its source code on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Does Autumn replace Stripe?$q$, $q$No, Autumn sits on top of Stripe as a billing logic layer, handling plans, usage, and upgrades/downgrades rather than replacing payment processing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Can I self-host Autumn?$q$, $q$Yes, since the project is open source, though the quickest way to start is through Autumn's hosted cloud service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$What is Autumn used for?$q$, $q$It is used to manage subscription plans, usage-based billing, feature gating, and AI credit systems, particularly for AI startups.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$AI credit billing$q$, $q$AI startups use Autumn to meter and bill for AI usage credits without building custom billing infrastructure.$q$, $q$AI and SaaS startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Feature gating and usage tracking$q$, $q$Engineering teams use Autumn's check and track APIs to gate features and record usage events tied to Stripe subscriptions.$q$, $q$Engineering teams building on Stripe$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$overview$q$, $q$What is Autumn?$q$, 2, ARRAY[$q$Autumn is an open-source pricing and billing platform, licensed under Apache 2.0, that acts as a layer between Stripe and an application to manage plans, usage tracking, and AI credit systems.$q$, $q$It provides API functions for attaching purchase flows, checking feature access, and tracking usage events, removing the need to hand-build billing logic around Stripe webhooks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$who-its-for$q$, $q$Who Autumn is for$q$, 2, ARRAY[$q$Autumn is aimed at AI and SaaS startups that need flexible, usage-based billing, including AI credit metering, and want a source of truth spanning both self-serve payments and enterprise deals.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── ProfitWell ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free subscription analytics tool from Paddle that tracks MRR, churn, and other SaaS metrics.$q$,
  pricing_model = $q$Free$q$,
  starting_price = $q$$0$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ProfitWell Metrics by Paddle is a free subscription analytics tool tracking MRR, churn, LTV, and benchmarking against 30,000+ companies.$q$,
  og_description = $q$ProfitWell Metrics by Paddle is a free subscription analytics tool tracking MRR, churn, LTV, and benchmarking against 30,000+ companies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2a4f0fe3-b308-423c-aecf-cdff842abdcc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2a4f0fe3-b308-423c-aecf-cdff842abdcc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Revenue reporting$q$, $q$Tracks core subscription KPIs including MRR, ARR, churn, and customer lifetime value.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Customer health scoring$q$, $q$Identifies customers likely to convert, upgrade, or churn.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Industry benchmarking$q$, $q$Compares performance against a dataset of over 30,000 subscription companies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Segmentation$q$, $q$Analyzes customer cohorts and pricing-plan data to surface growth trends.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Billing system integrations$q$, $q$Connects to Paddle, Stripe, Chargebee, Braintree, Zuora, and Recurly.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Core analytics dashboard is completely free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Works with multiple billing systems, not just Paddle$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Benchmarks against a large dataset of subscription companies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Backed by Paddle, an established payments company$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Now owned and operated by Paddle rather than as an independent standalone company$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Advanced retention/pricing tools once bundled under the ProfitWell brand have been folded into Paddle's broader product line$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Is ProfitWell free?$q$, $q$Yes, ProfitWell Metrics is completely free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Is ProfitWell still an independent company?$q$, $q$No, ProfitWell was acquired and is now operated as ProfitWell Metrics, part of Paddle's product ecosystem.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$What billing systems does ProfitWell Metrics work with?$q$, $q$It integrates with Paddle, Stripe, Chargebee, Braintree, Zuora, and Recurly, among others.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$SaaS metrics tracking$q$, $q$Finance and founder teams use ProfitWell Metrics to monitor MRR, churn, and LTV without building custom reporting.$q$, $q$SaaS founders and finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Competitive benchmarking$q$, $q$Companies compare their subscription metrics against a large dataset of peer companies.$q$, $q$SaaS operators evaluating growth performance$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$ProfitWell Metrics$q$, $q$$0$q$, NULL, $q$["MRR, ARR, churn, and LTV dashboards","Industry benchmarking","Segmentation by cohort and pricing plan","Integrations with major billing systems"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$overview$q$, $q$What is ProfitWell?$q$, 2, ARRAY[$q$ProfitWell (now branded ProfitWell Metrics) is a free subscription analytics tool that reports on MRR, ARR, churn, and customer lifetime value for SaaS businesses.$q$, $q$It was acquired and is now part of Paddle, and it continues to operate as a free tool that works across multiple billing systems, not only Paddle's own.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$who-its-for$q$, $q$Who ProfitWell is for$q$, 2, ARRAY[$q$ProfitWell suits SaaS founders and finance teams who want a free, ready-made view of subscription revenue metrics and benchmarking against other subscription companies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Vitally ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Customer success platform combining data, health scoring, and AI-driven automation for CSM teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Vitally is an AI-powered customer success platform with health scoring, playbooks, and automation for B2B SaaS teams.$q$,
  og_description = $q$Vitally is an AI-powered customer success platform with health scoring, playbooks, and automation for B2B SaaS teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '354544ee-5844-47e0-abfb-03b3c7ee9886';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '354544ee-5844-47e0-abfb-03b3c7ee9886' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Vitally AI$q$, $q$Generates customer summaries, follow-up tasks, and insights from conversations and unstructured data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Health scores$q$, $q$Dynamic customer health assessment based on lifecycle stage or segment.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Automation and playbooks$q$, $q$Automates CSM assignment, task creation, and other customer management workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Project management$q$, $q$Agile-style project tracking to guide customers through onboarding milestones.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Customer surveys and NPS$q$, $q$Built-in feedback collection tools for measuring customer sentiment.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Reporting and dashboards$q$, $q$KPI visualization and team performance analytics.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$AI features (Vitally AI) built directly into the workflow for summaries and task generation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Includes unlimited automations and unlimited observer seats on all plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$High G2 rating (4.5 stars from 700+ reviews)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Serves 600+ B2B SaaS organizations including Zapier and Pleo$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Pricing is not published; requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Three plan tiers (Tech-Touch, Hybrid-Touch, High-Touch) require evaluation to determine fit$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$How much does Vitally cost?$q$, $q$Vitally does not publish pricing; you need to request a quote for its Tech-Touch, Hybrid-Touch, or High-Touch plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Does Vitally include AI features?$q$, $q$Yes, Vitally AI generates customer summaries, follow-up tasks, and insights from customer data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Who uses Vitally?$q$, $q$Vitally serves B2B SaaS companies including Zapier, Gorgias, Navattic, Pleo, and Productboard.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Customer health monitoring$q$, $q$CS teams track dynamic health scores to identify at-risk or expansion-ready accounts.$q$, $q$Customer success managers and CS leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$CS workflow automation$q$, $q$Teams use playbooks and automation to standardize onboarding and renewal processes.$q$, $q$CS operations teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Tech-Touch$q$, $q$Custom$q$, NULL, $q$["All Vitally Core Features","Unlimited Automations","Unlimited Observer Seats","Single Sign-on","Full Integration Library"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Hybrid-Touch$q$, $q$Custom$q$, NULL, $q$["All Vitally Core Features","Unlimited Automations","Unlimited Observer Seats","Single Sign-on","Full Integration Library"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$High-Touch$q$, $q$Custom$q$, NULL, $q$["Unlimited Full Seats","All Vitally Core Features","Unlimited Automations","Single Sign-on","Full Integration Library"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$overview$q$, $q$What is Vitally?$q$, 2, ARRAY[$q$Vitally is a customer success platform that combines customer data, health scoring, project management, and AI-driven automation in one workspace for CSM teams.$q$, $q$Its Vitally AI feature generates customer summaries, follow-up tasks, and insights drawn from conversations and unstructured customer data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$who-its-for$q$, $q$Who Vitally is for$q$, 2, ARRAY[$q$Vitally is built for customer success managers, CS leaders, and CS operations teams at B2B SaaS companies looking to scale account management with automation and health scoring.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Planhat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Agentic customer platform combining CRM, customer success, and professional services automation for B2B teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Planhat is an agentic customer platform unifying CRM, customer success, and professional services automation for B2B teams.$q$,
  og_description = $q$Planhat is an agentic customer platform unifying CRM, customer success, and professional services automation for B2B teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '599548f2-9d79-4758-9183-d5c016b8b2a6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '599548f2-9d79-4758-9183-d5c016b8b2a6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Agentic automation$q$, $q$Delegates customer lifecycle processes to governed agents for faster execution.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Unified customer model$q$, $q$Builds a comprehensive customer profile integrating CRM data, time-series data, and external telemetry.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Multi-application platform$q$, $q$Functions as a Customer Success Platform, CRM, or Professional Services Automation tool.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$AI-enhanced health scoring$q$, $q$Dynamically scores customer health and automatically captures touchpoints.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$CRM integrations$q$, $q$Syncs with major CRM systems to keep customer data unified.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$MCP server for Claude$q$, $q$Offers an MCP server integration for use with Anthropic's Claude.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Combines CRM, customer success, and PSA in a single platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Recognized on G2's Momentum Grid and Gartner's MarketScape/Magic Quadrant for CSM platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Serves companies across SaaS, IT services, healthcare, and security verticals$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Offers forward-deployed implementation and consulting support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$No public pricing; requires an enquiry/quote for every plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Add-ons like the upgraded AI platform and advanced portals are priced separately$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Breadth of the platform (CRM + CSP + PSA) can mean a longer evaluation process$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$How much does Planhat cost?$q$, $q$Planhat uses a custom, quote-based pricing model; you must contact sales via an 'Enquire' request for pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Is Planhat just a customer success platform?$q$, $q$No, Planhat can function as a Customer Success Platform, a CRM, or Professional Services Automation software, or a combination of all three.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Does Planhat integrate with AI tools?$q$, $q$Yes, it offers an MCP Server integration with Anthropic's Claude and includes AI-enhanced health scoring.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Unified customer lifecycle management$q$, $q$Commercial teams use Planhat to manage sales, onboarding, and renewals from one unified customer model.$q$, $q$B2B commercial and customer success teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Professional services delivery$q$, $q$Teams delivering implementation and services use Planhat's PSA capabilities alongside CS workflows.$q$, $q$Professional services and implementation teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$overview$q$, $q$What is Planhat?$q$, 2, ARRAY[$q$Planhat is an agentic customer platform for B2B commercial teams that unifies CRM, customer success, and professional services automation around a single customer data model.$q$, $q$It uses governed AI agents to automate processes across the customer lifecycle and offers integrations including CRM syncing and an MCP server for Anthropic's Claude.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$who-its-for$q$, $q$Who Planhat is for$q$, 2, ARRAY[$q$Planhat targets B2B enterprises and commercial teams, including sales, customer success, and professional services, across startups, mid-market, and enterprise companies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Custify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-native customer success platform for SaaS teams to score customer health, detect churn risk, and automate playbooks.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Custify is an AI-native customer success platform with churn detection, health scoring, and automated playbooks for SaaS teams.$q$,
  og_description = $q$Custify is an AI-native customer success platform with churn detection, health scoring, and automated playbooks for SaaS teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e817d4a-bca3-442e-be39-93f237e411c9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e817d4a-bca3-442e-be39-93f237e411c9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Customer 360$q$, $q$A unified view of customer adoption and usage patterns.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Customer health scoring$q$, $q$KPI-based health assessment across a customer portfolio.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Churn detection$q$, $q$AI-powered early warning system that flags at-risk accounts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Expansion engine$q$, $q$Identifies upsell and renewal opportunities among existing customers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Automation and playbooks$q$, $q$Converts business processes into automated workflows and task routing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$CustifyAI$q$, $q$Generates playbooks, account summaries, and sentiment analysis.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Native integrations with 200+ tools including HubSpot, Salesforce, and Zendesk, plus Zapier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$SOC 2 certified$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Concierge onboarding with implementation completed within 4 weeks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$AI-driven churn detection and playbook generation built in$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Pricing is not published; visitors must contact the pricing page or sales for details$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Aimed primarily at subscription-based SaaS companies, less suited to non-SaaS businesses$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$How much does Custify cost?$q$, $q$Custify does not publish specific pricing tiers on its site; interested customers need to check the pricing page or contact sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$What integrations does Custify support?$q$, $q$Custify connects with over 200 tools, including HubSpot, Salesforce, Zoho, Intercom, Zendesk, and Pipedrive via native integrations and Zapier.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Is Custify SOC 2 certified?$q$, $q$Yes, Custify holds SOC 2 certification.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Churn prevention$q$, $q$CS teams use Custify's AI-powered health scoring and churn detection to identify at-risk accounts early.$q$, $q$Customer success managers at SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$Expansion revenue$q$, $q$Teams use the expansion engine to surface upsell and renewal opportunities across their customer base.$q$, $q$Customer success and account management teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$overview$q$, $q$What is Custify?$q$, 2, ARRAY[$q$Custify is an AI-native customer success platform that centralizes customer data, automates workflows, and helps SaaS teams reduce churn and identify growth opportunities.$q$, $q$It includes CustifyAI for generating playbooks, summaries, and sentiment analysis, alongside customer health scoring and a churn-detection early warning system.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$who-its-for$q$, $q$Who Custify is for$q$, 2, ARRAY[$q$Custify is built for subscription-based SaaS companies and their customer success managers who want to scale account management without proportionally growing headcount.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── ClientSuccess ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Customer success platform with health scoring, journey management, and an AI co-pilot to reduce churn.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ClientSuccess offers SuccessScore health tracking, journey management, and an AI co-pilot to help B2B SaaS teams reduce churn.$q$,
  og_description = $q$ClientSuccess offers SuccessScore health tracking, journey management, and an AI co-pilot to help B2B SaaS teams reduce churn.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b85ba652-1c1b-4a44-ba69-19c2f681f148';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b85ba652-1c1b-4a44-ba69-19c2f681f148' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$SuccessScore$q$, $q$A 360-degree customer health tracking system combining usage, adoption, feedback, and sentiment data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Pulse$q$, $q$Weekly and real-time reporting on account status.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Customer journey management$q$, $q$Manages the customer lifecycle including onboarding, adoption, and renewal.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$SmartCS$q$, $q$An AI co-pilot that provides automated communications and generative AI features.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Customer portals$q$, $q$Branded portals with automated project templates for collaborative customer engagement.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$NPS Analyzer$q$, $q$Tracks and analyzes Net Promoter Score data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Pricing scales by number of CSM users and modules needed, avoiding a one-size-fits-all plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$No setup or implementation fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Offers 15-20% discounts for annual contracts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$AICPA SOC certified$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Recently acquired Product Signals to add product feedback capabilities$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Specific dollar pricing is not published; requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Startup package caps at 10 customers and 500 full licenses, requiring an upgrade as accounts grow$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$How is ClientSuccess priced?$q$, $q$Pricing is based on the number of customer success managers using the platform and the modules selected, across Startup, Growth, and Enterprise packages, with no public list price.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Does ClientSuccess offer an AI feature?$q$, $q$Yes, SmartCS is an AI co-pilot that provides automated communications and generative AI capabilities.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Are there discounts for annual billing?$q$, $q$Yes, ClientSuccess offers roughly 15-20% off month-to-month rates for annual contracts, plus multi-year discounts.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Churn reduction$q$, $q$CS teams use SuccessScore and Pulse reporting to monitor account health and intervene before churn.$q$, $q$Customer success teams at mid-market and enterprise SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Customer onboarding and renewals$q$, $q$Teams manage the full customer journey, from onboarding through renewal, using branded customer portals.$q$, $q$CS and account management teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Startup$q$, $q$Custom$q$, NULL, $q$["Up to 10 customers","Up to 500 full licenses","Client 360 Dashboard","Integration Library","Playbooks","Health Scoring"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Growth$q$, $q$Custom$q$, NULL, $q$["Up to 50 customers","Up to 5,000 full licenses","Dedicated CSM","Custom Dashboards/Reports","Customer Portal (add-on)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited customers","Unlimited full licenses","All modules fully enabled"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$overview$q$, $q$What is ClientSuccess?$q$, 2, ARRAY[$q$ClientSuccess is a customer success platform built to reduce churn and grow customer revenue through health tracking, journey management, and an AI co-pilot called SmartCS.$q$, $q$Its SuccessScore system combines usage, adoption, feedback, and sentiment data into a single 360-degree view of account health.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$who-its-for$q$, $q$Who ClientSuccess is for$q$, 2, ARRAY[$q$ClientSuccess targets mid-market to enterprise B2B SaaS companies that want to scale customer success operations across the full customer lifecycle.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── FreeScout ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source help desk and shared inbox built with PHP/Laravel that you self-host.$q$,
  pricing_model = $q$Free$q$,
  starting_price = $q$$0$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FreeScout is a free, open-source (AGPL-3.0) self-hosted help desk and shared inbox with unlimited agents, tickets, and mailboxes.$q$,
  og_description = $q$FreeScout is a free, open-source (AGPL-3.0) self-hosted help desk and shared inbox with unlimited agents, tickets, and mailboxes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd4008e96-5007-46e7-98c7-0f90f45c63fa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd4008e96-5007-46e7-98c7-0f90f45c63fa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Unlimited agents and mailboxes$q$, $q$No limits on the number of agents, tickets, or mailboxes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Mobile-friendly with native apps$q$, $q$Includes dedicated Android and iOS apps alongside a mobile-friendly web UI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Multi-language support$q$, $q$Supports 30+ languages for the interface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Kanban boards and knowledge base$q$, $q$Optional modules add Kanban-style boards and a self-service knowledge base.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Channel integrations$q$, $q$Supports SMS via Twilio and integrations with Slack, WhatsApp, Facebook, and Telegram.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Security features$q$, $q$Supports S/MIME and PGP encryption, GDPR compliance, and SAML SSO.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Core software is completely free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Unlimited agents, tickets, and mailboxes with no per-seat pricing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Native mobile apps for Android and iOS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Broad channel support including SMS, WhatsApp, and Telegram$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Requires self-hosting on PHP/MySQL infrastructure, needing technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Advanced modules (Kanban, live chat, CRM, SMS) may require paid add-ons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Cloud-hosted options are only available via third-party providers, not officially from FreeScout$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Is FreeScout really free?$q$, $q$Yes, the core FreeScout software is free and open source under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Do I need to self-host FreeScout?$q$, $q$Yes, FreeScout is designed to be self-hosted on PHP/MySQL infrastructure, though third-party providers offer cloud hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$What is FreeScout built with?$q$, $q$It's built with PHP using the Laravel framework.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Does FreeScout have mobile apps?$q$, $q$Yes, it offers dedicated Android and iOS apps in addition to a mobile-friendly web interface.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Self-hosted shared inbox$q$, $q$Support teams that want a Zendesk/Help Scout alternative without recurring per-agent fees self-host FreeScout.$q$, $q$Support teams wanting a self-hosted help desk$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Privacy-conscious support$q$, $q$Organizations with data-residency or privacy requirements run FreeScout on their own servers to keep ticket data in-house.$q$, $q$Privacy- and compliance-focused teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Self-hosted$q$, $q$$0$q$, NULL, $q$["Unlimited agents, tickets, mailboxes","Android and iOS apps","30+ language support","S/MIME, PGP, SAML SSO"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$overview$q$, $q$What is FreeScout?$q$, 2, ARRAY[$q$FreeScout is a free, open-source help desk and shared inbox built with PHP and the Laravel framework, licensed under AGPL-3.0.$q$, $q$It positions itself as a self-hosted alternative to commercial help desks like Zendesk and Help Scout, with unlimited agents, tickets, and mailboxes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$who-its-for$q$, $q$Who FreeScout is for$q$, 2, ARRAY[$q$FreeScout suits support teams and organizations that want a self-hosted, privacy-friendly help desk without per-agent SaaS pricing, and that have the technical resources to run PHP/MySQL infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Zammad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source (AGPL-3.0) helpdesk platform with AI features, available self-hosted or as German-hosted cloud SaaS.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€7/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Zammad is an open-source AGPL-3.0 helpdesk with AI ticket tools, self-hosted for free or cloud-hosted from €7/month.$q$,
  og_description = $q$Zammad is an open-source AGPL-3.0 helpdesk with AI ticket tools, self-hosted for free or cloud-hosted from €7/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8ad76ec7-95d0-4c9d-8183-877e0a53b6e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8ad76ec7-95d0-4c9d-8183-877e0a53b6e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Multi-channel ticketing$q$, $q$Centralizes email, chat, SMS, social media, and phone support in one platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$AI ticket tools$q$, $q$Provides ticket summaries and writing assistance, billed per AI call on cloud plans.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Automation$q$, $q$Smart templates, bulk actions, and workflow automation for routine ticket handling.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Knowledge base$q$, $q$Multi-language knowledge base for both customers and agents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Security$q$, $q$Two-factor authentication, S/MIME encryption, SSO, and PGP support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Integrations$q$, $q$30+ integrations including Microsoft Teams, Slack, and GitHub.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Core software is open source under AGPL-3.0 and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Cloud plans hosted on ISO27001-certified, GDPR-compliant German servers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Wide channel coverage including phone, WhatsApp, and Facebook on higher tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$30-day free trial available on cloud plans$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$AI features on cloud plans incur additional per-call fees (€0.03 per AI call)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Self-hosted support contracts start at €2,999/year, a significant cost beyond the free software itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Lower cloud tiers cap the number of agents (5 on Starter, 35 on Professional)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Is Zammad free?$q$, $q$Yes, the core Zammad software is open source under AGPL-3.0 and free to self-host; paid cloud hosting and support plans are also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$How much does Zammad cloud cost?$q$, $q$Cloud plans start at about €7/month (billed annually) for the Starter tier and go up to €25/month for the Plus tier with unlimited agents.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Does Zammad support AI features?$q$, $q$Yes, optional AI features like ticket summaries are available on Professional and higher cloud tiers, billed at €0.03 per AI call.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Where is Zammad's cloud hosted?$q$, $q$On ISO27001-certified, GDPR-compliant servers in Germany.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Self-hosted helpdesk$q$, $q$Teams that want full control over their support infrastructure self-host Zammad for free.$q$, $q$Support teams with in-house infrastructure$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Managed cloud helpdesk$q$, $q$Teams that prefer not to manage servers use Zammad's German-hosted cloud plans.$q$, $q$Support, IT, and internal operations teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Starter v2 (cloud)$q$, $q$€7/month (annual) or €9/month$q$, $q$monthly$q$, $q$["Up to 5 agents","Email support","Email, Web Form, SMS channels","10 MB attachments, 20 GB storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Professional v2 (cloud)$q$, $q$€16/month (annual) or €18/month$q$, $q$monthly$q$, $q$["Up to 35 agents","Chat and Telegram channels","SLAs and knowledge base","Optional AI features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Plus v2 (cloud)$q$, $q$€25/month (annual) or €27/month$q$, $q$monthly$q$, $q$["Unlimited agents","Phone support","Facebook and WhatsApp channels","Advanced reporting"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Business (self-hosted support)$q$, $q$€2,999/year$q$, $q$annual$q$, $q$["Business-hours support","6-hour response time","15 service requests"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Enterprise (self-hosted support)$q$, $q$€5,999/year$q$, $q$annual$q$, $q$["Extended-hours support","4-hour response time","45 service requests","5% service discount"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Corporation (self-hosted support)$q$, $q$€9,999/year$q$, $q$annual$q$, $q$["Full-day support","2-hour response time","95 service requests","10% service discount"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$overview$q$, $q$What is Zammad?$q$, 2, ARRAY[$q$Zammad is an open-source helpdesk platform, licensed under AGPL-3.0, that centralizes support tickets across email, chat, SMS, social media, and phone.$q$, $q$It can be self-hosted for free or used as a managed cloud service hosted on ISO27001-certified servers in Germany, with optional AI features like ticket summaries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$who-its-for$q$, $q$Who Zammad is for$q$, 2, ARRAY[$q$Zammad suits support, IT, and internal operations teams that want an open-source helpdesk they can either self-host for free or run as GDPR-compliant cloud SaaS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── UVdesk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source helpdesk platform for eCommerce and multichannel customer support, available self-hosted or as a paid SaaS.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$22/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$UVdesk is an open-source helpdesk for eCommerce support, with a free self-hosted edition and paid SaaS plans from $22/month.$q$,
  og_description = $q$UVdesk is an open-source helpdesk for eCommerce support, with a free self-hosted edition and paid SaaS plans from $22/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Multichannel ticketing$q$, $q$Consolidates inquiries from email, social media, marketplaces, and websites into a single ticket queue.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$eCommerce order integration$q$, $q$Fetches order data from connected stores so agents can see customer order details inside tickets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Knowledge base / support center$q$, $q$Built-in customer-facing knowledge base and support center for self-serve help content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Form builder$q$, $q$Lets teams create custom support forms for capturing structured customer requests.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Agent performance tracking$q$, $q$Reporting on agent activity to monitor support team performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Theme customization$q$, $q$Customizable support portal themes and branding.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Free, self-hosted open-source community edition with unlimited agents$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Native integrations with major eCommerce platforms (Shopify, Magento, WooCommerce/WordPress) and marketplaces (Amazon, eBay, Etsy)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$SaaS cloud version available for teams that don't want to self-host$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Security/compliance certifications claimed for the cloud offering (ISO 27001, ISO 9001, SOC 2 Type 2)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Paid SaaS plans require a minimum of 2 agents$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Advanced features (full portal customization, unlimited mailboxes/knowledgebase) are reserved for the higher Pro tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Self-hosted deployment requires PHP server setup and maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Is UVdesk free?$q$, $q$Yes. UVdesk offers a free, self-hosted open-source community edition with unlimited agents, plus a free SaaS tier with standard features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Does UVdesk integrate with eCommerce platforms?$q$, $q$Yes, UVdesk supports integrations with Shopify, Magento, OpenCart, PrestaShop, WordPress, Amazon, eBay, Etsy, and Flipkart.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$What does the paid SaaS version cost?$q$, $q$Paid SaaS plans start at $22/month (or $192/year) for Basic, requiring a minimum of 2 agents, with a Pro plan at $36/month for larger teams.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Can I self-host UVdesk?$q$, $q$Yes, an open-source community skeleton is available for self-hosted deployment on your own server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$eCommerce customer support$q$, $q$Online stores and marketplace sellers managing order-related support inquiries across multiple sales channels.$q$, $q$eCommerce businesses and marketplace sellers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Self-hosted helpdesk$q$, $q$Organizations that want a free, fully controlled helpdesk deployed on their own infrastructure.$q$, $q$Technical teams and cost-conscious support operations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Free (Community/Open Source)$q$, $q$$0$q$, NULL, $q$["Unlimited agents","Self-hosted","Security, workflow, and theme customization"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Free (SaaS)$q$, $q$$0$q$, NULL, $q$["Standard helpdesk features","Unlimited agents"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Basic$q$, $q$$22/month or $192/year$q$, $q$monthly$q$, $q$["Minimum 2 agents","eCommerce multichannel integration","Agent performance analysis","Form builder","File viewer","Data import"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Pro$q$, $q$$36/month or $360/year$q$, $q$monthly$q$, $q$["Minimum 2 agents","Full portal customization","Unlimited mailboxes","Unlimited knowledgebase","eCommerce multichannel support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$overview$q$, $q$What is UVdesk?$q$, 2, ARRAY[$q$UVdesk is a helpdesk and customer support platform built by Webkul, aimed at eCommerce businesses and marketplace sellers who need to manage support tickets across many channels.$q$, $q$It is offered both as a free, open-source self-hosted PHP application and as a paid SaaS product with tiered plans, giving teams a choice between full control and managed hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$who-its-for$q$, $q$Who UVdesk is for$q$, 2, ARRAY[$q$UVdesk suits online stores and marketplace sellers who need order-aware support tickets, as well as budget-conscious teams that want a self-hosted, open-source helpdesk they can run on their own servers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Helpy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Helpdesk platform with ticketing, live chat, and knowledge base, offered self-hosted, on private cloud, or as SaaS.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$40/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Lehi, Utah, USA$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Helpy is a helpdesk with ticketing, live chat, and a knowledge base, deployable self-hosted, on private cloud, or as SaaS; self-hosted starts at $40/seat/month.$q$,
  og_description = $q$Helpy is a helpdesk with ticketing, live chat, and a knowledge base, deployable self-hosted, on private cloud, or as SaaS; self-hosted starts at $40/seat/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '203778ad-4def-4fde-8983-24641267e6c6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '203778ad-4def-4fde-8983-24641267e6c6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Multi-channel ticketing$q$, $q$Email integration with ticket tracking and assignment across channels.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Live chat$q$, $q$Real-time customer chat with auto-assignment and bot support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Self-serve knowledge base$q$, $q$Customizable knowledge base with access controls for customer self-service.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$SSO and security controls$q$, $q$Supports SAML, OAuth, and LDAP single sign-on plus data masking and role-based permissions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Quick reply templates$q$, $q$Canned responses and one-click conversion of replies into knowledge base articles.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Flexible deployment: self-hosted/on-premises, private cloud (AWS/Azure), or turnkey SaaS$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$14-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Open-source community edition available on GitHub$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Enterprise security options (SSO, data masking) aimed at regulated industries$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Self-hosted pricing requires an annual contract at $40 per seat per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Cloud-hosted plan pricing is not published on the main pricing page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$The open-source GitHub repository's most recent release dates to 2020, indicating the free community edition may lag behind the commercial product$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Can I try Helpy for free?$q$, $q$Yes, Helpy offers a 14-day free trial that does not require a credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$How much does self-hosted Helpy cost?$q$, $q$The self-hosted plan is $40 per seat per month, billed under an annual contract, and includes every feature Helpy offers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Is there an open-source version of Helpy?$q$, $q$Yes, an open-source core is available on GitHub, though its most recent public release was in 2020.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Where is Helpy based?$q$, $q$Helpy's headquarters is listed at 2701 N. Thanksgiving Way, Suite 100, Lehi, Utah, USA.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Regulated-industry support$q$, $q$Teams needing on-premises or private-cloud data control for compliance reasons.$q$, $q$Financial services, healthcare, government, and education organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Self-hosted support desk$q$, $q$Organizations wanting full infrastructure control over their helpdesk deployment.$q$, $q$IT and security-conscious support teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Self-Hosted$q$, $q$$40/seat/month$q$, $q$annual$q$, $q$["All features included","Core ticketing","Live chat","Knowledge base","SSO (SAML, OAuth, LDAP)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Multiple accounts","Full whitelabel","Resell rights","Product embed"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$overview$q$, $q$What is Helpy?$q$, 2, ARRAY[$q$Helpy is a customer support helpdesk that combines ticketing, live chat, and a self-serve knowledge base into a single platform.$q$, $q$It can be deployed self-hosted on private hardware, on a private cloud (AWS, Azure, or similar), or used as a turnkey SaaS product, with an open-source community edition also available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$who-its-for$q$, $q$Who Helpy is for$q$, 2, ARRAY[$q$Helpy targets organizations that prioritize data control and compliance, such as financial services, healthcare, education, government, defense, and telecom, where SSO and self-hosting matter.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('203778ad-4def-4fde-8983-24641267e6c6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── osTicket ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source support ticket system used by millions worldwide, with an optional paid hosted cloud version.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$osTicket is a free, open-source ticketing system for support teams, with a paid hosted cloud edition called SupportSystem.$q$,
  og_description = $q$osTicket is a free, open-source ticketing system for support teams, with a paid hosted cloud edition called SupportSystem.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c6e21c1b-c4e0-486b-8501-88c1bbe7830a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c6e21c1b-c4e0-486b-8501-88c1bbe7830a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Multi-channel ticket routing$q$, $q$Routes inquiries created via email, web forms, and API into a unified ticket queue.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Intelligent ticket filtering$q$, $q$Configurable rules and filters route tickets to the right agents or teams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Configurable help topics$q$, $q$Custom help topics and forms tailored to different types of requests.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Customer support portal$q$, $q$Self-service portal where customers can submit and track tickets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$SLA management$q$, $q$Service Level Agreement rules to track and enforce response/resolution times.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Dashboard reporting$q$, $q$Reporting and analytics dashboard for ticket and agent activity.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Completely free, open-source (GPL-2.0) with no cost to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Large, established user base — reported 5+ million users and 15,000+ businesses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Actively maintained with regular releases (v1.18.4 released 2026)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$API access for integrating ticket creation with other systems$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Self-hosted edition requires you to install, host, and maintain your own server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Cloud-hosted SupportSystem pricing is not published on the main site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Advanced support requires purchasing commercial support/professional services from Enhancesoft$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Is osTicket really free?$q$, $q$Yes, the self-hosted osTicket software is free and open source under the GPL-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Is there a hosted version of osTicket?$q$, $q$Yes, Enhancesoft offers SupportSystem, a cloud-hosted version of osTicket with a 30-day free trial that requires no credit card.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Who maintains osTicket?$q$, $q$osTicket is developed and commercially supported by Enhancesoft, which also offers professional services.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Can osTicket integrate with other tools?$q$, $q$Yes, osTicket supports ticket creation via email, web forms, and API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Self-hosted support ticketing$q$, $q$Organizations that want a free, self-managed ticketing system with full data control.$q$, $q$IT, education, healthcare, government, and nonprofit support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Managed cloud support desk$q$, $q$Teams that want osTicket's ticketing without managing their own server.$q$, $q$Small and mid-sized businesses using SupportSystem$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Ticket management","SLAs","Customer portal","API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$SupportSystem (Cloud)$q$, $q$Custom$q$, NULL, $q$["Managed hosting","30-day free trial, no credit card required"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$overview$q$, $q$What is osTicket?$q$, 2, ARRAY[$q$osTicket is an open-source support ticket system that consolidates inquiries from email, web forms, and the API into a single, unified ticket queue.$q$, $q$It is free to self-host under the GPL-2.0 license, and its maker, Enhancesoft, also sells a hosted cloud version called SupportSystem.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$who-its-for$q$, $q$Who osTicket is for$q$, 2, ARRAY[$q$osTicket suits organizations across education, healthcare, technology, government, and nonprofits that want a free, widely-used ticketing system they can self-host, or a hosted alternative if they don't want to manage a server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Request Tracker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, enterprise-grade ticketing and workflow system used for over 20 years, with a paid Cloud RT hosting option.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Request Tracker (RT) is an open-source ticketing and workflow system with 400+ extensions, self-hosted or via paid Cloud RT hosting.$q$,
  og_description = $q$Request Tracker (RT) is an open-source ticketing and workflow system with 400+ extensions, self-hosted or via paid Cloud RT hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c74c6d31-a2de-408d-9658-1ce6cd0f1ff3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c74c6d31-a2de-408d-9658-1ce6cd0f1ff3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Email-based ticketing$q$, $q$Manages tickets from multiple email addresses with tracking and assignment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Visual workflow builder$q$, $q$Configure ticket lifecycles and workflows visually.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Knowledge base (Articles)$q$, $q$Stores FAQs and canned responses as reusable articles.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Asset management$q$, $q$Tracks tangible and intangible assets within RT via the RT Assets module.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$REST 2 API$q$, $q$REST API with Zapier integration support for automation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$SLA management$q$, $q$Business-hours-aware SLA tracking and reporting.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Incident response module$q$, $q$RT Incident Response (RTIR) extension for security/incident workflows.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Open source with over 400 free community-built extensions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Long track record — in active use for over 20 years$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Actively maintained with recent releases (rt-6.0.3 in 2026)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$REST API and Zapier support for integrations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Self-hosted setup requires technical installation and maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Cloud RT pricing is not published and requires contacting the vendor$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Interface and setup can feel dated compared to modern SaaS helpdesks$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Is Request Tracker free?$q$, $q$Yes, the self-hosted, open-source version of RT is free to use under the GPL-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Is there a hosted version?$q$, $q$Yes, Cloud RT is a paid, subscription-based hosted version, with a free trial available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Does RT have an API?$q$, $q$Yes, RT provides a REST 2 API with Zapier integration support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$What other products come with RT?$q$, $q$Bestpractical/Request Tracker also offers RT Incident Response (RTIR), RT Assets, and RT FormTools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$IT and support ticketing$q$, $q$Teams tracking support requests, tasks, and change management through customizable workflows.$q$, $q$IT departments and helpdesks$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Security incident response$q$, $q$Organizations using the RTIR extension to manage security incidents.$q$, $q$Security operations teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Core ticketing","Workflow builder","Knowledge base","400+ community extensions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Cloud RT$q$, $q$Custom$q$, NULL, $q$["Managed hosting","Free trial available"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$overview$q$, $q$What is Request Tracker?$q$, 2, ARRAY[$q$Request Tracker (RT) is an open-source, enterprise-grade issue and ticket tracking system that has been in use for over 20 years, built by Best Practical / requesttracker.com.$q$, $q$It can be self-hosted for free, extended with 400+ community extensions, or run as a paid managed service called Cloud RT.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$who-its-for$q$, $q$Who Request Tracker is for$q$, 2, ARRAY[$q$RT suits IT departments, helpdesks, and security operations teams that need a highly customizable, self-hostable ticketing system without vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OTOBO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$100% open-source, license-free service management platform for IT, customer support, and enterprise service teams.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OTOBO is a free, open-source service management platform for ITSM, customer service, and enterprise service management.$q$,
  og_description = $q$OTOBO is a free, open-source service management platform for ITSM, customer service, and enterprise service management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ff507f8-cdb5-4501-a01f-b42875d7b2a8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ff507f8-cdb5-4501-a01f-b42875d7b2a8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$IT Service Management (ITSM)$q$, $q$ITIL-aligned processes for delivering IT services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Customer Service Management (CSM)$q$, $q$Multi-channel customer support ticketing and communication.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Enterprise Service Management (ESM)$q$, $q$Orchestrates services across multiple internal or external providers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Process automation$q$, $q$Customizable service process automation and self-service capabilities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Multi-channel communication$q$, $q$Supports handling requests across multiple communication channels.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$100% open source and free, with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$GPL-licensed with source available on GitHub (RotherOSS/otobo)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Used by large organizations including Siemens, Infineon, and NATO$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Optional managed hosting available through German data centers for teams wanting data residency$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Self-hosting requires technical setup and Perl-based server maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Consulting, training, support contracts, and managed hosting are paid add-ons with pricing not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Smaller GitHub community (roughly 330 stars) compared to some other open-source helpdesk projects$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Is OTOBO free?$q$, $q$Yes, OTOBO is 100% open source and license-free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Who develops OTOBO?$q$, $q$OTOBO is developed by Rother OSS GmbH, founded by a former ((OTRS)) Community Edition team member, as a fork focused on staying free and community-driven.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Does OTOBO offer paid support?$q$, $q$Yes, Rother OSS offers optional paid consulting, training, support contracts, and managed hosting in German data centers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Can OTOBO handle IT service management?$q$, $q$Yes, OTOBO includes ITSM capabilities aligned with ITIL best practices, alongside customer service and enterprise service management modules.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$IT service management$q$, $q$IT departments implementing ITIL-aligned service delivery and ticketing.$q$, $q$IT service teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Enterprise service orchestration$q$, $q$Organizations coordinating services across multiple internal departments or external providers.$q$, $q$Enterprises with multiple service providers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["ITSM","Customer service management","Enterprise service management","Process automation"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$overview$q$, $q$What is OTOBO?$q$, 2, ARRAY[$q$OTOBO is a web-based, modular service management platform covering IT service management, customer service, and enterprise service management, released as free, license-free open source software.$q$, $q$It is developed by Rother OSS GmbH, which also sells optional consulting, training, support contracts, and managed hosting for organizations that don't want to self-host.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$who-its-for$q$, $q$Who OTOBO is for$q$, 2, ARRAY[$q$OTOBO suits IT departments and enterprises that need ITIL-aligned service management and want a fully free, self-hostable alternative to commercial service desk software, with the option of paid managed hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GLPI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source IT service management and asset/CMDB platform, self-hosted for free or via paid GLPI Network Cloud plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€19/month per IT agent$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GLPI is an open-source ITSM and asset management platform, free to self-host or available via GLPI Network Cloud from €19/agent/month.$q$,
  og_description = $q$GLPI is an open-source ITSM and asset management platform, free to self-host or available via GLPI Network Cloud from €19/agent/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Helpdesk and ticket management$q$, $q$Manages support tickets alongside IT assets and infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Asset and inventory management$q$, $q$Tracks hardware, software, and other assets across the organization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$CMDB$q$, $q$Configuration Management Database for tracking infrastructure relationships.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Agentless cloud inventory$q$, $q$Scans and inventories cloud resources without installing agents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Workflow automation$q$, $q$Automates recurring IT service and asset workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Mobile apps$q$, $q$iOS and Android mobile applications for on-the-go access.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Free, open-source core (GPL-3.0) actively maintained with recent releases (v11.0.8, 2026)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Large established community with 6,100+ GitHub stars$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Managed cloud hosting available (GLPI Network Cloud) if self-hosting isn't wanted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Mobile apps for iOS and Android$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Cloud plans are priced per IT agent, which can scale up in cost for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Advanced plugin tiers (Standard, Advanced) require paid GLPI Network subscriptions starting at €100/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Self-hosted deployment requires server setup and maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Is GLPI free?$q$, $q$Yes, GLPI's core platform is free and open source (GPL-3.0) to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$How much does GLPI Cloud cost?$q$, $q$GLPI Network Public Cloud starts at €19/month per IT agent; Private Cloud starts at €21/month per IT agent (minimum 25 agents).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Does GLPI have a free trial?$q$, $q$Yes, GLPI's cloud offering includes a 45-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Does GLPI have mobile apps?$q$, $q$Yes, GLPI offers mobile applications for iOS and Android.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$IT asset and service management$q$, $q$IT teams managing tickets, assets, and infrastructure in one platform.$q$, $q$IT service management (ITSM) teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Managed cloud ITSM$q$, $q$Organizations wanting GLPI without managing their own servers.$q$, $q$Mid-to-enterprise IT organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Ticketing","Asset management","CMDB","Workflow automation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$GLPI Network Public Cloud$q$, $q$€19/month per IT agent$q$, $q$monthly$q$, $q$["Unlimited assets and end users","5GB disk space","5-minute automation frequency","Daily backups"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$GLPI Network Private Cloud$q$, $q$€21/month per IT agent (min. 25 agents)$q$, $q$monthly$q$, $q$["50GB disk space","Dedicated resources","1-minute automation frequency","VPN tunnel, IP filtering"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$GLPI Network Basic (Self-Hosted add-on)$q$, $q$€100/month$q$, $q$monthly$q$, $q$["Up to 10 IT agents","500 assets","Community and basic plugins","OAuth/SCIM"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$GLPI Network Standard (Self-Hosted add-on)$q$, $q$€300/month$q$, $q$monthly$q$, $q$["Up to 50 IT agents","5,000 assets","Standard plugins","Advanced dashboard"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$GLPI Network Advanced (Self-Hosted add-on)$q$, $q$€1,000/month$q$, $q$monthly$q$, $q$["50+ IT agents","5,000+ assets","Advanced plugins"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$overview$q$, $q$What is GLPI?$q$, 2, ARRAY[$q$GLPI is an open-source IT service management platform that unifies helpdesk ticketing, asset inventory, and a configuration management database (CMDB) in one tool.$q$, $q$It's free to self-host under GPL-3.0, and its maintainer Teclib' also sells managed GLPI Network Cloud hosting priced per IT agent, plus paid plugin tiers for self-hosted deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$who-its-for$q$, $q$Who GLPI is for$q$, 2, ARRAY[$q$GLPI suits mid-to-enterprise IT teams that need combined ticketing and asset/CMDB management, whether they prefer to self-host for free or pay for managed cloud hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── iTop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$French open-source ITSM and CMDB platform with a free Community tier and paid Atelier/Forge subscriptions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$iTop is an open-source ITSM and CMDB platform by Combodo, free for up to 10 agents with paid Atelier and Forge tiers for larger teams.$q$,
  og_description = $q$iTop is an open-source ITSM and CMDB platform by Combodo, free for up to 10 agents with paid Atelier and Forge tiers for larger teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e7979bb4-e11f-4629-ba03-f702582d77cc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e7979bb4-e11f-4629-ba03-f702582d77cc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$ITIL-certified service management$q$, $q$Request, incident, problem, and change management processes aligned with ITIL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$CMDB$q$, $q$Fully customizable Configuration Management Database for infrastructure visibility and dependency mapping.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Low-code customization$q$, $q$Customize workflows and data models without developer expertise.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$SLA tracking$q$, $q$Activity monitoring and SLA compliance tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Automation$q$, $q$Automates repetitive service management tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Plugin ecosystem$q$, $q$Extensible via a hub of community and vendor add-ons.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Free Community tier supports up to 10 agents$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Open source (AGPL-3.0) and actively maintained on GitHub, with recent releases (v3.2.3, 2026)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Available as SaaS or self-hosted/on-premise$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Low-code customization reduces reliance on developers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Community tier is capped at 10 agents; larger teams need paid Atelier (up to 50 agents) or Forge (50+) tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Pricing for paid tiers is not published and requires contacting Combodo$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Self-hosted deployment requires PHP server setup and maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Is iTop free?$q$, $q$Yes, iTop's Community edition is free and supports up to 10 agents; it is open source under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$What are the paid iTop tiers?$q$, $q$Atelier (up to 50 agents) and Forge (50+ agents) are paid tiers for teams needing more capacity and industrialized ITSM.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Can iTop be self-hosted?$q$, $q$Yes, iTop supports both self-hosted/on-premise deployment and a SaaS option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Who develops iTop?$q$, $q$iTop is developed and sponsored by Combodo, a French company.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Small-team ITSM$q$, $q$Small IT teams (up to 10 agents) using the free Community edition.$q$, $q$Small IT teams and startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Enterprise ITSM and CMDB$q$, $q$Larger organizations needing industrialized, customized service management with paid support.$q$, $q$Mid-to-large enterprise IT departments$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Community$q$, $q$Free$q$, NULL, $q$["Up to 10 agents","Standard service management","CMDB"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Atelier$q$, $q$Custom$q$, NULL, $q$["Up to 50 agents","Operational-level ITSM"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$Forge$q$, $q$Custom$q$, NULL, $q$["50+ agents","Fully industrialized/customized ITSM"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$overview$q$, $q$What is iTop?$q$, 2, ARRAY[$q$iTop is an open-source IT service management and CMDB platform developed by the French company Combodo, offering ITIL-aligned processes, low-code customization, and a plugin ecosystem.$q$, $q$It's free for small teams under the Community tier (up to 10 agents) and available in paid Atelier and Forge tiers, deployable as SaaS or self-hosted/on-premise.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$who-its-for$q$, $q$Who iTop is for$q$, 2, ARRAY[$q$iTop suits IT teams of any size seeking a customizable, ITIL-aligned ITSM and CMDB platform, from small teams on the free tier to larger enterprises needing industrialized service management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Snipe-IT ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source IT asset management system, free to self-host or available as paid managed cloud hosting from $39.99/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$39.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Snipe-IT is an open-source IT asset management system, free to self-host or available as managed cloud hosting from $39.99/month.$q$,
  og_description = $q$Snipe-IT is an open-source IT asset management system, free to self-host or available as managed cloud hosting from $39.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '807b9f70-85d4-451c-836e-7da931db0f4d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '807b9f70-85d4-451c-836e-7da931db0f4d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Asset tracking and inventory$q$, $q$Tracks IT and other organizational assets in place of spreadsheets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$REST API$q$, $q$API for custom integrations and automation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Security controls$q$, $q$Bcrypt password hashing, brute-force prevention, two-factor authentication, and HTTPS-only cookies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Frequent releases$q$, $q$New releases roughly every few weeks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Customizable asset types$q$, $q$Track more than just IT equipment by customizing asset categories.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Free, open-source (AGPL-3.0) and self-hostable with unlimited users and assets$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Large active community: 14,100+ GitHub stars, 291 releases, 330+ contributors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Managed cloud hosting available across 12 global regions on AWS with a 99.99% SLA$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$REST API for building custom integrations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Cloud hosting plans add meaningful monthly cost ($39.99–$249.99+/month) on top of the free self-hosted option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Automated upgrades and priority support require a paid hosting plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Self-hosted deployment requires server setup and maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Is Snipe-IT free?$q$, $q$Yes, Snipe-IT is free and open source (AGPL-3.0) if you self-host it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$How much does Snipe-IT cloud hosting cost?$q$, $q$Managed cloud hosting starts at $39.99/month (Basic) and scales up to $249.99/month for Dedicated hosting, with larger dedicated tiers available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Does Snipe-IT have an API?$q$, $q$Yes, Snipe-IT provides a REST API for custom integrations and automations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$How large is the Snipe-IT community?$q$, $q$The project has 14,100+ GitHub stars, 291 releases, and 330+ contributors.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Self-hosted asset management$q$, $q$Organizations wanting free, self-managed IT asset tracking with full data control.$q$, $q$IT teams and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Managed cloud asset tracking$q$, $q$Teams wanting Snipe-IT without running their own server.$q$, $q$Businesses preferring managed hosting$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Unlimited users and assets","Full source access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Basic Hosting$q$, $q$$39.99/month or $399.99/year$q$, $q$monthly$q$, $q$["Automated upgrades","Email support","Priority requests"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Small Business Hosting$q$, $q$$99.99/month or $999.99/year$q$, $q$monthly$q$, $q$["Automated upgrades","Email support","Priority requests"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$Dedicated Hosting (Small)$q$, $q$$249.99/month or $2,499.99/year$q$, $q$monthly$q$, $q$["Private server","VPN connectivity","Automated upgrades","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$overview$q$, $q$What is Snipe-IT?$q$, 2, ARRAY[$q$Snipe-IT is an open-source IT asset management system built to replace spreadsheet-based inventory tracking with a dedicated platform for managing hardware, software licenses, and other assets.$q$, $q$It's free to self-host under AGPL-3.0, and its maker also sells managed cloud hosting plans across 12 global regions on AWS, starting at $39.99/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$who-its-for$q$, $q$Who Snipe-IT is for$q$, 2, ARRAY[$q$Snipe-IT suits organizations of any size that want affordable, non-vendor-locked-in asset tracking, whether they prefer to self-host for free or pay for managed cloud hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ralph ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Asset Management, DCIM, and CMDB system for data centers and back offices, maintained by Allegro.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ralph is a free, open-source Asset Management, DCIM, and CMDB system for tracking data center and back-office hardware.$q$,
  og_description = $q$Ralph is a free, open-source Asset Management, DCIM, and CMDB system for tracking data center and back-office hardware.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2b9da418-5593-411e-b754-f7ed76965af3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2b9da418-5593-411e-b754-f7ed76965af3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Asset purchase and lifecycle tracking$q$, $q$Tracks hardware purchases and their lifecycle from acquisition to retirement.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Flexible asset lifecycle workflow$q$, $q$Configurable workflow system for moving assets through lifecycle stages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Data center and back-office support$q$, $q$Handles both data center hardware and general back-office equipment.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Data center visualization$q$, $q$Built-in visualization tools for data center layouts.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Established project with 2,500+ GitHub stars$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Recent releases continuing into 2026, showing ongoing maintenance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Purpose-built for combined DCIM/CMDB/asset-management use cases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Allegro maintains the project on a "sources only" basis without guaranteed support or issue response$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$No commercial support contract or managed hosting option was found$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Requires self-hosting and technical setup (Python/Django stack)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Is Ralph free?$q$, $q$Yes, Ralph is free and open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Who maintains Ralph?$q$, $q$Ralph is maintained by Allegro, which publishes the source code on GitHub but offers it on a sources-only basis without guaranteed support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$What does Ralph track?$q$, $q$Ralph tracks data center and back-office hardware assets, including purchase history and lifecycle stage, with data center visualization tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Is Ralph actively maintained?$q$, $q$Yes, the GitHub repository shows releases continuing into 2026.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Data center asset tracking$q$, $q$Organizations tracking hardware assets and lifecycle across data centers.$q$, $q$Data center operations and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Back-office equipment inventory$q$, $q$IT teams managing non-data-center hardware inventory.$q$, $q$IT asset management teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Asset lifecycle tracking","Data center visualization","CMDB"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$overview$q$, $q$What is Ralph?$q$, 2, ARRAY[$q$Ralph is a free, open-source Asset Management, DCIM, and CMDB system for tracking data center and back-office hardware, originally built and maintained by Allegro.$q$, $q$It's released under the Apache 2.0 license and is self-hosted; Allegro maintains it on a sources-only basis without guaranteed community support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$who-its-for$q$, $q$Who Ralph is for$q$, 2, ARRAY[$q$Ralph suits infrastructure and data center teams that need a free, self-hostable tool for tracking hardware assets and their lifecycle alongside data center visualization.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── NetBox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source network source-of-truth platform for DCIM and IPAM, with optional hosted NetBox Cloud and self-hosted NetBox Enterprise.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$NetBox is an open-source (Apache 2.0) network source-of-truth for DCIM and IPAM, with free self-hosting and paid NetBox Cloud/Enterprise options.$q$,
  og_description = $q$NetBox is an open-source (Apache 2.0) network source-of-truth for DCIM and IPAM, with free self-hosting and paid NetBox Cloud/Enterprise options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Data center infrastructure management (DCIM)$q$, $q$Model racks, devices, cables, and physical/virtual assets in a central database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$IP address management (IPAM)$q$, $q$Track IP addresses, VLANs, VRFs, and circuits alongside network device data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Network automation source of truth$q$, $q$Serves as the authoritative data source that automation tools query for structured network state.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Plugin ecosystem$q$, $q$A large ecosystem of community and vendor plugins extends NetBox's core data model.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Audit logging$q$, $q$Records changes made within the platform for traceability.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$REST/GraphQL access and integrations$q$, $q$Exposes network data for automation workflows and third-party tooling.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Core NetBox is free, open source (Apache 2.0), and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Widely adopted as a network source of truth (21k+ GitHub stars)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Large plugin ecosystem extends core functionality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Offers a managed NetBox Cloud option for teams that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Advanced capabilities (NetBox Enterprise, Cloud, Discovery, Assurance) are paid products from NetBox Labs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Public pricing for NetBox Cloud/Enterprise is not published on the marketing pages$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Self-hosting the open-source edition requires your own infrastructure and maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Is NetBox free?$q$, $q$The core NetBox platform is open source under the Apache 2.0 license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$What is NetBox Cloud?$q$, $q$NetBox Cloud is a fully-hosted SaaS version of NetBox offered by NetBox Labs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Is there a self-hosted paid option?$q$, $q$Yes, NetBox Enterprise is a self-hosted, commercially supported edition backed by NetBox Labs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Where is the source code?$q$, $q$NetBox is developed publicly at github.com/netbox-community/netbox.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Network documentation$q$, $q$Maintain an authoritative record of racks, devices, cabling, and IP space.$q$, $q$Network engineers and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$Network automation source of truth$q$, $q$Feed validated network data into automation and configuration pipelines.$q$, $q$NetOps and automation engineers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$overview$q$, $q$What is NetBox?$q$, 2, ARRAY[$q$NetBox is an open-source network source-of-truth platform used to model and document data center infrastructure (DCIM) and IP address space (IPAM). It stores network device, rack, cabling, IP, VLAN, and circuit data in a central database that automation tools can query.$q$, $q$The core project is Apache 2.0 licensed and free to self-host from github.com/netbox-community/netbox. NetBox Labs also offers commercially hosted (NetBox Cloud) and self-hosted, supported (NetBox Enterprise) editions on top of the open-source core.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$who-its-for$q$, $q$Who NetBox is for$q$, 2, ARRAY[$q$NetBox suits network engineers and infrastructure teams that need a structured, queryable record of their network as the foundation for automation, rather than spreadsheets or disconnected tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Nautobot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Network Source of Truth and automation platform from Network to Code, with a free Community Edition and paid Professional/Enterprise/Cloud tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = $q$New York City, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Nautobot is an open-source network source-of-truth and automation platform with a free Community Edition and paid enterprise/cloud tiers from Network to Code.$q$,
  og_description = $q$Nautobot is an open-source network source-of-truth and automation platform with a free Community Edition and paid enterprise/cloud tiers from Network to Code.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '979b8875-ed44-408b-b6aa-f0477d81e7fc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '979b8875-ed44-408b-b6aa-f0477d81e7fc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Inventory management$q$, $q$Tracks devices, IPs, circuits, and VLANs in a centralized data model.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Multi-vendor support$q$, $q$Works across network equipment from vendors including Cisco, Arista, and Juniper.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Dynamic configuration generation$q$, $q$Generates device configurations from validated network data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$REST and GraphQL APIs$q$, $q$Exposes network data for custom automation workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Python-based Jobs system$q$, $q$Runs Python jobs inside Nautobot for task automation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Custom apps and webhooks$q$, $q$Extensible through custom applications and webhook integrations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Community Edition is open source and free to self-manage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Supports multi-vendor network environments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Backed by Network to Code with professional support, training, and managed-service options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Extensible via Python jobs, custom apps, and APIs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Professional, Enterprise, and Cloud editions with additional features are paid and quote-based$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Specific pricing is not published; requires contacting Network to Code$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Self-managed Community Edition requires your own hosting and maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Is Nautobot free?$q$, $q$The Community Edition is open source and free to self-host and manage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Who develops Nautobot?$q$, $q$Nautobot is developed by Network to Code, a company founded in 2014 and headquartered in New York City.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Are paid editions available?$q$, $q$Yes, Network to Code offers Professional, Enterprise, and fully managed Cloud editions with additional features and support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Does Nautobot support automation?$q$, $q$Yes, it includes a Python-based Jobs system and REST/GraphQL APIs for building automation workflows.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Network source of truth$q$, $q$Centralize device, IP, circuit, and VLAN data across a multi-vendor network.$q$, $q$Network engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Network automation platform$q$, $q$Drive configuration generation and validation from a single data source.$q$, $q$NetOps and automation teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source","Self-managed deployment"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$overview$q$, $q$What is Nautobot?$q$, 2, ARRAY[$q$Nautobot is an open-source Network Source of Truth and Automation Platform that helps teams unify network data, model intended state, and drive automation. It supports multi-vendor inventory management, dynamic configuration generation, and REST/GraphQL APIs.$q$, $q$It is developed by Network to Code, a company founded in 2014 and based in New York City. Nautobot offers a free, self-managed Community Edition alongside paid Professional, Enterprise, and fully managed Cloud editions with additional support and features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$who-its-for$q$, $q$Who Nautobot is for$q$, 2, ARRAY[$q$Nautobot fits network engineering teams managing multi-vendor infrastructure who need a source of truth to drive network automation, with an option to scale into paid support and managed services as needs grow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── phpIPAM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source IP address management tool with IPv4/IPv6 tracking, VLAN/VRF support, and a REST API.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$phpIPAM is a free, open-source (GPLv3) IP address management tool with IPv4/IPv6, VLAN/VRF support, a REST API, and Docker deployment.$q$,
  og_description = $q$phpIPAM is a free, open-source (GPLv3) IP address management tool with IPv4/IPv6, VLAN/VRF support, a REST API, and Docker deployment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '42a75ad3-068c-492e-a658-dfdeda416a65';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '42a75ad3-068c-492e-a658-dfdeda416a65' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$IPv4/IPv6 address management$q$, $q$Tracks and organizes IP address space with VLAN and VRF support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Subnet management$q$, $q$Displays automatic free space calculation across subnets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Domain authentication$q$, $q$Supports Active Directory, LDAP, and RADIUS authentication.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$REST API$q$, $q$Exposes IPAM data for integration with other systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$PowerDNS integration$q$, $q$Integrates with PowerDNS for DNS record management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Device and rack management$q$, $q$Tracks devices and rack placement alongside IP data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$IP request module$q$, $q$Provides a workflow for requesting IP addresses, plus custom fields.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Completely free and open source (GPLv3) with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Actively maintained on GitHub with regular releases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$REST API and PowerDNS integration support automation workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Supports Docker deployment and multiple domain authentication methods$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Requires self-hosting on your own server infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$No official managed/hosted offering or paid support plan is advertised$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$No native mobile apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Is phpIPAM free?$q$, $q$Yes, phpIPAM is free, open-source software released under the GPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Does phpIPAM have an API?$q$, $q$Yes, it includes a REST API for integrating IPAM data with other tools.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Can phpIPAM be deployed with Docker?$q$, $q$Yes, Docker deployment is supported and documented.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Does phpIPAM support IPv6?$q$, $q$Yes, it manages both IPv4 and IPv6 address space.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$IP address management$q$, $q$Track and organize IPv4/IPv6 subnets, VLANs, and VRFs for a network.$q$, $q$Network administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$DNS and network automation$q$, $q$Integrate IPAM data with PowerDNS and other tooling via the REST API.$q$, $q$NetOps and sysadmins$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Open source (GPLv3)","Self-hosted","REST API"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$overview$q$, $q$What is phpIPAM?$q$, 2, ARRAY[$q$phpIPAM is a free, open-source IP address management tool that tracks IPv4 and IPv6 address space, VLANs, and VRFs. It includes subnet management with automatic free-space display, domain authentication (AD/LDAP/RADIUS), a REST API, and PowerDNS integration.$q$, $q$The project is released under the GPLv3 license and is self-hosted, with installation guides for common Linux distributions and Docker deployment support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$who-its-for$q$, $q$Who phpIPAM is for$q$, 2, ARRAY[$q$phpIPAM suits network administrators and sysadmins who want a free, self-hosted IPAM tool with API access for integrating IP data into other systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── RackTables ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source datacenter asset management system for tracking hardware, rack space, and network configuration.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RackTables is a free, open-source (GPLv2) datacenter asset management tool for tracking hardware, rack space, and network addresses.$q$,
  og_description = $q$RackTables is a free, open-source (GPLv2) datacenter asset management tool for tracking hardware, rack space, and network addresses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4a6cf529-e980-41a6-a8bd-f9fddd93fce3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4a6cf529-e980-41a6-a8bd-f9fddd93fce3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Hardware asset documentation$q$, $q$Documents servers and other hardware assets in a datacenter or server room.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Rack space allocation$q$, $q$Tracks physical rack space and equipment placement.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$IP address tracking$q$, $q$Records network addresses associated with tracked assets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Network configuration documentation$q$, $q$Captures network setup details tied to hardware assets.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Completely free and open source (GPLv2)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Self-hostable with no licensing costs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Actively maintained on GitHub with a public bug tracker and roadmap$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Purpose-built for datacenter/server room asset tracking$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Requires self-hosting and your own server infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$No official managed hosting or commercial support plan advertised$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Interface and feature set are dated compared to modern commercial CMDB tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Is RackTables free?$q$, $q$Yes, RackTables is free, open-source software released under GPLv2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$What does RackTables track?$q$, $q$It tracks datacenter hardware, IP addresses, rack space allocation, and network configuration details.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Where is the source code?$q$, $q$RackTables is developed on GitHub at github.com/RackTables/racktables, with a mirror at git.racktables.org.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$What was the latest stable version?$q$, $q$The latest stable version referenced on the project site is 0.22.0.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Datacenter asset tracking$q$, $q$Document servers, rack space, and hardware inventory for a datacenter or server room.$q$, $q$Datacenter/infrastructure administrators$q$, 0);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Open source (GPLv2)","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$overview$q$, $q$What is RackTables?$q$, 2, ARRAY[$q$RackTables is a free, open-source datacenter asset management system used to document hardware, network addresses, physical rack space, and network configuration. It is released under the GNU General Public License v2.$q$, $q$The project is self-hosted and maintained on GitHub, with a public bug tracker and roadmap. The latest stable version referenced on the project site is 0.22.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$who-its-for$q$, $q$Who RackTables is for$q$, 2, ARRAY[$q$RackTables suits infrastructure and datacenter administrators who need a free, self-hosted way to document physical hardware, rack layout, and associated network details.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Device42 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$IT infrastructure discovery, CMDB, and dependency-mapping platform, now part of Freshworks, priced as an annual subscription by device count.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Mateo, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Device42 is an IT infrastructure discovery, CMDB, and dependency-mapping platform, now part of Freshworks, with a free trial and device-based annual pricing.$q$,
  og_description = $q$Device42 is an IT infrastructure discovery, CMDB, and dependency-mapping platform, now part of Freshworks, with a free trial and device-based annual pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9fc7c07a-2f39-4616-b762-2e97af017f6e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9fc7c07a-2f39-4616-b762-2e97af017f6e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Infrastructure discovery$q$, $q$Automated discovery spanning legacy systems, mainframes, and cloud containers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$CMDB$q$, $q$A configuration management database with near real-time, automated updates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Dependency mapping$q$, $q$Visualizes relationships and dependencies between assets and applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Cloud discovery$q$, $q$Discovers and inventories AWS and Azure resources.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Storage management$q$, $q$Provides visibility into storage resources.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$IPAM$q$, $q$Centralized IP address management.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Software license management$q$, $q$Automated license discovery and compliance tracking.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Broad discovery coverage from legacy/mainframe systems to cloud infrastructure$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Combines CMDB, dependency mapping, IPAM, and license management in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Free trial available before purchase$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Backed by Freshworks after acquisition$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Pricing is quote-based and not published publicly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Priced by number of devices, which can scale cost with infrastructure size$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Now part of Freshworks following acquisition, which may affect standalone roadmap$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Is there a free trial of Device42?$q$, $q$Yes, Device42 offers a downloadable free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$How is Device42 priced?$q$, $q$It is sold as an annual subscription based on the number of devices, with pricing available on request.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Who owns Device42?$q$, $q$Device42 has been acquired by Freshworks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Does Device42 support cloud discovery?$q$, $q$Yes, it discovers and inventories resources in AWS and Azure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$IT asset discovery and CMDB$q$, $q$Automatically discover and maintain an up-to-date inventory of infrastructure assets and their dependencies.$q$, $q$IT operations and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$Cloud migration planning$q$, $q$Map application dependencies before migrating workloads to the cloud.$q$, $q$IT operations and cloud migration teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$overview$q$, $q$What is Device42?$q$, 2, ARRAY[$q$Device42 is an IT infrastructure discovery, asset management, and dependency-mapping platform that provides visibility across hybrid IT environments, from legacy and mainframe systems to cloud infrastructure. It includes a CMDB, cloud discovery for AWS and Azure, storage management, IPAM, and software license management.$q$, $q$Device42 is headquartered in San Mateo, California, and has been acquired by Freshworks. It is sold as an annual subscription priced by device count, with a free trial available and quote-based pricing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$who-its-for$q$, $q$Who Device42 is for$q$, 2, ARRAY[$q$Device42 fits IT operations teams that need automated discovery and an up-to-date CMDB across hybrid infrastructure, including cloud migration and compliance use cases.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Freshservice ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered ITSM platform from Freshworks with incident, asset, and workflow management, starting at $19/agent/month billed annually.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$19/agent/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Freshservice is Freshworks' ITSM platform with AI-assisted incident, asset, and workflow management, from $19/agent/month with a 14-day free trial.$q$,
  og_description = $q$Freshservice is Freshworks' ITSM platform with AI-assisted incident, asset, and workflow management, from $19/agent/month with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '41501fa1-8a36-4631-b45d-fc12ce3657f5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '41501fa1-8a36-4631-b45d-fc12ce3657f5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Freddy AI Copilot and Insights$q$, $q$AI features for instant issue resolution and analytics, available on higher-tier plans.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Incident management$q$, $q$Proactive monitoring and incident response workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Asset management and CMDB$q$, $q$Connected asset data providing context for faster ticket resolution.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Workflow automation$q$, $q$Low-code orchestration, intelligent routing, and service catalogs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Unified service delivery$q$, $q$Integrates ITSM, IT asset management, and IT operations management on one platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Employee onboarding workflows$q$, $q$Cross-departmental coordination across IT, HR, and Finance.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Clear, published per-agent pricing across four tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$14-day free trial available before purchase$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Combines ITSM, asset management, and workflow automation in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Backed by Freshworks with a large existing customer base$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Freddy AI Copilot is a paid add-on ($29/agent/month) even on paid plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Advanced modules (problem, change, major incident management) require the higher Pro tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Enterprise tier pricing is custom/quote-based$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$How much does Freshservice cost?$q$, $q$Plans start at $19/agent/month (Starter) billed annually, up to $99/agent/month (Pro); Enterprise pricing is custom.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Is there a free trial?$q$, $q$Yes, Freshservice offers a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Does Freshservice include AI features?$q$, $q$It includes Freddy AI capabilities, with the Freddy AI Copilot available as a $29/agent/month add-on.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Who makes Freshservice?$q$, $q$Freshservice is developed by Freshworks Inc.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$IT service management$q$, $q$Handle incidents, service requests, and change management with ITIL-aligned workflows.$q$, $q$Enterprise IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$MSP service delivery$q$, $q$Manage service desk operations for managed service provider clients.$q$, $q$Managed service providers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Starter$q$, $q$$19/agent/month$q$, $q$annual$q$, $q$["Knowledge management","Task management","Support portal","Omnichannel support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Growth$q$, $q$$49/agent/month$q$, $q$annual$q$, $q$["Service catalog","SLA management","On-call management","Cloud management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Pro$q$, $q$$99/agent/month$q$, $q$annual$q$, $q$["Problem management","Change management","Major incident management","Release management"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Sandbox","Audit logs","Freddy AI Agent (Classic)","Freddy AI Insights"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$overview$q$, $q$What is Freshservice?$q$, 2, ARRAY[$q$Freshservice is an ITSM platform from Freshworks built on ITIL practices, covering incident, asset, and workflow management alongside AI-assisted features branded Freddy AI. It offers four pricing tiers, from Starter ($19/agent/month) to a custom-priced Enterprise plan, all billed annually.$q$, $q$A 14-day free trial is available. Higher tiers add capabilities such as problem management, change management, major incident management, and additional Freddy AI features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$who-its-for$q$, $q$Who Freshservice is for$q$, 2, ARRAY[$q$Freshservice fits IT teams and MSPs that want a published, per-agent-priced ITSM platform with a trial period, scaling from basic help desk needs to full ITIL-aligned service management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── InvGate Service Desk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$No-code ITSM platform with embedded AI, offering a fixed-price Starter plan from $1,499/year and per-agent Pro/Enterprise tiers.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$1,499/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$InvGate Service Desk is a no-code ITSM platform with AI features, priced from $1,499/year with a free trial on Starter and Pro plans.$q$,
  og_description = $q$InvGate Service Desk is a no-code ITSM platform with AI features, priced from $1,499/year with a free trial on Starter and Pro plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0de1e87e-9618-43ae-b91b-b9ceedf4e826';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0de1e87e-9618-43ae-b91b-b9ceedf4e826' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$AI ticket summarization$q$, $q$Uses AI to highlight critical information in tickets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Virtual Service Agent$q$, $q$AI agent operating within Microsoft Teams, WhatsApp, and Slack.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$No-code workflow builder$q$, $q$Visual workflow builder with pre-built templates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Self-service portal and knowledge management$q$, $q$Self-service portal with AI-assisted knowledge article generation from resolved tickets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Change and problem management$q$, $q$Supports ITIL-aligned change and problem management processes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Analytics dashboards$q$, $q$Over 150 built-in metrics with customizable dashboards.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Asset inventory integration$q$, $q$Links tickets to IT Asset Inventory for unified asset-ticket tracking.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Published pricing for Starter and Pro plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Free trial available on Starter and Pro plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$No-code workflow builder with pre-built templates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$AI Service Agent integrates with Teams, WhatsApp, and Slack$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Enterprise plan requires custom quote starting at $12,000/year$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Pro plan pricing scales per agent ($500/agent/year) on top of a base cost$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Vendor notes prices may change without prior notice$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$How much does InvGate Service Desk cost?$q$, $q$Starter is $1,499/year fixed, Pro starts at $2,500/year ($500/agent/year for up to 50 agents), and Enterprise starts at $12,000/year with custom pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Is there a free trial?$q$, $q$Yes, a free trial is available for the Starter and Pro plans.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Does InvGate Service Desk include AI?$q$, $q$Yes, it includes AI ticket summarization and a Virtual Service Agent via its AI Hub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Can Enterprise be self-hosted?$q$, $q$The Enterprise plan includes on-premise hosting as an option.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$IT service desk$q$, $q$Manage incidents, requests, and workflows with a no-code builder.$q$, $q$IT service teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Multi-departmental service management$q$, $q$Extend ITIL-aligned workflows to non-IT departments.$q$, $q$Enterprise service management teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Starter$q$, $q$$1,499/year$q$, $q$annual$q$, $q$["5 agents","Unlimited end-users/approvers","SSO","AI Hub"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Pro$q$, $q$$500/agent/year (starts at $2,500/year)$q$, $q$annual$q$, $q$["5-50 agents","Workflow builder","AI Service Agent","Teams/WhatsApp integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$Enterprise$q$, $q$Custom (starts at $12,000/year)$q$, $q$annual$q$, $q$["Unlimited agents","Concurrent seats","On-premise hosting","Multiple SAML support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$overview$q$, $q$What is InvGate Service Desk?$q$, 2, ARRAY[$q$InvGate Service Desk is an ITSM platform combining a no-code workflow builder with embedded AI features, including ticket summarization and a Virtual Service Agent that works within Microsoft Teams, WhatsApp, and Slack.$q$, $q$Pricing is published for two of its three tiers: Starter at a fixed $1,499/year, and Pro starting at $2,500/year ($500/agent/year for up to 50 agents). The Enterprise tier is custom-priced, starting at $12,000/year and including on-premise hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$who-its-for$q$, $q$Who InvGate Service Desk is for$q$, 2, ARRAY[$q$InvGate Service Desk suits IT and service teams that want transparent starting pricing and a no-code workflow builder, scaling from small teams on Starter to enterprise deployments with on-premise hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── HaloITSM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Unified ITSM platform with all-inclusive per-agent pricing (from £66/agent/month), covering incident, change, problem, and asset management.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$£66/agent/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HaloITSM is a unified ITSM platform with all-inclusive per-agent pricing from £66/agent/month and a 30-day free trial, no credit card required.$q$,
  og_description = $q$HaloITSM is a unified ITSM platform with all-inclusive per-agent pricing from £66/agent/month and a 30-day free trial, no credit card required.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c110df5-bfa6-4663-9dad-5ea512a9a23a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c110df5-bfa6-4663-9dad-5ea512a9a23a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Incident and major incident management$q$, $q$Ticket routing, SLA tracking, and escalation workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Service request management$q$, $q$Self-service portal with forms and automation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Change management$q$, $q$Approval workflows and impact assessment for changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Problem management$q$, $q$Root cause analysis and known error documentation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Asset and CMDB$q$, $q$Configuration tracking and service dependency mapping.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Halo AI$q$, $q$Built-in automation for categorization, summarization, and suggested resolutions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$1,000+ built-in reports$q$, $q$Out-of-the-box reporting and analytics.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$All-inclusive licensing model bundles core features into one price with no feature-gated tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$30-day free trial with all features, no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Flexible deployment: Halo Cloud, Private Cloud, or On-Premise$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$ISO 27001 and SOC 2 Type II certified with a 99.99% uptime commitment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Per-agent pricing varies by region, complicating cost comparison$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Only internal agents are licensed; end users/customers are free but the agent-based model can still scale in cost for larger support teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Enterprise unlimited-license package is a large fixed $1M/year commitment$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$How much does HaloITSM cost?$q$, $q$Standard UK pricing is £66 per agent per month, billed annually; pricing varies by region.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Is there a free trial?$q$, $q$Yes, a 30-day free trial with all features is available and no credit card is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$What deployment options are available?$q$, $q$Halo Cloud, Private Cloud, and On-Premise deployments are all supported.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Are end users charged?$q$, $q$No, end users and customers who access the portal are always free; only agents are licensed.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Unified ITSM$q$, $q$Run incident, request, change, problem, and asset management from one licensed platform.$q$, $q$IT service teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$MSP service delivery$q$, $q$Deliver ITSM across multiple clients with concurrent or named licensing.$q$, $q$Managed service providers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$All-inclusive per-agent$q$, $q$£66/agent/month$q$, $q$annual$q$, $q$["All ITSM modules included","Named or concurrent licenses","No feature-gated tiers"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$Enterprise Package$q$, $q$$1,000,000/year$q$, $q$annual$q$, $q$["Unlimited licenses","Funded implementation"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$overview$q$, $q$What is HaloITSM?$q$, 2, ARRAY[$q$HaloITSM is a unified IT service management platform from Halo Service Solutions covering incident, request, change, problem, and asset management. It uses an all-inclusive licensing model, bundling core ITSM functionality into a single per-agent price rather than charging separately for modules.$q$, $q$Standard UK pricing is £66/agent/month billed annually, with regional pricing elsewhere and a 30-day free trial that includes all features with no credit card required. Deployment options include Halo Cloud, Private Cloud, and On-Premise.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$who-its-for$q$, $q$Who HaloITSM is for$q$, 2, ARRAY[$q$HaloITSM suits enterprises and MSPs that want a single, all-inclusive ITSM price without paying extra for individual modules, and that need flexible deployment options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── ManageEngine ServiceDesk Plus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-driven ITSM and asset management platform from ManageEngine (Zoho), with a free 5-technician edition and paid plans from $13/technician/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$13/technician/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ServiceDesk Plus is ManageEngine's ITSM and asset management platform, free for up to 5 technicians, with paid plans from $13/technician/month.$q$,
  og_description = $q$ServiceDesk Plus is ManageEngine's ITSM and asset management platform, free for up to 5 technicians, with paid plans from $13/technician/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$AI ticket triage (Zia)$q$, $q$Predictive intelligence and a virtual support agent for ticket handling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$GenAI-powered responses$q$, $q$Integrates with ChatGPT and Microsoft Copilot for AI-generated replies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$No-code workflow builder$q$, $q$Automates ticket handling, SLA management, and escalations without code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Self-service portal and knowledge base$q$, $q$Lets end users submit and track requests and search knowledge articles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$CMDB and IT asset management$q$, $q$Available on Professional and Enterprise editions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Multi-instance model$q$, $q$Separate instances with data segregation for different departments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$On-premises and cloud deployment$q$, $q$Available as both an on-premises and cloud-hosted deployment.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Free edition available for up to 5 technicians$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Published per-technician pricing across Standard, Professional, and Enterprise editions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$AI/ML capabilities included at no extra cost across all editions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Certified for 14 ITIL practices$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Free edition is limited to 5 technicians and one service desk instance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$IT asset management features require the Professional or Enterprise edition$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Pricing scales with both technician count and asset count on paid tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Is ServiceDesk Plus free?$q$, $q$Yes, a free edition is available for up to 5 technicians.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$How much do paid plans cost?$q$, $q$Standard starts at $13/technician/month, Professional at $27/technician/month, and Enterprise at $67/technician/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Is it available on-premises?$q$, $q$Yes, both on-premises and cloud deployment options are offered.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Who makes ServiceDesk Plus?$q$, $q$It is developed by ManageEngine, part of the Zoho ecosystem.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$IT help desk$q$, $q$Handle incident and request management for IT teams.$q$, $q$IT service teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Enterprise service management$q$, $q$Extend service management workflows to HR, facilities, and finance departments.$q$, $q$Non-IT business teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Free$q$, $q$$0 (up to 5 technicians)$q$, NULL, $q$["Standard edition features","1 service desk instance","Unlimited end users and tickets"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Standard$q$, $q$$13/technician/month$q$, $q$monthly$q$, $q$["IT help desk"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Professional$q$, $q$$27/technician/month$q$, $q$monthly$q$, $q$["IT help desk","IT asset management"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$Enterprise$q$, $q$$67/technician/month$q$, $q$monthly$q$, $q$["IT help desk","Asset management","Change management","Project management"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$overview$q$, $q$What is ManageEngine ServiceDesk Plus?$q$, 2, ARRAY[$q$ServiceDesk Plus is an AI-driven ITSM platform from ManageEngine (part of Zoho) that combines IT service management, IT asset management, and CMDB capabilities, and extends into enterprise service management for departments like HR and finance.$q$, $q$It offers a free edition limited to 5 technicians on the Standard tier, plus paid Standard, Professional, and Enterprise editions starting at $13, $27, and $67 per technician per month respectively, available both on-premises and in the cloud.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$who-its-for$q$, $q$Who ServiceDesk Plus is for$q$, 2, ARRAY[$q$ServiceDesk Plus fits small IT teams that can start on the free 5-technician edition, as well as larger enterprises needing asset management, change management, and multi-department service delivery on paid editions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── OTRS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Commercial service management platform for customer service, ITSM, and ISMS from OTRS AG; the free Community Edition was discontinued in 2020.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$Hungarian$q$, $q$French$q$, $q$Italian$q$]::text[],
  seo_meta_description = $q$OTRS is a commercial service management platform for customer service, ITSM, and ISMS from OTRS AG, with quote-based pricing and managed hosting.$q$,
  og_description = $q$OTRS is a commercial service management platform for customer service, ITSM, and ISMS from OTRS AG, with quote-based pricing and managed hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '47b3f39e-f481-4d52-be50-11d497bacb7b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '47b3f39e-f481-4d52-be50-11d497bacb7b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Ticketing and service desk$q$, $q$Core ticketing functionality for customer service and IT support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Business process management$q$, $q$Workflow automation for service processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Asset/device management and CMDB$q$, $q$Tracks assets and configuration items.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Reporting and KPI measurement$q$, $q$Built-in reporting and key performance indicator tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$AI-powered summaries$q$, $q$AI-generated ticket summaries and analytics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Kanban views and time tracking$q$, $q$Visual workflow boards and time tracking for tickets.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Covers customer service, ITSM, ISMS, and cyber defense use cases in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Includes AI-powered summaries and analytics$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Multilingual support (English, German, Spanish, Portuguese, Hungarian, French, Italian)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Managed/hosted deployment offered by OTRS AG$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$The free ((OTRS)) Community Edition was discontinued (EOL) at the end of 2020, so new users get only the commercial product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$No public pricing; requires contacting sales for a demo and quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Organizations still on the legacy Community Edition rely on community forks (e.g., Znuny) rather than official OTRS AG support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Is OTRS still open source?$q$, $q$The free ((OTRS)) Community Edition was discontinued at the end of 2020; OTRS is now offered as a commercial, managed product by OTRS AG.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$What alternatives exist for the old Community Edition?$q$, $q$Community forks such as Znuny continue to provide free, open-source alternatives based on the last Community Edition release.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$What is OTRS used for?$q$, $q$It is used for customer service, IT service management (ITSM), information security management (ISMS), and cyber defense.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Is pricing public?$q$, $q$No, OTRS pricing is not published; prospects must contact OTRS AG for a demo and quote.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$IT service management$q$, $q$Manage tickets, changes, and CMDB data for IT teams.$q$, $q$IT service teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$Customer service and ISMS$q$, $q$Run customer service ticketing alongside information security management processes.$q$, $q$Customer service and security teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$overview$q$, $q$What is OTRS?$q$, 2, ARRAY[$q$OTRS is a service management platform from OTRS AG used for customer service, IT service management (ITSM), information security management (ISMS), and cyber defense. It includes ticketing, business process management, asset/CMDB tracking, reporting, and AI-powered ticket summaries.$q$, $q$The historically free ((OTRS)) Community Edition was declared end of life at the end of 2020, and OTRS AG now promotes migrating to its commercial, managed OTRS offering. Organizations that want a free, open-source alternative typically use community forks such as Znuny instead.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$who-its-for$q$, $q$Who OTRS is for$q$, 2, ARRAY[$q$OTRS fits organizations wanting a commercially supported, managed service management platform spanning ITSM, customer service, and ISMS, rather than teams looking for a free self-hosted ticketing system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Horilla ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source HRMS with attendance, payroll, recruitment, and performance modules, free to self-host or available as paid cloud hosting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$7/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Kerala, India$q$,
  languages = '{}',
  seo_meta_description = $q$Horilla is an open-source HRMS covering attendance, payroll, recruitment, and performance, self-hostable free under LGPL-2.1 or hosted from $7/user/month.$q$,
  og_description = $q$Horilla is an open-source HRMS covering attendance, payroll, recruitment, and performance, self-hostable free under LGPL-2.1 or hosted from $7/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Employee database$q$, $q$Central employee records shared across all HR modules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Attendance tracking$q$, $q$Attendance capture with mobile check-in support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Payroll$q$, $q$Built-in payroll processing integrated with attendance and leave data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Leave management$q$, $q$Leave request, approval, and balance tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Recruitment & onboarding$q$, $q$Applicant tracking and structured onboarding workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Performance management$q$, $q$Employee performance review tracking.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Asset tracking$q$, $q$Tracks company assets assigned to employees.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Helpdesk$q$, $q$Internal HR ticketing/helpdesk module.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Self-hosted edition is free forever and released under LGPL-2.1 with source on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$All nine HR modules are bundled together rather than sold as separate add-ons$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Docker one-click installation simplifies self-hosted deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Active open-source community with 820+ forks and 11,000+ deployed teams$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Cloud plan includes a 30-day free trial before billing starts$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Cloud hosting is billed per user ($7/user/month), which scales with team size$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Self-hosting requires the team to manage its own server infrastructure and updates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Enterprise plan pricing is custom/quote-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Mobile app support is limited primarily to attendance check-in functionality$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Is Horilla free?$q$, $q$Yes, the self-hosted, open-source edition is free forever under the LGPL-2.1 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Does Horilla offer hosted cloud plans?$q$, $q$Yes, Horilla Cloud is priced at $7 per user per month with a 30-day free trial, plus a custom-priced Enterprise tier with dedicated support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Can I self-host Horilla?$q$, $q$Yes, Horilla supports Docker one-click installation as well as manual bare-metal deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Who builds Horilla?$q$, $q$Horilla is built and maintained by Cybrosys Technologies, headquartered in Kerala, India.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Unified HR system without per-module fees$q$, $q$Growing companies that want attendance, payroll, recruitment, and performance tracking in one open platform instead of stitching together separate tools.$q$, $q$SMB HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Full data ownership via self-hosting$q$, $q$Organizations with data residency or privacy requirements that need to keep HR data on their own infrastructure.$q$, $q$IT/compliance-conscious teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Managed HR without server upkeep$q$, $q$Teams that want Horilla's feature set without operating their own servers can use the paid cloud-hosted plan.$q$, $q$Teams without in-house DevOps$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["All 9 HR modules","Self-managed infrastructure","Open-source, LGPL-2.1 licensed"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Cloud$q$, $q$$7/user/month$q$, $q$monthly$q$, $q$["Managed hosting","First 30 days free","All HR modules included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated support","Custom implementation"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$overview$q$, $q$What is Horilla?$q$, 2, ARRAY[$q$Horilla is an open-source Human Resource Management System that bundles attendance, payroll, leave management, recruitment, onboarding, performance management, asset tracking, an employee database, and helpdesk ticketing into a single platform. It's built and maintained by Cybrosys Technologies, based in Kerala, India.$q$, $q$The software is released under the LGPL-2.1 license, and the full source code is available on GitHub, so teams can self-host it for free, audit the code, or fork it. Cybrosys also offers a managed Horilla Cloud option and a custom-priced Enterprise tier for teams that don't want to run their own infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$who-its-for$q$, $q$Who Horilla is for$q$, 2, ARRAY[$q$Horilla suits growing organizations that want a full HR suite without paying separately for each module, especially teams comfortable self-hosting via Docker. It also fits companies that need to keep HR data on infrastructure they control, or that prefer a paid cloud-hosted option ($7/user/month) if they don't want to manage servers themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── MintHCM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Human Capital Management system for recruitment, employee records, performance, and leave management, self-hosted under AGPLv3.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MintHCM is a free, open-source HCM platform for recruitment, employee profiles, performance, and leave management, self-hosted under AGPLv3.$q$,
  og_description = $q$MintHCM is a free, open-source HCM platform for recruitment, employee profiles, performance, and leave management, self-hosted under AGPLv3.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6fd92840-a8d9-4354-97b1-b102f54b88d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6fd92840-a8d9-4354-97b1-b102f54b88d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Recruitment$q$, $q$Job descriptions, employer branding, and applicant handling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Onboarding & offboarding$q$, $q$Structured processes for bringing employees in and out.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Employee profiles & competencies$q$, $q$Centralized profiles tracking employment history and competencies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Performance evaluation$q$, $q$Tools for tracking and evaluating employee performance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Time & leave management$q$, $q$Time management, calendar, and leave request tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Travel & expense management$q$, $q$Tracking of travel and expense requests.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Analytics$q$, $q$Reporting on HR processes across the platform.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Open API$q$, $q$API access enabling custom integrations with systems like SAP and Workday.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Completely free and open source with no license fees, only self-hosting/server costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Released under AGPLv3 with source code publicly available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Open API allows custom integration with enterprise systems$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Community-driven translation into multiple languages via Crowdin$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Marketed with AI-enabled features for HR workflows$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Requires self-hosting and managing your own server infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Smaller open-source community (roughly 378 GitHub stars at time of review)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Support is primarily community-forum based, with paid implementation partners as an option$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Built on the SuiteCRM/SugarCRM codebase, which may carry some legacy architecture$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Is MintHCM free?$q$, $q$Yes, MintHCM is free and open source; the only ongoing cost is your own server/hosting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$What license is MintHCM released under?$q$, $q$MintHCM is released under the GNU Affero General Public License v3 (AGPLv3).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Can MintHCM integrate with systems like SAP or Workday?$q$, $q$MintHCM exposes an open API that can be used for custom integrations with enterprise systems such as SAP and Workday.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Is MintHCM available in languages other than English?$q$, $q$The interface can be translated into additional languages through MintHCM's community Crowdin project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Free self-hosted HCM for cost-conscious teams$q$, $q$Organizations that want a full HCM feature set without software license fees and are willing to self-host.$q$, $q$SMBs and budget-constrained HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$Custom enterprise integration$q$, $q$Companies needing to connect HR data with existing enterprise systems via the open API.$q$, $q$IT teams integrating HR with SAP/Workday$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$overview$q$, $q$What is MintHCM?$q$, 2, ARRAY[$q$MintHCM is a free, open-source Human Capital Management system covering recruitment, onboarding, employee profiles, performance evaluation, time and leave management, and travel/expense tracking. It is released under the AGPLv3 license and self-hosted on the organization's own infrastructure.$q$, $q$The project exposes an open API for integrating with enterprise systems such as SAP and Workday, and its interface can be translated into additional languages through a community Crowdin project.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$who-its-for$q$, $q$Who MintHCM is for$q$, 2, ARRAY[$q$MintHCM fits organizations that want a no-license-fee HCM system and are comfortable self-hosting and maintaining their own servers, including teams that need to integrate HR data with existing enterprise software via its open API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Open HRMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source HR management software built on Odoo, covering recruitment, payroll, attendance, and appraisals, with paid support packages available.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Kerala, India$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Open HRMS is a free, open-source HR management platform built on Odoo, covering recruitment, payroll, attendance, and appraisals.$q$,
  og_description = $q$Open HRMS is a free, open-source HR management platform built on Odoo, covering recruitment, payroll, attendance, and appraisals.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8e6508f8-f264-449c-bf83-015dd51a8619';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8e6508f8-f264-449c-bf83-015dd51a8619' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Recruitment$q$, $q$Applicant tracking and recruiting workflow.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Employee database$q$, $q$Centralized employee information management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Payroll$q$, $q$Salary and payment processing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Appraisal$q$, $q$Performance management and employee evaluation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Attendance & leaves$q$, $q$Time and leave tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$HR reports$q$, $q$Analytics and reporting dashboards.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Timesheets$q$, $q$Timesheet tracking tied to HR records.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Free, open-source download with no software license fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Built on the mature Odoo ERP platform, inheriting its module ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Multiple Odoo version releases supported with installation guides$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Cloud demo instance available to evaluate before installing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Paid monthly support packages available for teams that want hands-on help$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Self-hosted deployment requires manual installation and PostgreSQL setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Paid support is incident-based ($499-$1,099/month) rather than a standard SaaS subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$No hosted/managed cloud pricing is published on the site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Relies on Odoo framework knowledge for deeper customization$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Is Open HRMS free?$q$, $q$Yes, Open HRMS is a free, open-source download; the company also sells optional paid support packages.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$What are the paid support packages?$q$, $q$Open HRMS offers three incident-based monthly support packages priced at $499, $799, and $1,099, covering 15, 30, and 45 support incidents respectively with 24x7 availability.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$What platform is Open HRMS built on?$q$, $q$Open HRMS is built on Odoo, the open-source ERP platform, with HR-specific modules and customizations added.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Who develops Open HRMS?$q$, $q$Open HRMS is developed by Cybrosys Technologies, with offices in Kerala, India and London, UK.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Free self-hosted HR on Odoo$q$, $q$Teams already using or open to Odoo who want a free HR module suite added on top.$q$, $q$Odoo users and SMB HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Supported deployments$q$, $q$Organizations wanting hands-on setup help and ongoing support can purchase an incident-based support package.$q$, $q$Teams without in-house Odoo expertise$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Support Package 1$q$, $q$$499/month$q$, $q$monthly$q$, $q$["15 incidents","24x7 support","Development included","1-hour max response time"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Support Package 2$q$, $q$$799/month$q$, $q$monthly$q$, $q$["30 incidents","24x7 support","Development included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$Support Package 3$q$, $q$$1,099/month$q$, $q$monthly$q$, $q$["45 incidents","24x7 support","Development included"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$overview$q$, $q$What is Open HRMS?$q$, 2, ARRAY[$q$Open HRMS is a free, open-source HR management platform built on the Odoo ERP framework. It covers recruitment, employee records, payroll, appraisals, attendance, leave tracking, and HR reporting.$q$, $q$It's developed by Cybrosys Technologies, which also sells optional incident-based support packages ($499-$1,099/month) for teams that want hands-on implementation help alongside the free software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$who-its-for$q$, $q$Who Open HRMS is for$q$, 2, ARRAY[$q$Open HRMS suits organizations already familiar with Odoo, or those wanting a free HR system they can self-host and customize, with the option to purchase support if they lack in-house Odoo expertise.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Kimai ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source time tracking software for project-driven teams, free to self-host under AGPL-3 or available as GDPR-compliant hosted cloud plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€2.99/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Austria$q$,
  languages = ARRAY[$q$Catalan$q$, $q$Czech$q$, $q$German$q$, $q$English$q$, $q$Spanish$q$, $q$French$q$, $q$Hebrew$q$, $q$Croatian$q$, $q$Italian$q$, $q$Dutch$q$, $q$Polish$q$, $q$Portuguese$q$, $q$Slovak$q$, $q$Swedish$q$, $q$Tamil$q$, $q$Ukrainian$q$]::text[],
  seo_meta_description = $q$Kimai is an open-source time tracking tool for project teams, free to self-host under AGPL-3 or hosted from €2.99/user/month with EU-based cloud plans.$q$,
  og_description = $q$Kimai is an open-source time tracking tool for project teams, free to self-host under AGPL-3 or hosted from €2.99/user/month with EU-based cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9723eb0b-ac61-46c1-b15a-4b60b4e6d68f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9723eb0b-ac61-46c1-b15a-4b60b4e6d68f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Time tracking & reporting$q$, $q$Track and analyze company time data with built-in reporting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Invoicing$q$, $q$Configurable invoice templates in PDF and DOCX, including e-invoicing (EN 16931, XRechnung 3.0).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$JSON API$q$, $q$API for external integrations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$SSO authentication$q$, $q$LDAP and SAML login support, including Google Workspace, Azure AD, and Authentik.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Two-factor authentication$q$, $q$TOTP-based 2FA for account security.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Customer & project management$q$, $q$Manage customers and projects with role-based permissions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Data export$q$, $q$Export time data as XLSX, PDF, CSV, or HTML.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Customer portal$q$, $q$Share statistics with customers via a dedicated portal.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Self-hosted edition is free forever and 100% open source under AGPL-3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Cloud plans include GDPR-compliant hosting in Germany with automatic updates and backups$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Translated into 30+ languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Built-in e-invoicing compliant with EN 16931 and XRechnung 3.0 standards$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Supports enterprise-grade SSO via SAML and LDAP$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$No native mobile apps are mentioned; access is web-based$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Higher-tier features (e.g., SSO, customer portal, custom domain) require the paid Professional cloud plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Self-hosting requires managing your own server and updates$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Is Kimai free?$q$, $q$Yes, the self-hosted version is free forever and fully open source under the AGPL-3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$What does Kimai Cloud cost?$q$, $q$Kimai Cloud starts at €2.99/user/month (Standard, billed annually) or €3.99/user/month for the Professional plan billed annually, with 20% savings versus monthly billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Where is Kimai Cloud hosted?$q$, $q$Kimai Cloud is hosted in Germany and is GDPR compliant.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Can I self-host Kimai?$q$, $q$Yes, Kimai supports Docker and manual self-hosted installation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Self-hosted time tracking for full data control$q$, $q$Teams that want to run time tracking on their own infrastructure at no license cost.$q$, $q$Self-hosting freelancers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Managed EU-hosted time tracking$q$, $q$Teams that want Kimai's features without server maintenance can use the GDPR-compliant cloud plans.$q$, $q$EU-based project teams and consultancies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Full feature set","AGPL-3 open source","Self-managed hosting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Standard (Cloud)$q$, $q$€2.99/user/month (annual) / €3.99/user/month (monthly)$q$, $q$monthly$q$, $q$["Project time tracking","Billable hours","Invoicing","Data export & audit logs","5 custom invoice templates","Weekly backups"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Professional (Cloud)$q$, $q$€3.99/user/month (annual) / €4.99/user/month (monthly)$q$, $q$monthly$q$, $q$["Everything in Standard","Working hour accounts","Expense tracking","Task management","Customer portal","Kiosk mode","SAML SSO","Custom domain with SSL","10 custom invoice templates","Daily backups"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$overview$q$, $q$What is Kimai?$q$, 2, ARRAY[$q$Kimai is an open-source time tracking platform for project-driven teams, offering time tracking, reporting, invoicing, and a JSON API. The self-hosted edition is free and released under the AGPL-3 license.$q$, $q$For teams that don't want to run their own server, Kimai also offers hosted Cloud plans (Standard and Professional) with GDPR-compliant hosting in Germany, starting at €2.99/user/month billed annually.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$who-its-for$q$, $q$Who Kimai is for$q$, 2, ARRAY[$q$Kimai suits project-based teams, agencies, and consultancies that need time tracking with invoicing, whether they prefer to self-host for free or use a managed EU-hosted cloud plan with SSO and customer-facing reporting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ActivityWatch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, privacy-first automatic time tracker that stores all activity data locally on the user's device.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ActivityWatch is a free, open-source automatic time tracker that logs app and website usage locally, with no premium tiers or data sent to servers.$q$,
  og_description = $q$ActivityWatch is a free, open-source automatic time tracker that logs app and website usage locally, with no premium tiers or data sent to servers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c90b471e-f0b7-403c-972f-49e1d0871d55' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Automatic activity tracking$q$, $q$Tracks active applications and window titles without manual timers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Local-first storage$q$, $q$All time tracking data stays on the user's own device and is never sent to a server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Browser extensions$q$, $q$Chrome and Firefox extensions capture web browsing activity.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Editor plugins$q$, $q$Plugins for tracking coding time inside editors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Categorization$q$, $q$Tools for organizing tracked activity into categories.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Custom watchers$q$, $q$Extendable watcher system for capturing additional activity types.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Completely free with no premium tiers, usage limits, or ads$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Open source under the MPL-2.0 license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Privacy-first: all data stored locally on-device rather than sent to a server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Cross-platform support for Windows, macOS, Linux, and Android$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Extensible via browser extensions, editor plugins, and custom watchers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Cross-device synchronization is still in development$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$No built-in cloud dashboard or team/manager reporting, since data stays local$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Developed by volunteers, so support relies on the open-source community$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Is ActivityWatch free?$q$, $q$Yes, ActivityWatch is completely free with no premium tiers, usage limits, or ads.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Where is my tracked data stored?$q$, $q$All time tracking data is stored locally on your own device and is never sent to any server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$What platforms does ActivityWatch support?$q$, $q$ActivityWatch supports Windows, macOS, Linux, and Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$What license is ActivityWatch released under?$q$, $q$ActivityWatch is licensed under the Mozilla Public License 2.0 (MPL-2.0).$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Privacy-conscious personal time tracking$q$, $q$Individuals who want automatic activity tracking without sending data to a third-party server.$q$, $q$Privacy-conscious individuals and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Developer time tracking$q$, $q$Developers who want to track coding time via editor plugins alongside general app/website usage.$q$, $q$Software developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$overview$q$, $q$What is ActivityWatch?$q$, 2, ARRAY[$q$ActivityWatch is a free, open-source automatic time tracker that logs active applications, window titles, and web browsing activity to give users insight into how they spend time on their devices.$q$, $q$It follows a local-first, privacy-focused model: all tracked data is stored on the user's own device and never transmitted to a server. The project is licensed under MPL-2.0 and supports Windows, macOS, Linux, and Android, with browser extensions and editor plugins extending what it can track.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$who-its-for$q$, $q$Who ActivityWatch is for$q$, 2, ARRAY[$q$ActivityWatch fits individuals and developers who want automated personal time tracking without any subscription cost or cloud data collection, including those who specifically want their activity data to never leave their device.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Traggo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted, tag-based time tracking tool with dashboards, calendar views, and a Docker deployment.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Traggo is a free, open-source, self-hosted, tag-based time tracking tool with customizable dashboards and calendar views.$q$,
  og_description = $q$Traggo is a free, open-source, self-hosted, tag-based time tracking tool with customizable dashboards and calendar views.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd816c0d6-616e-417e-bf4c-30fc9be88134';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd816c0d6-616e-417e-bf4c-30fc9be88134' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Tag-based tracking$q$, $q$Organize tracked time using flexible custom tags instead of fixed tasks or projects.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Customizable dashboards$q$, $q$Build dashboards with diagrams from tracked time data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$List and calendar views$q$, $q$View tracked time entries as a list or on a calendar.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Theming$q$, $q$Web UI with multiple theme options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$User management$q$, $q$Manage multiple users on a self-hosted instance.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Completely free and open source with no commercial pricing tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Full data control since self-hosting is the only deployment option$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Flexible tag-based organization instead of rigid project/task structures$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Docker-based deployment for straightforward setup$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Customizable dashboards and both list and calendar views$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$No hosted/cloud version is offered; self-hosting is required$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Built by a small open-source project, so support relies on the community$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Tag-based model may require more manual setup than task/project-based tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Is Traggo free?$q$, $q$Yes, Traggo is completely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Does Traggo offer a hosted/cloud version?$q$, $q$No, Traggo is self-hosted only; there is no cloud-hosted option.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$How does Traggo organize tracked time?$q$, $q$Traggo uses a tag-based system, letting users categorize time entries with custom tags instead of predefined projects or tasks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$How is Traggo deployed?$q$, $q$Traggo is deployed via Docker for self-hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Self-hosted personal/team time tracking$q$, $q$Users who want a free, self-hosted time tracker with full control over their data.$q$, $q$Freelancers and small self-hosting teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$Flexible tag-based categorization$q$, $q$Users who prefer organizing tracked time by custom tags rather than a fixed project/task hierarchy.$q$, $q$Users with non-standard time categorization needs$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$overview$q$, $q$What is Traggo?$q$, 2, ARRAY[$q$Traggo is a free, open-source, self-hosted time tracking tool that organizes tracked time using custom tags rather than traditional tasks or projects. It offers customizable dashboards, list and calendar views, and a themeable web UI.$q$, $q$Traggo is deployed via Docker and is self-hosted only, meaning there is no cloud-hosted version; all tracked data stays on infrastructure the user controls.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$who-its-for$q$, $q$Who Traggo is for$q$, 2, ARRAY[$q$Traggo suits individuals and small teams who want a free, self-hosted time tracker with a flexible, tag-based way of categorizing time rather than a rigid project/task structure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Solidtime ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source time tracking app for teams and freelancers, with a free solo plan, paid Professional cloud plan, and self-hosting option.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€8/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Solidtime is an open-source time tracker with a free solo plan, invoicing, desktop apps, and paid Professional cloud plans from €8/user/month.$q$,
  og_description = $q$Solidtime is an open-source time tracker with a free solo plan, invoicing, desktop apps, and paid Professional cloud plans from €8/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5c6ff423-a4cd-408d-b230-67dfd498aa1d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5c6ff423-a4cd-408d-b230-67dfd498aa1d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Timer, calendar & weekly views$q$, $q$Track time via a timer, calendar, or weekly timesheet view.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Reporting$q$, $q$Filter, share, and export reports of tracked hours.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Invoicing$q$, $q$Convert billable hours into invoices, with VAT and discount support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Multi-project support$q$, $q$Manage multiple projects with rates, team roles, and access controls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Desktop app$q$, $q$Automatic activity tracking and idle detection with local-only privacy storage.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Browser extension$q$, $q$Browser extension for tracking time alongside the desktop app.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Free Solo plan available with no credit card required to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Open source under AGPL-3.0 with over 8,600 GitHub stars$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Self-hosting option available for organizations that want on-premise deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$EU-hosted cloud infrastructure with GDPR-compliant, privacy-first design$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Desktop apps for macOS, Windows, and Linux with idle detection$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Free plan is limited to a single user$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Invoicing, team features, and advanced reporting require the paid Professional plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$No specific founding year or headquarters is published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Is Solidtime free?$q$, $q$Yes, Solidtime offers a free Solo plan for a single user with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$How much does Solidtime's paid plan cost?$q$, $q$The Professional plan costs €9/user/month billed monthly, or €8/user/month billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Can I self-host Solidtime?$q$, $q$Yes, Solidtime is open source (AGPL-3.0) and offers a self-hosting/on-premise option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$What platforms does Solidtime support?$q$, $q$Solidtime is available as a web app, desktop apps for macOS, Windows, and Linux, and a browser extension.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Freelancer time tracking and invoicing$q$, $q$Freelancers who track billable hours and convert them into invoices.$q$, $q$Freelancers and solo consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Team time tracking with access controls$q$, $q$Teams needing project rates, role-based access, and shareable reports.$q$, $q$Agencies and client-facing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Self-hosted deployment$q$, $q$Organizations wanting to run Solidtime on their own infrastructure instead of the cloud version.$q$, $q$Privacy-conscious organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Solo (Free)$q$, $q$Free$q$, NULL, $q$["1 user","Clients, projects, tags, tasks","Billable hours & rates","Reporting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Professional$q$, $q$€9/user/month (monthly) / €8/user/month (annual)$q$, $q$monthly$q$, $q$["Everything in Solo","Team support","Project/organization access management","Invoicing","Project & task estimates","Time entry rounding","PDF reports","Shareable reports","Priority support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$overview$q$, $q$What is Solidtime?$q$, 2, ARRAY[$q$Solidtime is an open-source time tracking application for teams and freelancers, offering a timer, calendar and weekly timesheet views, reporting, invoicing, and multi-project support. It's released under AGPL-3.0 and has over 8,600 GitHub stars.$q$, $q$The product is offered as a free Solo cloud plan for a single user, a paid Professional cloud plan (from €8/user/month annually) for teams needing invoicing and access controls, and a self-hosted on-premise option for organizations that prefer to run it themselves.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$who-its-for$q$, $q$Who Solidtime is for$q$, 2, ARRAY[$q$Solidtime fits freelancers who want free solo time tracking and invoicing, as well as agencies and client-facing teams that need multi-project rates, team access controls, and shareable reports, with self-hosting available for teams that prefer to control their own data.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── TMetric ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Time tracking software for service teams to capture billable hours, manage billing rates, and track project profitability.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free for up to 2 seats$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TMetric is time tracking software for agencies and client-facing teams, offering billable hours, invoicing, and project budgets, free for up to 2 seats.$q$,
  og_description = $q$TMetric is time tracking software for agencies and client-facing teams, offering billable hours, invoicing, and project budgets, free for up to 2 seats.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6ca54283-3659-44f7-9c00-35f92eddfd5f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6ca54283-3659-44f7-9c00-35f92eddfd5f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Automated time tracking$q$, $q$Real-time tracking across desktop, browser, and mobile apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Project profitability$q$, $q$Budget tracking and cost-versus-revenue analysis per project.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Billing & invoicing$q$, $q$Automatic invoice generation applying configured billing rates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Team management$q$, $q$Dashboards, work schedules, and team activity tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Timesheets$q$, $q$Automated timesheet calculation with approval workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Reporting$q$, $q$Reports on projects, tasks, team activity, and app usage.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Time off management$q$, $q$Leave requests, balances, and accrual tracking.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$App & site monitoring$q$, $q$Screenshot capture and activity tracking for teams (Business plan).$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Free plan available for up to 2 seats with unlimited time tracking, clients, and projects$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$14-day free trial with no credit card required, extendable by 7 more days$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$50+ integrations including Jira, Asana, QuickBooks, GitHub, and Trello$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Available across web, desktop (Windows/macOS), mobile (iOS/Android), and browser extensions$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$4.6-star rating from 3,000+ reviews and used by 10,000+ companies$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Exact per-seat pricing for Professional and Business plans is not publicly listed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Advanced features like invoicing, time off, and screenshot monitoring require paid tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Enterprise plan requires custom/quote-based pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Does TMetric have a free plan?$q$, $q$Yes, TMetric offers a free plan for up to 2 seats with unlimited time tracking, clients, and projects.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Is there a free trial?$q$, $q$Yes, TMetric offers a 14-day free trial with no credit card required, extendable by 7 additional days.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$What platforms does TMetric support?$q$, $q$TMetric is available as a web app, Windows and macOS desktop apps, iOS and Android mobile apps, and browser extensions for Chrome, Firefox, Opera, Edge, and Safari.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$What integrations does TMetric offer?$q$, $q$TMetric integrates with 50+ tools including Jira, Asana, QuickBooks, Notion, GitHub, GitLab, Zendesk, Google Workspace, Microsoft Office, and Trello.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Billable hours for agencies$q$, $q$Agencies and consultancies tracking billable hours, billing rates, and project margins.$q$, $q$Agencies and consultancies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Client-facing project profitability$q$, $q$Client-facing teams needing budget tracking and cost-vs-revenue analysis per project.$q$, $q$Project managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Team activity monitoring$q$, $q$Teams wanting app/site monitoring and screenshot capture alongside time tracking.$q$, $q$Managers of distributed teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Free$q$, $q$Free$q$, NULL, $q$["Up to 2 seats","Unlimited time tracking, clients, projects","Exportable reports","50+ app integrations","Web, mobile, and desktop apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Professional$q$, $q$Per seat/month$q$, $q$monthly$q$, $q$["Everything in Free","Billable rates","Expenses","Project budgets","Invoicing","Task management","Calendar sync with Google and Outlook"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Business$q$, $q$Per seat/month$q$, $q$monthly$q$, $q$["Everything in Professional","Time Off Module","Team timesheets","App & site monitoring","Screenshot capturing","Advanced integrations (Jira, Redmine, ClickUp, QuickBooks)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Fully customizable features and integrations","Priority support","Secure deployment options","Volume discounts"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$overview$q$, $q$What is TMetric?$q$, 2, ARRAY[$q$TMetric is time tracking software built for service teams to capture billable hours, manage billing rates, and control project margins. It targets agencies, consultancies, and client-facing teams looking to reduce revenue leakage from untracked time.$q$, $q$It offers a free plan for up to 2 seats, paid Professional and Business plans that add invoicing, time off management, and app/site monitoring, and a custom-priced Enterprise plan, with apps across web, desktop, and mobile.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$who-its-for$q$, $q$Who TMetric is for$q$, 2, ARRAY[$q$TMetric suits agencies, consultancies, and other client-facing teams that need to track billable hours, manage project budgets, and generate invoices, from small teams using the free tier to larger teams needing team timesheets and activity monitoring.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── TimeCamp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered time tracking platform with automated timesheets, invoicing, and attendance/payroll reporting, with a free plan for unlimited users.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$3.99/user/month$q$,
  founded_year = NULL,
  company_size = $q$50 employees$q$,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TimeCamp is an AI-powered time tracker with automated timesheets, invoicing, and payroll reporting, free for unlimited users or from $3.99/user/month.$q$,
  og_description = $q$TimeCamp is an AI-powered time tracker with automated timesheets, invoicing, and payroll reporting, free for unlimited users or from $3.99/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dc59330e-f844-4f93-be6c-bf6f8678410b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dc59330e-f844-4f93-be6c-bf6f8678410b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$AI Time Tracking Agent (TIC)$q$, $q$Automatically fills timesheets by monitoring applications, websites, and calendar activity.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Automated & manual tracking$q$, $q$One-click timer, manual entry, and background activity monitoring.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Timesheet approvals$q$, $q$Managers review, approve, or reject entries with audit-ready locking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Real-time dashboards$q$, $q$Productivity metrics, labor costs, and workforce capacity data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Invoicing & billing$q$, $q$Create invoices from billable hours with custom billing rates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Attendance & payroll$q$, $q$Tracks time-off and overtime, generating payroll-ready reports.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Compliance features$q$, $q$Supports GDPR, SOC2, HIPAA, and DCAA standards with role-based access.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Free plan supports unlimited users, projects, and timesheets with core tracking$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$14-day free trial on paid plans with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$AI Time Tracking Agent automatically fills timesheets from app, website, and calendar activity$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$50+ integrations including Jira, Asana, Trello, ClickUp, and Monday.com$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Available on web, Windows, macOS, and Linux desktop apps$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$4.7-star rating from 1,500+ reviews and used by 18,000+ teams in 102 countries$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$AI tracking, invoicing, and attendance features require the paid Starter plan or above$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Data export and timesheet approvals are limited to the higher Ultimate plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Enterprise pricing (private cloud, SSO, custom integrations) is custom/quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Is TimeCamp free?$q$, $q$Yes, TimeCamp offers a free plan with unlimited users, projects, and timesheets, plus core time tracking.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$How much do TimeCamp's paid plans cost?$q$, $q$Paid plans start at Starter ($3.99/user/month billed annually), Premium ($6.99/user/month), and Ultimate ($9.99/user/month), with a custom-priced Enterprise tier above that.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Does TimeCamp offer a free trial?$q$, $q$Yes, a 14-day free trial is available with no credit card required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$What is the TimeCamp AI Time Tracking Agent (TIC)?$q$, $q$TIC is an AI agent that automatically fills in timesheets by monitoring applications, websites, and calendar activity, available on Starter plans and above.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Automated timesheets$q$, $q$Teams that want timesheets filled in automatically rather than tracked manually.$q$, $q$Teams wanting low-effort time tracking$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Project profitability & invoicing$q$, $q$Agencies and consultancies billing clients based on tracked, billable hours.$q$, $q$Agencies and consultancies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Payroll and attendance reporting$q$, $q$HR and finance teams needing payroll-ready attendance and overtime reports.$q$, $q$HR and payroll teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Unlimited users, projects, timesheets","Core time tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Starter$q$, $q$$3.99/user/month$q$, $q$annual$q$, $q$["AI Tracker (TIC)","Invoicing","Attendance calendar"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Premium$q$, $q$$6.99/user/month$q$, $q$annual$q$, $q$["Resource planner","Billable time","Budget alerts"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Ultimate$q$, $q$$9.99/user/month$q$, $q$annual$q$, $q$["Data export","Remote detection","Timesheet approvals"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Private cloud","SSO","Custom integrations","Dedicated support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$overview$q$, $q$What is TimeCamp?$q$, 2, ARRAY[$q$TimeCamp is a time tracking platform that combines automated and manual time logging with an AI agent (TIC) that fills in timesheets by monitoring applications, websites, and calendar activity. It also offers timesheet approvals, invoicing, and payroll-ready attendance reporting.$q$, $q$The Free plan supports unlimited users and core tracking, while paid Starter, Premium, and Ultimate plans add AI tracking, invoicing, resource planning, and data export, with a custom-priced Enterprise tier for private cloud and SSO needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$who-its-for$q$, $q$Who TimeCamp is for$q$, 2, ARRAY[$q$TimeCamp fits teams that want low-effort, largely automated time tracking, as well as agencies needing project billing and invoicing, and HR/finance teams needing payroll and attendance reports.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── DeskTime ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Automatic time tracking and productivity monitoring software for remote, hybrid, and on-site teams, founded in 2011 by Latvia's Draugiem Group.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$€5.50/user/month$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = $q$Riga, Latvia$q$,
  languages = '{}',
  seo_meta_description = $q$DeskTime is automatic time tracking and productivity monitoring software for remote and hybrid teams, from €5.50/user/month with a 14-day free trial.$q$,
  og_description = $q$DeskTime is automatic time tracking and productivity monitoring software for remote and hybrid teams, from €5.50/user/month with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b6b57d57-40f4-4d52-966d-761a1cafadb8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b6b57d57-40f4-4d52-966d-761a1cafadb8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Automatic time tracking$q$, $q$Background activity monitoring without manual entry.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Productivity analysis$q$, $q$Calculates productivity metrics and identifies focus patterns.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Activity monitoring$q$, $q$URL/app tracking, document title monitoring, and screenshot capture.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Workforce management$q$, $q$Shift scheduling, absence calendars, and attendance tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Reporting & analytics$q$, $q$Customizable reports with admin and user dashboards, including AI-powered summaries.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Private time$q$, $q$Lets employees pause tracking during non-work activities.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Integrations$q$, $q$Connects with Jira, Asana, Outlook, Google Calendar, GitLab, Trello, Zapier, and via API.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Founded in 2011 as part of Latvia's Draugiem Group, with 730,000+ users and 330 million+ hours tracked$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$14-day free trial across plans, plus a bonus free month with annual billing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$ISO 27001 & 27701 certified with GDPR compliance and two-factor authentication$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$4.5/5 rating on G2 from 400+ reviews$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Screenshot capture and shift scheduling included on higher tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$No free plan; only a 14-day free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Screenshots, integrations, and API access require the Premium plan or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Enterprise plan requires a minimum of 200+ users$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Prices are listed in EUR/USD and exclude VAT$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Does DeskTime have a free plan?$q$, $q$No, DeskTime does not offer a permanent free plan, but it does offer a 14-day free trial and a free month when billed annually.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$How much does DeskTime cost?$q$, $q$The Pro plan starts at €5.50/user/month, and Premium is €8.25/user/month, both billed annually or monthly; Enterprise (200+ users) is custom priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$When was DeskTime founded?$q$, $q$DeskTime was created in 2011 as an internal tool within Draugiem Group, a Latvia-based business incubator, and remains part of that company.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Is DeskTime GDPR compliant?$q$, $q$Yes, DeskTime is ISO 27001 & 27701 certified and GDPR compliant, with data encryption and two-factor authentication support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Remote/hybrid team productivity monitoring$q$, $q$Managers tracking productivity and attendance across distributed teams.$q$, $q$Managers of remote and hybrid teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Shift-based workforce management$q$, $q$Organizations needing shift scheduling and absence calendars alongside time tracking.$q$, $q$Shift-based and on-site teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Large enterprise deployments$q$, $q$Large organizations (200+ users) needing custom API integrations and a dedicated account manager.$q$, $q$Enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Pro$q$, $q$€5.50/user/month$q$, $q$monthly$q$, $q$["Document title tracking","Productivity calculations","Calendar integrations","1 month free with annual billing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Premium$q$, $q$€8.25/user/month$q$, $q$monthly$q$, $q$["Everything in Pro","Screenshots","Integrations & API","Shift scheduling","1 month free with annual billing"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Minimum 200+ users","Everything in Premium","Custom API","Dedicated account manager","Employee training"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$overview$q$, $q$What is DeskTime?$q$, 2, ARRAY[$q$DeskTime is automatic time tracking and productivity monitoring software for remote, hybrid, and on-site teams. It captures work activity in the background, including app/URL usage, document titles, and optional screenshots, and turns it into productivity reports, shift schedules, and attendance data.$q$, $q$DeskTime was created in 2011 within Draugiem Group, a Latvia-based business incubator headquartered in Riga, and remains part of that company today. It's ISO 27001/27701 certified and GDPR compliant.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$who-its-for$q$, $q$Who DeskTime is for$q$, 2, ARRAY[$q$DeskTime suits managers of remote and hybrid teams who need automatic productivity monitoring, as well as shift-based and on-site teams needing scheduling and attendance tracking, up to large enterprises needing custom integrations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Jibble ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free time and attendance tracking with GPS, face recognition, and unlimited users, plus premium plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Portuguese$q$, $q$Chinese$q$, $q$Japanese$q$, $q$Korean$q$]::text[],
  seo_meta_description = $q$Jibble offers free time tracking with GPS, face recognition, and unlimited users, plus premium plans for growing teams.$q$,
  og_description = $q$Jibble offers free time tracking with GPS, face recognition, and unlimited users, plus premium plans for growing teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '83609f1b-4f33-443e-91c3-d41dea40e0aa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '83609f1b-4f33-443e-91c3-d41dea40e0aa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Real-time timer and timesheets$q$, $q$Employees clock in and out with a real-time timer, and hours automatically populate timesheets for review.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Face recognition verification$q$, $q$Selfie and face recognition checks confirm the person clocking in is who they claim to be, reducing buddy punching.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$GPS tracking and geofencing$q$, $q$Location tracking and geofences restrict clock-ins to approved work sites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Offline clock-in$q$, $q$Team members can clock in and out without an internet connection; entries sync once back online.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$PTO and approval workflows$q$, $q$Time-off requests and timesheet approvals are managed through built-in workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Invoicing from tracked hours$q$, $q$Tracked time can be converted directly into client invoices.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Integrations$q$, $q$Connects with Slack, Microsoft Teams, QuickBooks, Xero, and Deel.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Free forever plan supports unlimited users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Multiple verification methods (face recognition, GPS, NFC, PIN) reduce time theft$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Native iOS, Android, web, and desktop apps plus a Chrome extension$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Built-in integrations with Slack, Microsoft Teams, QuickBooks, Xero, and Deel$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Premium/Enterprise pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Advanced features beyond the free tier are not detailed on the public site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Company founding details and headquarters are not disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Is Jibble free to use?$q$, $q$Yes, Jibble offers a free-forever plan with unlimited users, mobile and web clock-in, basic timesheets, and integrations with Slack, Microsoft Teams, and QuickBooks.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Does Jibble support biometric clock-in?$q$, $q$Yes, Jibble supports face recognition and selfie verification as part of its clock-in options.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Can employees clock in without internet access?$q$, $q$Yes, Jibble supports offline clock-in, syncing entries once connectivity is restored.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$What platforms does Jibble run on?$q$, $q$Jibble is available on iOS, Android, web browsers, and desktop, plus a Chrome extension and shared kiosk mode.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Distributed team attendance$q$, $q$Track clock-ins across multiple locations using GPS and geofencing.$q$, $q$Businesses with field or multi-site staff$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Payroll-ready timesheets$q$, $q$Convert approved timesheets into invoices or export for payroll processing.$q$, $q$Small and mid-sized businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Unlimited users","Mobile and web clock-in","Basic timesheets","Slack, Microsoft Teams, and QuickBooks integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Premium/Enterprise$q$, $q$Contact sales$q$, NULL, $q$["Advanced attendance features","Priority support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$overview$q$, $q$What is Jibble?$q$, 2, ARRAY[$q$Jibble is a time tracking and attendance platform that records employee work hours through mobile, web, and desktop clock-ins.$q$, $q$It combines a real-time timer with verification tools such as face recognition, GPS geofencing, NFC, and PIN codes, and automates timesheets, approvals, and PTO tracking.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$who-its-for$q$, $q$Who Jibble is for$q$, 2, ARRAY[$q$Jibble suits businesses of any size that need attendance verification across distributed or field teams, and want a no-cost starting point before considering premium plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OpenTimeClock ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Web-based employee time and attendance tracking with a free tier and a $39/month paid plan.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$39/month$q$,
  founded_year = 1997,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenTimeClock offers free and paid ($39/mo) employee time tracking with GPS, biometric clock-in, and 80+ payroll reports.$q$,
  og_description = $q$OpenTimeClock offers free and paid ($39/mo) employee time tracking with GPS, biometric clock-in, and 80+ payroll reports.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2c4f3d77-298c-424f-a26d-6c21dd92ceda';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2c4f3d77-298c-424f-a26d-6c21dd92ceda' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Multiple clock-in methods$q$, $q$Employees can clock in via username/password, facial recognition, PIN codes, QR codes, or RFID/NFC cards.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$GPS and geofencing$q$, $q$Location verification and geofencing help prevent buddy punching.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$80+ predefined reports$q$, $q$Includes more than 80 PDF and Excel reports for payroll and attendance analysis.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Overtime and PTO automation$q$, $q$Automates overtime calculations and PTO accrual tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Live dashboard$q$, $q$Real-time notifications and a live dashboard show who is currently clocked in.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Offline mode$q$, $q$Supports clock-ins without an active internet connection.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Free plan includes unlimited users and free support$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Long-operating company, founded in 1997$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Wide range of clock-in and verification methods (biometric, RFID/NFC, QR, GPS)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$80+ built-in payroll and attendance reports on paid plans$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Free plan limits PDF/Excel report access to 30 days$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Full reporting and features require the $39/month paid plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Headquarters and company size are not disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Is OpenTimeClock free?$q$, $q$Yes, OpenTimeClock has a free plan with unlimited users, though PDF/Excel report access is limited to the first 30 days.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$How much does the paid plan cost?$q$, $q$The paid plan is $39/month or $399/year, with multi-year prepay options available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Does OpenTimeClock offer a nonprofit plan?$q$, $q$Yes, qualifying government agencies, schools, hospitals, and nonprofits can apply for a free full-featured NPO plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$What clock-in methods are supported?$q$, $q$OpenTimeClock supports username/password, facial recognition, PIN, QR code, RFID/NFC card, and GPS-based clock-ins.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Multi-location attendance tracking$q$, $q$Use geofencing and GPS to verify employee clock-ins at approved locations.$q$, $q$Businesses with multiple job sites$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Payroll reporting$q$, $q$Generate payroll-ready reports from tracked hours using the 80+ built-in report templates.$q$, $q$HR and payroll teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Unlimited users","Free support","30 days of PDF/Excel report access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Paid$q$, $q$$39/month or $399/year$q$, $q$monthly$q$, $q$["Full feature access","Unlimited users","Free support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$NPO Plan$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Full feature access for qualifying nonprofits, schools, hospitals, and government agencies"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Sponsor Link Plan$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Paid features unlocked in exchange for a text link to OpenTimeClock on your homepage"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$overview$q$, $q$What is OpenTimeClock?$q$, 2, ARRAY[$q$OpenTimeClock is a web-based employee time tracking and attendance platform, in operation since 1997, that records work hours, manages schedules, and supports payroll processing.$q$, $q$It supports multiple clock-in methods including facial recognition, PIN, QR code, and RFID/NFC cards, and provides more than 80 predefined PDF and Excel reports.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$who-its-for$q$, $q$Who OpenTimeClock is for$q$, 2, ARRAY[$q$OpenTimeClock fits businesses of any size, plus nonprofits, schools, hospitals, and government agencies that qualify for its free NPO plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── SignServer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, server-side signing software for code, documents, and timestamps, with a paid Enterprise edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SignServer is open-source signing software for code, documents, and timestamps, with a free Community edition and paid Enterprise tier.$q$,
  og_description = $q$SignServer is open-source signing software for code, documents, and timestamps, with a free Community edition and paid Enterprise tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e17e182c-05b6-4b50-b6cc-283acedc783a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e17e182c-05b6-4b50-b6cc-283acedc783a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Centralized key management$q$, $q$Signing operations run server-side so cryptographic keys stay in one secured location instead of on individual machines.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Multi-format code signing$q$, $q$Supports signing in formats including JAR, CMS, OpenPGP, and Debian packages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Timestamping services$q$, $q$Provides timestamping to prove when a document or artifact was signed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Secure boot and OTA signing$q$, $q$Supports signing for secure boot images and over-the-air firmware updates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Post-quantum cryptography support$q$, $q$Includes support for post-quantum cryptographic algorithms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Container and DevOps integration$q$, $q$Deployable via Docker, Kubernetes Helm charts, and Ansible for CI/CD signing workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Community Edition is free and licensed under LGPL v2.1$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Supports a wide range of signing formats and use cases (code, documents, timestamps, firmware)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Enterprise edition adds SLAs and SaaS/Cloud/Appliance deployment options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Backed by Keyfactor, with Docker, Kubernetes, and Ansible deployment support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Keyfactor states the Community Edition is not intended for production signing environments$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Enterprise pricing is not publicly listed and requires a trial or sales contact$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Requires technical setup (Docker/Kubernetes) rather than a hosted turnkey product$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Is SignServer free?$q$, $q$The Community Edition is free and open source under LGPL v2.1. A paid Enterprise Edition with SLAs and additional security features is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Can I use SignServer Community in production?$q$, $q$Keyfactor states the Community Edition is intended for learning, testing, and prototyping, not production signing environments; production use is recommended on the Enterprise Edition.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$What can SignServer sign?$q$, $q$SignServer can sign code (JAR, CMS, OpenPGP, Debian packages), documents, timestamps, and secure boot/OTA firmware images.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$How is SignServer deployed?$q$, $q$It can be deployed via Docker, Kubernetes Helm charts, Ansible, or on cloud platforms like AWS and Azure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Code signing pipelines$q$, $q$Integrate centralized signing into CI/CD pipelines for JAR, Debian, or other code artifacts.$q$, $q$DevOps and software release teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Firmware and secure boot signing$q$, $q$Sign OTA updates and secure boot images with centrally managed keys.$q$, $q$IoT and embedded systems teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source, LGPL v2.1 licensed","Core signing and timestamping functionality","For learning, testing, and prototyping"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Enterprise Edition$q$, $q$Contact sales (30-day trial available on AWS/Azure)$q$, NULL, $q$["SLAs","Additional security features","SaaS/Cloud/Appliance deployment"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$overview$q$, $q$What is SignServer?$q$, 2, ARRAY[$q$SignServer is open-source signing software, sponsored by Keyfactor, that lets organizations digitally sign documents, code, and timestamps while keeping cryptographic keys centralized and secured server-side.$q$, $q$It ships as a free Community Edition (LGPL v2.1) and a paid Enterprise Edition that adds SLAs, additional security features, and SaaS/Cloud/Appliance deployment options.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$who-its-for$q$, $q$Who SignServer is for$q$, 2, ARRAY[$q$SignServer is aimed at development and security teams that need centralized code, document, or firmware signing, with the Enterprise Edition intended for production-grade signing environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── LibreSign ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, AGPL-licensed e-signature app for Nextcloud that lets organizations self-host document signing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$LibreSign is an open-source AGPL e-signature app for Nextcloud with self-hosted signing plus paid Business and API plans.$q$,
  og_description = $q$LibreSign is an open-source AGPL e-signature app for Nextcloud with self-hosted signing plus paid Business and API plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5f8979c-0034-41d0-8a61-d04ac685524e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5f8979c-0034-41d0-8a61-d04ac685524e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Self-hosted e-signatures$q$, $q$Runs as a Nextcloud app so organizations sign, manage, and validate documents on infrastructure they control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Hybrid signature options$q$, $q$Supports signing with personal certificates or system-generated certificates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$QR code validation$q$, $q$Signed documents can be validated via QR code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Batch signing via envelopes$q$, $q$Groups multiple documents into envelopes for batch signing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Certificate revocation and DocMDP$q$, $q$Implements Certificate Revocation List (CRL) checks and document modification detection (DocMDP).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Multi-factor authentication$q$, $q$Adds MFA on top of encrypted signing workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Fully open source under AGPL-3.0, auditable and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Integrates directly with Nextcloud, with over 186,000 downloads via the Nextcloud App Store$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Supports hybrid (personal or system) certificates and CRL-based revocation checks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Active development led by the LibreCode cooperative since 2020$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Public pricing for Business and API Integration plans is not yet available$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Requires a Nextcloud environment to run$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Commercial plan details require contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Is LibreSign free?$q$, $q$Yes, LibreSign's core signing app is free and open source under AGPL-3.0, self-hosted as a Nextcloud app. Paid Business and API Integration plans are also offered, though pricing is not yet public.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$What license is LibreSign released under?$q$, $q$LibreSign is released under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Does LibreSign require Nextcloud?$q$, $q$Yes, LibreSign is distributed as a Nextcloud app and installed through the Nextcloud App Store.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Who maintains LibreSign?$q$, $q$LibreSign is developed by the Brazilian cooperative LibreCode (Somos.Coop) since 2020.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Self-hosted contract signing$q$, $q$Sign and validate contracts on infrastructure the organization controls, without a third-party SaaS.$q$, $q$Organizations with data sovereignty requirements$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Nextcloud-based document workflows$q$, $q$Add e-signature validation directly into an existing Nextcloud deployment.$q$, $q$Nextcloud administrators and teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Self-hosted (Nextcloud app)$q$, $q$Free$q$, NULL, $q$["Open source, AGPL-3.0 licensed","Self-hosted document signing","Nextcloud App Store distribution"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$Business$q$, $q$Contact sales$q$, NULL, $q$["Support and guidance","Tailored adoption path"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$API Integration$q$, $q$Contact sales$q$, NULL, $q$["API access for integrating with existing systems and workflows"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$overview$q$, $q$What is LibreSign?$q$, 2, ARRAY[$q$LibreSign is an open-source electronic signature app for Nextcloud, developed by the LibreCode cooperative since 2020, that lets organizations sign, manage, and validate documents on self-hosted infrastructure.$q$, $q$It supports hybrid signature methods, QR code-based validation, batch signing via envelopes, and certificate revocation checks, and is released under the AGPL-3.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$who-its-for$q$, $q$Who LibreSign is for$q$, 2, ARRAY[$q$LibreSign suits Nextcloud users and organizations that need e-signature capability without handing document data to a third-party SaaS provider.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Paperless-ngx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source document management system that scans, OCRs, indexes, and archives paperwork for self-hosting.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Paperless-ngx is a free, open-source, self-hosted document management system with OCR and full-text search.$q$,
  og_description = $q$Paperless-ngx is a free, open-source, self-hosted document management system with OCR and full-text search.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '833af197-f585-45d4-b9f9-cf879adb35d4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '833af197-f585-45d4-b9f9-cf879adb35d4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$OCR ingestion$q$, $q$Scanned documents are automatically processed with optical character recognition.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Full-text search$q$, $q$Search across the text content of all archived documents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Tagging and organization$q$, $q$Documents can be tagged and organized for retrieval.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Docker Compose deployment$q$, $q$Deploys via Docker containers, with a pre-configured Docker Compose setup as the easiest path.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Web-based interface$q$, $q$An Angular-based web UI provides access to the archive.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Completely free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Large, active GitHub community (43.2k stars, 2.9k forks, 149 releases as of the latest check)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Straightforward Docker Compose deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Strong OCR and full-text search capabilities$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Documents are stored unencrypted; the project warns against running it on an untrusted host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Self-hosting requires ongoing technical maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$No official managed/hosted cloud version$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Is Paperless-ngx free?$q$, $q$Yes, Paperless-ngx is fully free and open source under the GPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$How do I deploy Paperless-ngx?$q$, $q$The recommended method is Docker Compose, using the project's pre-configured environment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Is Paperless-ngx safe for sensitive documents?$q$, $q$The developers advise against running it on an untrusted host since documents are stored unencrypted; local, backed-up deployments are recommended for sensitive records.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$What technology powers Paperless-ngx?$q$, $q$The backend is built in Python (Django) and the frontend uses TypeScript with Angular.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Home and small-office paperwork archiving$q$, $q$Scan and OCR physical mail, receipts, and paperwork into a searchable archive.$q$, $q$Individuals and small offices$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$Self-hosted document retention$q$, $q$Run a private, self-hosted archive instead of relying on third-party cloud storage.$q$, $q$Privacy-conscious users and self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$overview$q$, $q$What is Paperless-ngx?$q$, 2, ARRAY[$q$Paperless-ngx is a community-supported, open-source document management system that scans, indexes, and archives physical paperwork.$q$, $q$It runs OCR on incoming documents, supports full-text search and tagging, and is typically deployed with Docker Compose. It is licensed under GPL-3.0 and has over 43,000 GitHub stars.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$who-its-for$q$, $q$Who Paperless-ngx is for$q$, 2, ARRAY[$q$Paperless-ngx suits individuals, families, and small offices who want to digitize paperwork and self-host a searchable document archive rather than use a third-party SaaS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Papermerge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source document management system with OCR, full-text search, and a REST API, licensed under Apache-2.0.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Papermerge is a free, open-source Apache-2.0 document management system with OCR, full-text search, and a REST API.$q$,
  og_description = $q$Papermerge is a free, open-source Apache-2.0 document management system with OCR, full-text search, and a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '094491bf-2c55-4e74-8744-920a4c1860d4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '094491bf-2c55-4e74-8744-920a4c1860d4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$OCR with text overlay$q$, $q$Scanned documents are processed with OCR and a searchable text layer is overlaid on the original.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Full-text search$q$, $q$Search across OCR'd document content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Document versioning$q$, $q$Tracks versions of documents as they are updated.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Hierarchical folders and tags$q$, $q$Organizes documents in folders with tags and custom metadata fields.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Multi-user access$q$, $q$Supports multiple users with group ownership and document sharing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$OpenAPI REST API$q$, $q$Provides an OpenAPI-compliant REST API for integrations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Permissive Apache-2.0 open-source license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Simple Docker deployment with a single-command basic setup$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$REST API available for custom integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Supports common scan formats: PDF, JPEG, PNG, and TIFF$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Smaller GitHub community (508 stars, 109 forks) than some competing open-source DMS projects$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$No officially documented paid or hosted-cloud tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Self-hosting requires managing your own database and media storage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Is Papermerge free?$q$, $q$Yes, Papermerge is free and open source under the Apache-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$What file formats does Papermerge support?$q$, $q$It supports PDF, JPEG, PNG, and TIFF documents, with OCR text overlay.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Does Papermerge have an API?$q$, $q$Yes, it provides an OpenAPI-compliant REST API.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$How is Papermerge deployed?$q$, $q$It can be deployed via Docker, with a basic single-command setup or more detailed Docker Compose configurations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$Scanned document archiving$q$, $q$OCR and index scanned PDFs and images into a searchable, self-hosted archive.$q$, $q$Small teams and individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$API-driven document workflows$q$, $q$Build custom integrations against Papermerge's REST API.$q$, $q$Developers building document-centric tools$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$overview$q$, $q$What is Papermerge?$q$, 2, ARRAY[$q$Papermerge is an open-source document management system built for scanned documents, performing OCR, indexing, and enabling full-text search.$q$, $q$It offers a web UI resembling a desktop file browser, document versioning, tagging, and an OpenAPI-compliant REST API, and is licensed under Apache-2.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$who-its-for$q$, $q$Who Papermerge is for$q$, 2, ARRAY[$q$Papermerge fits individuals and small teams who want a self-hosted, API-accessible document archive without licensing costs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Mayan EDMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source document management system with OCR, workflows, and digital signature verification.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mayan EDMS is a free, open-source document management system with OCR, workflow automation, and digital signature verification.$q$,
  og_description = $q$Mayan EDMS is a free, open-source document management system with OCR, workflow automation, and digital signature verification.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b5c46acf-0f25-4f29-8713-c5083cd9eea5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b5c46acf-0f25-4f29-8713-c5083cd9eea5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Document versioning$q$, $q$Stores multiple versions of a document with the ability to download or revert to a previous version.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Full-text search$q$, $q$Searches documents by text content, metadata, or other file attributes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Workflow engine$q$, $q$Tracks document state changes through a configurable workflow engine with change history.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Digital signature verification$q$, $q$Verifies embedded cryptographic signatures to check document authenticity.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$OCR and auto-categorization$q$, $q$Extracts text via OCR and supports automatic document categorization.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Non-destructive image transforms$q$, $q$Rotate, crop, and flip scanned images without altering the original file.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Free and open source, in active development since 2010$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Broad feature set including workflows, OCR, and digital signature verification$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Docker-based deployment supported$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Commercial support option available alongside the free software$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Self-hosting requires technical setup and ongoing maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Official documentation site was inaccessible during review, making evaluation harder without direct GitLab/GitHub access$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$No public information on company size or headquarters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Is Mayan EDMS free?$q$, $q$Yes, Mayan EDMS is free and open source; commercial support is also offered separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$What features does Mayan EDMS include?$q$, $q$It includes document versioning, full-text search, a workflow engine, OCR, digital signature verification, and non-destructive image transformations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$How is Mayan EDMS deployed?$q$, $q$It is built on Python/Django and supports Docker-based deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$How long has Mayan EDMS been developed?$q$, $q$The project was introduced in 2010 and has been in continuous active development since.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Workflow-driven document management$q$, $q$Route documents through configurable workflows and track their state changes.$q$, $q$Organizations needing document approval workflows$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Signature-verified archiving$q$, $q$Archive documents while verifying embedded digital signatures for authenticity.$q$, $q$Compliance-focused teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$overview$q$, $q$What is Mayan EDMS?$q$, 2, ARRAY[$q$Mayan EDMS is a free, open-source document management system built on Python and Django, in active development since 2010.$q$, $q$It provides document versioning, full-text search, a workflow engine, OCR, digital signature verification, and non-destructive image transformations, with Docker-based deployment support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$who-its-for$q$, $q$Who Mayan EDMS is for$q$, 2, ARRAY[$q$Mayan EDMS suits organizations that want a self-hosted, workflow-capable document management system without licensing fees, with the option to add commercial support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Docspell ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source personal document organizer with OCR and machine-learning tag suggestions, self-hosted via Docker.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Docspell is a free, open-source AGPLv3 document organizer for homes and small groups, with OCR and ML-based tag suggestions.$q$,
  og_description = $q$Docspell is a free, open-source AGPLv3 document organizer for homes and small groups, with OCR and ML-based tag suggestions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e57311ae-2760-4595-acff-07a9102a6a78';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e57311ae-2760-4595-acff-07a9102a6a78' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Metadata management$q$, $q$Organizes documents with tags, correspondents, and custom fields.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$ML-powered suggestions$q$, $q$Uses machine learning to suggest correspondents and tags for incoming documents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$OCR processing$q$, $q$Extracts text from scanned documents and email attachments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Full-text search$q$, $q$Searches across OCR'd document content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Email integration$q$, $q$Ingests documents directly from email.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$REST/HTTP API$q$, $q$Exposes a REST/HTTP API alongside its web and Android interfaces.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Free and open source under AGPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Machine-learning tag/correspondent suggestions reduce manual sorting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Multiple install methods: Docker, Debian package, Nix, and Helm charts for Kubernetes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Includes an Android app in addition to the web interface$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Explicitly targeted at home/household or small-group use rather than large enterprises$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Requires self-hosting and technical setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Backend stack (Scala/Elm) may be less familiar for typical system administrators$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Is Docspell free?$q$, $q$Yes, Docspell is free and open source under the AGPLv3-or-later license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Who is Docspell designed for?$q$, $q$Docspell is targeted for home use — families, households, and also smaller groups or companies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Does Docspell use machine learning?$q$, $q$Yes, it includes machine-learning-powered suggestions for correspondents and tags.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$How is Docspell installed?$q$, $q$It can be installed via Docker (quickest setup), Debian packages, zip download, Nix, or Helm charts for Kubernetes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Household paperwork organization$q$, $q$Scan, OCR, and auto-tag household mail and receipts.$q$, $q$Families and households$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$Small-group document intake$q$, $q$Ingest documents from scanners and email into a shared, searchable organizer.$q$, $q$Small groups and small companies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$overview$q$, $q$What is Docspell?$q$, 2, ARRAY[$q$Docspell is a free, open-source personal document organizer that helps individuals and small groups manage paperwork from scanners and email.$q$, $q$It uses OCR and machine-learning-based suggestions for tags and correspondents, and is self-hosted with multiple install options including Docker, Debian, Nix, and Helm.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$who-its-for$q$, $q$Who Docspell is for$q$, 2, ARRAY[$q$Docspell is built for home use — families, households, and small groups or companies — rather than large enterprise deployments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Teedy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, self-hosted open-source document management system with OCR, encryption, and 2FA.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Simplified Chinese$q$, $q$Traditional Chinese$q$]::text[],
  seo_meta_description = $q$Teedy is a free, open-source GPL-2.0 document management system with OCR, AES encryption, 2FA, and a REST API.$q$,
  og_description = $q$Teedy is a free, open-source GPL-2.0 document management system with OCR, AES encryption, 2FA, and a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aca7a829-e889-4429-ac20-146ff507188a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aca7a829-e889-4429-ac20-146ff507188a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$OCR and full-text search$q$, $q$Performs OCR and full-text search across images, PDFs, and Office documents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$LDAP authentication$q$, $q$Supports LDAP for centralized user authentication.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$256-bit AES encryption$q$, $q$Encrypts stored files with 256-bit AES.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$File versioning$q$, $q$Tracks file versions as documents change.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Two-factor authentication$q$, $q$Adds 2FA on top of standard login.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$REST API and webhooks$q$, $q$Provides a RESTful API and webhooks for integrations, plus an Android client.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Free and open source under GPL-2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Lightweight alternative to larger commercial document management platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Strong built-in security: AES encryption, 2FA, and LDAP authentication$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Android client available alongside the web app$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Default admin credentials (admin/admin) must be changed manually after install$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Embedded H2 database is for testing only; PostgreSQL is required for production$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Smaller ecosystem than larger open-source DMS competitors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Is Teedy free?$q$, $q$Yes, Teedy is free and open source under the GPL-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Was Teedy previously known by another name?$q$, $q$Yes, Teedy was formerly known as Sismics Docs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$How is Teedy deployed?$q$, $q$The recommended method is Docker, listening on port 8080; manual installation requires Java 11, Tesseract 4, ffmpeg, and mediainfo.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Does Teedy support two-factor authentication?$q$, $q$Yes, Teedy includes 2FA support alongside LDAP authentication and 256-bit AES encryption.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Secure document archiving$q$, $q$Store and search documents with AES encryption, 2FA, and version history.$q$, $q$Small businesses and individuals needing security$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$Self-hosted DMS alternative$q$, $q$Replace larger commercial document management platforms with a lightweight, self-hosted option.$q$, $q$Teams seeking a low-cost DMS$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$overview$q$, $q$What is Teedy?$q$, 2, ARRAY[$q$Teedy, formerly known as Sismics Docs, is a lightweight, self-hosted open-source document management system released under GPL-2.0.$q$, $q$It provides OCR, full-text search across multiple file formats, 256-bit AES encryption, file versioning, LDAP authentication, 2FA, webhooks, and a REST API, plus an Android client.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$who-its-for$q$, $q$Who Teedy is for$q$, 2, ARRAY[$q$Teedy suits individuals and businesses that want the core features of larger commercial document management systems in a free, self-hosted, lightweight package.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aca7a829-e889-4429-ac20-146ff507188a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── LogicalDOC ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Document management platform with a free open-source Community Edition and paid Business/Enterprise editions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2008,
  company_size = NULL,
  headquarters = $q$Carpi, Italy$q$,
  languages = '{}',
  seo_meta_description = $q$LogicalDOC is a document management platform with a free open-source Community Edition and paid Business/Enterprise editions.$q$,
  og_description = $q$LogicalDOC is a document management platform with a free open-source Community Edition and paid Business/Enterprise editions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fbab0d6d-e002-4027-8b1d-76a72da67b81';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fbab0d6d-e002-4027-8b1d-76a72da67b81' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Workflow engine$q$, $q$Routes documents through configurable circulation and approval workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Electronic forms and e-signature tools$q$, $q$Includes tools for electronic forms and document signing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Version control and co-authoring$q$, $q$Tracks document versions and supports collaborative editing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Advanced search and retrieval$q$, $q$Provides advanced search functions across the document repository.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Microsoft Office integration$q$, $q$Integrates with Microsoft Office products for document editing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Cross-platform and flexible deployment$q$, $q$Runs on Windows, Linux, and macOS, with cloud, on-premise, and hybrid deployment options.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$NAS integration$q$, $q$Integrates with QNAP and Synology NAS devices.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Free, open-source Community Edition available alongside paid editions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Flexible deployment: cloud, on-premise, or hybrid$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Global office presence across Italy, the US, Germany, Spain, France, and Portugal$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Includes a mobile app and NAS integrations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Business and Enterprise edition pricing is not publicly listed and requires a sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Advanced workflow, forms, and e-signature capabilities are reserved for paid editions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Company size is not publicly disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Is LogicalDOC free?$q$, $q$The Community Edition is free and open source. Business and Enterprise editions are paid, with pricing available only by contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Where is LogicalDOC based?$q$, $q$LogicalDOC is headquartered in Carpi, Italy, with additional offices in the United States, Germany, Spain, France, and Portugal.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$When was LogicalDOC founded?$q$, $q$LogicalDOC's copyright notices date back to 2008.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$What deployment options does LogicalDOC support?$q$, $q$It supports cloud, on-premise, and hybrid cloud deployment, and runs on Windows, Linux, and macOS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Enterprise document workflows$q$, $q$Route documents through approval workflows with version control and co-authoring.$q$, $q$Mid-size to large organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Self-hosted document management$q$, $q$Deploy the open-source Community Edition on-premise for full control.$q$, $q$Organizations preferring open-source, self-hosted software$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source","Core document management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Business/Enterprise Edition$q$, $q$Contact sales$q$, NULL, $q$["Workflow engine","Advanced search","Cloud/hybrid deployment","NAS integration"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$overview$q$, $q$What is LogicalDOC?$q$, 2, ARRAY[$q$LogicalDOC is a document management system, headquartered in Carpi, Italy, that helps organizations organize, store, and collaborate on digital documents.$q$, $q$It is offered as a free, open-source Community Edition and a paid, modular Enterprise Edition, with cloud, on-premise, and hybrid deployment options across Windows, Linux, and macOS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$who-its-for$q$, $q$Who LogicalDOC is for$q$, 2, ARRAY[$q$LogicalDOC suits organizations that want to start with a free, self-hosted Community Edition and later scale up to a paid Enterprise Edition with workflow, forms, and e-signature features.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OpenKM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Document management platform with a free Community Edition and paid Professional and Cloud editions for records, search, and workflow.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Palma de Mallorca, Spain$q$,
  languages = '{}',
  seo_meta_description = $q$OpenKM document management software: a free Community Edition plus paid Professional and Cloud editions for records, workflow, and search.$q$,
  og_description = $q$OpenKM document management software: a free Community Edition plus paid Professional and Cloud editions for records, workflow, and search.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '13b061f8-1278-44ee-b96b-21fa24709fc9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '13b061f8-1278-44ee-b96b-21fa24709fc9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Document & records management$q$, $q$Centralized storage, retention, and organization of documents and records.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Workflow automation$q$, $q$Customizable automatic tasks and workflow tools to route documents through business processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Advanced search$q$, $q$Full-text and metadata-based search across stored documents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Role-based access control$q$, $q$Document-level security and permissions based on user roles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Activity logging$q$, $q$Complete logging of user and document activity for auditability.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$API & integration tools$q$, $q$Developer tools and APIs for extending and integrating OpenKM with other systems.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Modular architecture$q$, $q$Add-on modules extend the core platform's functionality.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Free Community Edition available for evaluation and use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Three editions (Community, Professional, Cloud) scale from small teams to enterprises$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Global network of regional offices across Europe, the Americas, Asia, and Africa$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Localized deployments available for markets including Brazil, France, Germany, Italy, Mexico, Poland, Portugal, and Romania$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Starting with Community Edition 7.0, OpenKM no longer publishes the source code, distributing it only as a free closed binary$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Professional and Cloud edition pricing is not published and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Advanced workflow and governance features require upgrading beyond the free Community Edition$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Does OpenKM offer a free version?$q$, $q$Yes, OpenKM Community Edition is free to use, alongside paid Professional (self-hosted) and Cloud (subscription) editions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Is OpenKM open source?$q$, $q$Versions up to 6.3 were distributed under GPL-2.0 with published source code. Starting with Community Edition 7.0, OpenKM distributes only a free binary without publishing the source.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$What editions does OpenKM offer?$q$, $q$Community (free), Professional (paid, self-hosted), and Cloud (paid, subscription-based).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Where is OpenKM based?$q$, $q$OpenKM is headquartered in Palma de Mallorca, Balearic Islands, Spain, with regional offices in Spain, the UK, the USA, and other markets.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Records management$q$, $q$Centralize document retention and records governance for regulated organizations.$q$, $q$Compliance and records teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Workflow automation$q$, $q$Automate document-driven approval and task workflows across departments.$q$, $q$Operations and administrative teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Community$q$, $q$Free$q$, NULL, $q$["Free binary distribution","Core document management, search, and workflow features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Professional$q$, $q$Custom (contact sales)$q$, NULL, $q$["Self-hosted deployment","Extended enterprise feature set"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Cloud$q$, $q$Custom (contact sales)$q$, NULL, $q$["Subscription-based cloud deployment"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$overview$q$, $q$What is OpenKM?$q$, 2, ARRAY[$q$OpenKM is a document management platform that combines document and records management, workflow automation, and advanced search into one system. It is offered in three editions: a free Community Edition, a paid self-hosted Professional Edition, and a paid subscription Cloud Edition.$q$, $q$The company is headquartered in Palma de Mallorca, Spain, and maintains regional offices and localized versions of its site across the Americas, Europe, Asia, and Africa.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$who-its-for$q$, $q$Who OpenKM is for$q$, 2, ARRAY[$q$OpenKM suits organizations that need centralized document and records management with workflow automation, ranging from teams evaluating the free Community Edition to enterprises that require the Professional or Cloud editions and dedicated support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SeedDMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SeedDMS is a free, open-source, self-hosted document management system built on PHP with full-text search and LDAP support.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SeedDMS: a free, open-source PHP document management system with folder organization, full-text search, and LDAP authentication.$q$,
  og_description = $q$SeedDMS: a free, open-source PHP document management system with folder organization, full-text search, and LDAP authentication.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '72dc4119-8718-45ec-8600-77edafd7ff89';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '72dc4119-8718-45ec-8600-77edafd7ff89' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Hierarchical folder organization$q$, $q$Organizes documents in a folder structure similar to a traditional file system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Full-text search$q$, $q$Indexes and searches document content across the repository.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Document preview & conversion$q$, $q$Generates previews and converts documents between formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$LDAP authentication$q$, $q$Integrates with LDAP for enterprise directory-based authentication.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$OAI-PMH support$q$, $q$Supports the OAI-PMH protocol for metadata harvesting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$WebDAV access$q$, $q$Provides WebDAV access to stored documents.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Notification system$q$, $q$Notifies users of workflow updates and document changes.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Completely free and open source under GPLv2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Self-hosted, giving full control over data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$LDAP integration for enterprise directory authentication$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Actively developed for more than 10 years$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$WebDAV support for standard file-system-style access$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Requires self-hosting on a PHP/web server, with the associated setup and maintenance effort$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$No official commercial support tier found$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Requires an environment that supports soft links (Unix-like systems)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Is SeedDMS free?$q$, $q$Yes, SeedDMS is free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Is SeedDMS open source?$q$, $q$Yes, it is licensed under the GNU General Public License version 2 (GPLv2).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Does SeedDMS support LDAP authentication?$q$, $q$Yes, it supports LDAP for enterprise directory integration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Can SeedDMS preview documents?$q$, $q$Yes, it generates document previews and supports format conversion.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Document archiving$q$, $q$Store, organize, and search scanned or digital documents in a self-hosted repository.$q$, $q$Small and medium-sized organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Paperless workflows$q$, $q$Use SeedDMS as a compatible server for paperless document capture setups.$q$, $q$Teams digitizing paper-based processes$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$Self-hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["Full document management feature set","GPLv2 licensed source code"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$overview$q$, $q$What is SeedDMS?$q$, 2, ARRAY[$q$SeedDMS is a free, open-source document management system built on PHP that organizes documents and digital media in a hierarchical folder structure. It supports full-text search, document preview and format conversion, LDAP authentication, WebDAV access, and OAI-PMH metadata harvesting.$q$, $q$The project has been developed for over a decade and is distributed under the GNU General Public License version 2 (GPLv2), with source code available for self-hosted deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$who-its-for$q$, $q$Who SeedDMS is for$q$, 2, ARRAY[$q$SeedDMS is suited to small and medium-sized organizations that want a free, self-hosted document management system and are comfortable running and maintaining a PHP-based web application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Alfresco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Alfresco, now part of Hyland, is an enterprise content, process, and governance management platform for document-centric business workflows.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Alfresco by Hyland: an enterprise content, process, and governance management platform for document-centric business workflows.$q$,
  og_description = $q$Alfresco by Hyland: an enterprise content, process, and governance management platform for document-centric business workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '35a25125-49a7-491d-af00-f68e8a653d0c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '35a25125-49a7-491d-af00-f68e8a653d0c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Web-based document management$q$, $q$Searchable access to content across devices through a web interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Integrated process management$q$, $q$Combines content and process services to speed up business decision-making.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Microsoft 365 & Google Docs integration$q$, $q$Connects with Microsoft 365 and Google Docs for collaborative editing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Information governance$q$, $q$Automated lifecycle management with compliance capabilities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Content intelligence$q$, $q$Automatic content enrichment and metadata extraction.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Open APIs$q$, $q$Built on open standards and APIs for customization and integration.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Backed by Hyland's broader enterprise content services portfolio$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Combines content management, process automation, and governance in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Cited customers include Liberty Mutual Insurance, RBC Capital Markets, and Cisco$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Both cloud and on-premises deployment options$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Built on open standards and APIs for integration$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Pricing is not publicly disclosed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Enterprise-focused positioning may be costly or complex for very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Now marketed under Hyland's broader portfolio, which may change roadmap or branding over time$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Who owns Alfresco?$q$, $q$Alfresco is now part of Hyland's content services portfolio.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$What is Alfresco used for?$q$, $q$It is used for enterprise document management, business process automation, and information governance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Does Alfresco integrate with Microsoft 365?$q$, $q$Yes, Alfresco integrates with Microsoft 365 and Google Docs for collaboration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Is Alfresco pricing public?$q$, $q$No, pricing is not published; organizations must contact Hyland's sales team for a quote.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Regulated industry document management$q$, $q$Centralize and govern content across healthcare, financial services, government, insurance, and other regulated sectors.$q$, $q$Large enterprises and regulated organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Business process automation$q$, $q$Combine content services with process automation to accelerate document-driven workflows.$q$, $q$Enterprise operations and IT teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$overview$q$, $q$What is Alfresco?$q$, 2, ARRAY[$q$Alfresco is a content, process, and governance management platform used to manage, process, and govern information across enterprises. It offers web-based document access, integrated business process management, information governance with automated lifecycle management, and content enrichment through metadata extraction.$q$, $q$Alfresco is now part of Hyland, positioned within Hyland's broader content services and intelligent document processing portfolio, and is deployed by organizations such as Liberty Mutual Insurance, RBC Capital Markets, and Cisco.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$who-its-for$q$, $q$Who Alfresco is for$q$, 2, ARRAY[$q$Alfresco is aimed at large organizations in industries such as healthcare, financial services, government, insurance, education, manufacturing, and retail that need enterprise-scale content management combined with process automation and compliance-driven governance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ownCloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ownCloud is an open-source file sync, share, and collaboration platform with a free Community Edition and paid Standard/Enterprise tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$ownCloud: open-source file sync and share software with a free Community Edition and paid Standard and Enterprise plans.$q$,
  og_description = $q$ownCloud: open-source file sync and share software with a free Community Edition and paid Standard and Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Spaces$q$, $q$Project folders for organizing and collaborating on team content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Web Office integrations$q$, $q$In-browser document editing via OnlyOffice, Microsoft 365, or Collabora Online.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Multi-factor authentication & encryption$q$, $q$Security controls including MFA and data encryption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Controlled public link sharing$q$, $q$Share files via links with password protection and expiration dates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$File lifecycle management$q$, $q$Manage files through their lifecycle within the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Real-time document collaboration$q$, $q$Collaborate on documents in real time.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Desktop & mobile apps$q$, $q$Native apps for Windows, macOS, Linux, iOS, and Android.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Free, open-source Community Edition with unlimited users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Broad platform coverage across desktop and mobile$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Choice between self-hosting or ownCloud.online (SaaS hosted in Germany)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Notable users cited include CERN, ETH Zürich, the European Commission, and Fujitsu$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Web Office integrations enable in-browser document editing$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Standard and Enterprise plans require a 25-user minimum and custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Faster support SLAs (phone support, 2-hour reaction time) are limited to paid tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Advanced enterprise features and commercial licensing are not included in the free Community Edition$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Is ownCloud free?$q$, $q$Yes, the Community Edition is free and open source with unlimited users; paid Standard and Enterprise tiers add support and enterprise features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Does ownCloud offer a hosted option?$q$, $q$Yes, ownCloud.online is a SaaS option hosted in Germany for individuals and teams.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$What license does ownCloud use?$q$, $q$Core components are licensed under Apache 2.0.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$What is the minimum for Standard and Enterprise plans?$q$, $q$Both require a minimum of 25 users, billed annually.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Privacy-focused file sync$q$, $q$Self-host file sync and share to keep data on-premises under organizational control.$q$, $q$Research institutions and government bodies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Team collaboration$q$, $q$Use Spaces and Web Office to co-edit documents and organize team files.$q$, $q$Businesses needing on-premises collaboration$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Community$q$, $q$Free$q$, NULL, $q$["Unlimited users","Self-managed, on-premises deployment","Open source","Desktop & mobile apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Standard$q$, $q$Custom$q$, $q$annual$q$, $q$["Minimum 25 users","On-premises deployment","9x5 email support, 2h reaction time","Commercial license"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Minimum 25 users","12x5 email and phone support, 2h reaction time","Custom app branding","Commercial license"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$ownCloud.online (Single Users)$q$, $q$Custom$q$, NULL, $q$["1-4 users","500GB storage","Hosted in Germany","256-bit AES and SSL/TLS encryption","MFA"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$ownCloud.online (Teams)$q$, $q$Custom$q$, NULL, $q$["Minimum 5 users","1,000GB base storage + 200GB per additional user","Hosted in Germany"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$overview$q$, $q$What is ownCloud?$q$, 2, ARRAY[$q$ownCloud is an open-source platform for secure file sharing, syncing, and real-time content collaboration. It offers a free Community Edition licensed under Apache 2.0, plus paid Standard and Enterprise editions with commercial licensing and support, and an ownCloud.online SaaS option hosted in Germany.$q$, $q$Features include Spaces for organizing team content, Web Office integrations with OnlyOffice, Microsoft 365, and Collabora Online, multi-factor authentication, and controlled public link sharing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$who-its-for$q$, $q$Who ownCloud is for$q$, 2, ARRAY[$q$ownCloud fits organizations that want self-hosted or Germany-hosted file sync and collaboration with control over data residency, ranging from individuals using the free Community Edition to enterprises on paid Standard or Enterprise plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Seafile ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Seafile is an open-source file sync and share platform with a free Community Edition, paid Professional on-prem tier, and Plus cloud plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$8/user/month (Plus Team plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Seafile: open-source file sync and share software with a free Community Edition, a paid Professional tier, and Plus cloud plans from $8/user/month.$q$,
  og_description = $q$Seafile: open-source file sync and share software with a free Community Edition, a paid Professional tier, and Plus cloud plans from $8/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$File sync with version control$q$, $q$Synchronizes files across devices while retaining version history.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$AI-generated file properties$q$, $q$Assigns custom properties and AI-generated descriptions to files (Plus edition).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Multiple content views$q$, $q$View files as tables, galleries, kanban boards, or maps (Plus edition).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Real-time collaborative editing$q$, $q$Co-edit documents in real time via SeaDoc.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Team wiki$q$, $q$Built-in wiki functionality with version history.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Granular sharing permissions$q$, $q$Password-protected sharing with fine-grained permission controls.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Two-factor authentication & audit logs$q$, $q$Security controls available in the Professional edition.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Free, open-source Community Edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Professional edition pricing starts free for up to 3 users and $100/year total for 9 users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Reports over 1 million users, including universities and enterprises such as Kaspersky Lab$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Both self-hosted (Professional) and managed cloud (Plus) deployment options$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Plus cloud plan includes a free 30-day trial$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$AI-powered organization and multi-view features are limited to the paid Plus cloud tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Professional on-premises pricing scales per user, requiring a custom quote for 1,000+ users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Some collaboration features such as SeaDoc and kanban/map views are tied to specific paid editions$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Is Seafile free?$q$, $q$Yes, the Community Edition is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$What does Seafile Professional cost?$q$, $q$It is free for up to 3 users, $100/year total for 9 users, and then priced per user annually (e.g. $48/user/year for 10-249 users).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Is there a cloud-hosted option?$q$, $q$Yes, Seafile Plus is a managed cloud plan starting at $8/user/month for the Team plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Does Seafile offer a free trial?$q$, $q$Yes, the Plus plan includes a free 30-day trial for up to 3 users.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Self-hosted file sync$q$, $q$Run Seafile Community or Professional Edition on your own infrastructure for privacy and control.$q$, $q$Privacy-focused organizations and universities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Team knowledge management$q$, $q$Use Seafile Plus cloud for wikis, collaborative editing, and AI-assisted file organization.$q$, $q$Teams needing managed cloud collaboration$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Basic file sync","Mobile clients","Version control","Public links","LDAP/AD user management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Professional (3 users)$q$, $q$Free$q$, $q$annual$q$, $q$["Office file editing","File locking","Granular permissions"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Professional (9 users)$q$, $q$$100/year total$q$, $q$annual$q$, $q$["Full-text search","Two-factor authentication","Audit logs","WebDAV"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Professional (10-249 users)$q$, $q$$48/user/year$q$, $q$annual$q$, $q$["All Professional features","Remote wipe"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Plus Trial$q$, $q$Free$q$, NULL, $q$["Up to 3 users","1GB storage","30-day trial"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Plus Team$q$, $q$$8/user/month$q$, $q$monthly$q$, $q$["Minimum 3 users","500GB storage","Knowledge management and AI-assisted metadata"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$overview$q$, $q$What is Seafile?$q$, 2, ARRAY[$q$Seafile is an open-source file synchronization and sharing platform. Its free Community Edition covers core sync, versioning, and public link sharing, while the paid Professional edition (self-hosted) adds office file editing, full-text search, two-factor authentication, and audit logs, and the Plus cloud plan adds knowledge management, custom file properties, multiple content views, and AI-assisted metadata extraction.$q$, $q$Seafile reports over 1 million users across enterprises, universities, and other organizations, including customers such as Kaspersky Lab.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$who-its-for$q$, $q$Who Seafile is for$q$, 2, ARRAY[$q$Seafile suits organizations that want self-hosted control via the free Community or paid Professional edition, as well as teams that prefer a managed cloud option through Seafile Plus for wiki, collaboration, and AI-assisted file organization features.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Pydio Cells ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pydio Cells is a self-hosted content collaboration platform with an open-source AGPLv3 Community edition and paid enterprise licensing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pydio Cells: self-hosted content collaboration platform with a free, open-source AGPLv3 Community edition and paid enterprise licensing.$q$,
  og_description = $q$Pydio Cells: self-hosted content collaboration platform with a free, open-source AGPLv3 Community edition and paid enterprise licensing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '458633b6-d7a2-4972-910e-e20a9a1c4947';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '458633b6-d7a2-4972-910e-e20a9a1c4947' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Self-hosted file transfers$q$, $q$Handles file transfers up to 5TB on infrastructure you control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$No-code workflow automation$q$, $q$Cells Flows lets users build automated workflows without code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$SSO & two-factor authentication$q$, $q$Advanced security including single sign-on and 2FA.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Granular access controls$q$, $q$Access management via ACLs and the platform's "Cells" concept.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Metadata management$q$, $q$Automated tagging and metadata management for content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Hybrid/private cloud compatibility$q$, $q$Deployable in hybrid or private cloud environments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$API access$q$, $q$Documented API for developer integrations.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Free, open-source Community/Home edition licensed under AGPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Full self-hosted control over data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Used by large organizations including Crédit Agricole, Seagate, and the University of Cambridge, per the vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$No-code workflow builder (Cells Flows) included$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$API documentation available for custom integrations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Enterprise pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Self-hosting requires server infrastructure and setup expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Premium support is limited to the paid enterprise tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Is Pydio Cells open source?$q$, $q$Yes, it is licensed under AGPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Is there a free edition?$q$, $q$Yes, Pydio Cells Home is a free, open-source edition for individual use.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$How much does Pydio Cells Enterprise cost?$q$, $q$Pricing is not published; organizations need to contact sales for a quote.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$What is the maximum file transfer size?$q$, $q$Pydio Cells supports file transfers up to 5TB.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Self-hosted document sharing$q$, $q$Manage and share large files and digital assets on infrastructure you control.$q$, $q$Enterprises needing full data control$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Secure collaboration in regulated industries$q$, $q$Use granular ACLs, SSO, and 2FA for secure content collaboration.$q$, $q$Government, healthcare, and financial organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Community/Home$q$, $q$Free$q$, NULL, $q$["AGPLv3 open source","Self-hosted","For individual use"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Enterprise$q$, $q$Custom (contact sales)$q$, NULL, $q$["Premium support","SSO","Advanced access controls"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$overview$q$, $q$What is Pydio Cells?$q$, 2, ARRAY[$q$Pydio Cells is a self-hosted content collaboration platform for document sharing, digital asset management, and secure collaboration. It supports file transfers up to 5TB, no-code workflow automation via Cells Flows, SSO and two-factor authentication, and granular access controls.$q$, $q$The Community/Home edition is free and open source under AGPLv3, while the Enterprise edition adds premium support and is priced on request.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$who-its-for$q$, $q$Who Pydio Cells is for$q$, 2, ARRAY[$q$Pydio Cells suits organizations that need self-hosted document collaboration with full data control, from individuals using the free Home edition to enterprises such as those in finance, healthcare, and government evaluating the paid Enterprise tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── FileRun ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$FileRun is a self-hosted, proprietary file sync and share platform with one-time and per-user annual pricing, and no ongoing free tier.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$€99 one-time (Family plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$FileRun: self-hosted file sync and share software with one-time Family licensing and per-user annual Business plans, no free tier.$q$,
  og_description = $q$FileRun: self-hosted file sync and share software with one-time Family licensing and per-user annual Business plans, no free tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c69f3e8f-9780-457f-a312-c387ed3ead8a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c69f3e8f-9780-457f-a312-c387ed3ead8a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Self-hosted file sync & share$q$, $q$Sync, share, and collaborate on files on your own server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Multiple authentication methods$q$, $q$Supports LDAP, Active Directory, OAuth2, and WordPress authentication.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Custom branding$q$, $q$Branding and theming customization options.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Online document editing$q$, $q$Integrates with ONLYOFFICE, Collabora, Google Docs, and Microsoft 365.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Advanced uploads$q$, $q$Folder sync, resumable transfers, and drag-and-drop uploads.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Desktop & mobile apps$q$, $q$Apps for Mac, Windows, Linux, iOS, and Android.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Flexible deployment$q$, $q$Runs on Linux/Windows servers, NAS systems, Docker, VMs, bare metal, or Raspberry Pi.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Full self-hosted control, no reliance on third-party cloud storage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Broad platform support with desktop and mobile apps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Multiple authentication integrations (LDAP, AD, OAuth2, WordPress)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Runs on low-cost hardware such as Raspberry Pi$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$One-time Family license option for personal, non-commercial use$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$No ongoing free tier for regular use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Family license is restricted to non-commercial use only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Business plans require an annual per-user subscription$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Proprietary software, not open source$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Is FileRun free?$q$, $q$No, FileRun requires a paid license: a one-time Family plan or an annual per-user Business plan. A free trial is available for large business customers on request.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Is FileRun open source?$q$, $q$No, FileRun is proprietary commercial software.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$What authentication methods does FileRun support?$q$, $q$LDAP, Active Directory, OAuth2, and WordPress.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Can FileRun run on a Raspberry Pi?$q$, $q$Yes, it supports budget hardware including Raspberry Pi.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Personal cloud storage$q$, $q$Self-host a Dropbox/Google Drive alternative under the one-time Family license.$q$, $q$Individuals and families$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Business file sharing$q$, $q$Sync, share, and co-edit documents on company-controlled servers with LDAP/AD integration.$q$, $q$Small to large businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Family$q$, $q$€99 one-time$q$, NULL, $q$["5 user accounts (+1 new every year)","Lifetime updates","Forum access","Non-commercial use only","14-day money-back guarantee"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Small Business$q$, $q$€10/user/year$q$, $q$annual$q$, $q$["10 or 20 user accounts","Limited installation support","Forum access","30-day money-back guarantee"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Medium Business$q$, $q$€10/user/year$q$, $q$annual$q$, $q$["30+ user accounts","Free Docker installation service","Email support (max 24h response, Mon-Fri)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Large Business$q$, $q$€10/user/year$q$, $q$annual$q$, $q$["100+ user accounts","9 free guest accounts per paid user","Free installation and server configuration","Email support including weekends"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$overview$q$, $q$What is FileRun?$q$, 2, ARRAY[$q$FileRun is a self-hosted file synchronization and sharing platform that lets users sync, share, and collaborate on files on their own server instead of a third-party cloud service. It supports LDAP, Active Directory, OAuth2, and WordPress authentication, online document editing via ONLYOFFICE, Collabora, Google Docs, or Microsoft 365, and desktop and mobile apps for Mac, Windows, Linux, iOS, and Android.$q$, $q$FileRun is proprietary software, sold as a one-time Family license for non-commercial use or as an annual per-user subscription for Small, Medium, and Large Business plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$who-its-for$q$, $q$Who FileRun is for$q$, 2, ARRAY[$q$FileRun fits individuals or families who want a low-cost, one-time-licensed self-hosted cloud alternative, as well as businesses that need self-hosted file sharing with LDAP/AD integration and per-user annual licensing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Peergos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Peergos is an open-source, end-to-end encrypted cloud storage platform you can self-host free or use via paid hosted plans from £3/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$£3/month (Pro plan, billed yearly)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Peergos: open-source, end-to-end encrypted cloud storage. Self-host for free or use hosted plans starting at £3/month.$q$,
  og_description = $q$Peergos: open-source, end-to-end encrypted cloud storage. Self-host for free or use hosted plans starting at £3/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6081e57b-98a6-4413-b8d5-be18ac3034df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6081e57b-98a6-4413-b8d5-be18ac3034df' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Post-quantum encryption$q$, $q$Protects files in transit and at rest with post-quantum encryption.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Protected metadata$q$, $q$Hides contact lists, file sizes, and directory structures, even from Peergos itself.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Offline access$q$, $q$Log in and view recently accessed files without an internet connection.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Secure sync client$q$, $q$Synchronizes files across multiple devices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Portable identity$q$, $q$Migrate between servers while retaining data and connections.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Secret shareable links$q$, $q$Share files with people who don't have a Peergos account.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Built-in apps$q$, $q$Includes a document editor, spreadsheets, calendar, media player, and PDF viewer.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Fully open source (AGPL-3.0) with code published on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Free to self-host indefinitely$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Independently security-audited by Cure53 and Radically Open Security$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Post-quantum encryption and hidden metadata for strong privacy$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Backed by grant/foundation funding (NGI-POINTER, Protocol Labs, FUTO, Oxford University) rather than venture capital$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$No free hosted (server-based) plan; only self-hosting is free$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Hosted plan storage caps (200GB-3000GB) are modest versus mainstream cloud providers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Android is supported but no iOS app was found$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Is Peergos free?$q$, $q$You can self-host Peergos for free. Hosted plans start at £3/month (billed yearly).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Is Peergos open source?$q$, $q$Yes, it is licensed under AGPL-3.0 with code available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$What encryption does Peergos use?$q$, $q$Post-quantum end-to-end encryption for files in transit and at rest.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Has Peergos been security audited?$q$, $q$Yes, by Cure53 and Radically Open Security, with reports published publicly.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Encrypted personal cloud storage$q$, $q$Store and share photos, videos, music, and documents with end-to-end encryption.$q$, $q$Privacy-focused individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Self-hosted encrypted storage$q$, $q$Run your own Peergos server for free while still connecting to users on other hosts.$q$, $q$Technical users and self-hosting enthusiasts$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Open source (AGPL-3.0)","Self-provided storage","Full control"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Pro$q$, $q$£3/month (billed yearly) or £4/month (billed monthly)$q$, $q$monthly$q$, $q$["200GB storage","Unlimited devices","Unlimited file size"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Visionary$q$, $q$£8/month (billed yearly) or £10/month (billed monthly)$q$, $q$monthly$q$, $q$["1000GB storage","Unlimited devices"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Pioneer$q$, $q$£20/month (billed yearly) or £25/month (billed monthly)$q$, $q$monthly$q$, $q$["3000GB storage","Unlimited devices"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$overview$q$, $q$What is Peergos?$q$, 2, ARRAY[$q$Peergos is an open-source, end-to-end encrypted cloud storage and file-sharing platform that uses post-quantum encryption to protect files in transit and at rest, and hides metadata such as contact lists, file sizes, and directory structures. It is available for Windows, macOS, Linux, and Android.$q$, $q$The project is open source under AGPL-3.0, with code published on GitHub, and has undergone independent security audits by Cure53 and Radically Open Security. Users can self-host Peergos for free or subscribe to hosted plans starting at £3/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$who-its-for$q$, $q$Who Peergos is for$q$, 2, ARRAY[$q$Peergos is aimed at privacy-focused individuals who want end-to-end encrypted cloud storage, and at technical users who prefer to self-host their own encrypted storage server for free while still being able to connect with users on other Peergos servers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Filestash ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Filestash is an open-source, self-hosted file manager for 30+ storage backends, with a free Hobby tier and paid Self Served/Enterprise plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6/month (Hobby plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Filestash: open-source file manager for S3, SFTP, WebDAV, and 30+ storage backends. Free self-hosted Hobby tier, paid plans from $50/month.$q$,
  og_description = $q$Filestash: open-source file manager for S3, SFTP, WebDAV, and 30+ storage backends. Free self-hosted Hobby tier, paid plans from $50/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bfbd22a1-7933-401b-b0f3-d85dae77fecd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bfbd22a1-7933-401b-b0f3-d85dae77fecd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Multi-protocol storage support$q$, $q$Unified interface for S3, SFTP, FTP, WebDAV, SMB, NFS, Git, SharePoint, and 30+ other backends.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$SSO integration$q$, $q$Authenticate via LDAP, SAML, and OIDC.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Role-based access control$q$, $q$Granular authorization, including AWS IAM support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Gateway functionality$q$, $q$Expose data via SFTP, S3, or MCP protocols.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$White-label branding$q$, $q$Customizable branding for resale, available on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Workflow automation$q$, $q$Event-triggered task orchestration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Audit & compliance logging$q$, $q$Immutable, tamper-proof logs supporting GDPR compliance.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$AI features$q$, $q$Semantic search, smart folders, and OCR, with Ollama support.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Open-source (AGPLv3) Hobby tier, free to self-host for up to 3 users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Very broad protocol and storage backend support (30+)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Cited enterprise/institutional clients include MIT, JP Morgan, Bell, Orange, and UCI$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$AI features such as semantic search and OCR available at higher tiers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Both self-hosted and cloud deployment options$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Free Hobby tier is capped at 3 users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Enterprise features (high availability, whitelabeling, 24/7 support) start at $290/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$SSO and RBAC require the paid Self Served commercial license, not just the free tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Is Filestash free?$q$, $q$The Hobby tier is free for self-hosted use with up to 3 users, or $6/month for a hosted Hobby plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Is Filestash open source?$q$, $q$Yes, the Hobby tier is licensed under AGPLv3 and available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$What storage backends does Filestash support?$q$, $q$S3, SFTP, FTP, WebDAV, SMB, NFS, Git, SharePoint, and 30+ other storage protocols.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Does Filestash offer AI features?$q$, $q$Yes, semantic search, smart folders, and OCR, with support for Ollama.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Free self-hosted file browser$q$, $q$Run a unified file manager across storage backends at no cost for small teams.$q$, $q$Individuals and small teams (up to 3 users)$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Enterprise storage consolidation$q$, $q$Provide SSO, RBAC, audit logging, and compliance controls across multiple storage systems.$q$, $q$Enterprises in finance, technology, and government$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Hobby$q$, $q$Free (self-hosted, up to 3 users) or $6/month$q$, $q$monthly$q$, $q$["AGPLv3 license","Self-hosted deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Self Served$q$, $q$From $50/month$q$, $q$monthly$q$, $q$["Commercial license","SSO (SAML, OIDC, LDAP)","RBAC","3 seats","Single node deployment","Cloud or self-hosted"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Enterprise$q$, $q$From $290/month$q$, $q$monthly$q$, $q$["Unlimited users","Audit & compliance","Whitelabeling","24/7 support","High availability","Custom plugins"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$overview$q$, $q$What is Filestash?$q$, 2, ARRAY[$q$Filestash is a self-hosted file management platform that provides a unified interface for browsing, organizing, and sharing files across 30+ storage backends, including S3, SFTP, FTP, WebDAV, SMB, NFS, Git, and SharePoint. It supports SSO via LDAP, SAML, and OIDC, role-based access control with AWS IAM support, and AI features such as semantic search, smart folders, and OCR with Ollama support.$q$, $q$The free, open-source Hobby tier (AGPLv3) supports self-hosting for up to 3 users, while paid Self Served and Enterprise plans add commercial licensing, SSO/RBAC, white-labeling, audit and compliance logging, and 24/7 support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$who-its-for$q$, $q$Who Filestash is for$q$, 2, ARRAY[$q$Filestash suits individuals or small teams wanting a free, self-hosted unified file browser across cloud storage backends, as well as enterprises that need SSO, RBAC, audit logging, and compliance controls across multiple storage systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── FileBrowser ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted web file manager you install on your own server via a single binary or Docker image.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FileBrowser is a free, open-source web file manager: install it on your server and browse, upload, edit and manage files from any browser.$q$,
  og_description = $q$FileBrowser is a free, open-source web file manager: install it on your server and browse, upload, edit and manage files from any browser.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e72088e-b35d-4326-9a4b-87a7536c4484';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e72088e-b35d-4326-9a4b-87a7536c4484' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Web-based file browsing$q$, $q$Point FileBrowser at a directory path and access, upload, delete, preview, and edit files through a browser-based interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$User management$q$, $q$Create multiple user accounts with their own login and permission scopes for the files they can access.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$File editing$q$, $q$Edit text and code files directly in the browser without downloading them first.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Custom commands$q$, $q$Configure and run custom shell commands against files from within the interface.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Docker deployment$q$, $q$Official Docker images make it possible to run FileBrowser as a container alongside other self-hosted services.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Free and open source under the Apache-2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Ships as a single binary or Docker image, simple to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Sleek, easy-to-use web interface for basic file management$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Active security and bug-fix support despite feature freeze$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Project is officially in maintenance-only mode: no new features are being added by the maintainer$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Feature pull requests are reviewed case-by-case and may not be merged$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$No official managed/cloud hosting option — you must run and maintain the server yourself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Is FileBrowser free?$q$, $q$Yes, FileBrowser is free, open-source software licensed under Apache-2.0. There is no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Is FileBrowser still maintained?$q$, $q$Yes, but it is in maintenance-only mode: the maintainer fixes bugs and security issues but is not actively adding new features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$How do I install FileBrowser?$q$, $q$FileBrowser ships as a single self-contained binary and also has official Docker images, so it can be installed on your own server or run as a container.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Does FileBrowser support multiple users?$q$, $q$Yes, it includes a user management system with individual logins and permission scopes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Personal cloud storage$q$, $q$Turn a home server or VPS into a private, self-hosted alternative to consumer cloud storage for accessing and managing files from a browser.$q$, $q$Self-hosters and homelab users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Team file sharing on internal infrastructure$q$, $q$Give a small team browser-based access to shared files stored on internal servers without relying on third-party storage providers.$q$, $q$Small IT teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$overview$q$, $q$What is FileBrowser?$q$, 2, ARRAY[$q$FileBrowser is an open-source web file manager. You install it on a server, point it at a directory, and it provides a browser-based interface for uploading, previewing, editing, and organizing files.$q$, $q$It ships as a single self-contained binary and has official Docker images, so it can be self-hosted without additional server infrastructure beyond the machine running it. The project is currently in maintenance-only mode: its creator continues to fix bugs and security issues but is not building new features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$who-its-for$q$, $q$Who FileBrowser is for$q$, 2, ARRAY[$q$FileBrowser suits self-hosters and small teams who want a lightweight, no-cost web interface for managing files on their own servers, rather than relying on a third-party cloud storage provider.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── MinIO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$S3-compatible object storage system, now shipped as MinIO AIStor with a free single-node tier and paid Enterprise tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MinIO AIStor is S3-compatible object storage for AI and data lakehouse workloads, with a free single-node tier and custom-priced Enterprise plans.$q$,
  og_description = $q$MinIO AIStor is S3-compatible object storage for AI and data lakehouse workloads, with a free single-node tier and custom-priced Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7f20a0c9-52f8-4c2c-8723-46040d797c2b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7f20a0c9-52f8-4c2c-8723-46040d797c2b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$S3-compatible API$q$, $q$Provides a native S3 API surface so existing S3 tooling and SDKs work against self-hosted MinIO deployments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Data protection$q$, $q$Supports encryption, versioning, immutability, replication, and lifecycle management for stored objects.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$AI and analytics integration$q$, $q$Designed to work with data lakehouse formats like Apache Iceberg and AI frameworks such as PyTorch.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Free single-node deployment$q$, $q$The Free tier offers a full-featured, single-node deployment architecture with community Slack and documentation support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Enterprise multi-node architecture$q$, $q$Enterprise Lite and Enterprise tiers add multi-node scalable architecture with SUBNET health diagnostics and security reporting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Enterprise support SLAs$q$, $q$The top Enterprise tier includes 24/7/365 support with a sub-4-hour response SLA and dedicated onboarding.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$S3-compatible, so it integrates with a wide range of existing S3 tooling$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Free single-node tier is fully featured for development and small deployments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Scales from single-node to exabyte-class multi-node Enterprise deployments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Self-hostable across edge, on-premises, and cloud environments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$The original open-source Community Edition repository (minio/minio) was archived by MinIO in 2026 and is no longer maintained, with future development moved to the commercial AIStor product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Enterprise and Enterprise Lite pricing is not publicly listed and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$External identity provider logins (LDAP/OIDC) were removed from the legacy open-source edition and are now only available in AIStor$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Multi-node deployments require a paid Enterprise tier$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Is MinIO still open source?$q$, $q$MinIO's original open-source Community Edition GitHub repository (minio/minio) was archived and marked no longer maintained in 2026. Current development is focused on the commercial MinIO AIStor product, which still offers a free tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$How much does MinIO AIStor cost?$q$, $q$AIStor has a Free tier for single-node deployments. Enterprise Lite (under 400 TiB usable storage) and Enterprise tiers require contacting MinIO for custom pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Is MinIO S3-compatible?$q$, $q$Yes, MinIO exposes a native S3-compatible API.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Can I self-host MinIO?$q$, $q$Yes, MinIO AIStor is designed to be self-hosted across edge, on-premises, and cloud environments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$AI and data lakehouse storage$q$, $q$Store and serve large volumes of unstructured data for AI training, analytics, and Apache Iceberg-based data lakehouse workloads.$q$, $q$Data engineering and AI infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Self-hosted S3-compatible storage$q$, $q$Run an S3-compatible object store on your own infrastructure instead of using a public cloud storage provider.$q$, $q$Platform and DevOps teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Free$q$, $q$$0$q$, NULL, $q$["Full-featured single-node deployment architecture","Community Slack and documentation support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Enterprise Lite$q$, $q$Custom$q$, NULL, $q$["Multi-node scalable architecture","Below 400 TiB usable storage","Lite SUBNET subscription with health diagnostics and security reporting","Optional engineer support add-on with under-5-day response SLA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Multi-node architecture at scale","Dedicated virtual onboarding","Enterprise SUBNET subscription with team governance","24/7/365 support with under-4-hour response SLA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$overview$q$, $q$What is MinIO?$q$, 2, ARRAY[$q$MinIO is an S3-compatible object storage system built for self-hosted deployment across edge, on-premises, and cloud environments. It is now positioned by its maker as MinIO AIStor, targeting AI, analytics, and data lakehouse workloads with support for formats such as Apache Iceberg.$q$, $q$MinIO offers a free, full-featured single-node deployment, while multi-node, higher-capacity deployments require a paid Enterprise Lite or Enterprise subscription with custom pricing. Notably, the original community open-source repository was archived in 2026 as the project shifted its primary development focus to the commercial AIStor product line.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$who-its-for$q$, $q$Who MinIO is for$q$, 2, ARRAY[$q$MinIO suits teams that need S3-compatible object storage they control on their own infrastructure, from individual developers running a free single-node instance to enterprises running multi-node, high-throughput deployments under a paid support contract.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Garage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted S3-compatible object storage system built for reliability across geographically distributed, low-resource hardware.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Garage is a free, open-source S3-compatible object storage system designed to run reliably on distributed, low-power hardware.$q$,
  og_description = $q$Garage is a free, open-source S3-compatible object storage system designed to run reliably on distributed, low-power hardware.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3be3e9b4-cb50-43f7-9445-28dcf621ad49';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3be3e9b4-cb50-43f7-9445-28dcf621ad49' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$S3 API compatibility$q$, $q$Exposes an S3-compatible API, allowing tools such as Nextcloud, Matrix, Mastodon, Rclone, PeerTube, and Cyberduck to use Garage as a storage backend.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Multi-zone data replication$q$, $q$Each chunk of data is replicated across three zones to protect against hardware or site failure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Low resource requirements$q$, $q$Runs with as little as 1GB of RAM and 16GB of disk space, and supports CPUs over ten years old as well as ARMv7/ARMv8 hardware.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Single-binary deployment$q$, $q$Ships as a self-contained, dependency-free executable that runs across Linux distributions without external services.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Wide-area network resilience$q$, $q$Designed to operate over the internet across multiple datacenters with heterogeneous, non-datacenter-grade hardware.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Completely free and open source (AGPL-3.0 license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Very low hardware requirements make it viable on old or low-power machines$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$S3-compatible API works with many existing self-hosted apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Built specifically for resilience across geographically distributed, unreliable networks$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$No managed/hosted cloud offering — deployment and operation are entirely self-managed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Smaller community and ecosystem than larger object storage projects like MinIO or Ceph$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Documentation and tooling are comparatively lean, reflecting its focus on a lightweight core$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Is Garage free?$q$, $q$Yes, Garage is free, open-source software licensed under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Is Garage S3-compatible?$q$, $q$Yes, Garage implements an S3-compatible API, so it works with tools like Nextcloud, Rclone, and Cyberduck.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$What hardware does Garage need?$q$, $q$Garage is designed to run on minimal hardware, including CPUs more than 10 years old and ARM devices, with as little as 1GB RAM and 16GB of disk space.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Who maintains Garage?$q$, $q$Garage is developed by Deuxfleurs, a project that has received public funding through European initiatives including NGI POINTER, NLnet/NGI0 Entrust, and the NGI0 Commons Fund.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Self-hosted object storage for small clusters$q$, $q$Provide S3-compatible storage for self-hosted applications on modest or repurposed hardware distributed across multiple sites.$q$, $q$Self-hosters and small infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Backend storage for federated services$q$, $q$Serve as the storage backend for federated or open-source platforms such as Nextcloud, Matrix, Mastodon, and PeerTube.$q$, $q$Operators of federated/self-hosted platforms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$overview$q$, $q$What is Garage?$q$, 2, ARRAY[$q$Garage is an open-source, S3-compatible object storage system built to run reliably across distributed infrastructure, including hardware outside traditional datacenters. It replicates each chunk of data across three zones and is designed to tolerate heterogeneous, low-power hardware.$q$, $q$It ships as a single self-contained binary with minimal resource requirements, and is developed by Deuxfleurs with public funding from European digital infrastructure initiatives.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$who-its-for$q$, $q$Who Garage is for$q$, 2, ARRAY[$q$Garage fits self-hosters and small teams who want S3-compatible object storage that can run on modest, geographically distributed, or older hardware, particularly as a backend for federated open-source applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Ceph ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted unified storage platform combining object, block, and file storage in a single distributed system.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ceph is a free, open-source unified storage platform offering S3/Swift-compatible object storage, block devices, and a POSIX file system.$q$,
  og_description = $q$Ceph is a free, open-source unified storage platform offering S3/Swift-compatible object storage, block devices, and a POSIX file system.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '32f17210-2418-4e31-bedc-836e12407246';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '32f17210-2418-4e31-bedc-836e12407246' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Object storage$q$, $q$Provides a RESTful gateway with S3- and Swift-compatible APIs, along with user management and multi-site deployment support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Block storage (RBD)$q$, $q$Offers thin-provisioned block devices with images up to 16 exabytes, snapshots, and copy-on-write cloning.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$File system (CephFS)$q$, $q$A POSIX-compliant distributed file system accessible via kernel client or FUSE, with Hadoop integration support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Multisite replication$q$, $q$Supports disaster recovery through multisite replication for both object and block storage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Community governance$q$, $q$Developed under the non-profit Ceph Foundation with a large, active open-source community.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Free and open source, licensed under LGPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Unifies object, block, and file storage in one platform instead of requiring separate systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$S3- and Swift-compatible object storage API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Backed by an active community and the non-profit Ceph Foundation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$No official managed cloud service from the Ceph project itself — deployment and operations are self-managed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Operating a Ceph cluster reliably at scale requires significant infrastructure and operational expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$No published pricing since it is community software rather than a commercial product$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Is Ceph free?$q$, $q$Yes, Ceph is free, open-source software licensed under LGPL, developed under the non-profit Ceph Foundation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$What kinds of storage does Ceph provide?$q$, $q$Ceph provides object storage (S3/Swift-compatible), block storage (RBD), and a POSIX file system (CephFS) from a single unified system.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Can Ceph be used as an S3-compatible store?$q$, $q$Yes, Ceph's object storage gateway exposes an S3- and Swift-compliant REST API.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Does Ceph support disaster recovery?$q$, $q$Yes, Ceph supports multisite replication for disaster recovery across both object and block storage.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$Unified storage backend for private clouds$q$, $q$Provide object, block, and file storage from a single distributed cluster for private cloud or on-premises infrastructure.$q$, $q$Infrastructure and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$S3-compatible storage at scale$q$, $q$Run a self-hosted, S3-compatible object store for applications that need large-scale, replicated storage without a public cloud provider.$q$, $q$Enterprises and service providers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$overview$q$, $q$What is Ceph?$q$, 2, ARRAY[$q$Ceph is a free, open-source distributed storage platform that unifies object, block, and file storage in one system. Its object storage gateway offers S3- and Swift-compatible APIs, its RBD component provides thin-provisioned block devices with snapshots and cloning, and CephFS offers a POSIX-compliant distributed file system.$q$, $q$Ceph is developed under the non-profit Ceph Foundation and is licensed under LGPL, making it fully free and self-hostable on your own infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$who-its-for$q$, $q$Who Ceph is for$q$, 2, ARRAY[$q$Ceph suits infrastructure and platform teams that need a single, self-hosted storage system to serve object, block, and file storage needs at scale, typically for private clouds or large on-premises deployments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32f17210-2418-4e31-bedc-836e12407246', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32f17210-2418-4e31-bedc-836e12407246', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32f17210-2418-4e31-bedc-836e12407246', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SeaweedFS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source distributed storage system for billions of files, with S3, Iceberg table, and POSIX filesystem support, plus a paid Enterprise edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2/TB per month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SeaweedFS is a free, open-source distributed storage system for billions of files, with an Enterprise edition priced at $2 per TB per month.$q$,
  og_description = $q$SeaweedFS is a free, open-source distributed storage system for billions of files, with an Enterprise edition priced at $2 per TB per month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cfd96970-81c8-46e6-aaba-767235ac591e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cfd96970-81c8-46e6-aaba-767235ac591e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Unified S3, Iceberg, and POSIX access$q$, $q$Serves S3 objects, Apache Iceberg tables, and POSIX files from a single storage cluster.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Point-in-time recovery$q$, $q$Enterprise edition allows rolling back folders, buckets, or objects to a specific moment in time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Customizable erasure coding$q$, $q$Tunable erasure coding ratios (e.g., 20+4) reduce storage overhead to roughly 1.2x versus 3x for traditional replication.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Self-healing storage$q$, $q$Automatically detects and removes corrupted data, with automatic erasure-coding shard repair.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Kernel mount$q$, $q$Provides a native Linux filesystem mount with flat memory usage regardless of file count.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Admin UI with OIDC$q$, $q$Includes an administration interface with OIDC identity-provider integration and multi-tenant S3 quality-of-service rate limiting (Enterprise).$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Free, open-source core under the Apache-2.0 license with no feature gates for development/testing under 25TB$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Enterprise pricing is transparently published ($2/TB per month or $20/TB per year) rather than requiring a sales quote$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Enterprise features apply via a license key with no migration or architecture change needed$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Handles object, table (Iceberg), and POSIX file storage from one cluster$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Advanced features like point-in-time recovery, self-healing, and multi-tenancy require a paid Enterprise license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Free tier is explicitly scoped to development and testing under 25TB$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Self-hosted only — no managed cloud service is offered$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Is SeaweedFS free?$q$, $q$The open-source core is free with no feature gates for development and testing under 25TB. Production use of Enterprise features requires a paid license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$How much does SeaweedFS Enterprise cost?$q$, $q$SeaweedFS Enterprise is priced at $2 per TB per month, or $20 per TB per year.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Does SeaweedFS support S3?$q$, $q$Yes, SeaweedFS can serve S3-compatible objects, alongside Apache Iceberg tables and POSIX files, from the same cluster.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Can I upgrade an existing SeaweedFS cluster to Enterprise?$q$, $q$Yes, Enterprise features are enabled by applying a license key to an existing SeaweedFS deployment, without requiring migration or a new architecture.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Large-scale file and object storage$q$, $q$Store and serve billions of files or S3 objects from a self-hosted distributed cluster.$q$, $q$Infrastructure teams handling large file volumes$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Data lakehouse storage backend$q$, $q$Serve Apache Iceberg tables alongside object and file storage from a single SeaweedFS cluster for analytics workloads.$q$, $q$Data engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Free$q$, $q$$0$q$, NULL, $q$["Open-source core, no feature gates","Intended for development and testing under 25TB"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$Enterprise$q$, $q$$2/TB per month or $20/TB per year$q$, $q$monthly$q$, $q$["Point-in-time recovery","Self-healing storage with automatic erasure-coding repair","Admin UI with OIDC integration","Multi-tenancy with S3 QoS rate limiting"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$overview$q$, $q$What is SeaweedFS?$q$, 2, ARRAY[$q$SeaweedFS is an open-source distributed storage system built to store and serve billions of files quickly. It can serve S3-compatible objects, Apache Iceberg tables, and POSIX-compliant files from a single cluster.$q$, $q$The open-source core, licensed under Apache-2.0, has no feature gates for development and testing under 25TB. A separate Enterprise edition, priced at $2 per TB per month (or $20 per TB per year), adds features like point-in-time recovery, self-healing storage, and multi-tenancy via a license key applied to an existing deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$who-its-for$q$, $q$Who SeaweedFS is for$q$, 2, ARRAY[$q$SeaweedFS suits teams that need to self-host storage for very large numbers of files or objects, from developers testing on the free tier to organizations running production clusters under a paid Enterprise license for advanced data protection features.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── GlusterFS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source distributed network filesystem for scalable storage across standard hardware, sponsored by Red Hat.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GlusterFS is a free, open-source distributed network filesystem for scalable storage on commodity hardware.$q$,
  og_description = $q$GlusterFS is a free, open-source distributed network filesystem for scalable storage on commodity hardware.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8bdbdb20-3a53-4c65-b774-2c8bcceae403';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8bdbdb20-3a53-4c65-b774-2c8bcceae403' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Distributed network filesystem$q$, $q$Aggregates storage from multiple servers into a single scalable network filesystem using standard hardware.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Scales on commodity hardware$q$, $q$Designed to run on standard, non-proprietary servers rather than requiring specialized storage appliances.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Suited to bandwidth-intensive workloads$q$, $q$Used for use cases such as media streaming and data analysis that require high throughput.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Active documentation and release process$q$, $q$Maintains ongoing documentation, a public roadmap, and a defined release schedule.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Free and open source, licensed under GPL-2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Runs on standard commodity hardware without proprietary storage appliances$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Long-established project with mature documentation and installation/administration guides$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Development continues with community maintainers after Red Hat's commercial product wind-down$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Red Hat ended commercial support for its Red Hat Gluster Storage product at the end of 2024$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Development pace has slowed since Red Hat's withdrawal from the commercial side of the project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$No managed cloud offering — GlusterFS is entirely self-hosted and self-managed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Is GlusterFS free?$q$, $q$Yes, GlusterFS is free, open-source software licensed under GPL-2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Is GlusterFS still maintained?$q$, $q$Yes. Although Red Hat discontinued its commercial Red Hat Gluster Storage product at the end of 2024, the open-source GlusterFS project continues to receive maintainer-driven updates and releases.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$What is GlusterFS used for?$q$, $q$GlusterFS is used to build distributed, scalable network filesystems on commodity hardware, including for bandwidth-intensive workloads like media streaming and data analysis.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Who backs GlusterFS?$q$, $q$GlusterFS is copyrighted by Red Hat, Inc. and developed as an open-source project with an active community and public GitHub repositories.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Scalable storage on commodity servers$q$, $q$Aggregate standard servers into a distributed filesystem for scalable storage without specialized hardware.$q$, $q$Infrastructure and systems administration teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Bandwidth-intensive workloads$q$, $q$Support media streaming and large-scale data analysis workloads that require high-throughput distributed storage.$q$, $q$Media and data engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$overview$q$, $q$What is GlusterFS?$q$, 2, ARRAY[$q$GlusterFS is a free and open-source scalable network filesystem that aggregates storage from standard commodity servers into a single distributed filesystem. It is commonly used for bandwidth-intensive workloads such as media streaming and data analysis.$q$, $q$The project is copyrighted by Red Hat, Inc. and licensed under GPL-2.0. Red Hat ended commercial support for its own Red Hat Gluster Storage product at the end of 2024, but the underlying open-source GlusterFS project continues to be maintained by the community.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$who-its-for$q$, $q$Who GlusterFS is for$q$, 2, ARRAY[$q$GlusterFS fits infrastructure teams that want to build distributed, scalable storage from their own commodity hardware without a commercial support contract, particularly for high-throughput workloads.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Restic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source backup program that encrypts and deduplicates data, backing up to many storage backends from a single executable.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Restic is a free, open-source backup program that only transfers changed data, encrypts backups, and supports many storage backends.$q$,
  og_description = $q$Restic is a free, open-source backup program that only transfers changed data, encrypts backups, and supports many storage backends.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '38c4934d-5e31-4ebe-b4ec-4ca3760270e4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '38c4934d-5e31-4ebe-b4ec-4ca3760270e4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Incremental backups$q$, $q$Only transfers the parts of files that actually changed since the last backup, reducing bandwidth and storage use.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Single executable$q$, $q$Ships as a single binary requiring no separate server infrastructure to run.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Multiple storage backends$q$, $q$Backs up to a wide range of self-hosted and cloud storage services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Backup verification$q$, $q$Includes built-in checks to confirm that backups can actually be restored.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Cross-platform support$q$, $q$Runs on Linux, BSD, macOS, and Windows.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Completely free and open source under the BSD 2-Clause License$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Efficient incremental backups that only transfer changed data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Works with many storage backends, both self-hosted and cloud-based$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$No server component required — runs as a single executable$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Maintains backward compatibility following Semantic Versioning$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Command-line only — no official graphical interface$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$No managed/hosted service; you must supply and manage your own storage backend$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$No commercial support plan offered directly by the project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Is Restic free?$q$, $q$Yes, Restic is completely free and open source, licensed under the BSD 2-Clause License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$What platforms does Restic support?$q$, $q$Restic runs on Linux, BSD, macOS, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Does Restic encrypt backups?$q$, $q$Yes, Restic uses modern cryptography to secure backup data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Does Restic require a server?$q$, $q$No, Restic is a single executable and does not require any dedicated server infrastructure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Encrypted backups to cloud or self-hosted storage$q$, $q$Back up files with encryption and deduplication to a wide range of storage backends, self-hosted or cloud-based.$q$, $q$Developers and system administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Cross-platform personal and server backups$q$, $q$Run the same backup tool consistently across Linux, macOS, BSD, and Windows machines.$q$, $q$Individuals and small teams managing mixed-OS environments$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$overview$q$, $q$What is Restic?$q$, 2, ARRAY[$q$Restic is a free, open-source backup program that only transfers the parts of files that have changed since the last backup, minimizing bandwidth and storage overhead. It ships as a single executable and requires no dedicated server infrastructure.$q$, $q$Backups are encrypted and can be verified to confirm they can actually be restored. Restic supports a wide range of storage backends, both self-hosted and cloud-based, and runs on Linux, BSD, macOS, and Windows.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$who-its-for$q$, $q$Who Restic is for$q$, 2, ARRAY[$q$Restic suits developers and system administrators who want a free, scriptable, cross-platform command-line backup tool that works with many different storage destinations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── BorgBackup ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source deduplicating backup archiver with authenticated encryption and multiple compression algorithms.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$BorgBackup is a free, open-source deduplicating archiver offering space-efficient, encrypted backups for Linux, macOS, and BSD.$q$,
  og_description = $q$BorgBackup is a free, open-source deduplicating archiver offering space-efficient, encrypted backups for Linux, macOS, and BSD.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '156f6244-fa16-4f23-b785-7b39766ad2f0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '156f6244-fa16-4f23-b785-7b39766ad2f0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Data deduplication$q$, $q$Provides space-efficient storage of backups by deduplicating data across archives.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Authenticated encryption$q$, $q$Secures backup archives with authenticated encryption to protect data confidentiality and integrity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Multiple compression algorithms$q$, $q$Supports lz4, zstd, zlib, and lzma compression algorithms for backup archives.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$FUSE mounting$q$, $q$Backup archives can be mounted with FUSE and browsed like a regular filesystem.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Free and open-source under the BSD license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Space-efficient deduplication reduces storage costs for repeated backups$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Strong authenticated encryption built in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Supports several compression algorithms to balance speed and ratio$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Active open-source community on GitHub$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Command-line only — no official native graphical interface$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$No managed/hosted backup service directly from the core project (third-party commercial services are listed separately)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Requires users to manage their own storage destination$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Is BorgBackup free?$q$, $q$Yes, BorgBackup is free, open-source software distributed under the BSD license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$What platforms does BorgBackup support?$q$, $q$BorgBackup supports Linux, macOS, BSD, and other platforms.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Does BorgBackup deduplicate data?$q$, $q$Yes, deduplication is a core feature, providing space-efficient storage of backups.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Can I browse a BorgBackup archive like a filesystem?$q$, $q$Yes, archives can be mounted using FUSE, making backed-up data browsable like a regular filesystem.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Space-efficient encrypted backups$q$, $q$Create deduplicated, encrypted backup archives for servers or workstations to minimize storage usage.$q$, $q$System administrators and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Cross-platform Unix-like backups$q$, $q$Run consistent backup workflows across Linux, macOS, and BSD systems.$q$, $q$Individuals and teams managing Unix-like infrastructure$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$overview$q$, $q$What is BorgBackup?$q$, 2, ARRAY[$q$BorgBackup is a free, open-source deduplicating archiver focused on space-efficient, encrypted backup storage. It supports multiple compression algorithms (lz4, zstd, zlib, lzma) and secures archives with authenticated encryption.$q$, $q$Backup archives can be mounted with FUSE and browsed like a normal filesystem. BorgBackup is distributed under the BSD license and supports Linux, macOS, and BSD.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$who-its-for$q$, $q$Who BorgBackup is for$q$, 2, ARRAY[$q$BorgBackup suits system administrators and developers who want a free, encrypted, deduplicating backup tool for Unix-like systems, without relying on a commercial backup service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Kopia ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source backup tool that creates encrypted, compressed, and deduplicated backups to cloud or local storage, with both CLI and GUI.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kopia is a free, open-source backup tool offering encrypted, compressed, deduplicated backups with both a desktop GUI and command-line interface.$q$,
  og_description = $q$Kopia is a free, open-source backup tool offering encrypted, compressed, deduplicated backups with both a desktop GUI and command-line interface.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '806a6c41-0dfb-4b12-9209-416dc798214d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '806a6c41-0dfb-4b12-9209-416dc798214d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Encrypted, compressed, deduplicated backups$q$, $q$Creates backups that are encrypted, compressed, and deduplicated to reduce storage size while protecting data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Pluggable encryption and compression$q$, $q$Supports configurable encryption and compression options for backup repositories.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Snapshot and restore$q$, $q$Creates point-in-time snapshots and supports restoring individual files or full snapshots.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Policy-based backup rules$q$, $q$Lets users define policies controlling how and when backups are taken and retained.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Desktop and command-line interfaces$q$, $q$Provides both a graphical desktop application and a command-line interface for scripting and automation.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Free and open source, hosted on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Offers both a desktop GUI and a CLI, unlike many backup tools that are CLI-only$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Deduplication and compression reduce storage costs for cloud backup destinations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Cross-platform support for Windows, macOS, and Linux$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Active community support forum$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$No official managed/hosted backup service — users must supply their own storage destination$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$No published enterprise support plan or paid tier$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Is Kopia free?$q$, $q$Yes, Kopia is free, open-source backup software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Does Kopia have a graphical interface?$q$, $q$Yes, Kopia offers both a desktop GUI application and a command-line interface.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$What platforms does Kopia support?$q$, $q$Kopia supports Windows, macOS, and Linux.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Does Kopia deduplicate backups?$q$, $q$Yes, Kopia creates encrypted, compressed, and deduplicated backups to reduce storage usage.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Encrypted cloud backups$q$, $q$Back up laptops or servers to cloud storage of your choice with encryption, compression, and deduplication.$q$, $q$Individuals and IT administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$Policy-driven backup management$q$, $q$Define retention and scheduling policies to automate backups across multiple machines.$q$, $q$System administrators managing multiple endpoints$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$overview$q$, $q$What is Kopia?$q$, 2, ARRAY[$q$Kopia is a free, open-source backup tool that creates encrypted, compressed, and deduplicated backups to a cloud or local storage destination of the user's choice. It is designed to scale from individual laptops to large servers.$q$, $q$Unlike many backup tools that are command-line only, Kopia offers both a desktop graphical application and a CLI, along with policy-based rules for controlling backup behavior and retention.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$who-its-for$q$, $q$Who Kopia is for$q$, 2, ARRAY[$q$Kopia suits individuals and system administrators who want a free backup tool with both a user-friendly GUI and a scriptable CLI, running across Windows, macOS, and Linux.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;


-- Enrichment marathon batch: Vendure, Venngage, Veracode, Vercel, Verdaccio, Vero, Vertice, Vespa

-- ── Vendure ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vendure is an open-source, headless commerce framework built on Node.js, TypeScript, and GraphQL for building custom B2B and B2C storefronts and marketplaces.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free open-source core; paid Platform tier is custom annual pricing$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE($q$1-50 employees$q$, company_size),
  headquarters = COALESCE($q$Vienna, Austria$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vendure Review: Open-Source Headless Commerce Framework$q$, seo_title),
  seo_meta_description = COALESCE($q$Vendure is an open-source TypeScript and GraphQL headless commerce framework for building custom storefronts. See features, pricing, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vendure is an open-source headless commerce framework for building custom B2B and B2C ecommerce platforms, marketplaces, and storefronts. Built on Node.js, TypeScript, NestJS, and GraphQL, it gives development teams a modular backend for modeling product catalogs, orders, pricing, promotions, and customers, paired with an admin dashboard and a flexible plugin architecture. Vendure was created by developer Michael Bromley, who made the first commit to the project in May 2018 with the goal of building a modern, API-first commerce platform that avoided the rigidity of older monolithic ecommerce systems. The open-source Vendure Core is distributed under the GPLv3 license and remains free to self-host, while a commercial arm, Vendure GmbH, a joint venture between Bromley and Austria-based ALPIN11 New Media GmbH, is headquartered in Vienna, Austria, and sells Vendure Platform, a paid enterprise tier under the Vendure Commercial License that adds a production-ready Next.js storefront, over 20 enterprise plugins, AI tooling, dedicated support, and quarterly roadmap input, billed as a flat annual subscription rather than a percentage of gross merchandise value. Vendure Cloud, a managed hosting runtime with auto-scaling, automated backups, preview deployments, and EU data residency options, is rolling out to design partners with general availability targeted for late 2026. On GitHub the project has amassed over 8,000 stars and an active Discord community. Vendure is frequently evaluated alongside other headless and composable commerce platforms such as Medusa, Saleor, and commercetools, and it is unrelated to Vendr, a SaaS procurement platform with a similarly spelled name. Vendure suits engineering teams that want full code-level control over their commerce logic rather than a hosted, no-code storefront builder like Shopify.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b6f6733-ef4d-4430-95f2-717f687caf82';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b6f6733-ef4d-4430-95f2-717f687caf82' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$GraphQL Admin and Shop APIs$q$, $q$A fully headless API layer for managing catalog, orders, and customers, and for building any storefront experience.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$NestJS-based plugin architecture$q$, $q$Extend or override core commerce logic with TypeScript plugins instead of forking the codebase.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Multi-channel and multi-region catalog$q$, $q$Sell across multiple storefronts, currencies, and regions from one backend.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Built-in promotions and pricing engine$q$, $q$Configure discounts, promotions, and dynamic pricing rules without custom code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Order and fulfillment workflow engine$q$, $q$Model complex order states and fulfillment processes for B2B and B2C use cases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Admin dashboard$q$, $q$A ready-made back-office UI for managing products, orders, customers, and promotions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Next.js storefront starter (Platform)$q$, $q$A production-ready storefront included with the paid Platform tier to speed up launches.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Role-based access control$q$, $q$Granular permissions for admin users across channels and functions.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Free, source-available core with no gross-merchandise-value-based fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Deep customization through TypeScript plugins built on NestJS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Strong GraphQL API works with any frontend framework$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Active open-source community with Discord and GitHub support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Enterprise Platform tier adds dedicated support without requiring a rebuild$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Requires Node.js and TypeScript development skills, not suited to no-code users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Self-hosting Core means teams manage their own infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Smaller ecosystem and plugin marketplace than Shopify or WooCommerce$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Vendure Cloud is still in a design-partner phase, not yet generally available$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Is Vendure free to use?$q$, $q$Yes, Vendure Core is free and open source under the GPLv3 license and can be self-hosted at no cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$What technology stack does Vendure use?$q$, $q$Vendure is built on Node.js, TypeScript, NestJS, and GraphQL.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Who created Vendure?$q$, $q$Developer Michael Bromley created Vendure, committing the first code in May 2018.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Is Vendure the same as Vendr?$q$, $q$No. Vendure is a headless commerce framework, while Vendr is an unrelated SaaS procurement platform with a similar name.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Does Vendure include a storefront?$q$, $q$Vendure is headless by default, so you build your own storefront; the paid Platform tier includes a ready-made Next.js storefront starter.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Can Vendure handle B2B commerce?$q$, $q$Yes, Vendure is designed to support complex B2B pricing, catalogs, and ordering in addition to B2C.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$What is Vendure Platform?$q$, $q$Vendure Platform is the paid, commercially licensed enterprise tier that adds extra plugins, AI tooling, and dedicated support.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Is there a managed hosting option?$q$, $q$Vendure Cloud is a managed runtime currently available to design partners, with general availability planned for late 2026.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Custom B2B ecommerce portals$q$, $q$Model complex pricing, catalogs, and ordering workflows for wholesale or B2B buyers.$q$, $q$Enterprise development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Composable storefronts for D2C brands$q$, $q$Build a fully custom, headless storefront experience decoupled from the commerce backend.$q$, $q$Ecommerce agencies and D2C brands$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Marketplace platforms$q$, $q$Extend Vendure's plugin system to support multi-vendor marketplace logic.$q$, $q$Startups building marketplace products$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Core$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full commerce framework","Admin dashboard","GPLv3 open source license","Community support via Discord and GitHub"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Platform$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Everything in Core","Next.js storefront starter","20+ enterprise plugins","AI tooling","Dedicated support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Cloud$q$, $q$Design-partner pricing$q$, $q$N/A$q$, NULL, $q$["Managed infrastructure","Auto-scaling","Automated backups and rollbacks","Preview deployments","EU data residency option"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '1b6f6733-ef4d-4430-95f2-717f687caf82';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$overview$q$, $q$What Is Vendure$q$, 2, ARRAY[$q$Vendure is an open-source, headless commerce framework that lets developers build custom ecommerce storefronts, marketplaces, and B2B ordering portals on top of a Node.js and TypeScript backend. Rather than shipping a fixed storefront template, Vendure exposes a GraphQL Admin API and Shop API so teams can build any frontend experience, from a Next.js site to a mobile app, while Vendure handles catalog data, orders, pricing, and customers.$q$, $q$The framework was created by developer Michael Bromley, who committed the first code in May 2018 with the aim of giving developers an alternative to older monolithic ecommerce systems. It is built on NestJS, giving it a modular, dependency-injected architecture that mirrors patterns familiar to backend TypeScript developers.$q$, $q$Vendure targets teams building complex, custom, or B2B commerce experiences that outgrow off-the-shelf platforms like Shopify or WooCommerce, and it is commonly compared to other composable commerce frameworks such as Medusa, Saleor, and commercetools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$At the core of Vendure is a plugin system built on NestJS, letting developers extend or override nearly any part of the commerce logic, from custom pricing rules to new payment integrations, without forking the core codebase.$q$, $q$Vendure natively supports multi-channel, multi-region, and multi-currency selling from a single backend, along with a built-in promotions and pricing engine, order and fulfillment workflows, and role-based access control for the admin dashboard.$q$, $q$Because the platform is headless and API-first, frontend teams are free to build with any framework; the paid Platform tier additionally ships a production-ready Next.js storefront starter to accelerate launches.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Vendure Core is free and open source under the GPLv3 license, with no cost to self-host and no fees tied to gross merchandise value.$q$, $q$Vendure Platform is the commercial, enterprise tier, licensed under the Vendure Commercial License and sold as a flat annual subscription that adds enterprise plugins, AI tooling, and dedicated support. Vendure Cloud, a managed hosting runtime for either Core or Platform projects, is currently available to design partners with general availability planned for late 2026.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Venngage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Venngage is an online infographic and data-visualization design tool that helps non-designers create infographics, reports, presentations, and marketing visuals from templates.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free; Premium plan from around $19/user/month$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$1-50 employees$q$, company_size),
  headquarters = COALESCE($q$Toronto, Ontario, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Venngage Review: Online Infographic and Design Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Venngage is a template-driven infographic maker for reports, presentations, and marketing visuals. Compare Venngage pricing, features, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Venngage is a browser-based visual content design platform focused on infographics, reports, presentations, and data visualizations for people without graphic design training. Founded in 2012 by Eugene Woo and Lucas Walker and headquartered in Toronto, Canada, Venngage grew out of the founders' earlier work and pivoted toward infographic creation as demand for shareable visual content rose across social media and corporate reporting. The platform offers a drag-and-drop editor, more than 10,000 templates, chart and map widgets, brand kit tools, and an AI-powered infographic and text-to-design generator that can turn a topic or block of text into a formatted visual in seconds. Venngage says over 14 million creators have used the platform, spanning marketers, HR teams, educators, and small businesses that need polished visuals without hiring a designer or learning tools like Adobe Illustrator. Pricing follows a freemium model: a free plan offers limited templates and downloads, while paid tiers unlock premium templates, PDF and PNG exports, and team collaboration; published plan pricing lists Premium around 19 dollars per user per month, Business around 49 dollars per user per month, and an Enterprise tier around 499 dollars per month for 10 seats, cheaper on annual billing. Venngage competes directly with Visme, Canva, and Piktochart in the visual-content-creation category; it is a separate company and product from Visme despite serving an overlapping audience of non-designer content creators. Venngage is best suited to marketing and communications teams that need to regularly produce data-heavy infographics, one-page reports, and social graphics without a dedicated design department, and its built-in charting and mapping tools give it an edge for data storytelling specifically, compared to more general-purpose design tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$10,000+ templates$q$, $q$A large library of infographic, report, and presentation templates for common business use cases.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$AI infographic generator$q$, $q$Generate a first-draft infographic from a topic or block of text using built-in AI tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Drag-and-drop editor$q$, $q$Customize templates with charts, icons, maps, and images without design experience.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Data-driven charts and maps$q$, $q$Import spreadsheet data directly into charts and map visuals inside a design.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Brand kit$q$, $q$Save brand colors, fonts, and logos for consistent, on-brand designs across a team.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Team collaboration$q$, $q$Share, comment on, and approve designs together on paid team plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Multiple export formats$q$, $q$Export finished designs as PNG, PDF, or interactive HTML depending on plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Interactive and animated infographics$q$, $q$Add interactive elements and simple animation to infographics for digital sharing.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Large, purpose-built template library for infographics and reports$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$No design experience required to produce polished visuals$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$AI tools speed up first drafts of data-heavy content$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Usable free plan and an affordable entry-level paid tier$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Strong built-in support for data storytelling with charts and maps$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Free plan is limited, with no PDF export and fewer templates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Advanced or highly custom designs still require manual editing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Less full-featured than Canva or Visme for general design and video work$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Business and Enterprise pricing can add up quickly for larger teams$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Is Venngage free?$q$, $q$Venngage has a free plan with limited templates and no PDF export; paid plans unlock more templates and export options.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Who founded Venngage?$q$, $q$Venngage was founded in 2012 by Eugene Woo and Lucas Walker in Toronto, Canada.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Is Venngage the same as Visme?$q$, $q$No, Venngage and Visme are separate companies and products, even though both are visual content design tools.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Does Venngage have an AI design generator?$q$, $q$Yes, Venngage offers an AI infographic and text-to-design generator.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Can teams collaborate in Venngage?$q$, $q$Yes, collaboration and approval workflows are available on paid Business and Enterprise plans.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$What file formats can I export from Venngage?$q$, $q$Depending on the plan, users can export as PNG, PDF, or interactive HTML.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Is Venngage good for presentations?$q$, $q$Yes, Venngage includes presentation templates in addition to its infographic and report templates.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Where is Venngage based?$q$, $q$Venngage is headquartered in Toronto, Ontario, Canada.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Marketing infographics and reports$q$, $q$Turn campaign or research data into shareable infographics and one-page reports.$q$, $q$Marketing and content teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Internal communications and HR visuals$q$, $q$Create onboarding guides, org charts, and internal one-pagers without a designer.$q$, $q$HR and internal communications teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Educational and student reports$q$, $q$Build visual reports, timelines, and study aids using structured templates.$q$, $q$Educators and students$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Limited templates","No PDF download","Basic editor access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Premium$q$, $q$~$19/user/month$q$, $q$monthly or annual$q$, NULL, $q$["Premium templates","PDF download","Brand kit"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Business$q$, $q$~$49/user/month$q$, $q$monthly or annual$q$, NULL, $q$["Team collaboration","Real-time editing","Additional storage"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Enterprise$q$, $q$~$499/month for 10 seats$q$, $q$monthly or annual$q$, NULL, $q$["SSO","Dedicated support","Custom branding controls"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$overview$q$, $q$What Is Venngage$q$, 2, ARRAY[$q$Venngage is an online design platform specialized in infographics, reports, and other data-heavy visual content, aimed at marketers, educators, and business users who are not trained designers. Founded in 2012 by Eugene Woo and Lucas Walker in Toronto, Canada, the platform grew around a large library of structured, editable templates rather than a blank-canvas approach.$q$, $q$Users pick a template, then customize it with a drag-and-drop editor, swapping in their own data, charts, colors, and branding. Venngage says more than 14 million people have used the platform to create visual content for marketing, internal communications, education, and reporting.$q$, $q$The company has increasingly layered AI into the product, including a text-to-infographic generator that produces a first-draft design from a topic or block of text, reducing the time needed to go from raw data to a finished visual.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Venngage's template library spans infographics, one-page reports, presentations, case studies, and social graphics, with over 10,000 templates covering common business and marketing use cases.$q$, $q$Built-in chart and map widgets let users import spreadsheet data directly into visuals, which is a key differentiator from more general design tools. A brand kit feature lets teams lock in colors, fonts, and logos for consistency across designs.$q$, $q$Paid plans add team collaboration and approval workflows, additional export formats including PDF and interactive HTML, and options for animated or interactive infographics.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Venngage offers a free plan with access to a limited set of templates and no PDF export, which lets users try the editor before committing to a paid plan.$q$, $q$Paid tiers scale from an individual Premium plan priced around 19 dollars per user per month, to a Business plan around 49 dollars per user per month for team collaboration features, up to an Enterprise plan around 499 dollars per month covering 10 seats with added support and controls; annual billing reduces the monthly rate.$q$]::text[], 2);


-- ── Veracode ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Veracode is an application security testing platform offering static, dynamic, and software-composition analysis to help enterprises find and fix vulnerabilities across the software development lifecycle.$q$, short_description),
  pricing_model = COALESCE($q$custom$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE($q$501-1,000 employees$q$, company_size),
  headquarters = COALESCE($q$Burlington, Massachusetts, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Veracode Review: Application Security Testing Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Veracode offers SAST, DAST, SCA, and ASPM tools to secure applications. Learn about Veracode pricing, features, history, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Veracode is an application security testing platform that helps organizations find and remediate vulnerabilities in code they write, buy, and run. Founded in 2006 in Burlington, Massachusetts by Chris Wysopal and Christien Rioux, two former members of the L0pht hacker collective and the at stake security consultancy, Veracode built its business around cloud-based static analysis, dynamic analysis, and software composition analysis that scans open-source dependencies for known vulnerabilities. The company has changed hands several times: CA Technologies acquired Veracode for about 614 million dollars in 2017, Broadcom acquired CA Technologies, and with it Veracode, for 18.9 billion dollars in 2018, and later that year Broadcom sold the Veracode business to private equity firm Thoma Bravo for 950 million dollars, spinning it out as an independent company again. In March 2022, growth-equity firm TA Associates acquired a majority stake in Veracode at a valuation of roughly 2.5 billion dollars. Today Veracode serves more than 2,400 customers and reports having scanned over 315 trillion lines of code and helped fix over 113 million software flaws, with roughly 700 employees globally. Its product suite has expanded beyond core static, dynamic, and composition analysis into an Application Security Posture Management module called Risk Manager, AI-assisted remediation called Fix, container security, a Package Firewall for supply-chain risk, and penetration-testing-as-a-service, plus developer security training. Pricing is enterprise and quote-based, not published publicly, and typically scales with the number of applications or lines of code scanned. Veracode competes with Checkmarx, Snyk, Fortify from OpenText, and GitHub Advanced Security, and it is a distinct company from Vanta, which automates SOC 2 and compliance workflows rather than scanning application code.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '96409439-bd37-456a-bd67-52a51e831b1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '96409439-bd37-456a-bd67-52a51e831b1e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Static Application Security Testing$q$, $q$Scans source code for security flaws early in development.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Dynamic Application Security Testing$q$, $q$Tests running web applications for runtime vulnerabilities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Software Composition Analysis$q$, $q$Identifies known vulnerabilities in open-source dependencies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Application Security Posture Management$q$, $q$Risk Manager provides unified visibility and remediation tracking across application risk.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$AI-assisted remediation$q$, $q$The Fix capability suggests and automates fixes for identified vulnerabilities.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Container security$q$, $q$Scans container images for vulnerabilities before production deployment.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Package Firewall$q$, $q$Proactively blocks malicious or risky open-source packages from entering the pipeline.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Penetration Testing as a Service$q$, $q$On-demand, expert-led penetration testing delivered through the platform.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Decades of application security research behind the product, founded by L0pht veterans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Broad coverage across static, dynamic, and composition analysis plus container scanning in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Strong compliance and audit reporting for regulated industries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Large existing customer base and scan-volume track record$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$AI-based remediation reduces manual fix time$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Pricing is not public and typically requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Can be resource-intensive to fully integrate into CI/CD pipelines$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Static analysis scan times can be slower than some newer, lighter-weight competitors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Best suited to larger organizations, which may make it heavy for very small teams$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$What does Veracode do?$q$, $q$Veracode provides application security testing, including static, dynamic, and software composition analysis, to find and fix vulnerabilities.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Who founded Veracode and when?$q$, $q$Chris Wysopal and Christien Rioux founded Veracode in 2006.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Who owns Veracode now?$q$, $q$TA Associates acquired a majority stake in Veracode in March 2022 at a roughly 2.5 billion dollar valuation.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$How much does Veracode cost?$q$, $q$Veracode uses custom, quote-based pricing that is not published publicly.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Is Veracode the same as Vanta?$q$, $q$No, Veracode scans application code for security flaws, while Vanta automates compliance and audit workflows; they are different companies.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Does Veracode scan open-source dependencies?$q$, $q$Yes, through its Software Composition Analysis capability.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$What industries use Veracode?$q$, $q$Veracode is used across regulated industries like finance, healthcare, and government, as well as general enterprise software teams.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Does Veracode integrate with CI/CD pipelines?$q$, $q$Yes, Veracode offers IDE plugins and CI/CD integrations for automated scanning.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Enterprise DevSecOps pipelines$q$, $q$Embed automated security scanning into build and release pipelines.$q$, $q$Security and engineering teams at large enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Regulated-industry compliance scanning$q$, $q$Meet audit and compliance requirements for application security in finance and healthcare.$q$, $q$Compliance and application security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Open-source dependency risk management$q$, $q$Identify and remediate known vulnerabilities in third-party libraries.$q$, $q$Application security teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Custom / Enterprise$q$, $q$Contact sales$q$, $q$annual contract$q$, NULL, $q$["Priced per application or scan volume","Modular SAST, DAST, SCA, and PTaaS options","Dedicated account support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '96409439-bd37-456a-bd67-52a51e831b1e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$overview$q$, $q$What Is Veracode$q$, 2, ARRAY[$q$Veracode is an application security testing company that helps engineering and security teams identify and fix vulnerabilities in custom code, open-source dependencies, and running applications. It was founded in 2006 by Chris Wysopal and Christien Rioux, two former members of the L0pht hacker think tank, and built its early reputation on cloud-delivered static analysis.$q$, $q$The company has been owned by several different parents over its history, moving through CA Technologies, Broadcom, and Thoma Bravo before TA Associates acquired a majority stake in 2022 at a roughly 2.5 billion dollar valuation, and it now operates as an independent application security vendor headquartered in Burlington, Massachusetts.$q$, $q$Veracode serves more than 2,400 customers and reports scanning over 315 trillion lines of code, positioning itself for organizations that need to secure software across the full development lifecycle, from code written in-house to open-source components and running production applications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Veracode's core testing capabilities include Static Application Security Testing for finding flaws in source code, Dynamic Application Security Testing for scanning running web applications, and Software Composition Analysis for identifying known vulnerabilities in open-source dependencies.$q$, $q$Beyond core scanning, Veracode offers Risk Manager for Application Security Posture Management, AI-assisted remediation through its Fix capability, container security scanning, a Package Firewall that proactively blocks malicious open-source packages, and Penetration Testing as a Service.$q$, $q$The platform also includes developer-focused eLearning and security labs, aimed at reducing vulnerabilities at the source by training developers directly.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Veracode does not publish standard pricing tiers. Costs are quote-based and typically scale with the number of applications, lines of code, or scan types an organization needs, which is common for enterprise application security platforms.$q$, $q$Prospective customers request a demo or quote directly from Veracode's sales team, and pricing can vary significantly depending on which modules, such as SAST, DAST, SCA, or PTaaS, are included in a contract.$q$]::text[], 2);


-- ── Vercel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vercel is a frontend cloud platform for building, deploying, and scaling web applications, created by the team behind Next.js and the AI app-builder v0.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Hobby); Pro from $20/user/month$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$501-1,000 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vercel Review: Frontend Cloud and Deployment Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Vercel hosts and scales web apps and is the home of Next.js and v0. See Vercel pricing, features, funding history, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vercel is a frontend cloud platform that builds, deploys, and scales web applications, with deep integration for Next.js, the open-source React framework it maintains. The company was founded in 2015 by Guillermo Rauch under the name ZEIT and was renamed Vercel in April 2020, keeping its original triangular logo. Rauch, previously known for creating the Socket.IO real-time library, built Vercel around a git-push-to-deploy workflow, automatic CI/CD, global CDN edge delivery, serverless and edge functions, and preview deployments for every pull request, which made it a default choice for teams shipping React and Next.js applications. Vercel is headquartered in San Francisco and had grown to roughly 875 employees by 2026, up from about 600 in 2024. The company has raised substantial venture funding, most notably a 250 million dollar round in May 2024 at a 3.25 billion dollar valuation, followed by a 300 million dollar Series F in September 2025 that pushed its valuation to 9.3 billion dollars, reflecting surging demand tied to AI-assisted web development. Vercel is also the creator of v0, its generative AI tool that turns natural-language prompts into working React and Next.js UI code, which plugs directly into the Vercel deployment pipeline. Pricing follows a freemium model: the Hobby plan is free for personal projects, Pro starts at 20 dollars per user per month plus usage-based charges for bandwidth, edge requests, and function execution time, and Enterprise pricing is custom with SLAs, SCIM, and advanced security controls. Vercel competes with Netlify, Cloudflare Pages, AWS Amplify, and Render, and it is unrelated to Verdaccio, a private npm registry tool with a similarly styled name.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Git-based automatic deployments$q$, $q$Every push triggers an automatic build and deployment with zero manual configuration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Preview deployments$q$, $q$Every branch and pull request gets its own live preview URL.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Global edge network$q$, $q$Serves applications from a worldwide CDN for low-latency delivery.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Serverless and Edge Functions$q$, $q$Run backend logic close to users without managing servers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Native Next.js optimization$q$, $q$Deep integration and performance tuning for Vercel's own Next.js framework.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Web Application Firewall and DDoS mitigation$q$, $q$Built-in security protections included on all plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Image optimization and analytics$q$, $q$Automatic image resizing plus traffic and performance analytics.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$v0 AI UI generation$q$, $q$Generate and deploy React and Next.js UI code from natural-language prompts.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Best-in-class Next.js integration and performance tuning$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Fast, simple git-push deployment workflow$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Generous free Hobby tier for personal projects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Strong global edge network for low-latency delivery$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$v0 integration speeds up AI-assisted frontend development$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Usage-based costs can rise quickly at scale for bandwidth and functions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Enterprise pricing is opaque and requires a sales conversation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Some optimizations are tied closely to Next.js, creating light framework lock-in$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Function cold starts and limits can affect complex backend workloads$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Who founded Vercel?$q$, $q$Guillermo Rauch founded the company in 2015, originally under the name ZEIT.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$When did ZEIT become Vercel?$q$, $q$The company rebranded from ZEIT to Vercel in April 2020.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$What is Vercel's valuation?$q$, $q$Vercel was valued at 9.3 billion dollars after its September 2025 Series F funding round.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Is v0 part of Vercel?$q$, $q$Yes, Vercel created and operates v0, its AI UI generation tool.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$How much does Vercel cost?$q$, $q$Vercel offers a free Hobby tier, a Pro tier from 20 dollars per user per month plus usage, and custom Enterprise pricing.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Does Vercel only work with Next.js?$q$, $q$No, Vercel supports many frameworks, though Next.js has the deepest integration since Vercel maintains it.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Is Vercel the same as Verdaccio?$q$, $q$No, they are unrelated products despite similar-sounding names; Verdaccio is a private npm registry tool.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Does Vercel offer serverless functions?$q$, $q$Yes, Vercel supports both serverless functions and edge functions.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Deploying Next.js and React production apps$q$, $q$Ship and scale production web applications with automatic CI/CD and global delivery.$q$, $q$Frontend engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$AI-assisted UI prototyping$q$, $q$Generate working UI code from prompts with v0 and deploy it instantly.$q$, $q$Startups and product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Global marketing and content sites$q$, $q$Serve high-traffic marketing sites with low-latency edge delivery.$q$, $q$Enterprise web and marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Hobby$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Automatic CI/CD","Global CDN","Web Application Firewall","DDoS mitigation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Pro$q$, $q$$20/user/month plus usage$q$, $q$monthly$q$, NULL, $q$["Team collaboration","Faster builds","Usage credit included","Cold start prevention options"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Enterprise$q$, $q$Custom$q$, $q$annual contract$q$, NULL, $q$["99.99% SLA","SCIM directory sync","Managed firewall rulesets","Multi-region failover"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$overview$q$, $q$What Is Vercel$q$, 2, ARRAY[$q$Vercel is a frontend cloud platform for deploying and scaling web applications, built around a git-push workflow where every commit triggers an automatic build and deployment. It was founded in 2015 by Guillermo Rauch as ZEIT, and the company rebranded to Vercel in April 2020 while keeping its original triangular logo.$q$, $q$Vercel maintains Next.js, the popular open-source React framework, and the platform is deeply optimized for it, though it also supports other frameworks and static sites. It is headquartered in San Francisco and has grown from around 600 employees in 2024 to roughly 875 by 2026.$q$, $q$Vercel raised a 250 million dollar round in May 2024 at a 3.25 billion dollar valuation, then a 300 million dollar Series F in September 2025 that lifted its valuation to 9.3 billion dollars, driven in part by growing demand for AI-assisted web development tools built on its platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Every deployment on Vercel gets an automatic preview URL, so teams can review pull requests visually before merging. Builds run through automatic CI/CD, and production traffic is served from a global edge network with a built-in Web Application Firewall and DDoS mitigation.$q$, $q$Vercel supports serverless and edge functions for backend logic, native image optimization, and built-in analytics for performance and traffic insights.$q$, $q$Vercel also created v0, a generative AI tool that converts natural-language prompts into working React and Next.js code, which integrates directly with Vercel's deployment pipeline for a prompt-to-production workflow.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The Hobby plan is free forever and includes automatic CI/CD, a global CDN, and DDoS mitigation, aimed at personal projects and experimentation.$q$, $q$The Pro plan costs 20 dollars per user per month, includes a usage credit, and adds team collaboration and faster builds, with additional usage-based charges for edge requests, data transfer, and function execution time. Enterprise pricing is custom and adds a 99.99 percent SLA, SCIM directory sync, and managed firewall rulesets.$q$]::text[], 2);


-- ── Verdaccio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Verdaccio is a free, open-source, lightweight Node.js private npm registry and proxy that lets teams cache and host their own packages.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE($q$Volunteer-run open-source project (no company)$q$, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Verdaccio Review: Free Private npm Registry$q$, seo_title),
  seo_meta_description = COALESCE($q$Verdaccio is a lightweight, open-source private npm proxy registry for Node.js teams. Learn about its features, setup, and free MIT-licensed pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Verdaccio is a free, open-source, lightweight private npm registry and proxy server built for Node.js and JavaScript teams that need to host internal packages or cache public npm packages locally. The project traces back to Sinopia, a private registry and cache created by developer Alex Kocharin in 2013; when Sinopia went dormant in late 2015, developers John Wilkinson and Trent Earl forked it in April 2016 to keep it alive, and contributor David Cuzzinz gave the fork its name, Verdaccio, an art-history term for a greenish pigment that continued Sinopia's color-themed naming. Contributor Juan Picado joined in August 2016, stabilized the project for modern Node.js versions, took over ownership in February 2017, and shipped Verdaccio 2.0 as its first stable release; Picado has remained the project's lead maintainer since. Verdaccio requires zero configuration to start, ships with its own lightweight built-in storage so teams do not need a separate database, and can proxy and cache packages from public registries like npmjs.org while also hosting private, scoped packages. It supports plugin-based storage backends including Amazon S3, Google Cloud Storage, and Azure Blob Storage, along with authentication plugins for LDAP, htpasswd, and custom auth providers, plus a web interface for browsing packages. The entire project is MIT licensed and maintained by volunteer contributors rather than a company, meaning there is no paid tier, enterprise SLA, or commercial pricing; teams instead self-host it on their own infrastructure, commonly inside a single Docker container. Verdaccio is often used as a lightweight, self-hosted alternative to commercial private-registry products like JFrog Artifactory, npm Enterprise, or GitHub Packages, particularly by teams that want a minimal-footprint tool. It has no relation to Vercel, the unrelated frontend-hosting and deployment company, despite a similar-sounding name.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e4836b9e-697c-4735-b03e-624cbcf6545f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Zero-config setup$q$, $q$Runs out of the box with its own lightweight built-in storage, no separate database required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$npm registry proxying and caching$q$, $q$Caches packages from public registries like npmjs.org to speed up installs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Private, scoped package hosting$q$, $q$Host internal packages alongside cached public ones.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Pluggable storage backends$q$, $q$Extend storage to Amazon S3, Google Cloud Storage, or Azure Blob Storage via plugins.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Pluggable authentication$q$, $q$Supports htpasswd, LDAP, and custom authentication plugins.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Web interface$q$, $q$Browse and search hosted packages through a built-in UI.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Docker-ready deployment$q$, $q$Official Docker images make self-hosting straightforward.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Client compatibility$q$, $q$Works with npm, Yarn, and pnpm without special tooling.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Completely free and MIT licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Minimal setup, can run in a single container$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Active volunteer-maintained open-source community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Flexible storage and authentication plugin ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Low resource footprint compared to enterprise registries$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$No official paid support or enterprise SLA$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Lacks the built-in advanced security scanning found in some commercial tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Scaling to very large registries requires manual operations work$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Maintained entirely by volunteers, so roadmap pace can vary$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Is Verdaccio free?$q$, $q$Yes, Verdaccio is completely free and open source under the MIT license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Who maintains Verdaccio?$q$, $q$Verdaccio is maintained by volunteer contributors, led by Juan Picado.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$What is Verdaccio based on?$q$, $q$Verdaccio began as an April 2016 fork of the Sinopia private registry project.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Can Verdaccio proxy the public npm registry?$q$, $q$Yes, it caches packages from public registries such as npmjs.org.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Does Verdaccio support cloud storage?$q$, $q$Yes, through plugins for Amazon S3, Google Cloud Storage, and Azure Blob Storage.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Is Verdaccio the same company as Vercel?$q$, $q$No, they are unrelated projects despite similar-sounding names.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Can I run Verdaccio in Docker?$q$, $q$Yes, official Docker images are provided for self-hosting.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Does Verdaccio support authentication?$q$, $q$Yes, including htpasswd, LDAP, and custom authentication plugins.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Hosting private internal npm packages$q$, $q$Publish and distribute internal libraries without exposing them publicly.$q$, $q$Engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Caching public packages for CI$q$, $q$Proxy and cache npmjs.org packages to speed up and stabilize continuous integration.$q$, $q$DevOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Lightweight local registry for monorepos$q$, $q$Run a minimal registry locally or in a small team environment.$q$, $q$Individual developers and small teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open source under MIT license","Self-managed infrastructure","Community support via GitHub"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$overview$q$, $q$What Is Verdaccio$q$, 2, ARRAY[$q$Verdaccio is a free, open-source private npm registry and proxy server for Node.js and JavaScript projects. It lets teams host their own private packages and cache public npm packages locally to speed up installs and reduce reliance on the public registry.$q$, $q$The project began as a fork of Sinopia, a private registry created by Alex Kocharin in 2013 that went dormant around late 2015. Developers John Wilkinson and Trent Earl forked it in April 2016 to keep the project alive, and contributor David Cuzzinz named the fork Verdaccio, a term from art history for a greenish pigment, continuing Sinopia's color-themed naming.$q$, $q$Contributor Juan Picado joined in August 2016, stabilized the codebase for newer Node.js versions, and took over project ownership in February 2017, releasing Verdaccio 2.0 as the first stable release. Picado has remained the project's lead maintainer since.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Verdaccio requires no configuration to get started and ships with its own lightweight built-in storage, so it does not need a separate database to run. It can proxy and cache packages from public registries like npmjs.org while also hosting private, scoped packages internally.$q$, $q$For teams that outgrow local storage, Verdaccio supports plugin-based storage backends such as Amazon S3, Google Cloud Storage, and Azure Blob Storage, along with pluggable authentication through htpasswd, LDAP, or custom providers.$q$, $q$It ships with a web interface for browsing hosted packages and works with standard npm, Yarn, and pnpm clients without any special tooling.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Verdaccio is entirely free and MIT licensed, with no paid tiers, subscriptions, or enterprise SLA. Since it is run by volunteer contributors rather than a company, teams self-host it on their own infrastructure, commonly as a single Docker container or Node process.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Vero ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vero is a customer engagement platform that lets product-led marketing teams send targeted email, push, and SMS messages based on real user behavior data.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$54/month ($49/month billed annually)$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Sydney, Australia$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vero Review: Customer Engagement Email Marketing Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Vero helps product-led teams send behavior-based email, push, and SMS campaigns. Compare Vero pricing, features, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vero is a customer engagement platform built for B2C and B2B product-led marketing and growth teams to send behavior-triggered email, iOS and Android push, and SMS messages. It was founded by Chris Hexton and James Lamont, who launched the product as Vero Workflows after going through Australia's Startmate accelerator program in 2012. The company is headquartered in Sydney, Australia, with a distributed team across the United States, Lisbon, and Hong Kong, and in 2020, roughly eight years after founding, Vero raised 4 million dollars from Square Peg Capital, one of Australia's best-known technology venture firms, to build out Vero Newsletters and expand the platform. Vero differentiates itself from many competing marketing-automation and customer-engagement tools by connecting directly to a company's data warehouse and product event data rather than requiring marketers to duplicate user data into a separate marketing database, positioning itself as a platform built for the modern data stack. Core capabilities include a visual customer-journey builder, dynamic content personalization, segment building from behavioral and transactional data, a flexible API for storing and updating user profiles, and multichannel delivery across email, push, and SMS. Pricing is usage-based rather than pure per-contact pricing: the Starter plan costs 54 dollars per month, or 49 dollars per month billed annually, and includes 5,000 user profiles, 10,000 emails, 20,000 push notifications, and 160,000 tracked events per month, while larger customers move to a custom Professional plan priced around their forecast or actual send volume, with a 10 percent discount for annual prepayment. Vero competes with customer engagement platforms like Customer.io, Braze, and Iterable, and it is a distinct company from Vertice, an unrelated SaaS and cloud spend management platform that also appears in the same product listings due to a similar-sounding name.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Visual customer journey builder$q$, $q$Design multi-step, behavior-triggered campaigns across channels.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Behavior-triggered email$q$, $q$Send email campaigns based on real user actions and events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Push notifications$q$, $q$Send iOS and Android push messages as part of multichannel journeys.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$SMS messaging$q$, $q$Reach users via SMS alongside email and push channels.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Dynamic content personalization$q$, $q$Personalize message content based on user data and behavior.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Data warehouse and event-based segmentation$q$, $q$Segment users using data connected directly from a company's warehouse and product events.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Flexible API$q$, $q$Store and update user profiles and activity history programmatically.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Unlimited team members and sub-accounts$q$, $q$Manage multiple projects or brands from isolated sub-accounts.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Built to work directly with product and event data, not just static contact lists$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Multichannel campaigns, email, push, and SMS, in one workflow builder$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Usage-based pricing avoids paying for inactive contacts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Transparent starter pricing with a clear entry point$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Strong fit for product-led SaaS and app growth teams$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Smaller feature set and ecosystem than larger players like Braze or Iterable$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Professional-tier pricing is custom and not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Limited brand recognition outside product-led SaaS circles$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Fewer native integrations than some larger marketing automation suites$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$What is Vero used for?$q$, $q$Vero is used for behavior-based email, push, and SMS customer engagement campaigns.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Who founded Vero?$q$, $q$Chris Hexton and James Lamont founded Vero, launching it as Vero Workflows in 2012.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Where is Vero based?$q$, $q$Vero is headquartered in Sydney, Australia.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$How much does Vero cost?$q$, $q$The Starter plan is 54 dollars per month, or 49 dollars per month billed annually; larger accounts use custom Professional pricing.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Does Vero support SMS?$q$, $q$Yes, alongside email and push notifications.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Is Vero the same as Vertice?$q$, $q$No, they are different companies in different categories despite the similar-sounding names.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Can Vero connect to a data warehouse?$q$, $q$Yes, Vero is built to work directly with a company's data warehouse and product event data.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Who funds Vero?$q$, $q$Vero is backed by Square Peg Capital, an Australian venture capital firm.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Behavior-triggered onboarding and lifecycle email$q$, $q$Automate onboarding and lifecycle messages based on how users interact with a product.$q$, $q$Product-led SaaS marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Multichannel re-engagement campaigns$q$, $q$Combine email, push, and SMS to win back inactive users.$q$, $q$Mobile app growth teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Data-warehouse-driven segmentation$q$, $q$Build precise audience segments directly from warehouse and event data.$q$, $q$Data-informed marketing and growth teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Starter$q$, $q$$54/month ($49/month billed annually)$q$, $q$monthly or annual$q$, NULL, $q$["5,000 user profiles","10,000 emails/month","20,000 push messages/month","160,000 events tracked/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Professional$q$, $q$Custom$q$, $q$monthly or annual$q$, NULL, $q$["Custom profile volume","Custom email and push volume","Custom event tracking volume","SMS messaging included"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$overview$q$, $q$What Is Vero$q$, 2, ARRAY[$q$Vero is a customer engagement platform used by product-led marketing and growth teams to send behavior-triggered messages across email, push, and SMS. It was founded by Chris Hexton and James Lamont, who launched it as Vero Workflows after completing Australia's Startmate accelerator program in 2012.$q$, $q$The company is headquartered in Sydney, Australia, with a distributed team across the United States, Lisbon, and Hong Kong. In 2020, Vero raised 4 million dollars from Square Peg Capital to build out its newsletter product and expand beyond its original workflow-automation focus.$q$, $q$Vero positions itself as a customer engagement tool built for the modern data stack, connecting directly to a company's data warehouse and product event streams rather than requiring teams to duplicate user data into a separate marketing database.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Vero's visual customer journey builder lets teams design multi-step, behavior-triggered campaigns across email, push, and SMS from a single workflow.$q$, $q$The platform supports dynamic content personalization and segmentation built on real user behavior and transactional data, plus a flexible API for storing and updating user profiles and activity history.$q$, $q$Vero includes unlimited team members, team roles, and isolated sub-account projects, letting larger organizations run multiple brands or products from one account.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The Starter plan costs 54 dollars per month, or 49 dollars per month billed annually, and includes 5,000 user profiles, 10,000 emails per month, 20,000 push messages per month, and 160,000 tracked events per month.$q$, $q$Larger customers move to a custom Professional plan priced around forecast or actual usage across profiles, email, push, SMS, and events, with a 10 percent discount available for annual prepayment.$q$]::text[], 2);


-- ── Vertice ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vertice is a SaaS and cloud spend management platform that helps finance and procurement teams negotiate software contracts, track usage, and cut cloud costs.$q$, short_description),
  pricing_model = COALESCE($q$custom$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$London, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vertice Review: SaaS and Cloud Spend Management Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Vertice helps finance teams negotiate SaaS contracts and optimize cloud spend. See Vertice pricing, features, and funding compared to alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vertice is a SaaS and cloud spend management platform that helps finance and procurement teams control software costs through contract negotiation, usage analytics, and cloud cost optimization. It was founded in 2021 by brothers Eldar Tuvey and Roy Tuvey, who serve as co-CEOs and had previously built and sold two cybersecurity SaaS companies together; the founders have said the idea for Vertice came directly from the pricing and procurement pain points they experienced running those earlier startups. Vertice emerged from stealth in January 2022 with a 26 million dollar raise led by 83North and Bessemer Venture Partners, followed by a 25 million dollar Series B in January 2024 from the same investors, and a 50 million dollar Series C in January 2025 led by Lakestar with participation from Perpetual Growth and CF Private Equity, bringing total funding to more than 100 million dollars. The company is headquartered in London and has grown to roughly 350 employees; the Financial Times and Sifted named Vertice the UK's fastest-growing tech company based on a two-year compound annual growth rate of 689 percent. Vertice's platform spans three areas: Intake-to-Procure workflow and vendor management, SaaS Purchasing where an in-house negotiation team uses pricing benchmarks drawn from more than 32,000 vendors to secure better contract terms on a company's behalf, and Cloud Cost Optimization covering AWS, Azure, and Google Cloud reserved-instance and savings-plan recommendations. Vertice reports typical customer outcomes of around 20 percent average savings, a 7x average return on investment, and a roughly 90-day payback period. Pricing is custom and quote-based rather than published, generally scaled to a customer's total software and cloud spend under management. Vertice competes most directly with Vendr and Zylo in SaaS spend management, and it is a distinct company from Vendr despite operating in the same space, as well as from Vero, an unrelated email marketing platform with a similar-sounding name.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Intake-to-Procure workflow automation$q$, $q$Standardize how software purchase requests enter and move through procurement.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Vendor management and onboarding$q$, $q$Centralize vendor records, onboarding, and risk assessments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$SaaS contract negotiation$q$, $q$An in-house negotiation team negotiates software contracts on a customer's behalf.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Pricing benchmark data$q$, $q$Benchmarks pricing across more than 32,000 vendors for negotiation leverage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Software usage analytics$q$, $q$Track SaaS usage and license utilization to inform renewal decisions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Cloud cost optimization$q$, $q$Optimize spend across AWS, Azure, and Google Cloud.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Reserved instance and savings plan recommendations$q$, $q$Identify cloud commitment opportunities to lower infrastructure costs.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Contract center and risk management$q$, $q$Centralize contracts and flag renewal and compliance risk.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Hands-on negotiation support, not just software or analytics$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Broad vendor pricing benchmark data provides real negotiation leverage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Combines SaaS spend and cloud cost optimization in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Strong reported ROI and payback metrics$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Well funded, backed by established venture capital firms$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Pricing is not public and requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Best suited to companies with meaningful software and cloud spend, less useful for very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Relying on Vertice's negotiation team may reduce internal procurement control$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Newer entrant, founded in 2021, compared to some established procurement platforms$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$What does Vertice do?$q$, $q$Vertice provides SaaS and cloud spend management, including contract negotiation and cost optimization.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Who founded Vertice?$q$, $q$Brothers Eldar Tuvey and Roy Tuvey founded Vertice in 2021.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Where is Vertice headquartered?$q$, $q$Vertice is headquartered in London, United Kingdom.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$How much does Vertice cost?$q$, $q$Vertice uses custom, quote-based pricing that is not published publicly.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Does Vertice negotiate contracts on a company's behalf?$q$, $q$Yes, an in-house negotiation team handles contract negotiations for customers.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Does Vertice help with cloud costs too?$q$, $q$Yes, it offers cloud cost optimization across AWS, Azure, and Google Cloud.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Is Vertice the same as Vendr?$q$, $q$No, Vertice and Vendr are separate companies operating in the same SaaS spend management category.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$How much funding has Vertice raised?$q$, $q$Vertice had raised over 100 million dollars total as of its January 2025 Series C round.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Cutting SaaS renewal costs$q$, $q$Use benchmark data and expert negotiation to lower software contract costs.$q$, $q$Finance and procurement leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Centralizing vendor intake and contracts$q$, $q$Standardize how new software requests and contracts flow through the organization.$q$, $q$IT and procurement teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Cloud infrastructure cost optimization$q$, $q$Identify savings opportunities across major cloud providers.$q$, $q$Engineering and finance operations (FinOps) teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Custom / Enterprise$q$, $q$Contact sales$q$, $q$annual contract$q$, NULL, $q$["Priced against total managed software and cloud spend","Dedicated negotiation support","Usage analytics and reporting dashboards"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$overview$q$, $q$What Is Vertice$q$, 2, ARRAY[$q$Vertice is a SaaS and cloud spend management platform that helps finance and procurement teams control software costs. It was founded in 2021 by brothers Eldar Tuvey and Roy Tuvey, who serve as co-CEOs and had previously built and sold two cybersecurity SaaS companies together, an experience they credit for exposing them to the pricing and procurement pain points Vertice was built to solve.$q$, $q$The company emerged from stealth in January 2022 with a 26 million dollar funding round led by 83North and Bessemer Venture Partners and has since raised additional Series B and Series C rounds, bringing total funding to over 100 million dollars as of January 2025.$q$, $q$Headquartered in London with roughly 350 employees, Vertice was named the UK's fastest-growing tech company by the Financial Times and Sifted, based on a two-year compound annual growth rate of 689 percent.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Vertice's Intake-to-Procure module manages vendor intake workflows, vendor onboarding, contract centralization, and risk management for procurement teams.$q$, $q$Its SaaS Purchasing service pairs software with an in-house negotiation team that uses pricing benchmark data drawn from more than 32,000 vendors to secure better contract terms on a customer's behalf.$q$, $q$Cloud Cost Optimization extends the platform to AWS, Azure, and Google Cloud, with visibility dashboards, continuous savings recommendations, and reserved-instance and savings-plan optimization.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Vertice does not publish standard pricing tiers; its pricing page emphasizes savings guarantees rather than a rate card. Pricing is quote-based and typically scales with the total software and cloud spend a customer wants Vertice to manage.$q$, $q$Vertice reports that customers see around 20 percent average savings, a 7x average return on investment, and a roughly 90-day payback period, which the company uses to justify its custom pricing model.$q$]::text[], 2);


-- ── Vespa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vespa is an open-source big-data serving engine that unifies search, recommendation, ranking, and real-time machine learning inference at scale.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free (open-source, self-hosted); Vespa Cloud is usage-based with a free trial$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Trondheim, Norway$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vespa.ai Review: Open-Source AI Search and Serving Engine$q$, seo_title),
  seo_meta_description = COALESCE($q$Vespa is an open-source engine for search, recommendation, and real-time ML inference at scale. Learn its history, features, and Vespa Cloud pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vespa is an open-source, distributed big-data serving engine that unifies retrieval, ranking, machine-learned inference, and real-time serving for search and recommendation applications at scale. Its roots trace back to 2005, when Yahoo built the technology internally after acquiring Overture and the Norwegian search engine AllTheWeb.com, repurposing the AllTheWeb team's search infrastructure into a general-purpose real-time computation engine used across Yahoo's products, including its e-commerce division. Yahoo open-sourced Vespa in 2017 and began onboarding external customers around 2021, with companies such as Spotify and Wix adopting it for large-scale search, ad serving, and AI-based ranking use cases. On October 4, 2023, Yahoo formally spun Vespa out as an independent company to broaden access to the platform beyond Yahoo's internal use, appointing Jon Bratseth, a longtime VP architect on Yahoo's big-data and AI team and one of Vespa's core contributors, as CEO; Yahoo retained an equity stake and a board seat in the new entity. The independent company is headquartered in Trondheim, Norway, employs roughly 60 to 70 people, and in November 2023 raised a 31 million dollar Series A from London-based Blossom Capital, with Yahoo and investor J12 also participating. Vespa's core engine remains free and open source on GitHub, letting teams self-host it to combine vector search, tensor operations, full-text search, and structured data queries in a single system capable of serving billions of documents with thousands of queries per second at sub-100-millisecond latency. Vespa Cloud, the company's fully managed hosting offering, adds automated scaling, security, and operations on top of the open-source engine, with usage-based pricing and a free trial rather than a published flat rate. Vespa competes with vector database and search infrastructure tools such as Elasticsearch, Pinecone, and Weaviate, and it is unrelated to the Vespa motor-scooter brand despite sharing a name.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e3bab8d3-6cb7-4707-add4-248119724ff1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Unified multi-modal search$q$, $q$Combines vector, tensor, text, and structured-data search in one engine.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Massive-scale real-time indexing$q$, $q$Serves billions of constantly changing documents in real time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Distributed machine-learned ranking$q$, $q$Runs ML-based ranking pipelines across a distributed cluster.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Low-latency, high-throughput queries$q$, $q$Delivers sub-100-millisecond responses at thousands of queries per second.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Continuous deployment and autoscaling$q$, $q$Supports rolling upgrades and automated scaling for production workloads.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Vespa Cloud managed hosting$q$, $q$Fully managed infrastructure, security, and operations for Vespa deployments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Open-source core engine$q$, $q$Self-hostable engine available freely on GitHub.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Built for AI and RAG workloads$q$, $q$Supports retrieval-augmented generation and AI recommendation pipelines.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Proven at massive scale from over a decade of internal Yahoo production use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Combines vector search, text search, and ML ranking in one engine without separate systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Free, open-source core with no vendor lock-in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Strong performance at high query volume and low latency$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Backed by an experienced team and disclosed venture funding for continued development$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Steeper learning curve than simpler, purpose-built vector databases$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Smaller community and ecosystem than Elasticsearch or newer vector-only databases$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Vespa Cloud pricing is not published and requires contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Self-hosting at scale requires meaningful operational expertise$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$What is Vespa.ai used for?$q$, $q$Vespa is used for large-scale search, recommendation, and AI serving applications.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Is Vespa free?$q$, $q$Yes, the core engine is open source and free to self-host; Vespa Cloud is a paid, usage-based managed option.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Who created Vespa?$q$, $q$Vespa was originally built at Yahoo starting in 2005 and open sourced in 2017.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$When did Vespa become an independent company?$q$, $q$Yahoo spun Vespa out as an independent company on October 4, 2023.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Who leads Vespa.ai today?$q$, $q$CEO Jon Bratseth, a former Yahoo big-data architect and core Vespa contributor, leads the company.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Does Vespa support vector search for AI applications?$q$, $q$Yes, alongside text search and structured data queries in the same engine.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Is Vespa related to the Vespa scooter brand?$q$, $q$No, it is entirely unrelated; the shared name is coincidental.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Which companies use Vespa?$q$, $q$Spotify and Wix are among the known external companies that use Vespa.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Large-scale enterprise search$q$, $q$Power search and retrieval across billions of documents.$q$, $q$Engineering teams building search platforms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$AI recommendation and ranking systems$q$, $q$Serve personalized recommendations using distributed ML ranking.$q$, $q$Applied machine learning and data science teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Retrieval-augmented generation backends$q$, $q$Combine vector and text search to ground AI applications in real data.$q$, $q$AI engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full serving engine","Self-managed infrastructure","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Vespa Cloud$q$, $q$Usage-based$q$, $q$monthly, free trial available$q$, NULL, $q$["Fully managed hosting","Automated scaling","Managed security and operations"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$overview$q$, $q$What Is Vespa$q$, 2, ARRAY[$q$Vespa is an open-source, distributed serving engine for search, recommendation, and real-time machine learning inference at large scale. Its technology originated at Yahoo in 2005, built out of the AllTheWeb search team following Yahoo's acquisition of Overture, and was used internally across Yahoo's products for over a decade before being open sourced in 2017.$q$, $q$External companies including Spotify and Wix began adopting Vespa around 2021. On October 4, 2023, Yahoo spun Vespa out as a fully independent company, appointing longtime Yahoo big-data architect Jon Bratseth as CEO, while retaining an equity stake and board seat.$q$, $q$The independent company is headquartered in Trondheim, Norway, with roughly 60 to 70 employees, and raised a 31 million dollar Series A from Blossom Capital in November 2023, with Yahoo and investor J12 also participating.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Vespa unifies vector search, tensor operations, full-text search, and structured data queries in a single engine, which is increasingly relevant for AI applications that combine semantic and keyword search, such as retrieval-augmented generation.$q$, $q$The engine is designed to scale to billions of constantly changing documents while serving thousands of queries per second at sub-100-millisecond latency, using a distributed, machine-learned ranking pipeline.$q$, $q$Vespa supports continuous deployment and automated scaling for production workloads, and Vespa Cloud extends this with fully managed hosting, security, and operations on top of the open-source engine.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The core Vespa engine is free and open source, and teams can self-host it on their own infrastructure at no licensing cost.$q$, $q$Vespa Cloud, the managed hosting option, uses usage-based pricing rather than a flat published rate, and offers a free trial for teams evaluating the managed service before committing to a paid plan.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;


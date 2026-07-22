-- Enrichment batch: Corteza CRM, Atomic CRM, Krayin CRM, Odoo Community, Frappe Books, Akaunting, Invoice Ninja, Bigcapital, Firefly III, Actual Budget, Lunch Money, Ghostfolio, Planka, Redmine, Phorge, Taskwarrior, Super Productivity, SiYuan, Trilium Notes, Joplin, Standard Notes, Notesnook, Memos, SilverBullet, Documize, HedgeDoc, Mattermost, Rocket.Chat, Zulip, Element, MiroTalk, BigBlueButton, Galene, Briefing, Nextcloud Talk, Synapse, Forem, HumHub, Mastodon, Misskey, Pleroma, Friendica, Pixelfed, Lemmy, Mobilizon, Pretix, NocoDB, Baserow, Grist, SeaTable, Teable, Mathesar, KeystoneJS, TinaCMS, Cockpit CMS, Statamic, Craft CMS, Grav, October CMS, ProcessWire, Concrete CMS, TYPO3, Umbraco, Backdrop CMS, Silverstripe CMS, Publii, Micro.blog, Blot, Bear Blog, Shopware, Sylius, Medusa, Saleor, Vendure
-- Publishes 74 bulk-imported tool(s) with full editorial content.

-- ── Corteza CRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Corteza is an open-source, low-code platform (Apache 2.0) with a built-in CRM module for records-based business apps.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Corteza is a free, open-source low-code platform with a built-in CRM, messaging, and workflow automation, licensed under Apache 2.0.$q$,
  og_description = $q$Corteza is a free, open-source low-code platform with a built-in CRM, messaging, and workflow automation, licensed under Apache 2.0.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '016aac11-14a9-4e56-958c-3b361e5b1ef4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '016aac11-14a9-4e56-958c-3b361e5b1ef4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Low-code CRM$q$, $q$Gives a 360-degree overview of leads and accounts, with a module for automating sales and service processes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Unified Workspace$q$, $q$A Google Workspace-style collaboration layer bundled into the platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Enterprise Messaging$q$, $q$Built-in Slack-style internal messaging for teams.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Flattened RBAC$q$, $q$Role-based access control that lets organizations apply complex internal security policies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Low-code app builder$q$, $q$Build and iterate custom records-based business apps beyond CRM.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Accessibility$q$, $q$The platform is built to conform to WCAG 2.1 accessibility guidelines.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Fully open source under the Apache 2.0 license with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Code is contributed to the Commons Conservancy Software Foundation, so access cannot be revoked by a single vendor$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Bundles CRM, internal messaging, and workspace tools in one self-hosted platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Actively maintained on GitHub with recent commits and 2,000+ stars$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Requires self-hosting (e.g. via Docker) and technical setup to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$No first-party managed-cloud pricing page on cortezaproject.org; hosted instances are offered by third parties such as Planet Crust$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Smaller community and ecosystem than major commercial CRMs like Salesforce$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Is Corteza free?$q$, $q$Yes. Corteza is fully open source under the Apache 2.0 license and free to download and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$What license does Corteza use?$q$, $q$Corteza is released under the Apache License 2.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Can I run Corteza without managing my own server?$q$, $q$Corteza is designed to be self-hosted via Docker; hosted cloud instances are also offered by third parties such as Planet Crust, separate from the core open-source project.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Is Corteza only a CRM?$q$, $q$No. Corteza is a broader low-code platform that includes a CRM module alongside a unified workspace and enterprise messaging.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Open-source CRM without vendor lock-in$q$, $q$Organizations that want a self-hosted alternative to closed-source CRMs and full control of their data.$q$, $q$IT teams and organizations avoiding vendor lock-in$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$Custom low-code business apps$q$, $q$Building bespoke records-based workflow apps on top of the same platform that powers the CRM.$q$, $q$Developers and low-code app builders$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$overview$q$, $q$What is Corteza CRM?$q$, 2, ARRAY[$q$Corteza is an open-source, low-code platform that includes a CRM module for managing leads and accounts, alongside a unified workspace and enterprise messaging. It is released under the Apache 2.0 license, and its code has been contributed to the Commons Conservancy Software Foundation.$q$, $q$The platform is self-hosted, typically via Docker, and includes a flattened role-based access control (RBAC) system so organizations can apply their own internal security policies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$who-its-for$q$, $q$Who Corteza CRM is for$q$, 2, ARRAY[$q$Corteza suits organizations that want an open-source, self-hosted CRM and are comfortable running and maintaining their own infrastructure, as well as developers who want to extend the same low-code platform to build other records-based business apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Atomic CRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Atomic CRM is an open-source CRM toolkit by Marmelab, built with React, Shadcn UI, and Supabase, that teams can self-host or customize.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€25/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Atomic CRM is an open-source CRM built with React and Supabase, offering free self-hosting or paid managed plans from €25/month.$q$,
  og_description = $q$Atomic CRM is an open-source CRM built with React and Supabase, offering free self-hosting or paid managed plans from €25/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Sales pipeline and Kanban board$q$, $q$Customizable Kanban board for tracking deals through a sales pipeline.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Contact and activity management$q$, $q$Contact organization with avatars, activity tracking, notes, and email-to-note capture.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Task management$q$, $q$Task creation with reminders tied to contacts and deals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Data import/export$q$, $q$Import and export CRM data for migrations and reporting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Single sign-on$q$, $q$SSO support via Google, Azure, Keycloak, or Auth0.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$API and MCP Server$q$, $q$API integration plus an MCP Server for connecting AI assistants to CRM data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Mobile app$q$, $q$A companion mobile app for accessing the CRM on the go.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Fully open source with code available on GitHub, so any feature can be modified$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$No vendor lock-in — can be self-hosted on your own infrastructure at no cost$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Built on a modern, well-documented stack (React, TypeScript, Shadcn UI, Supabase)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Includes SSO and an MCP Server for AI-assistant integration out of the box$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Paid Starter and Team plans cap contacts and storage (1,000 contacts/1GB and 10,000 contacts/10GB respectively)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Self-hosting requires managing your own Supabase/PostgreSQL infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Enterprise pricing is custom and not published$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Is Atomic CRM free?$q$, $q$Yes, it can be self-hosted for free since it is fully open source; Marmelab also offers paid managed plans starting at €25/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Who built Atomic CRM?$q$, $q$Atomic CRM is built by Marmelab, using React, TypeScript, Shadcn UI, Tailwind CSS, and Supabase.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Can I self-host Atomic CRM?$q$, $q$Yes, self-hosting is supported for full data sovereignty, in addition to Marmelab's Supabase-managed hosting option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Does Atomic CRM support single sign-on?$q$, $q$Yes, it supports SSO via Google, Azure, Keycloak, and Auth0.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Customizable CRM without vendor lock-in$q$, $q$Teams that want a CRM they can fully modify at the code level rather than adapting to a closed platform.$q$, $q$Companies needing a tailored CRM$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Managed hosted CRM$q$, $q$Teams that want the open-source toolkit without operating their own infrastructure, using Marmelab's Starter or Team plans.$q$, $q$Small to mid-sized sales teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Free (self-hosted)$q$, $q$$0$q$, NULL, $q$["Self-hosted on your own infrastructure","Full source code access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Starter$q$, $q$€25/month$q$, $q$monthly$q$, $q$["Up to 1,000 contacts","1GB storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Team$q$, $q$€50/month$q$, $q$monthly$q$, $q$["Up to 10,000 contacts","10GB storage"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Enterprise$q$, NULL, NULL, $q$["Unlimited capacity","Custom pricing"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$overview$q$, $q$What is Atomic CRM?$q$, 2, ARRAY[$q$Atomic CRM is an open-source CRM toolkit from Marmelab, built with React, TypeScript, Shadcn UI, Tailwind CSS, and Supabase. It covers contact management, a Kanban-based sales pipeline, task reminders, and activity tracking.$q$, $q$Because the full source is available on GitHub, teams can modify any feature to fit their process instead of working around a closed vendor's roadmap. Marmelab also offers Supabase-managed hosting as a paid alternative to self-hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$who-its-for$q$, $q$Who Atomic CRM is for$q$, 2, ARRAY[$q$Atomic CRM fits teams that want to self-host a CRM and customize it at the code level, as well as smaller sales teams that prefer a managed hosted plan without giving up the option to self-host later.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Krayin CRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Krayin CRM is a free, open-source, self-hosted CRM built on Laravel, maintained by Webkul, covering sales, marketing, and support.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Krayin CRM is a free, open-source Laravel CRM for sales, marketing automation, and customer support, with 23,000+ GitHub stars.$q$,
  og_description = $q$Krayin CRM is a free, open-source Laravel CRM for sales, marketing automation, and customer support, with 23,000+ GitHub stars.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Sales management$q$, $q$Lead tracking, deal management, and sales forecasting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Marketing automation$q$, $q$Campaign management, email marketing, and customer segmentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Customer support$q$, $q$VoIP, live chat, and multi-channel feedback handling.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Reporting and analytics$q$, $q$Performance reporting and analysis tools for sales and support activity.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Custom fields and access control$q$, $q$Custom fields, activity logs, and access control lists for tailoring the CRM to a business.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Multi-channel communication$q$, $q$Connects with Gmail, Outlook, WhatsApp, Facebook, WeChat, Skype, and phone systems.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Fully open source (MIT license) and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Large, active GitHub project with 23,000+ stars and recent commits$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Covers sales, marketing automation, and support in one CRM$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Extensible with official extensions for VoIP, multi-tenant SaaS, and Google Workspace sync$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Self-hosting on Laravel/PHP requires setting up and maintaining your own server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$No fixed first-party managed-cloud pricing; hosted setups are sold separately through Webkul's Cloudkul service and third-party hosts$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Industry-specific solution templates and extensions add complexity to evaluate$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Is Krayin CRM free?$q$, $q$Yes, Krayin is fully open source and free to download and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Who maintains Krayin CRM?$q$, $q$Krayin is maintained by Webkul as an open-source project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$What is Krayin built on?$q$, $q$Krayin is built on Laravel (PHP).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Can I get Krayin as managed hosting?$q$, $q$Webkul offers Cloudkul managed hosting setup on AWS, GCP, and Azure, and third-party hosts also offer Krayin hosting plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Self-hosted sales CRM$q$, $q$Tracking leads, deals, and forecasts without paying per-user SaaS fees.$q$, $q$SMEs wanting an open-source CRM$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$Support and marketing in one platform$q$, $q$Combining live chat, VoIP, and email campaigns with CRM records.$q$, $q$Support and marketing teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$overview$q$, $q$What is Krayin CRM?$q$, 2, ARRAY[$q$Krayin CRM is an open-source, self-hosted CRM built on Laravel and maintained by Webkul. It covers sales pipeline management, marketing automation, and multi-channel customer support (including VoIP and live chat) in a single self-hosted application.$q$, $q$The project has more than 23,000 GitHub stars and is actively developed, with extensions available for VoIP, multi-tenant SaaS deployments, and Google Workspace synchronization.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$who-its-for$q$, $q$Who Krayin CRM is for$q$, 2, ARRAY[$q$Krayin suits businesses that want a free, self-hosted CRM built on a familiar Laravel/PHP stack, and that are comfortable managing their own server or contracting managed hosting through Webkul or a third party.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Odoo Community ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Odoo Community is the free, open-source (LGPLv3) edition of Odoo's business management suite, with 40+ integrated apps.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = $q$8,000+ employees$q$,
  headquarters = $q$Grand Rosière, Belgium$q$,
  languages = '{}',
  seo_meta_description = $q$Odoo Community is the free, open-source edition of Odoo, offering 40+ integrated apps for accounting, CRM, inventory, and more.$q$,
  og_description = $q$Odoo Community is the free, open-source edition of Odoo, offering 40+ integrated apps for accounting, CRM, inventory, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e2c5c190-2aaa-46b6-b142-c38b763e334a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e2c5c190-2aaa-46b6-b142-c38b763e334a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Integrated business apps$q$, $q$40+ apps spanning Accounting, Invoicing, Expenses, CRM, Sales, Point of Sale, Inventory, Manufacturing, Purchase, HR, and Website/eCommerce.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Open-source codebase$q$, $q$Source code is publicly available on GitHub under the LGPLv3 license.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$PostgreSQL-based data model$q$, $q$Runs on PostgreSQL with no proprietary data format.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Community app marketplace$q$, $q$Access to 40,000+ community-developed apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Self-hosted or Odoo.sh hosting$q$, $q$Can be deployed on-premise or hosted via Odoo's own Odoo.sh cloud platform.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Completely free to download, install, and modify under the LGPLv3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Broad coverage of business functions (finance, sales, inventory, HR) in one open-source suite$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Large third-party app marketplace and active developer community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Backed by Odoo, a large, established company with 8,000+ employees$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Extra apps, infrastructure, and professional services are reserved for the paid Enterprise edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Self-hosting requires managing your own server, or paying for Odoo.sh cloud hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$40+ apps and heavy customization options can mean a steeper setup and configuration process$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Is Odoo Community really free?$q$, $q$Yes, Odoo Community is open source and free to use, with no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$What license does Odoo Community use?$q$, $q$Odoo Community is licensed under LGPLv3.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$What's the difference between Odoo Community and Enterprise?$q$, $q$Enterprise adds extra apps, infrastructure, and professional services on top of the free Community edition.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Can Odoo Community be self-hosted?$q$, $q$Yes, it can be self-hosted, or deployed via Odoo's own Odoo.sh cloud hosting platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Free, self-hosted ERP core$q$, $q$Running accounting, sales, and inventory on open-source software without licensing fees.$q$, $q$Small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Custom app development on Odoo's framework$q$, $q$Building or installing community-developed apps on top of the Odoo framework.$q$, $q$Developers and Odoo implementation partners$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$Community$q$, $q$$0$q$, NULL, $q$["Open source, self-hosted","Access to core apps and GitHub source"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$overview$q$, $q$What is Odoo Community?$q$, 2, ARRAY[$q$Odoo Community is the free, open-source edition of Odoo's business management platform, licensed under LGPLv3. It includes 40+ integrated apps covering finance, sales, supply chain, HR, and website/eCommerce, all built on PostgreSQL.$q$, $q$It differs from Odoo Enterprise, which adds extra apps, infrastructure, and professional services on top of the same open-source core.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$who-its-for$q$, $q$Who Odoo Community is for$q$, 2, ARRAY[$q$Odoo Community fits businesses that want a free, self-hosted alternative to commercial ERP/CRM suites and are willing to manage their own deployment, as well as developers building on Odoo's open framework.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Frappe Books ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Frappe Books is a free, open-source desktop accounting app for freelancers and small businesses that stores data locally in SQLite.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Frappe Books is a free, open-source offline desktop accounting app with double-entry bookkeeping and invoicing for small businesses.$q$,
  og_description = $q$Frappe Books is a free, open-source offline desktop accounting app with double-entry bookkeeping and invoicing for small businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '99b0c7e3-3443-428c-9117-bae2653976d1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '99b0c7e3-3443-428c-9117-bae2653976d1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Double-entry accounting$q$, $q$Records each transaction across two accounts for accurate financial tracking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Financial dashboard$q$, $q$Overview of key financial data and performance metrics.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Point of Sale$q$, $q$Integrated POS for processing retail sales transactions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Standard financial reports$q$, $q$Profit and Loss Statement, Trial Balance, and Balance Sheet reports.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Invoice template builder$q$, $q$A template builder for customizing invoice appearance using basic HTML.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Offline, local-first storage$q$, $q$Runs offline as a desktop app, storing all data in a local SQLite file for full data ownership.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Completely free and open source with no subscription cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Works fully offline, with data stored locally for privacy and data ownership$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Cross-platform desktop app (Windows, macOS, Linux) via Electron$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Data lives in a single SQLite file, making backups as simple as copying the file$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Desktop-only application, not a hosted web app by default$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$No official first-party managed cloud version dedicated to Frappe Books$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Being a smaller project, it has fewer built-in integrations than larger accounting platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Is Frappe Books free?$q$, $q$Yes, Frappe Books is free and open source with no subscription fee.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Does Frappe Books work offline?$q$, $q$Yes, it runs locally and does not require an internet connection.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$What database does Frappe Books use?$q$, $q$It uses a local SQLite file to store all financial data and configuration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$What platforms does Frappe Books support?$q$, $q$It runs as a desktop application via Electron on Windows, macOS, and Linux.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Offline bookkeeping for freelancers$q$, $q$Managing invoices, expenses, and reports without an internet connection or subscription.$q$, $q$Freelancers and small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Privacy-focused accounting$q$, $q$Keeping all financial data on a local machine rather than a third-party cloud.$q$, $q$Businesses prioritizing data ownership$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$Free$q$, $q$$0$q$, NULL, $q$["Full desktop app","Local SQLite storage","Offline use"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$overview$q$, $q$What is Frappe Books?$q$, 2, ARRAY[$q$Frappe Books is a free, open-source desktop accounting application for small and medium businesses. It supports double-entry bookkeeping, invoicing, a point-of-sale module, and standard reports like Profit and Loss and Balance Sheet.$q$, $q$Built with Electron, it runs offline on Windows, macOS, and Linux, storing all data in a local SQLite file so users retain full ownership of their financial data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$who-its-for$q$, $q$Who Frappe Books is for$q$, 2, ARRAY[$q$Frappe Books fits freelancers and small business owners who want free, offline accounting software and prefer keeping their financial data on their own machine rather than in a third-party cloud.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Akaunting ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Akaunting is open-source accounting software for small businesses, free to self-host on-premise or available as paid cloud plans from $8/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$8/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Akaunting is open-source accounting software, free to self-host or available as cloud plans from $8/month, used by 300,000+ businesses.$q$,
  og_description = $q$Akaunting is open-source accounting software, free to self-host or available as cloud plans from $8/month, used by 300,000+ businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Invoicing$q$, $q$Professional invoice templates with recurring invoices and billing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Double-entry accounting$q$, $q$Chart of Accounts, Balance Sheet, and General Ledger.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Expense and cash flow tracking$q$, $q$Expense categorization and cash flow management tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Client portal$q$, $q$Lets clients view transactions and accept payments online.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Inventory and project tools$q$, $q$Inventory management, project tracking, and time tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Payroll and CRM apps$q$, $q$Optional apps for payroll and basic CRM functionality.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Self-hosted On-Premise Standard plan is free, with full source code available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Used by 300,000+ users across 100+ countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Available in 50+ languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Cloud plans scale from a single freelancer up to unlimited companies and users$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Higher-value features (payroll, inventory, CRM, POS) are gated to Elite/Ultimate cloud tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Cloud plan limits (e.g. invoice counts, number of apps) scale with price, so growing businesses may need to upgrade tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$On-premise self-hosting requires managing your own server infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Is Akaunting free?$q$, $q$The On-Premise/self-hosted Standard plan is free, with source code available; Akaunting also offers paid cloud plans starting at $8/month (billed yearly).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$How many languages does Akaunting support?$q$, $q$Akaunting is available in 50+ languages.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$What's included in the cheapest cloud plan?$q$, $q$The Standard Cloud plan supports 1 company, 1 user plus 1 accountant, 1,000 invoices, and 4 apps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Can I self-host Akaunting?$q$, $q$Yes, via the On-Premise version, separate from the hosted cloud plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Free self-hosted bookkeeping$q$, $q$Running invoicing and double-entry accounting on your own server at no license cost.$q$, $q$Freelancers and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Cloud accounting for growing teams$q$, $q$Scaling from a single company to unlimited companies and users with add-on apps like payroll and inventory.$q$, $q$Small to mid-sized businesses and accountants$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Standard Cloud$q$, $q$$8/month$q$, $q$annual$q$, $q$["1 company","1 user + 1 accountant","1,000 invoices","4 apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Premium Cloud$q$, $q$$24/month$q$, $q$annual$q$, $q$["10 companies","10 users","10,000 invoices","10 apps","Double-Entry, Bank Feeds, Expense Claims, Client Portal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Elite Cloud$q$, $q$$56/month$q$, $q$annual$q$, $q$["30 companies","30 users","30,000 invoices","30 apps","Payroll, Projects, Inventory, CRM, Shopify, Stripe"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Ultimate Cloud$q$, $q$$145/month$q$, $q$annual$q$, $q$["Unlimited companies, users, invoices","All 50+ apps","POS, budgeting, custom fields, tax regulation reports"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$overview$q$, $q$What is Akaunting?$q$, 2, ARRAY[$q$Akaunting is accounting software for small businesses and freelancers, covering invoicing, expense tracking, double-entry bookkeeping, and a client portal. It's used by 300,000+ users across more than 100 countries and is available in 50+ languages.$q$, $q$The On-Premise Standard plan is free and open source, while Akaunting also sells hosted cloud plans (Standard, Premium, Elite, and Ultimate) that add features like payroll, inventory, CRM, and point of sale as you move up tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$who-its-for$q$, $q$Who Akaunting is for$q$, 2, ARRAY[$q$Akaunting suits freelancers and small businesses that want free, self-hosted bookkeeping, as well as growing businesses and accountants that prefer a managed cloud plan with add-on modules like payroll and inventory.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Invoice Ninja ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Invoice Ninja is invoicing and business management software with a free plan, paid hosted plans from $14/month, and a self-hosted open-source version.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$14/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Invoice Ninja offers invoicing, payments, and time tracking with a free plan, paid plans from $14/month, and self-hosting via GitHub.$q$,
  og_description = $q$Invoice Ninja offers invoicing, payments, and time tracking with a free plan, paid plans from $14/month, and self-hosting via GitHub.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Invoicing$q$, $q$Customizable invoice templates (4 on the free plan, 11 on paid plans).$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Online payments$q$, $q$Payment processing through multiple gateways including Stripe, PayPal, and Square.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Time tracking and projects$q$, $q$Time tracking and project management with Kanban boards.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Expense and vendor tracking$q$, $q$Expense tracking and vendor management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Recurring billing$q$, $q$Recurring invoices and automatic billing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Client portal$q$, $q$A client-facing portal for viewing invoices and making payments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Quotes with e-signature$q$, $q$Quotes and proposal generation with e-signature support.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Perpetually free plan available with 5 clients and unlimited invoicing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Open-source self-hosted version available via GitHub for full control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Wide range of native payment gateway integrations (Stripe, PayPal, Square, GoCardless) plus QuickBooks, Gmail, Slack, and Zapier/Make/Pabbly automation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Paid plans include a 30-day money-back guarantee$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Free plan limits invoice templates and client count$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Higher-end e-invoicing/PEPPOL network access is limited to the Enterprise+ tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Self-hosted version requires separate setup and maintenance versus the hosted plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Is Invoice Ninja free?$q$, $q$There's a perpetually free plan with 5 clients and unlimited invoicing, plus paid plans and a self-hosted open-source version.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$How much do paid plans cost?$q$, $q$Ninja Pro starts at $14/month ($140/year), and Enterprise starts at $18/month ($180/year) for up to 100 users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Can Invoice Ninja be self-hosted?$q$, $q$Yes, an open-source version is available for self-hosting via its GitHub repository.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$What payment gateways does it support?$q$, $q$It supports Stripe, PayPal, Square, GoCardless, and other gateways, plus integrations like QuickBooks and Zapier.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Free invoicing for a handful of clients$q$, $q$Sending unlimited invoices to up to 5 clients at no cost.$q$, $q$Freelancers just starting out$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Paid plans for growing teams$q$, $q$Adding more clients, users, templates, and features like e-signatures and PEPPOL e-invoicing.$q$, $q$Small businesses and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Free$q$, $q$$0$q$, NULL, $q$["5 clients","Unlimited invoicing","4 invoice templates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Ninja Pro$q$, $q$$14/month$q$, $q$monthly$q$, $q$["11 invoice templates","$140/year option"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Enterprise$q$, $q$$18/month$q$, $q$monthly$q$, $q$["Up to 100 users","$180/year option"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Premium Business$q$, $q$From $280/year$q$, $q$annual$q$, $q$["Concierge support","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$overview$q$, $q$What is Invoice Ninja?$q$, 2, ARRAY[$q$Invoice Ninja is invoicing and business management software for freelancers and small businesses, covering invoicing, online payments, time tracking, expense tracking, and a client portal.$q$, $q$It offers a perpetually free plan, several paid hosted tiers (Ninja Pro, Enterprise, Premium Business), and an open-source version that can be self-hosted from its GitHub repository.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$who-its-for$q$, $q$Who Invoice Ninja is for$q$, 2, ARRAY[$q$Invoice Ninja fits freelancers who want a free way to invoice a small client base, and small businesses or agencies that need more clients, templates, or e-invoicing/e-signature features on a paid or self-hosted plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Bigcapital ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bigcapital is open-source accounting and inventory software (AGPL-3.0), free to self-host or available as hosted cloud plans from $20/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$20/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bigcapital is open-source accounting software, free to self-host under AGPL-3.0 or available as hosted cloud plans from $20/month.$q$,
  og_description = $q$Bigcapital is open-source accounting software, free to self-host under AGPL-3.0 or available as hosted cloud plans from $20/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0ef7337-a5e2-4799-a976-3b354b927eaf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0ef7337-a5e2-4799-a976-3b354b927eaf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Sales and purchase invoicing$q$, $q$Invoicing with support for recurring invoices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Financial reporting$q$, $q$Real-time financial reports for business intelligence.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Inventory tracking$q$, $q$Automatic stock management tied to sales and purchases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Multi-currency accounting$q$, $q$Support for multiple currencies with live exchange rates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Role-based access control$q$, $q$Collaboration tools with custom user roles and access controls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Budgeting and cost centers$q$, $q$Budgeting and cost-center analysis on higher plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Open source under AGPL-3.0, so the full platform can be self-hosted for free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$A commercial license option exists for organizations that need an AGPL exemption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Docker-based self-hosting is documented, with no per-user licensing fees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Hosted cloud plans include a 14-day free trial$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$AGPL-3.0 requires releasing modifications if you deploy a modified version over a network$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Multi-currency, inventory, and budgeting features are split across higher-priced plans (Essential, Plus, Big)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Company details like founding year and headquarters are not published$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Is Bigcapital free?$q$, $q$The self-hosted version is free and open source under AGPL-3.0; a managed cloud version is also available with paid plans starting at $20/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$What license does Bigcapital use?$q$, $q$Bigcapital is released under the GNU Affero General Public License v3.0 (AGPL-3.0), with a commercial license option available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Can Bigcapital be self-hosted?$q$, $q$Yes, self-hosting via Docker is documented and free.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Is there a free trial for the cloud version?$q$, $q$Yes, Bigcapital's hosted cloud plans include a 14-day free trial and a 30-day money-back guarantee on annual billing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Free self-hosted accounting$q$, $q$Running accounting and inventory tracking on your own infrastructure with no license fee.$q$, $q$Cost-conscious SMBs and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Managed cloud accounting$q$, $q$Using Bigcapital's hosted plans to get multi-currency accounting, inventory, and budgeting without self-hosting.$q$, $q$Growing small businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Capital Basic$q$, $q$$20/month$q$, $q$monthly$q$, $q$["Unlimited invoices/estimates","GST/VAT tracking","Bank connections","Chart of accounts","Basic reports"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Capital Essential$q$, $q$$40/month$q$, $q$monthly$q$, $q$["Purchase invoices","Multi-currency support","Inventory tracking","Smart reports"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Capital Plus$q$, $q$$55/month$q$, $q$monthly$q$, $q$["Custom user roles","Vendor credits","Budgeting","Cost center analysis"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Capital Big$q$, $q$$60/month$q$, $q$monthly$q$, $q$["Multiple branches","Warehouse support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$overview$q$, $q$What is Bigcapital?$q$, 2, ARRAY[$q$Bigcapital is open-source accounting and inventory software, released under AGPL-3.0, that automates invoicing, financial reporting, and stock tracking. It can be self-hosted for free via Docker, or run as a managed cloud service with paid plans from $20/month.$q$, $q$Paid plans add multi-currency support, inventory tracking, budgeting, cost-center analysis, and multi-branch support as you move up tiers, with a 14-day free trial available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$who-its-for$q$, $q$Who Bigcapital is for$q$, 2, ARRAY[$q$Bigcapital fits businesses that want an open-source, self-hostable alternative to accounting platforms like QuickBooks or Xero, as well as those that would rather use Bigcapital's own hosted cloud plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Firefly III ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Firefly III is a free, open-source, self-hosted personal finance manager licensed under AGPLv3, with a full REST API.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Firefly III is free, open-source, self-hosted personal finance software with budgets, categories, rules, and a full REST API.$q$,
  og_description = $q$Firefly III is free, open-source, self-hosted personal finance software with budgets, categories, rules, and a full REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1f92f756-1ddd-475c-a7ab-6671d8405485';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1f92f756-1ddd-475c-a7ab-6671d8405485' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Double-entry bookkeeping$q$, $q$Tracks income and expenses using a double-entry bookkeeping system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Budgets, categories, and tags$q$, $q$Organize transactions with budgets, categories, and tags to control spending.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Recurring transactions and rules$q$, $q$Create recurring transactions and rule-based automation for transaction handling.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Piggy banks$q$, $q$Save toward a goal using built-in piggy banks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$REST JSON API$q$, $q$A REST API that covers almost every part of Firefly III for integrations and automation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Multi-currency support$q$, $q$Supports any currency.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Financial reports$q$, $q$Multiple built-in financial reports.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Completely free and open source under AGPLv3, with no paid tiers or usage limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Fully self-hosted and isolated — never contacts external servers unless explicitly configured to$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Flexible deployment via Docker, Kubernetes, Softaculous, Cloudron, Lando, or Yunohost$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Large, active project with 24,000+ GitHub stars and a documented REST API$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$No official first-party hosted cloud version — users must self-host or use a third-party hosting provider$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Requires technical setup (Docker or server administration) to run$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$As a self-hosted tool, backups and uptime are the user's own responsibility$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Is Firefly III free?$q$, $q$Yes, Firefly III is completely free and open source under the AGPLv3 license, with no paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Does Firefly III offer a hosted cloud version?$q$, $q$No official hosted cloud version is provided by the project itself; it is designed to be self-hosted, though third-party hosts offer Firefly III hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Does Firefly III have an API?$q$, $q$Yes, it has a REST JSON API covering almost every part of the application.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$How is Firefly III deployed?$q$, $q$It supports Docker, Kubernetes, and installers like Softaculous, Cloudron, Lando, and Yunohost.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Self-hosted personal budgeting$q$, $q$Tracking personal income, expenses, and budgets without sending data to a third-party service.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Automated finance tracking via API$q$, $q$Building custom scripts or integrations against Firefly III's REST API to automate transaction entry.$q$, $q$Developers and power users$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Free$q$, $q$$0$q$, NULL, $q$["Full self-hosted feature set","REST API access","No usage limits"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$overview$q$, $q$What is Firefly III?$q$, 2, ARRAY[$q$Firefly III is a free, open-source personal finance manager that is entirely self-hosted. It supports double-entry bookkeeping, budgets, categories, tags, recurring transactions, rule-based automation, and savings goals via piggy banks.$q$, $q$It is licensed under AGPLv3, includes a REST JSON API covering nearly every part of the app, and never contacts external servers unless explicitly configured to do so.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$who-its-for$q$, $q$Who Firefly III is for$q$, 2, ARRAY[$q$Firefly III fits individuals who want full control and privacy over their personal finance data and are comfortable self-hosting via Docker or a similar deployment method, including developers who want to automate finance tracking through its API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Actual Budget ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Actual Budget is a free, open-source, local-first envelope budgeting app you can self-host for full data privacy.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Actual Budget: free, open-source envelope budgeting app with bank sync, multi-device sync, and self-hosting for privacy.$q$,
  og_description = $q$Actual Budget: free, open-source envelope budgeting app with bank sync, multi-device sync, and self-hosting for privacy.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Envelope Budgeting$q$, $q$Budget based on actual income using envelope-style budgeting, assigning every dollar a job.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Bank Sync$q$, $q$Connect bank accounts via GoCardless (EU/UK) or SimpleFIN (US/Canada) for transaction syncing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Multi-Device Sync$q$, $q$Sync budget data across multiple devices with optional end-to-end encryption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Transaction Import$q$, $q$Import transactions from QIF, OFX, QFX, CAMT.053, and CSV files.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Custom Reports$q$, $q$Track net worth and cash flow using a custom report engine.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$YNAB Migration$q$, $q$Import existing budgets from YNAB4 and nYNAB.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Developer API$q$, $q$Build custom tools and integrations against Actual's API.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Self-Hosting$q$, $q$Run your own sync server via Docker, Fly.io, or a hosting provider like PikaPods.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Self-hosted option gives full control over financial data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Local-first architecture continues to work offline$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Cross-platform desktop apps for Windows, Mac, and Linux$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Active open-source community with crowdsourced translations via Weblate$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Multi-device sync requires self-hosting a sync server, which takes technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$No confirmed official first-party mobile apps at time of research$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Relies on community/Discord support rather than dedicated customer service$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Is Actual Budget free?$q$, $q$Yes, Actual Budget is 100% free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Can I self-host Actual Budget?$q$, $q$Yes, you can run your own sync server via Docker, Fly.io, or a hosted option like PikaPods.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Does Actual Budget support bank syncing?$q$, $q$Yes, via GoCardless for EU/UK accounts and SimpleFIN for US/Canada accounts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Can I migrate from YNAB?$q$, $q$Yes, Actual Budget supports importing data from YNAB4 and nYNAB.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$What platforms does Actual Budget run on?$q$, $q$It's available as downloadable apps for Windows, Mac, and Linux, plus deployable via Docker.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Privacy-conscious envelope budgeting$q$, $q$Individuals who want zero-based envelope budgeting without sending financial data to a third-party cloud service.$q$, $q$Privacy-focused budgeters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Self-hosted personal finance$q$, $q$Technical users who want to run their own budgeting server on their own infrastructure via Docker.$q$, $q$Self-hosters and developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$YNAB alternative$q$, $q$Former YNAB4/nYNAB users looking for a free, open-source replacement with data migration support.$q$, $q$Ex-YNAB users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Actual Budget (Self-Hosted / Open Source)$q$, $q$$0$q$, NULL, $q$["Envelope budgeting","Bank sync via GoCardless/SimpleFIN","Multi-device sync","Custom reports","Developer API"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$overview$q$, $q$What is Actual Budget?$q$, 2, ARRAY[$q$Actual Budget is a free, open-source personal finance application built around envelope budgeting, where users assign every dollar of income to a category.$q$, $q$It uses a local-first architecture, meaning the app keeps working even without a network connection, and data can be synced across devices through a self-hosted sync server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$who-its-for$q$, $q$Who Actual Budget is for$q$, 2, ARRAY[$q$Actual Budget suits privacy-focused users and self-hosters who want a free, open-source alternative to subscription budgeting apps like YNAB, and are comfortable running or renting a small sync server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Lunch Money ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lunch Money is a paid, web-first personal budgeting and net-worth app with bank sync, multi-currency, and crypto tracking.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$10/month (or $60/year minimum on the pay-what-you-want annual plan)$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$Toronto, Canada$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Lunch Money is a paid personal budgeting app with bank sync, multi-currency and crypto tracking, and a 30-day free trial.$q$,
  og_description = $q$Lunch Money is a paid personal budgeting app with bank sync, multi-currency and crypto tracking, and a 30-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9b18967c-f6f6-453b-8f0e-8b8d312dfe53';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9b18967c-f6f6-453b-8f0e-8b8d312dfe53' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Bank Sync$q$, $q$Automatically sync transactions from most US and Canadian banks via Plaid, with CSV upload or manual entry as fallback.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Multi-Currency Support$q$, $q$Track accounts and transactions across multiple currencies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Budgeting with Rollover$q$, $q$Set category budgets with a redesigned interface for category setup and rollover tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Crypto Portfolio Tracking$q$, $q$Track cryptocurrency holdings alongside traditional bank accounts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Rules Engine$q$, $q$Automatically categorize and tag transactions using custom rules.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Calendar View$q$, $q$View income and expenses in a calendar-based interface with transaction detail.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Developer API$q$, $q$Programmatic access to account and transaction data.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Net Worth Tracking$q$, $q$Calculate net worth across all connected accounts.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$All features included at every price point, with no feature-gated upsells$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Pay-what-you-want annual pricing option$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Supports multi-currency and crypto portfolio tracking$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Web-first app with companion iOS and Android apps$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$30-day free trial before any payment is required$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$No permanent free plan — a paid subscription is required after the trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Bank sync coverage is strongest in the US/Canada and still expanding in Europe$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Web-first design means the browser/desktop experience is the primary interface$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$How much does Lunch Money cost?$q$, $q$$10/month, or an annual pay-what-you-want plan with a $60/year minimum.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Is there a free trial?$q$, $q$Yes, Lunch Money offers a 30-day free trial before a subscription is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Does Lunch Money support multiple currencies?$q$, $q$Yes, multi-currency support is included on every plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Can I track cryptocurrency in Lunch Money?$q$, $q$Yes, crypto portfolio tracking is included.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Is Lunch Money available on mobile?$q$, $q$Yes, it has companion apps for iOS and Android in addition to the web app.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Multi-currency budgeting$q$, $q$People who travel or hold accounts in multiple currencies and need unified budget tracking.$q$, $q$Frequent travelers and expats$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$All-in-one net worth tracking$q$, $q$Users who want to combine bank accounts, crypto, and manual accounts into one net-worth view.$q$, $q$Personal finance trackers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Rules-based transaction categorization$q$, $q$Users who want automated categorization and tagging of transactions via a rules engine.$q$, $q$Budget-conscious professionals$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Monthly$q$, $q$$10/month$q$, $q$monthly$q$, $q$["Bank sync","Multi-currency","Crypto tracking","Developer API","All features included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Annual (pay-what-you-want)$q$, $q$$60/year minimum$q$, $q$annual$q$, $q$["Bank sync","Multi-currency","Crypto tracking","Developer API","All features included"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$overview$q$, $q$What is Lunch Money?$q$, 2, ARRAY[$q$Lunch Money is a paid, web-first personal budgeting and net-worth tracking app founded in 2019 and based in Toronto, Canada.$q$, $q$It syncs bank transactions via Plaid, supports multiple currencies and cryptocurrency accounts, and includes a rules engine for automatic categorization, with all features available on every plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$who-its-for$q$, $q$Who Lunch Money is for$q$, 2, ARRAY[$q$Lunch Money suits people who want a paid, all-inclusive budgeting tool without tiered upsells, especially those managing multi-currency accounts or wanting to track crypto alongside traditional finances.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Ghostfolio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ghostfolio is an open-source wealth management app for tracking investments, offered free self-hosted or as a paid managed cloud service.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Ghostfolio: open-source, self-hostable wealth management software for tracking transactions, portfolio performance, and risk.$q$,
  og_description = $q$Ghostfolio: open-source, self-hostable wealth management software for tracking transactions, portfolio performance, and risk.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '94821a2d-fb17-42ea-8e5e-a593d22a6841';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '94821a2d-fb17-42ea-8e5e-a593d22a6841' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Transaction Management$q$, $q$Create, update, and delete transactions across multiple investment accounts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Portfolio Performance Tracking$q$, $q$Track Return on Average Investment (ROAI) across timeframes including Today, WTD, MTD, YTD, 1Y, 5Y, and Max.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Risk Analysis$q$, $q$Static analysis to identify potential portfolio risks and view portfolio composition.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Import/Export$q$, $q$Import and export transaction data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Dark Mode & Zen Mode$q$, $q$Alternate UI modes including a distraction-free Zen Mode.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Progressive Web App$q$, $q$Mobile-first PWA design usable across devices without a native app install.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Self-Hosting via Docker$q$, $q$Deploy on linux/amd64, linux/arm/v7, or linux/arm64 via Docker Compose, with community images for Umbrel, CasaOS, Runtipi, Unraid, and Home Assistant.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Ghostfolio Premium$q$, $q$A managed cloud-hosted version that bundles access to professional market data providers.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Free, AGPLv3-licensed self-hosted option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Managed Ghostfolio Premium cloud option removes the need to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Progressive Web App works across devices without a native app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Wide community-supported deployment options (Umbrel, CasaOS, Runtipi, Unraid, Home Assistant)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Active open-source project with thousands of commits and hundreds of releases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Self-hosting requires running PostgreSQL and Redis alongside Docker infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Exact Ghostfolio Premium pricing was not consistently published in an easily verifiable form at time of research$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Professional market-data provider access appears limited to the paid Premium tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Is Ghostfolio free?$q$, $q$The self-hosted version is free and licensed under AGPLv3; a paid Ghostfolio Premium cloud-hosted version is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Can I self-host Ghostfolio?$q$, $q$Yes, via Docker Compose, with community packages available for Umbrel, CasaOS, Runtipi, Unraid, and Home Assistant.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$What does Ghostfolio track?$q$, $q$Transactions, portfolio performance (ROAI) across multiple timeframes, and portfolio risk/composition.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Is Ghostfolio open source?$q$, $q$Yes, it's open-source software licensed under AGPLv3 and developed publicly on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Self-hosted portfolio tracking$q$, $q$Technical users who want to track their investment portfolio without relying on a third-party cloud service.$q$, $q$Self-hosters and privacy-focused investors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Managed wealth tracking$q$, $q$Users who want investment performance and risk tracking without managing their own server, via Ghostfolio Premium.$q$, $q$Individual investors$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Self-Hosted (Open Source)$q$, $q$$0$q$, NULL, $q$["Transaction management","Portfolio performance tracking","Risk analysis","Import/export"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Ghostfolio Premium (Cloud)$q$, $q$Paid — see ghostfol.io/en/pricing for current rate$q$, NULL, $q$["Managed hosting","Bundled professional market data providers"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$overview$q$, $q$What is Ghostfolio?$q$, 2, ARRAY[$q$Ghostfolio is an open-source wealth management application, first published in 2021, for tracking investment transactions, portfolio performance, and risk.$q$, $q$It can be self-hosted for free under the AGPLv3 license via Docker, or used through Ghostfolio Premium, a managed cloud offering that bundles professional market data providers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$who-its-for$q$, $q$Who Ghostfolio is for$q$, 2, ARRAY[$q$Ghostfolio suits individual investors who want a transparent, open-source way to track portfolio performance and risk, whether they prefer self-hosting their own instance or paying for the managed Premium cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Planka ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted Kanban board tool for team task management with a paid Pro tier and managed cloud hosting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€13/month$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$Kempten, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Planka: open-source, self-hosted Kanban board software with real-time boards, a free Community edition, and paid Pro/cloud plans.$q$,
  og_description = $q$Planka: open-source, self-hosted Kanban board software with real-time boards, a free Community edition, and paid Pro/cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Kanban boards$q$, $q$Unlimited boards and cards for organizing team tasks in a Trello-style interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Real-time synchronization$q$, $q$Board updates sync live across all connected users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Self-hosted deployment$q$, $q$Deploy Planka on your own server via Docker; source code is available on GitHub.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$REST API$q$, $q$A documented REST API (with Swagger UI reference) allows programmatic access, plus community Python and PHP SDKs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$OpenID Connect authentication$q$, $q$Supports OIDC-based single sign-on.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Multilingual interface$q$, $q$Interface available in 35+ languages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Custom branding (Pro)$q$, $q$Pro tier adds custom logo, colors, and login page branding.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Calendar and map views (Pro)$q$, $q$Pro tier unlocks calendar and map views plus recurring cards.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Free, open-source Community edition that can be fully self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Active project with 12.2k+ GitHub stars and regular releases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Docker-based deployment (8.1M+ image pulls)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Real-time collaborative boards with a modern UI$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Optional managed cloud hosting if you don't want to self-host$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Free self-hosted Community edition lacks calendar/map views, recurring cards, and custom branding$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Community edition license prohibits cross-company use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Pro features (branding, guest roles, advanced views) require a paid license$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Hosted plans bill per-user with additional charges for extra storage and guests$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Is Planka free?$q$, $q$Yes, the Community edition is free to self-host under Planka's Fair Use license, though it has some feature restrictions compared to Pro.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Does Planka offer a hosted/cloud version?$q$, $q$Yes, Planka offers managed cloud hosting for both the Community and Pro editions, priced per month plus per-user fees.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Is Planka open source?$q$, $q$Yes, Planka's source code is publicly available on GitHub under a fair-code licensing model.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Can I self-host Planka with Docker?$q$, $q$Yes, Planka is commonly deployed via Docker, with over 8.1 million image pulls reported.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Self-hosted team task boards$q$, $q$Teams that want full control over their data by running Planka on their own infrastructure.$q$, $q$Small to mid-size engineering or ops teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Managed Kanban without ops overhead$q$, $q$Organizations that want Planka's board features without managing servers, using the hosted Community or Pro plans.$q$, $q$Teams without dedicated DevOps resources$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Branded multi-client boards$q$, $q$Agencies needing custom-branded boards and cross-company usage rights via the Pro tier.$q$, $q$Agencies and consultancies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Community Self-Hosted$q$, $q$Free$q$, NULL, $q$["Own server deployment","GitHub community support","No calendar/map views, recurring cards, or custom branding","No cross-company use permitted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Community Hosted$q$, $q$€13.00/month base + €2.60-2.90/user/month (min. 5 users)$q$, $q$monthly$q$, $q$["Dedicated instance with isolated database","Updates included","Customer forum support","1 GB average storage included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Pro Self-Hosted$q$, $q$€36.00/month base + €7.20-7.90/user/month (min. 1 user)$q$, $q$monthly$q$, $q$["Custom branding (logo, colors, login page)","Worker and guest roles","Calendar and map views","Cross-company use allowed","Recurring cards"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Pro Hosted$q$, $q$€42.50/month base + €8.50-9.40/user/month (min. 5 users)$q$, $q$monthly$q$, $q$["All Pro self-hosted features","Dedicated infrastructure","5 GB average storage included"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Minimum 1000 users","All Pro features","Source code access","Custom development","SLA agreements"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$overview$q$, $q$What is Planka?$q$, 2, ARRAY[$q$Planka is a modern, Trello-style Kanban board application for organizing and visualizing team tasks. It is open source, with a free self-hosted Community edition and a commercial Pro tier that adds branding, guest roles, and additional views.$q$, $q$The project is maintained by PLANKA Software GmbH (Kempten, Germany) and can be deployed via Docker on your own infrastructure, or run as a managed cloud instance through PLANKA's hosted plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$who-its-for$q$, $q$Who Planka is for$q$, 2, ARRAY[$q$Planka suits teams that want a self-hosted alternative to Trello-style boards, from small teams using the free Community edition to agencies and enterprises that need custom branding, guest access, or cross-company usage rights via the Pro tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Redmine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, cross-platform project management and issue tracking web application built on Ruby on Rails.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2006,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Redmine is a free, open-source project management and issue-tracking web app with Gantt charts, wikis, time tracking, and SCM integration.$q$,
  og_description = $q$Redmine is a free, open-source project management and issue-tracking web app with Gantt charts, wikis, time tracking, and SCM integration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Issue tracking$q$, $q$Tracks tasks and bugs with customizable statuses and workflows across multiple projects.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Gantt charts and calendars$q$, $q$Built-in Gantt chart and calendar views for project scheduling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Role-based access control$q$, $q$Per-project roles and permissions for users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Wikis and forums$q$, $q$Project-specific wikis and discussion forums for documentation and collaboration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Time tracking$q$, $q$Log and report time spent on issues and projects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$SCM integration$q$, $q$Integrates with SVN, CVS, Git, Mercurial, and Bazaar repositories.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$REST API$q$, $q$Documented REST API supporting XML and JSON for issues, projects, wiki pages, and search.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Custom fields$q$, $q$Custom fields for issues, time entries, projects, and users.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Completely free and open source under the GNU GPL v2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Mature, long-running project with roots dating back to 2006$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Highly customizable through a large ecosystem of community plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Supports multiple SCM systems (Git, SVN, Mercurial, CVS, Bazaar) and multiple database backends$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Cross-platform, Ruby on Rails-based web application$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Requires self-hosting and ongoing server/technical maintenance since there is no official managed cloud plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Plugin compatibility varies across Redmine versions and may need testing/updates when upgrading$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$No official paid support tier from the core redmine.org project itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Is Redmine free?$q$, $q$Yes, Redmine is free, open-source software distributed under the GNU General Public License v2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Does Redmine integrate with Git or SVN?$q$, $q$Yes, Redmine has built-in SCM integration supporting Git, SVN, CVS, Mercurial, and Bazaar.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Is Redmine self-hosted only?$q$, $q$The official redmine.org project is self-hosted; you install and run it on your own server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Can Redmine be extended with plugins?$q$, $q$Yes, Redmine supports a plugin architecture, with plugins available via an official directory and on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Software issue tracking$q$, $q$Development teams tracking bugs and feature work across multiple projects.$q$, $q$Software development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Self-hosted project management$q$, $q$Organizations that want full control of their project data on their own infrastructure.$q$, $q$IT teams and organizations with data-control requirements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Multi-project portfolio tracking$q$, $q$Teams managing several projects with shared roles, custom fields, and Gantt-based scheduling.$q$, $q$PMOs and cross-functional teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Self-Hosted$q$, $q$$0$q$, NULL, $q$["Full source code access under GPL v2","Issue tracking, Gantt charts, wikis, time tracking","SCM integration","Plugin ecosystem"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$overview$q$, $q$What is Redmine?$q$, 2, ARRAY[$q$Redmine is a flexible, free and open-source project management web application written in Ruby on Rails. It is cross-platform and cross-database, and has been developed since 2006.$q$, $q$It combines issue tracking with Gantt charts, calendars, wikis, forums, time tracking, and integration with source control systems like Git and SVN.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$who-its-for$q$, $q$Who Redmine is for$q$, 2, ARRAY[$q$Redmine fits software teams and organizations that want a mature, no-cost, self-hosted project and issue tracker with deep customization through plugins and custom fields, and are willing to manage their own server infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Phorge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted developer toolkit forked from Phabricator, covering code review, task tracking, and repository hosting.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Phorge is a free, open-source, self-hosted fork of Phabricator offering code review, task tracking, and repository hosting for dev teams.$q$,
  og_description = $q$Phorge is a free, open-source, self-hosted fork of Phabricator offering code review, task tracking, and repository hosting for dev teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Code review$q$, $q$Differential-style code review tooling inherited from Phabricator.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Repository hosting$q$, $q$Built-in hosting for source code repositories.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Task tracking$q$, $q$Bug and task tracking for software projects.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Herald automation$q$, $q$Rule-based automation engine for triggering actions on project events.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Wikis$q$, $q$Documentation/wiki tooling for team knowledge bases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Self-hosted LAMP/LEMP deployment$q$, $q$Runs on your own PHP/MySQL or MariaDB server stack (Linux, macOS, or BSD).$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Continuation of the well-regarded Phabricator toolset after its original discontinuation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Actively maintained by the community, including PHP 8+ compatibility work and security patches$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Proven at scale: the Wikimedia Foundation migrated its production task tracking to Phorge$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Combines code review, task tracking, and repo hosting in one self-hosted platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Requires self-managing a LAMP/LEMP stack (PHP, MySQL/MariaDB) rather than offering a hosted SaaS option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$No Windows support; requires a Unix-like OS (Linux, macOS, or BSD)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Smaller community footprint than mainstream project-management tools$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$No official managed cloud/hosted plan found$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Is Phorge free?$q$, $q$Yes, Phorge is free and open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Is Phorge actively maintained?$q$, $q$Yes, it is developed by a community team; the Wikimedia Foundation completed a production migration to Phorge for task tracking, and maintainers continue shipping PHP 8+ compatibility and security fixes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$What is Phorge's relationship to Phabricator?$q$, $q$Phorge is a community-maintained fork of Phabricator, the developer toolsuite originally built at Facebook, which became unmaintained in mid-2021.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Can Phorge run on Windows?$q$, $q$No, Phorge requires a Unix-like operating system such as Linux, macOS, or BSD.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Migrating off deprecated Phabricator$q$, $q$Teams previously on Phabricator moving to an actively maintained, compatible fork.$q$, $q$Engineering teams that ran self-hosted Phabricator$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Integrated code review and task tracking$q$, $q$Organizations wanting code review, repository hosting, and task tracking in a single self-hosted platform.$q$, $q$Software development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Data-sovereign engineering tooling$q$, $q$Large organizations needing full control over their engineering collaboration data on their own infrastructure.$q$, $q$Large engineering orgs, e.g. foundations and enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Self-Hosted$q$, $q$$0$q$, NULL, $q$["Open source under Apache 2.0","Self-hosted deployment on your own LAMP/LEMP stack"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$overview$q$, $q$What is Phorge?$q$, 2, ARRAY[$q$Phorge is a free, open-source, community-maintained fork of Phabricator, the developer toolsuite originally built at Facebook that became unmaintained in mid-2021. Phorge's community fork effort began in 2021, with an initial public release in September 2022.$q$, $q$It provides code review, repository hosting, task tracking, wikis, and rule-based automation (Herald) in a single self-hosted platform, released under the Apache 2.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$who-its-for$q$, $q$Who Phorge is for$q$, 2, ARRAY[$q$Phorge is for engineering teams that relied on Phabricator and need an actively maintained, self-hosted continuation, and for organizations that want integrated code review and task tracking under their own infrastructure. The Wikimedia Foundation is a notable production adopter.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Taskwarrior ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Taskwarrior is a free, open-source command-line task manager for organizing and tracking to-do lists.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2006,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Taskwarrior is a free, open-source command-line to-do list manager with filters, priorities, tags, and recurring tasks.$q$,
  og_description = $q$Taskwarrior is a free, open-source command-line to-do list manager with filters, priorities, tags, and recurring tasks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '083ec4ab-767e-4d64-abab-5bc86ae9e884' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Command-line interface$q$, $q$Manage your entire task list from the terminal with a fast, scriptable command syntax.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Filters and reports$q$, $q$Search and narrow tasks with filters, and display them using customizable reports.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Tags and virtual tags$q$, $q$Organize and categorize tasks using user-defined and built-in virtual tags.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Contexts$q$, $q$Group and filter tasks by context to focus on specific areas of work.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Recurrence$q$, $q$Create repeating tasks with configurable recurrence rules.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Urgency scoring$q$, $q$Tasks are automatically prioritized using an urgency algorithm based on due dates, tags, and other attributes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$User Defined Attributes (UDAs)$q$, $q$Extend tasks with custom fields to fit specific workflows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Hooks API and syncing$q$, $q$Extend behavior with external scripts via the hooks API, and sync tasks across devices.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Completely free and open source (MIT license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Fast, scriptable command-line workflow suited to power users and GTD practitioners$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Highly extensible via hooks, UDAs, and a large ecosystem of add-on tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Packaged for Linux, macOS, and Windows through common package managers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Active, long-running project with a large GitHub community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$No graphical interface out of the box; requires comfort with the command line$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Steeper learning curve than mainstream to-do apps for non-technical users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Native mobile apps are not part of the core project$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Syncing setup (Taskserver) requires additional configuration$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Is Taskwarrior free to use?$q$, $q$Yes, Taskwarrior is free and open-source software released under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$What platforms does Taskwarrior support?$q$, $q$Taskwarrior is packaged for Linux/Unix distributions (including Arch, Debian, Fedora, Ubuntu), macOS (via Homebrew), and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Does Taskwarrior have a graphical user interface?$q$, $q$Taskwarrior's core product is a command-line utility; it does not ship a built-in GUI.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Can I sync tasks across multiple devices?$q$, $q$Yes, Taskwarrior supports syncing tasks across devices.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$How long has Taskwarrior been in development?$q$, $q$Development on Taskwarrior began in 2006 and continues to be actively maintained.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$GTD-style personal task management$q$, $q$Track to-do lists, priorities, and contexts using the Getting Things Done methodology.$q$, $q$Individuals who prefer command-line tools for personal productivity$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Developer and sysadmin workflows$q$, $q$Manage tasks alongside other terminal-based workflows without leaving the shell.$q$, $q$Developers and system administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Scripted and automated task tracking$q$, $q$Use hooks and UDAs to integrate Taskwarrior into custom scripts and automation pipelines.$q$, $q$Power users and script authors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$overview$q$, $q$What is Taskwarrior?$q$, 2, ARRAY[$q$Taskwarrior is free and open-source software that manages a to-do list from the command line, described by its creators as flexible, fast, and unobtrusive.$q$, $q$It is developed by Gothenburg Bit Factory and has an active ecosystem that includes companion tools such as Timewarrior for time tracking and Taskshell.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$who-its-for$q$, $q$Who Taskwarrior is for$q$, 2, ARRAY[$q$Taskwarrior suits developers, sysadmins, and other command-line-comfortable users who want fast, scriptable task management with deep customization through filters, UDAs, and hooks, rather than a graphical to-do app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Super Productivity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Super Productivity is a free, open-source to-do list and time-tracking app with Pomodoro and task-integration features.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Español$q$, $q$Français$q$, $q$Português (BR)$q$, $q$Русский$q$, $q$Deutsch$q$]::text[],
  seo_meta_description = $q$Super Productivity is a free, open-source todo app with time tracking, Pomodoro timer, and Jira/GitHub/GitLab task imports.$q$,
  og_description = $q$Super Productivity is a free, open-source todo app with time tracking, Pomodoro timer, and Jira/GitHub/GitLab task imports.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Task management with subtasks$q$, $q$Organize work with quick-add tasks, subtasks, notes, and due dates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Time tracking$q$, $q$Track time spent on tasks with keyboard shortcuts and detailed work logs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Pomodoro timer and focus mode$q$, $q$Built-in Pomodoro timer and a focus mode to reduce distractions during deep work.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Multiple board layouts$q$, $q$Organize tasks with Kanban boards, Eisenhower matrix, compact lists, or custom layouts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Issue tracker integrations$q$, $q$Import and sync tasks from Jira, GitHub, GitLab, Gitea, OpenProject, Linear, ClickUp, and Azure DevOps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Repeating tasks$q$, $q$Set up recurring tasks with smart scheduling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Data sync without accounts$q$, $q$Sync data across devices via Dropbox, WebDAV, or CalDAV without requiring user registration.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Plugin system$q$, $q$Extend functionality through plugins.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Completely free and open source (MIT license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$No user accounts, registration, or telemetry required — data stays local by default$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Supports Windows, macOS, Linux, Android, iOS, and web$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Deep integrations with popular issue trackers like Jira, GitHub, GitLab, and Linear$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Combines task management with time tracking and Pomodoro in one app$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$No built-in cloud accounts; sync relies on user-configured Dropbox or WebDAV$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$No official hosted/paid tier for teams needing centralized administration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Feature depth (multiple board types, integrations) can add a learning curve for new users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Is Super Productivity free?$q$, $q$Yes, Super Productivity is free and open source under the MIT license, with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$What platforms does Super Productivity support?$q$, $q$Super Productivity runs on Windows, macOS, Linux, Android, iOS, and as a web app.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Does Super Productivity integrate with issue trackers?$q$, $q$Yes, it supports importing and syncing tasks from Jira, GitHub, GitLab, Gitea, OpenProject, Linear, ClickUp, and Azure DevOps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Does Super Productivity require an account?$q$, $q$No, the app requires no user accounts or registration, and data stays on the user's device by default.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$How can I sync data across devices?$q$, $q$Data can be synced across devices using Dropbox, WebDAV, or basic CalDAV integration.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Developer task and time tracking$q$, $q$Import issues from Jira, GitHub, or GitLab and track time spent resolving them.$q$, $q$Software developers and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Deep work and focus sessions$q$, $q$Use Pomodoro timer and focus mode to structure work sessions and reduce procrastination.$q$, $q$Individuals practicing focused, distraction-free work$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Personal privacy-first productivity$q$, $q$Manage tasks and track time entirely offline without creating an account or sending data to a server.$q$, $q$Privacy-conscious individuals and local-first software users$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$overview$q$, $q$What is Super Productivity?$q$, 2, ARRAY[$q$Super Productivity is an open-source task management and time-tracking application that combines to-do lists, a Pomodoro timer, and focus mode in one tool.$q$, $q$It runs on Windows, macOS, Linux, Android, and iOS, as well as in the browser, and can import tasks from issue trackers such as Jira, GitHub, GitLab, Gitea, OpenProject, Linear, ClickUp, and Azure DevOps.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$who-its-for$q$, $q$Who Super Productivity is for$q$, 2, ARRAY[$q$It is aimed at developers and individuals who want a privacy-respecting, local-first productivity app that unifies task tracking, time tracking, and focus techniques without requiring an account or subscription.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SiYuan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SiYuan is a privacy-first, self-hosted, open-source personal knowledge management app with an optional paid cloud sync tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$64 one-time (PRO tier)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$Chinese$q$, $q$English$q$]::text[],
  seo_meta_description = $q$SiYuan is an open-source, self-hosted note-taking app with block linking, flashcards, and optional paid cloud sync tiers.$q$,
  og_description = $q$SiYuan is an open-source, self-hosted note-taking app with block linking, flashcards, and optional paid cloud sync tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fc868bfd-fdf4-4187-9d7e-b719006af946';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fc868bfd-fdf4-4187-9d7e-b719006af946' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Block-level editing$q$, $q$Edit notes using 20+ block elements and 10+ inline elements for granular content structuring.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Bidirectional linking$q$, $q$Create block-level references and backlinks between notes to build a connected knowledge base.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Knowledge graph$q$, $q$Visualize relationships between notes and blocks in a graph view.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Spaced repetition flashcards$q$, $q$Built-in flashcard review using the FSRS spaced-repetition algorithm.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Database/table views$q$, $q$Create relational database-style views with templates inside notes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$PDF annotation$q$, $q$Annotate PDF documents directly within the app.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Self-hosted or Docker deployment$q$, $q$Run SiYuan locally or self-host via Docker for full data control.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Optional cloud sync$q$, $q$Paid tiers add official cloud storage, data sync/backup, and a cloud inbox; free/PRO tiers support third-party S3 or WebDAV sync.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Core app is fully open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Self-hostable with full local data control and no forced account$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Large, actively developed project on GitHub$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Supports desktop (Windows/macOS/Linux), mobile (iOS/Android/HarmonyOS), and Docker/web deployment$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Free tier retains core note-taking functions; paid tiers are optional add-ons for cloud sync$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Official cloud sync and hosted storage require a one-time paid PRO or subscription tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Free tier has no official cloud storage, sync, or backup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Interface and community documentation are heavily Chinese-language-centric, though English is supported$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Third-party sync (S3/WebDAV) on lower tiers requires users to set up and pay for their own storage service separately$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Is SiYuan free to use?$q$, $q$Yes, SiYuan's core app is free and open source (AGPL-3.0), but official cloud sync and storage require a paid PRO or subscription tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$What does the paid tier include?$q$, $q$The PRO tier ($64 one-time) adds third-party S3/WebDAV sync and backup. The subscription tier ($148 one-time as listed) adds official cloud sync, 8GB of official cloud storage, cloud asset hosting, and a cloud inbox.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Can I self-host SiYuan?$q$, $q$Yes, SiYuan can be self-hosted, including via Docker deployment, with data kept under the user's own control.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$What platforms does SiYuan support?$q$, $q$SiYuan supports Windows, macOS, and Linux desktop apps, iOS, Android, and HarmonyOS mobile apps, and Docker/web deployment.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Who develops SiYuan?$q$, $q$SiYuan is developed by Yunnan Liandi Technology Co., Ltd. under the B3log open-source organization.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Personal knowledge management$q$, $q$Build a connected notebook of block-linked notes with backlinks and a knowledge graph.$q$, $q$Individuals building a personal wiki or second brain$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Self-hosted note-taking$q$, $q$Run SiYuan on your own server or desktop via Docker for full control over data without relying on a vendor's cloud.$q$, $q$Privacy-conscious users and self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Spaced-repetition study$q$, $q$Convert notes into flashcards and review them using the built-in FSRS spaced-repetition algorithm.$q$, $q$Students and lifelong learners$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Free$q$, $q$$0$q$, NULL, $q$["Basic note-taking functions","No official cloud storage, sync, or backup"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$PRO$q$, $q$$64 one-time$q$, NULL, $q$["Basic functions","Third-party S3 data sync and backup","Third-party WebDAV data sync and backup"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Subscription$q$, $q$$148 one-time$q$, NULL, $q$["Basic functions","Cloud asset hosting","8GB official cloud storage","Official data sync and backup","Cloud Inbox","Third-party S3 and WebDAV integration"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$overview$q$, $q$What is SiYuan?$q$, 2, ARRAY[$q$SiYuan is a privacy-first, self-hosted, fully open-source personal knowledge management application, built with TypeScript and Golang and released under the AGPL-3.0 license.$q$, $q$It offers block-level editing, bidirectional linking, a knowledge graph, spaced-repetition flashcards, and database-style views, and runs on desktop, mobile, and Docker deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$who-its-for$q$, $q$Who SiYuan is for$q$, 2, ARRAY[$q$SiYuan suits users who want a self-hosted, block-based note-taking tool with deep linking and knowledge-graph features, and who are comfortable managing their own sync via third-party storage or an optional paid cloud tier for official sync and backup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Trilium Notes ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted app for building a hierarchical personal knowledge base.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Trilium Notes: free, open-source, self-hosted app for organizing hierarchical personal notes with encryption and scripting.$q$,
  og_description = $q$Trilium Notes: free, open-source, self-hosted app for organizing hierarchical personal notes with encryption and scripting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8a1e8900-232b-487e-a707-161bf160047b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8a1e8900-232b-487e-a707-161bf160047b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Hierarchical notes & cloning$q$, $q$Organize notes in a tree structure, with the ability to clone a single note into multiple locations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Note encryption$q$, $q$Password-protect individual notes using AES-128-CBC encryption.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Multiple note types$q$, $q$Create text, code, file, canvas, Mermaid diagram, and mindmap notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Built-in collections$q$, $q$Use calendar, table, Kanban board, geomap, and presentation views for notes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Web clipper$q$, $q$Save web pages into Trilium via a browser extension.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$REST API and scripting$q$, $q$Automate and extend Trilium using a REST API and custom scripts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Note revisions$q$, $q$Automatic background versioning with undo support.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Fully free and open source with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Self-hosted, keeping data under the user's control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Handles very large note collections (100,000+ notes)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Supports encryption for sensitive notes$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Highly extensible via scripting and a REST API$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Requires self-hosting or running a local server for sync$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$No official mobile app (only an unofficial community Android client and PWA support)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Steeper learning curve than simple note apps due to its attribute and scripting system$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Is Trilium Notes free?$q$, $q$Yes, Trilium Notes is free and open source with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Can I sync Trilium across devices?$q$, $q$Yes, by running a self-hosted Trilium server; a PWA is also available for mobile browser access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Is there an official mobile app?$q$, $q$Not an official one; an unofficial Android client (TriliumDroid) exists.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$How does Trilium store data?$q$, $q$Notes are stored locally in a SQLite database.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Can I encrypt notes?$q$, $q$Yes, individual notes can be password-protected with AES-128-CBC encryption.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Personal knowledge base$q$, $q$Build a structured, searchable archive of personal notes and research using hierarchical organization and note linking.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$Developer documentation & scripting$q$, $q$Use the REST API and note scripting to build dynamic, automated note workflows.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$overview$q$, $q$What is Trilium Notes?$q$, 2, ARRAY[$q$Trilium Notes is an open-source note-taking application for building a personal knowledge base, organizing notes in a hierarchical tree with support for cloning notes into multiple locations.$q$, $q$It stores notes locally in a SQLite database and can be run as a desktop application or accessed through a self-hosted server via a browser or progressive web app.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$who-its-for$q$, $q$Who Trilium Notes is for$q$, 2, ARRAY[$q$Trilium Notes suits individuals who want a private, self-hosted place to organize large volumes of hierarchical notes, especially those comfortable with self-hosting a server and using scripting for automation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a1e8900-232b-487e-a707-161bf160047b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Joplin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Joplin is a free, open-source note-taking app with end-to-end encryption and an optional paid Joplin Cloud sync service.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€2.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Joplin: free, open-source, end-to-end encrypted note-taking app for Windows, macOS, Linux, Android and iOS, with optional Joplin Cloud sync.$q$,
  og_description = $q$Joplin: free, open-source, end-to-end encrypted note-taking app for Windows, macOS, Linux, Android and iOS, with optional Joplin Cloud sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Cross-platform apps$q$, $q$Native apps for Windows, macOS, Linux, Android, iOS, and a terminal client.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$End-to-end encryption$q$, $q$Secure notes with E2EE across supported sync targets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Multiple sync options$q$, $q$Sync via Joplin Cloud, Nextcloud, Dropbox, OneDrive, or WebDAV.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Web clipper$q$, $q$Save articles and pages using the Chrome or Firefox browser extension.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Plugin & theme support$q$, $q$Extend the app with community plugins and custom themes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Rich & Markdown editors$q$, $q$Switch between Rich Text and Markdown editing modes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Note publishing$q$, $q$Publish individual notes to the web via Joplin Cloud.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Core app is free and open source across all major platforms$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$End-to-end encryption available for privacy$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Multiple free sync backend options besides the paid cloud service$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Active development with 55.6k GitHub stars and frequent releases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Extensible with community plugins and themes$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Hosted collaboration and larger storage require a paid Joplin Cloud subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Notebook sharing is receive-only on the cheapest Cloud plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Self-hosting Joplin Server for teams requires additional technical setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Is Joplin free?$q$, $q$The Joplin app is free and open source; Joplin Cloud is a separate paid sync and hosting service.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$What does Joplin Cloud cost?$q$, $q$Plans start at €2.99/month for the Basic tier, with Pro and Teams tiers also available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Can I sync without paying?$q$, $q$Yes, Joplin supports free sync via Nextcloud, Dropbox, OneDrive, or WebDAV.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Is Joplin encrypted?$q$, $q$Yes, Joplin supports end-to-end encryption (E2EE).$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$What platforms does Joplin support?$q$, $q$Windows, macOS, Linux, Android, iOS, and a terminal app.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Private note-taking$q$, $q$Keep encrypted notes synced across devices without relying on a single proprietary cloud provider.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Team notebook sharing$q$, $q$Use the Joplin Cloud Teams plan to share notebooks and manage billing centrally.$q$, $q$Small teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Basic$q$, $q$€2.99/month$q$, $q$monthly$q$, $q$["2 GB storage","10 MB max attachment size","Device sync","Web app access","Notebook collaboration (receive only)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Pro$q$, $q$€5.99/month$q$, $q$monthly$q$, $q$["30 GB storage","200 MB max attachment size","Notebook sharing","Email to Note","Customizable publishing banner"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Pro 100GB$q$, $q$€9.99/month$q$, $q$monthly$q$, $q$["100 GB storage","200 MB max attachment size"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Teams$q$, $q$€7.99/user/month$q$, $q$monthly$q$, $q$["50 GB storage","Multi-user management","Consolidated billing","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$overview$q$, $q$What is Joplin?$q$, 2, ARRAY[$q$Joplin is an open-source note-taking application that supports multimedia content, end-to-end encryption, and Markdown editing across desktop, mobile, and terminal clients.$q$, $q$The core app is free; Joplin Cloud is a paid managed sync service (created by developer Laurent Cozic and operated from France) offering hosted storage, sharing, and publishing on top of the free app.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$who-its-for$q$, $q$Who Joplin is for$q$, 2, ARRAY[$q$Joplin fits privacy-focused users who want a free, encrypted, cross-platform note app, and teams that want an affordable managed sync option through Joplin Cloud instead of self-hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Standard Notes ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Standard Notes is an open-source, end-to-end encrypted note-taking app with free and paid subscription plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Standard Notes: open-source, end-to-end encrypted notes app for Mac, Windows, Linux, iOS and Android, with free and paid plans.$q$,
  og_description = $q$Standard Notes: open-source, end-to-end encrypted notes app for Mac, Windows, Linux, iOS and Android, with free and paid plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$End-to-end encryption$q$, $q$All notes are encrypted before syncing across devices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Cross-platform apps$q$, $q$Native apps for Mac, Windows, Linux, iOS, and Android.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Unlimited device sync$q$, $q$The free tier includes syncing across unlimited devices.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Self-hosting$q$, $q$The web app can be deployed on a user-run server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Listed publishing$q$, $q$Publish notes as an online publication through the Listed feature.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Third-party extensions$q$, $q$Extend functionality with community-built extensions.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Open source (AGPL-3.0) with a free tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Strong focus on end-to-end encryption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Self-hostable for full data control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Cross-platform native apps$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Advanced features like extended history, larger file storage, and family sharing require paid Productivity or Professional plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Exact plan pricing is not consistently published outside the app or website checkout flow$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Is Standard Notes free?$q$, $q$Yes, there is a free plan; paid Productivity and Professional plans unlock more storage, note history, and sharing features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Is Standard Notes open source?$q$, $q$Yes, it is licensed under AGPL-3.0 with source code available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Can I self-host Standard Notes?$q$, $q$Yes, the web app can be deployed behind your own web server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$What platforms are supported?$q$, $q$Mac, Windows, Linux, iOS, and Android.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Encrypted personal notes$q$, $q$Store notes with end-to-end encryption synced across all your devices.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Self-hosted deployment$q$, $q$Run the Standard Notes web client on a self-managed server for full control over data.$q$, $q$Technical users and organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Free$q$, $q$$0$q$, NULL, $q$["Sync across unlimited devices","End-to-end encryption"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Productivity$q$, NULL, NULL, $q$["Full Standard Notes editing experience"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Professional$q$, NULL, NULL, $q$["100GB encrypted file storage","Maximum note history","Family subscription sharing"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$overview$q$, $q$What is Standard Notes?$q$, 2, ARRAY[$q$Standard Notes is an open-source note-taking application built around end-to-end encryption, letting users capture notes and files in a secure, encrypted store.$q$, $q$Its web client is self-hostable, and it ships native apps for Mac, Windows, Linux, iOS, and Android, alongside a free tier and paid Productivity and Professional subscriptions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$who-its-for$q$, $q$Who Standard Notes is for$q$, 2, ARRAY[$q$Standard Notes is aimed at privacy-conscious individuals and organizations that want an encrypted, cross-platform note app with the option to self-host the client.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Notesnook ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Notesnook is an open-source, end-to-end encrypted note-taking app with a free plan and paid Essential, Pro, and Believer tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€2.11/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Notesnook: open-source, end-to-end encrypted notes app for web, desktop, iOS and Android, with a free plan and paid Pro tiers.$q$,
  og_description = $q$Notesnook: open-source, end-to-end encrypted notes app for web, desktop, iOS and Android, with a free plan and paid Pro tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$End-to-end encryption$q$, $q$Notes are encrypted on-device before syncing, using XChaCha20-Poly1305 and Argon2.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Cross-platform apps$q$, $q$Native apps for Windows, macOS, Linux, iOS, Android, and web.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Self-hostable sync server$q$, $q$Run your own Notesnook sync server instead of the hosted cloud.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Bidirectional note linking$q$, $q$Link related notes together for easier navigation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Password-protected vault$q$, $q$Store sensitive notes behind an additional password.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Web clipper$q$, $q$Save web articles directly into Notesnook.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Rich editing$q$, $q$Tables, task lists, formulas, and code blocks in the editor.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Fully open source (GPL-3.0), including the self-hostable sync server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Strong client-side encryption on both free and paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Affordable entry-level paid tier (Essential, from €2.11/month)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Cross-platform coverage across web, desktop, iOS, and Android$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Free plan is capped at 50MB/month storage and 50 notebooks/tags$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Larger file sizes and unlimited notebooks require a paid Pro or Believer plan$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Is Notesnook free?$q$, $q$Yes, there's a free plan with 50MB/month storage; paid Essential, Pro, and Believer plans add more storage and features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Is Notesnook open source?$q$, $q$Yes, it's fully open source, including the client apps and the self-hostable sync server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$What does the cheapest paid plan cost?$q$, $q$The Essential plan starts at €2.11/month, billed yearly.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Does Notesnook offer a refund?$q$, $q$Yes, a 14-day money-back guarantee applies to paid plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$What platforms does Notesnook support?$q$, $q$Web, Windows, macOS, Linux, iOS, and Android.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Private note-taking$q$, $q$Encrypt and sync notes across devices without exposing plaintext data to the server.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Self-hosted sync$q$, $q$Run the open-source Notesnook sync server to keep encrypted notes on infrastructure you control.$q$, $q$Technical users$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Free$q$, $q$€0$q$, $q$monthly$q$, $q$["50MB/month storage","10MB max file size","50 notebooks","50 tags","10 active reminders","100 note versions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Essential$q$, $q$€2.11/month$q$, $q$monthly$q$, $q$["1GB/month storage","100MB max file size","500 notebooks","500 tags","App lock"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Pro$q$, $q$€7.39/month$q$, $q$monthly$q$, $q$["10GB/month storage","1GB max file size","Unlimited notebooks and tags","Custom toolbar"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Believer$q$, $q$€9.51/month$q$, $q$monthly$q$, $q$["25GB/month storage","5GB max file size","Maximum support tier"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$overview$q$, $q$What is Notesnook?$q$, 2, ARRAY[$q$Notesnook is an open-source, end-to-end encrypted note-taking app positioned as a private alternative to Evernote, encrypting all data on-device before it reaches the server.$q$, $q$It ships native apps for web, Windows, macOS, Linux, iOS, and Android, and its sync server is self-hostable, alongside a hosted free plan and paid Essential, Pro, and Believer tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$who-its-for$q$, $q$Who Notesnook is for$q$, 2, ARRAY[$q$Notesnook suits privacy-conscious individuals who want strong client-side encryption across all their devices, and technical users who prefer self-hosting the sync server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Memos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Memos is a free, open-source, self-hosted timeline app for quick Markdown notes and daily logs.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Memos: a free, open-source, self-hosted Markdown note-taking app for quick capture, with zero telemetry by default.$q$,
  og_description = $q$Memos: a free, open-source, self-hosted Markdown note-taking app for quick capture, with zero telemetry by default.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Timeline-first capture$q$, $q$Write quick notes without folders, templates, or titles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Markdown-native storage$q$, $q$Notes are stored as portable Markdown files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Single-binary deployment$q$, $q$Runs as one Go binary in an approximately 20MB Docker image.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Flexible database backends$q$, $q$Supports SQLite by default, with MySQL or PostgreSQL for larger deployments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$REST and gRPC APIs$q$, $q$Build integrations and automations on top of Memos.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Zero telemetry$q$, $q$No tracking is enabled by default.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Tagging and search$q$, $q$Organize and find notes with tags and full-text search.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Completely free and open source (MIT license) with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Lightweight, single-binary deployment via Docker, Raspberry Pi, VPS, or NAS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Zero telemetry by default$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Notes stored in portable Markdown format$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Actively developed project with 61.6k GitHub stars$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Self-hosting is required; there is no official hosted or cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Minimal organizational structure (no folders or notebooks) by design$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Users are responsible for their own backups and infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Is Memos free?$q$, $q$Yes, Memos is completely free and open source with no paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Do I need to self-host Memos?$q$, $q$Yes, Memos is self-hosted; you deploy it via Docker or as a standalone binary.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$What license is Memos under?$q$, $q$The MIT license.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Does Memos have an API?$q$, $q$Yes, it offers both REST and gRPC APIs.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$What databases does Memos support?$q$, $q$SQLite by default, with MySQL and PostgreSQL available for larger deployments.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Quick daily logging$q$, $q$Capture quick notes, links, and snippets in a private timeline without organizational overhead.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Self-hosted note timeline$q$, $q$Deploy Memos on a VPS or NAS for a private, ad-free note timeline with no telemetry.$q$, $q$Self-hosters and small teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$overview$q$, $q$What is Memos?$q$, 2, ARRAY[$q$Memos is an open-source, self-hosted timeline app for quick notes, daily logs, links, and snippets, built as a single lightweight Go binary.$q$, $q$Notes are stored in portable Markdown, and the project supports SQLite, MySQL, or PostgreSQL, with zero telemetry enabled by default.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$who-its-for$q$, $q$Who Memos is for$q$, 2, ARRAY[$q$Memos fits self-hosters, developers, and privacy-conscious users who want a fast, low-overhead place to jot quick notes without folders or templates.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SilverBullet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SilverBullet is a free, open-source, self-hosted, browser-based Markdown note app with built-in scripting and queries.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SilverBullet: a free, open-source, self-hosted, browser-based personal knowledge base with Markdown editing and Lua scripting.$q$,
  og_description = $q$SilverBullet: a free, open-source, self-hosted, browser-based personal knowledge base with Markdown editing and Lua scripting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Live-preview Markdown editor$q$, $q$Edit notes with wiki-style bidirectional linking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Built-in query language (SLIQ)$q$, $q$Query your notes like a lightweight database.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Space Lua scripting$q$, $q$Script dynamic content and automation directly inside notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Single-binary or Docker deployment$q$, $q$Self-host on a VPS, Raspberry Pi, or via Docker.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Page templates and custom commands$q$, $q$Extend the editor with templates and widgets.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Task management and outlining$q$, $q$Built-in support for task lists and outlining.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Free and open source (MIT license) with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Fully self-hosted, keeping notes under user control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Combines note-taking with a programmable database and query layer$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Lightweight deployment as a single binary, Docker container, or CLI tool$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Requires self-hosting; there is no official hosted cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Programmable features like Space Lua scripting assume some technical comfort$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Browser-based editing depends on running your own server instance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Is SilverBullet free?$q$, $q$Yes, it's free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Do I need to self-host SilverBullet?$q$, $q$Yes, it runs as a self-hosted single binary or Docker container.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$What is Space Lua?$q$, $q$SilverBullet's built-in Lua scripting environment for dynamic content and automation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$What is SLIQ?$q$, $q$SilverBullet's built-in query language for treating notes as structured data.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Programmable knowledge base$q$, $q$Build a personal wiki with queries and scripted automation layered over Markdown notes.$q$, $q$Technical individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Self-hosted private notes$q$, $q$Run a lightweight, browser-based note system on your own server or Raspberry Pi.$q$, $q$Self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$overview$q$, $q$What is SilverBullet?$q$, 2, ARRAY[$q$SilverBullet is an open-source, self-hosted, browser-based personal knowledge base that combines a live-preview Markdown editor with wiki-style linking, a built-in query language, and Lua scripting.$q$, $q$It runs as a single binary, CLI tool, or Docker container with a Rust-based backend and TypeScript frontend, and is free with no paid tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$who-its-for$q$, $q$Who SilverBullet is for$q$, 2, ARRAY[$q$SilverBullet suits technically comfortable users who want a programmable, self-hosted alternative to note apps, treating notes as both documents and queryable data.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Documize ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Documize is a self-hosted documentation and knowledge management platform with a free tier for up to 5 users.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$900/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Documize: self-hosted docs and knowledge management platform with content workflows, free for up to 5 users, plans from $900/year.$q$,
  og_description = $q$Documize: self-hosted docs and knowledge management platform with content workflows, free for up to 5 users, plans from $900/year.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dc626839-0d04-4df9-9c03-63658e2f415a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dc626839-0d04-4df9-9c03-63658e2f415a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Spaces and structured docs$q$, $q$Organize documentation into spaces with labels.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Content workflows$q$, $q$Draft, review, approve, and publish content through defined lifecycle stages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Reusable templates and blocks$q$, $q$Build documents from reusable content blocks and templates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Granular permissions$q$, $q$Control access at the space, document, and action level.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Built-in analytics$q$, $q$Track content usage and identify knowledge gaps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Multiple auth methods$q$, $q$Supports LDAP, Active Directory, Keycloak, and CAS authentication.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Self-hosted single binary$q$, $q$Deploy on Windows, macOS, Linux, or FreeBSD.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Free tier for up to 5 users with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Self-hosted, keeping documentation on the customer's own infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Open-source Community edition available on GitHub under AGPL-3.0$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Supports multiple databases, including PostgreSQL, SQL Server, MySQL, MariaDB, and Percona$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Built-in approval workflows and analytics not found in simpler wiki tools$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Paid plans are billed annually ($900-$1,800/year) rather than monthly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Requires self-hosting and database setup rather than instant SaaS signup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Smaller open-source community than larger alternatives (2.4k GitHub stars)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Is Documize free?$q$, $q$Yes, for up to 5 users; paid Essential ($900/year, up to 100 users) and Enterprise ($1,800/year, unlimited users) plans are also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Is Documize open source?$q$, $q$Yes, a Community edition is available on GitHub under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Is Documize self-hosted?$q$, $q$Yes, it runs as a self-hosted single binary deployed on your own server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$What databases does Documize support?$q$, $q$PostgreSQL, SQL Server, MySQL, MariaDB, and Percona.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Does Documize offer refunds?$q$, $q$Yes, a 90-day refund policy is stated for paid plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Internal documentation$q$, $q$Use the free tier to build internal docs and wikis for up to 5 users.$q$, $q$Small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Enterprise knowledge management$q$, $q$Deploy Documize with LDAP/AD authentication, approval workflows, and analytics for larger user bases.$q$, $q$Mid-size to large organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 5 users","Self-host on your own server","Unlimited content and storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Essential$q$, $q$$900/year$q$, $q$annual$q$, $q$["Up to 100 users","Self-hosted","Unlimited content and storage","LDAP/AD/Keycloak/CAS auth"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$Enterprise$q$, $q$$1,800/year$q$, $q$annual$q$, $q$["Unlimited users","Self-hosted","Unlimited content and storage","Priority support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$overview$q$, $q$What is Documize?$q$, 2, ARRAY[$q$Documize is a self-hosted knowledge management platform combining docs, wikis, templates, approval workflows, and analytics into a single deployable binary.$q$, $q$It offers a free tier for up to 5 users, an open-source Community edition on GitHub, and paid Essential and Enterprise plans billed annually for larger organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$who-its-for$q$, $q$Who Documize is for$q$, 2, ARRAY[$q$Documize suits small teams that want free, self-hosted internal documentation, and larger organizations that need enterprise authentication, approval workflows, and content analytics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── HedgeDoc ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$HedgeDoc is a free, open-source, self-hosted, real-time collaborative Markdown editor.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HedgeDoc: free, open-source, self-hosted, real-time collaborative Markdown editor with presentation mode and version history.$q$,
  og_description = $q$HedgeDoc: free, open-source, self-hosted, real-time collaborative Markdown editor with presentation mode and version history.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Real-time collaboration$q$, $q$Multiple users can edit the same Markdown document simultaneously.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Presentation mode$q$, $q$Turn Markdown notes into slide decks using reveal.js.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Diagrams and graphs$q$, $q$Embed diagrams directly inside documents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Permission management$q$, $q$Control who can view and edit each note.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Revision history$q$, $q$Track and restore previous versions of a document.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Low system requirements$q$, $q$Runs on low-powered hardware, including a Raspberry Pi.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Docker deployment$q$, $q$Ready-to-use Docker images and bundles for self-hosting.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Free and open source (AGPL-3.0) with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Real-time multi-user collaborative editing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Lightweight enough to run on a Raspberry Pi$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Self-hosted, keeping documents under your own control$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Active successor project (HedgeDoc 2) in development$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Requires self-hosting; there is no official hosted cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$HedgeDoc 1.x is in maintenance mode only, with new features going into the HedgeDoc 2 rewrite$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$No native mobile or desktop apps; it is browser-based only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Is HedgeDoc free?$q$, $q$Yes, HedgeDoc is free, open source, and self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$What license does HedgeDoc use?$q$, $q$AGPL-3.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Can multiple people edit the same document?$q$, $q$Yes, HedgeDoc supports real-time collaborative editing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Was HedgeDoc previously called something else?$q$, $q$Yes, it was formerly known as CodiMD before rebranding to HedgeDoc in 2020.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Can HedgeDoc create presentations?$q$, $q$Yes, via a built-in presentation mode powered by reveal.js.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Collaborative meeting notes$q$, $q$Co-edit Markdown notes and documents together in real time.$q$, $q$Teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Self-hosted presentations$q$, $q$Write Markdown and present it directly using HedgeDoc's built-in presentation mode.$q$, $q$Individuals and educators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$overview$q$, $q$What is HedgeDoc?$q$, 2, ARRAY[$q$HedgeDoc is an open-source, self-hosted, web-based collaborative Markdown editor that lets multiple users edit the same document in real time.$q$, $q$Formerly known as CodiMD before a 2020 rebrand, it is licensed under AGPL-3.0 and is free to run on your own infrastructure, from a Raspberry Pi to a full server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$who-its-for$q$, $q$Who HedgeDoc is for$q$, 2, ARRAY[$q$HedgeDoc fits individuals and teams that need real-time collaborative note-taking, presentations, and diagrams while keeping documents on self-hosted infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Mattermost ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mattermost is an open-core, self-hostable team collaboration platform with free self-hosted and paid enterprise editions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Palo Alto, California, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Mattermost: open-core team messaging and collaboration platform for self-hosted or cloud deployment, with Professional and Enterprise plans.$q$,
  og_description = $q$Mattermost: open-core team messaging and collaboration platform for self-hosted or cloud deployment, with Professional and Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Channel-based messaging$q$, $q$Threaded discussions and channel-based team communication.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Workflow automation$q$, $q$Playbooks for automating recurring workflows and incident response.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Audio calls$q$, $q$Built-in audio calls with transcription and AI summarization on paid tiers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Kanban boards$q$, $q$Built-in project and task management boards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Deployment flexibility$q$, $q$Self-hosted, private cloud, or major public cloud deployment (AWS, Azure, GCP, Oracle).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Compliance controls$q$, $q$FIPS 140-3 compliance and STIG-hardened images on Enterprise tiers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Microsoft Teams interoperability$q$, $q$Shared channels with Microsoft Teams on Enterprise plans.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Open-core project with a self-hosted, open-source base (38.5k GitHub stars)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Deployable on-premises, in private clouds, or in air-gapped environments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Native desktop and mobile apps for Windows, macOS, Linux, iOS, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Enterprise tiers add compliance features (FIPS, STIG, legal hold) for regulated industries$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Advanced AI, compliance, and scaling features require paid Enterprise or Enterprise Advanced tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Pricing for paid plans is not published; requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Enterprise-focused feature set may be more than small teams need$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Is Mattermost open source?$q$, $q$It's an open-core project with source code on GitHub; a compiled edition is released monthly under the MIT license alongside separately licensed enterprise features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Is there a free version of Mattermost?$q$, $q$Yes, a self-hosted open-source edition is available; paid Professional, Enterprise, and Enterprise Advanced tiers add features and support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$How much does Mattermost cost?$q$, $q$Pricing for paid tiers is not published; you need to contact sales for a quote.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Where is Mattermost headquartered?$q$, $q$Palo Alto, California, USA.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Can Mattermost run air-gapped?$q$, $q$Yes, the Enterprise Advanced tier supports air-gapped and classified deployments.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Self-hosted team chat$q$, $q$Deploy the open-source edition on-premises for full control over messaging infrastructure.$q$, $q$Technical teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Regulated and government collaboration$q$, $q$Use Enterprise Advanced for classified, air-gapped, or compliance-heavy deployments.$q$, $q$Government, defense, and critical infrastructure organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Professional$q$, NULL, $q$annual$q$, $q$["Up to 250 users","Channel-based messaging","1:1 audio calls","Custom branding","Guest accounts","SSO/MFA"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Enterprise$q$, NULL, $q$annual$q$, $q$["Up to 50,000 concurrent users","Sovereign AI and contextual summarization","Microsoft Teams shared channels","FIPS 140-3 compliance","High availability clustering"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Enterprise Advanced$q$, NULL, $q$annual$q$, $q$["Up to 200,000 concurrent users","Mobile biometrics","Air-gapped deployment","Zero trust security","Data spillage handling"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$overview$q$, $q$What is Mattermost?$q$, 2, ARRAY[$q$Mattermost is an open-core collaboration platform offering chat, workflow automation, voice calling, and AI-assisted features, deployable self-hosted, in a private cloud, or air-gapped.$q$, $q$Headquartered in Palo Alto, California, Mattermost pairs a free open-source base with paid Professional, Enterprise, and Enterprise Advanced tiers aimed at larger and regulated organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$who-its-for$q$, $q$Who Mattermost is for$q$, 2, ARRAY[$q$Mattermost is used by technical teams that want a self-hosted, open-source chat platform, and by government, defense, and critical-infrastructure organizations that need compliance-grade, sovereign deployment options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Rocket.Chat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rocket.Chat is an open-source team communications platform with self-hosted, cloud, and custom-quote enterprise plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2015,
  company_size = $q$150+ employees$q$,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rocket.Chat: open-source team messaging platform with self-hosted, cloud, and enterprise plans for secure, compliant communication.$q$,
  og_description = $q$Rocket.Chat: open-source team messaging platform with self-hosted, cloud, and enterprise plans for secure, compliant communication.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '376dca7b-3bc4-46f6-ae09-635baf27d62b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '376dca7b-3bc4-46f6-ae09-635baf27d62b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Unified messaging$q$, $q$Chat, voice calls, video, and screen sharing in one platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Federation$q$, $q$Federated communication across separate Rocket.Chat organizations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Apps-Engine$q$, $q$Build custom apps and integrations on Rocket.Chat's extensibility framework.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Deployment flexibility$q$, $q$Self-hosted (Docker/Kubernetes), cloud, or air-gapped deployment options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Compliance certifications$q$, $q$SOC 2, ISO/IEC 27001, GDPR, HIPAA, and DoD ATO up to IL6.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Role-based access control$q$, $q$Manage granular permissions across workspaces.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Open source (MIT license, 45.8k GitHub stars) with a self-hosted free option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Wide deployment flexibility, including air-gapped and classified environments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Broad compliance certification list, including SOC 2, ISO 27001, and HIPAA$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Founded in 2015 with an established user base across 150+ countries$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Commercial, Government, and Defense plan pricing is not published; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Enterprise compliance focus may add complexity for teams that just need basic team chat$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Federation and advanced Apps-Engine features may require technical setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Is Rocket.Chat open source?$q$, $q$Yes, it's open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Can I self-host Rocket.Chat?$q$, $q$Yes, it supports self-hosted deployment via Docker or Kubernetes, including air-gapped environments.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$How much does Rocket.Chat cost?$q$, $q$Paid Commercial, Government, and Defense plans use custom quotes; you need to contact sales for pricing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$When was Rocket.Chat founded?$q$, $q$It started as a side project of four friends in 2015.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$What compliance certifications does Rocket.Chat have?$q$, $q$SOC 2, ISO/IEC 27001, GDPR, HIPAA, and DoD Authorization to Operate up to IL6.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Self-hosted secure team chat$q$, $q$Deploy Rocket.Chat on your own infrastructure for full data control.$q$, $q$Security-conscious organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Government and defense communications$q$, $q$Use Rocket.Chat's Government and Defense plans for classified or sovereign communication needs.$q$, $q$Public sector and defense agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Commercial$q$, NULL, NULL, $q$["Deployment flexibility","Compliance across regulatory frameworks"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Government$q$, NULL, NULL, $q$["Sovereign communications for public sector agencies"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Defense$q$, NULL, NULL, $q$["Air-gapped environments","DoD ATO up to IL6"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$overview$q$, $q$What is Rocket.Chat?$q$, 2, ARRAY[$q$Rocket.Chat is an open-source communications platform combining messaging, voice, video, and AI-powered automation, founded in 2015 as a side project of four friends.$q$, $q$It supports self-hosted, cloud, and air-gapped deployments, and holds certifications including SOC 2, ISO/IEC 27001, GDPR, HIPAA, and DoD Authorization to Operate up to IL6.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$who-its-for$q$, $q$Who Rocket.Chat is for$q$, 2, ARRAY[$q$Rocket.Chat is used by security-conscious organizations that want a self-hosted, open-source chat platform, and by government and defense agencies that need sovereign or air-gapped communication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Zulip ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source team chat app organized around topic-based threads for asynchronous team communication.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6.67/user/month$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Zulip is an open-source team chat tool with topic threading. Free self-hosting or Zulip Cloud plans from $6.67/user/month.$q$,
  og_description = $q$Zulip is an open-source team chat tool with topic threading. Free self-hosting or Zulip Cloud plans from $6.67/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c920ff4f-292d-4b70-82c4-92886a22daa0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c920ff4f-292d-4b70-82c4-92886a22daa0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Topic-based threading$q$, $q$Conversations are organized into topics within channels, keeping discussions structured and easy to catch up on asynchronously.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Unified inbox$q$, $q$An inbox view surfaces unread messages across channels and topics so users can track what needs attention.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Self-hosting or cloud$q$, $q$Zulip can be self-hosted for full data control or run as a hosted Zulip Cloud service, with migration possible between the two.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Integrations and API$q$, $q$Zulip offers hundreds of integrations and a REST API for connecting to other tools and building custom workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Guest accounts$q$, $q$Organizations can invite external collaborators as guest users with restricted access.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Enterprise authentication$q$, $q$Paid plans add SAML SSO (e.g., Okta, OneLogin), SCIM user sync, and custom domains.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$100% open-source with a free self-hosted option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Topic threading keeps large teams' conversations organized better than flat channels$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Free or discounted plans for open-source projects, nonprofits, and academic research$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Both cloud-hosted and self-hosted deployment options available$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Desktop apps for Mac, Windows, and Linux plus iOS and Android mobile apps$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Plus and Business plans require a minimum number of users (10 and 25 respectively)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Free Cloud plan limits search history to 10,000 messages$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Enterprise-grade SSO (SAML, SCIM) is gated behind paid tiers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Topic-based model has a learning curve for teams used to flat channel chat$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Is Zulip free to use?$q$, $q$Yes. Zulip offers a free Cloud plan and a free self-hosted plan with all core features; paid plans add unlimited search history, higher storage, and enterprise authentication.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Can I self-host Zulip?$q$, $q$Yes, Zulip is open source under the Apache 2 license and can be self-hosted, with paid self-hosted tiers available for organizations that want more storage or support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Does Zulip offer discounts for nonprofits or open-source projects?$q$, $q$Yes, qualifying open-source projects, academic research groups, nonprofits, and small organizations can receive free or discounted access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$What platforms does Zulip support?$q$, $q$Zulip has a web app, desktop apps for Mac, Windows, and Linux, and mobile apps for iOS and Android.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Who maintains Zulip?$q$, $q$Zulip was originally built by Zulip, Inc., open-sourced by Dropbox in 2015, and is now stewarded by Kandra Labs, which is owned by the nonprofit Zulip Foundation.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Distributed team communication$q$, $q$Teams spread across time zones use Zulip's topic threading to hold organized, asynchronous discussions without losing context.$q$, $q$Remote and distributed companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Open-source project coordination$q$, $q$Open-source communities use Zulip's free tier and threaded channels to coordinate contributors and discussions.$q$, $q$Open-source maintainers and contributors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Data-sovereign deployments$q$, $q$Organizations that need to keep chat data on their own infrastructure self-host Zulip instead of using the cloud service.$q$, $q$Enterprises, government, and research institutions$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Cloud Free$q$, $q$$0$q$, NULL, $q$["10,000 messages of search history","5 GB file storage","Hundreds of integrations","Guest accounts"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Cloud Standard$q$, $q$$6.67/user/month$q$, $q$annual$q$, $q$["Unlimited search history","5 GB/user storage","Custom user groups","Message retention policies"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Cloud Plus$q$, $q$$10/user/month$q$, $q$annual$q$, $q$["All Standard features","25 GB/user storage","SAML SSO","SCIM sync","Custom domain"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Self-Hosted Free$q$, $q$$0$q$, NULL, $q$["All Zulip features","Unlimited mobile notifications for eligible communities"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Self-Hosted Basic$q$, $q$$3.50/user/month$q$, $q$monthly$q$, $q$["All features","Unlimited mobile notifications"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Self-Hosted Business$q$, $q$$6.67/user/month$q$, $q$annual$q$, $q$["Enterprise authentication (SAML, AD/LDAP)","Guest access","Data exports","Retention policies"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Self-Hosted Enterprise$q$, $q$Contact sales$q$, NULL, $q$["Phone/email/chat support","OpenID Connect SSO","SCIM sync","Custom development"]$q$::jsonb, 6);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$overview$q$, $q$What is Zulip?$q$, 2, ARRAY[$q$Zulip is an open-source team chat application built around topic-based threading, which groups messages within channels into distinct topics so conversations stay organized and searchable.$q$, $q$It was originally built as a startup, acquired by Dropbox in 2014, and open-sourced under the Apache 2 license in 2015. Development is now led by Kandra Labs, which is owned by the nonprofit Zulip Foundation.$q$, $q$Zulip is available as a hosted Zulip Cloud service or as self-hosted software, with the ability to migrate between the two.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$who-its-for$q$, $q$Who Zulip is for$q$, 2, ARRAY[$q$Zulip is aimed at distributed teams, open-source projects, academic and research communities, and organizations that want asynchronous, threaded discussions rather than a flat, real-time chat feed.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Element ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Secure messaging and collaboration app built on the open Matrix protocol, offering end-to-end encrypted chat and calls.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Element is an end-to-end encrypted messaging app built on the Matrix protocol, with a free open-source Community edition and paid Enterprise/Sovereign tiers.$q$,
  og_description = $q$Element is an end-to-end encrypted messaging app built on the Matrix protocol, with a free open-source Community edition and paid Enterprise/Sovereign tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7a0ebe08-e4d6-46da-a624-6b276c676577';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7a0ebe08-e4d6-46da-a624-6b276c676577' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$End-to-end encryption$q$, $q$Messages and calls are end-to-end encrypted by default across Element clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Decentralized/federated architecture$q$, $q$Built on the Matrix open standard, Element supports federation and interoperability between separate organizations' servers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Element Call$q$, $q$Built-in voice and video calling is included as part of the Element client.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Air-gapped deployment$q$, $q$The Sovereign plan supports deployments that operate entirely without internet connectivity.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Enterprise identity management$q$, $q$Enterprise and Sovereign plans add LDAP, Active Directory, and OIDC/SSO integration, plus auditing and retention policies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Self-hosted homeserver$q$, $q$Organizations can run their own Matrix homeserver (Synapse or Synapse Pro via Element Server Suite Pro) instead of relying on Element's infrastructure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Open-source Community edition available for free, self-hosted use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$End-to-end encryption included across plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Decentralized Matrix protocol avoids vendor lock-in and single points of failure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Used by government and defense organizations, indicating strong security vetting$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Holds Cyber Essentials Plus, ISO/IEC 27001:2022, and OpenChain ISO/IEC 5230 certifications$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Enterprise and Sovereign plan pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Full enterprise identity/security features require the paid Enterprise Server Suite Pro$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Federated architecture adds operational complexity compared to a single hosted SaaS chat tool$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Is Element free to use?$q$, $q$Yes, Element's Community edition is free and open source under AGPL for self-hosted, non-professional deployments and evaluations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$What protocol does Element use?$q$, $q$Element is built on Matrix, an open, decentralized communication standard.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Does Element support end-to-end encryption?$q$, $q$Yes, end-to-end encryption is included on all plans for messages and calls.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Can Element run without internet access?$q$, $q$Yes, the Sovereign plan supports air-gapped deployments via Element Server Suite Pro.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Who uses Element?$q$, $q$Element is used by government and defense organizations, including bodies referenced by Element such as NATO, US Space Force, and the Bundeswehr, as well as private enterprises.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Secure government communication$q$, $q$Government and defense organizations use Element for encrypted, sovereign-controlled messaging that can run air-gapped.$q$, $q$Government and defense agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Cross-organization collaboration$q$, $q$Matrix's federated architecture lets separate organizations communicate securely without merging infrastructure.$q$, $q$Enterprises needing cross-border or cross-org messaging$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Self-hosted team chat$q$, $q$Teams that want full control of their data run the free Community edition on their own servers.$q$, $q$Privacy-focused organizations and open-source communities$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Community$q$, $q$Free$q$, NULL, $q$["Self-hosted deployment","Open source under AGPL","Includes Element Call","For non-professional deployments and evaluations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Enterprise$q$, $q$Custom (per seat/month)$q$, NULL, $q$["Element Server Suite Pro with Synapse Pro","LDAP/AD/OIDC identity management","Auditing, retention, data export","Level 3 support with SLA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Sovereign$q$, $q$Custom (per deployment)$q$, NULL, $q$["Air-gapped deployment","Element Server Suite Pro with Synapse Pro","Dedicated mobile push gateway","Enterprise-grade security and compliance"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$overview$q$, $q$What is Element?$q$, 2, ARRAY[$q$Element is a secure messaging and collaboration platform built on the Matrix open standard, providing end-to-end encrypted chat and calls with a decentralized, federated architecture.$q$, $q$The company behind Element was founded in 2017 as New Vector Ltd, a spin-out from Amdocs, and rebranded to Element in 2020. It is headquartered in the United Kingdom with additional entities in Germany, France, and the United States.$q$, $q$Element offers a free, open-source Community edition alongside paid Enterprise and Sovereign tiers built around Element Server Suite Pro for organizations needing advanced identity management, support SLAs, or air-gapped deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$who-its-for$q$, $q$Who Element is for$q$, 2, ARRAY[$q$Element is aimed at organizations that need sovereign, encrypted communication — including government, defense, and enterprises that require data control, federation between organizations, or air-gapped deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── MiroTalk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source WebRTC video conferencing platform with peer-to-peer, SFU, and end-to-end encrypted call modes.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MiroTalk is an open-source WebRTC video conferencing platform you can self-host, offering P2P, SFU, and encrypted call variants.$q$,
  og_description = $q$MiroTalk is an open-source WebRTC video conferencing platform you can self-host, offering P2P, SFU, and encrypted call variants.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f5b98a61-eacf-4efe-aaf6-07eff41492b5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f5b98a61-eacf-4efe-aaf6-07eff41492b5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Peer-to-peer video calls (P2P)$q$, $q$MiroTalk P2P connects participants directly over WebRTC without routing media through a central server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$SFU mode for larger meetings$q$, $q$MiroTalk SFU uses a selective forwarding unit architecture to support more participants than pure P2P allows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$High-resolution video$q$, $q$Supports video up to 8K resolution at 60fps along with screen sharing and recording.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Chat and collaborative whiteboard$q$, $q$Includes text chat with markdown support and a collaborative whiteboard alongside video.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$REST API and embedding$q$, $q$Offers a full REST API and embeddable widgets/iframe integration for adding video calling to other sites.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Self-hosted deployment$q$, $q$Can be deployed on your own server via Docker or Node.js in minutes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Free, open-source, and self-hostable under AGPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$No download, plug-in, or login required to join a call$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Multiple architecture variants (P2P, SFU, C2C) to fit different use cases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Full REST API for embedding video calling into other products$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Supports up to 8K/60fps video and multi-language interfaces$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$The root mirotalk.com domain does not resolve to an active marketing site, which can make discovery confusing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Peer-to-peer mode's quality depends on client hardware and network conditions rather than server infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$AGPLv3 requires derivative works to also be open source unless a separate commercial license is purchased$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$No official hosted enterprise support plan is documented$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Is MiroTalk free to use?$q$, $q$Yes, MiroTalk is free and open source under the AGPLv3 license, and can be self-hosted at no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Do I need to create an account to join a MiroTalk call?$q$, $q$No, MiroTalk is designed so users can join calls without downloads, plug-ins, or logins.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$What's the difference between MiroTalk P2P and SFU?$q$, $q$MiroTalk P2P connects participants directly to each other, while MiroTalk SFU routes media through a selective forwarding unit server to support larger meetings.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Can I self-host MiroTalk?$q$, $q$Yes, MiroTalk can be deployed on your own server using Docker or Node.js.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Is there a commercial license for MiroTalk?$q$, $q$Yes, in addition to the free AGPLv3 license, commercial licenses are available via CodeCanyon for closed-source use.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Embedded video calling$q$, $q$Developers use MiroTalk's REST API and iframe embedding to add video calls directly into their own websites or apps.$q$, $q$Developers building custom communication features$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Privacy-focused self-hosted meetings$q$, $q$Organizations self-host MiroTalk to keep video call infrastructure entirely under their own control.$q$, $q$Privacy-conscious teams and organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Ad-hoc peer-to-peer calls$q$, $q$Individuals use MiroTalk P2P for quick, no-signup video calls shared via a link.$q$, $q$Individuals and small teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$overview$q$, $q$What is MiroTalk?$q$, 2, ARRAY[$q$MiroTalk is an open-source WebRTC video conferencing platform that can be self-hosted on your own server. It is distributed in several variants, including MiroTalk P2P for direct peer-to-peer calls, MiroTalk SFU for larger meetings routed through a selective forwarding unit, and MiroTalk C2C for end-to-end encrypted cam-to-cam calls.$q$, $q$The project is developed by Miroslav Pejic and is licensed under AGPLv3, with a commercial license available through CodeCanyon for use cases requiring closed-source distribution.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$who-its-for$q$, $q$Who MiroTalk is for$q$, 2, ARRAY[$q$MiroTalk is aimed at developers who want to embed video calling into their own products, and at organizations that want a self-hosted, no-login video conferencing tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── BigBlueButton ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source virtual classroom platform for online education with whiteboards, breakout rooms, and LMS integrations.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2007,
  company_size = NULL,
  headquarters = $q$Ottawa, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$BigBlueButton is an open-source virtual classroom platform with whiteboards, breakout rooms, and polling, self-hostable or commercially hosted.$q$,
  og_description = $q$BigBlueButton is an open-source virtual classroom platform with whiteboards, breakout rooms, and polling, self-hostable or commercially hosted.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c6128d24-7ad0-4f60-87ac-6b8a21ef5c99';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c6128d24-7ad0-4f60-87ac-6b8a21ef5c99' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Multi-user whiteboard$q$, $q$Presenters and participants can annotate and collaborate on a shared whiteboard during sessions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Breakout rooms$q$, $q$Sessions can be split into breakout rooms for small-group collaborative work.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Document and slide sharing$q$, $q$Supports uploading PowerPoint, Word, PDF, and image files for presentation during sessions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Polling and hand-raise tools$q$, $q$Includes live polling, emoji reactions, and hand-raise features for gauging engagement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Session recording and playback$q$, $q$Sessions can be recorded and played back in multiple resolutions afterward.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$LMS integrations$q$, $q$Integrates with learning management systems including Canvas, Moodle, Sakai, Jenzabar, D2L, and Schoology.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Open source under LGPL-3.0 with a self-hosted install option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Purpose-built for online education rather than general business meetings$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Deep integration with major LMS platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Used daily across 65+ languages according to the project$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Installable in about 30 minutes via the bbb-install.sh script on Ubuntu$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Self-hosting requires server administration and Ubuntu 22.04 infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Focused specifically on classroom/education use cases rather than general business video conferencing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Commercial hosted pricing is not published on the main site and requires going through bigbluebutton.com$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Is BigBlueButton free?$q$, $q$Yes, BigBlueButton is open source under the LGPL-3.0 license and can be self-hosted for free; commercial hosting is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Can I self-host BigBlueButton?$q$, $q$Yes, it can be installed on Ubuntu 22.04 using the bbb-install.sh script, with full documentation at docs.bigbluebutton.org.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Does BigBlueButton integrate with learning management systems?$q$, $q$Yes, it integrates with LMS platforms including Canvas, Moodle Cloud, Sakai, Jenzabar, D2L, and Schoology.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Who created BigBlueButton?$q$, $q$BigBlueButton originated from Carleton University's Technology Innovation Management program in Ottawa, Canada in 2007, and is now sponsored by Blindside Networks.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Does BigBlueButton support breakout rooms and whiteboards?$q$, $q$Yes, it includes breakout rooms, a multi-user whiteboard, shared notes, and screen sharing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$K-12 online classrooms$q$, $q$Schools use BigBlueButton's classroom-specific tools like polling and breakout rooms for remote instruction.$q$, $q$K-12 schools$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Higher education distance learning$q$, $q$Universities integrate BigBlueButton with LMS platforms like Canvas and Moodle for online courses.$q$, $q$Colleges and universities$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Self-hosted institutional deployment$q$, $q$Institutions with data control requirements self-host BigBlueButton on their own servers rather than using a commercial host.$q$, $q$IT departments at educational and government institutions$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$overview$q$, $q$What is BigBlueButton?$q$, 2, ARRAY[$q$BigBlueButton is an open-source virtual classroom platform purpose-built for online education, distinguishing it from general-purpose video conferencing tools. It includes a multi-user whiteboard, breakout rooms, document sharing, polling, and session recording.$q$, $q$The project originated from Carleton University's Technology Innovation Management program in Ottawa, Canada, in 2007, and is now sponsored by Blindside Networks, which offers commercial hosting and support.$q$, $q$It is licensed under LGPL-3.0 and can be self-hosted on Ubuntu 22.04, or used through commercial hosted services.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$who-its-for$q$, $q$Who BigBlueButton is for$q$, 2, ARRAY[$q$BigBlueButton is built for K-12 schools, higher education institutions, and government organizations delivering online instruction, particularly those already using an LMS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Galene ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, self-hosted MIT-licensed videoconference server built for low server resource requirements.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Galene is a free, open-source videoconference server built in Go that is easy to self-host and runs on modest server resources.$q$,
  og_description = $q$Galene is a free, open-source videoconference server built in Go that is easy to self-host and runs on modest server resources.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '36449a40-80e5-4dd6-8164-c731f720d4dd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '36449a40-80e5-4dd6-8164-c731f720d4dd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Low resource requirements$q$, $q$Galene is designed to be easy to host and requires very moderate server resources compared to other conferencing servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Multiple codec support$q$, $q$Supports VP8, VP9, H.264, and AV1 video codecs along with simulcast and scalable video coding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Screen sharing and background blur$q$, $q$Client features include screen sharing, background blur, and file transfer.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Recording and text chat$q$, $q$The server supports session recording, text chat, and activity detection during meetings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Group moderation tools$q$, $q$Includes moderation controls for managing participants in group calls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Portable across platforms$q$, $q$The server runs on Go using the Pion WebRTC implementation and is tested on Linux/amd64, Linux/arm64, macOS, and Windows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Requires very moderate server resources, making it cheap to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Supports modern codecs including AV1 and VP9 with simulcast$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Portable across Linux, macOS, and Windows$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$In active academic use at institutions like Université de Paris and Sorbonne Université$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Does not perform end-to-end encryption, so self-hosting is recommended for privacy$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Requires manual setup or Yunohost installation rather than a managed hosted option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$No official company or commercial support channel; maintained by an individual author$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Mobile support is limited to mobile browsers rather than native apps$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Is Galene free?$q$, $q$Yes, Galene is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Does Galene support end-to-end encryption?$q$, $q$No, Galene does not perform end-to-end encryption, so the author recommends self-hosting for optimal privacy.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$What platforms can Galene run on?$q$, $q$The server is tested on Linux/amd64 and Linux/arm64, and also runs on macOS and Windows.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Who maintains Galene?$q$, $q$Galene is authored by Juliusz Chroboczek, with development currently supported by NLnet's NGI0Core program.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$How do I install Galene?$q$, $q$Galene can be installed manually or via Yunohost.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$University lectures and seminars$q$, $q$Universities such as Université de Paris and Sorbonne Université use Galene for lectures, practicals, and seminars.$q$, $q$Academic institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Low-resource self-hosted meetings$q$, $q$Organizations with limited server capacity self-host Galene because of its moderate resource requirements.$q$, $q$Small organizations and individuals hosting their own conferencing infrastructure$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Conference and event video$q$, $q$Galene has been used to run video for events and conferences such as SOCS'2020 and LibrePlanet 2024.$q$, $q$Conference and event organizers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$overview$q$, $q$What is Galene?$q$, 2, ARRAY[$q$Galene is a videoconference server designed to be easy to host and to require very moderate server resources. It was originally built for academic settings but has proven suitable for traditional meetings as well.$q$, $q$The server is written in Go using the Pion WebRTC implementation, supports codecs including VP8, VP9, H.264, and AV1 with simulcast and scalable video coding, and is free and open source under the MIT license.$q$, $q$It is authored by Juliusz Chroboczek, with development supported by NLnet's NGI0Core program.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$who-its-for$q$, $q$Who Galene is for$q$, 2, ARRAY[$q$Galene is aimed at universities, privacy-conscious organizations, and individuals who want to self-host a lightweight video conferencing server without heavy infrastructure requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Briefing ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, peer-to-peer video group chat that runs in the browser with no installation required.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Briefing is a free, open-source, peer-to-peer video group chat that works in the browser, with self-hosting and iOS app options.$q$,
  og_description = $q$Briefing is a free, open-source, peer-to-peer video group chat that works in the browser, with self-hosting and iOS app options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53194735-82e1-4a27-b2dc-b4ed0454db1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53194735-82e1-4a27-b2dc-b4ed0454db1e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Peer-to-peer video chat$q$, $q$Video and data are sent directly between participants (mesh architecture) rather than routed through a central server under normal operation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Desktop sharing$q$, $q$Participants can share their screen during a call.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Text chat$q$, $q$Includes in-call text chat alongside video.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Simple invitation links$q$, $q$Rooms can be started and shared instantly via a link at brie.fi/ng.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$iOS app$q$, $q$A free iOS app is available in addition to the browser-based web client.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Iframe embedding$q$, $q$Briefing can be embedded into other websites via iframe.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Free to use instantly at brie.fi/ng with no account required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Open source under AGPL-3.0$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Peer-to-peer architecture means call data doesn't normally pass through the server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Self-hostable via Docker on providers like fly.io, Render, Google Cloud, AWS, or Azure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Actively maintained, with releases continuing into the current release cycle$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$A commercial license is required for white-labeling or closed-source derivatives$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Peer-to-peer mesh architecture can strain performance in larger group calls$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$No Android app is documented, only iOS$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Maintained primarily by a single developer rather than a larger organization$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Is Briefing free?$q$, $q$Yes, Briefing is free to use at brie.fi/ng and is open source under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Can I self-host Briefing?$q$, $q$Yes, Briefing can be self-hosted via Docker on services such as fly.io, Render, Google Cloud, AWS, or Azure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Does Briefing require an account or app install?$q$, $q$No, Briefing runs directly in the browser with no download required; a free iOS app is also available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Is Briefing's data routed through a server?$q$, $q$No, Briefing uses a peer-to-peer mesh architecture, so call data does not normally travel over the server.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Is there a commercial license for Briefing?$q$, $q$Yes, a commercial license is available for white-labeling or closed-source use, separate from the free AGPL-3.0 license.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Quick ad-hoc video calls$q$, $q$Users start an instant, link-based video call at brie.fi/ng without creating an account.$q$, $q$Individuals needing a fast, no-signup video call$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Embedded video chat$q$, $q$Website owners embed Briefing via iframe to add video chat directly into their own site.$q$, $q$Developers and website owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Self-hosted private video chat$q$, $q$Privacy-conscious users deploy their own Briefing instance via Docker for full control over their video chat infrastructure.$q$, $q$Privacy-focused individuals and organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$overview$q$, $q$What is Briefing?$q$, 2, ARRAY[$q$Briefing is an open-source, peer-to-peer video group chat application that runs directly in the browser using WebRTC, with no software installation required. Video and data are sent directly between participants under normal operation rather than routed through a central server.$q$, $q$It is available for free at brie.fi/ng, can be embedded via iframe, and can be self-hosted using Docker on providers such as fly.io, Render, Google Cloud, AWS, or Azure. The project is licensed under AGPL-3.0, with a separate commercial license available for white-labeling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$who-its-for$q$, $q$Who Briefing is for$q$, 2, ARRAY[$q$Briefing is aimed at individuals who want an instant, no-signup video call, and at developers who want to embed or self-host a privacy-focused, peer-to-peer video chat tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Nextcloud Talk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source video meetings, chat, and webinars app integrated into the Nextcloud collaboration platform.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€42/user/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nextcloud Talk is a self-hosted, open-source video meetings and chat app, free to self-host with Enterprise Talk plans from €42/user/year.$q$,
  og_description = $q$Nextcloud Talk is a self-hosted, open-source video meetings and chat app, free to self-host with Enterprise Talk plans from €42/user/year.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$End-to-end encrypted calls$q$, $q$Supports end-to-end encrypted calls and federated chat/video across Nextcloud instances.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Threaded conversations$q$, $q$Chat supports threaded conversations for organizing discussions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$AI-powered summaries$q$, $q$Offers AI-powered chat and call summaries and live meeting translation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Screen sharing and webinars$q$, $q$Supports screen sharing, webinars, and public video conferencing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Deep Nextcloud integration$q$, $q$Integrates with Nextcloud Files, Groupware, and Office applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Cross-platform bridging$q$, $q$Can bridge with other networks including Teams, Slack, and Matrix.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Fully self-hosted and open source, supporting air-gapped deployments$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Deep integration with the broader Nextcloud suite (Files, Groupware, Office)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Supports on-premises deployment for GDPR compliance and data sovereignty$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Desktop apps for Windows, macOS, and Linux plus mobile apps for Android and iOS$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Used by organizations such as the Austrian Federal Ministry, Deutsche Telekom, and Amnesty International$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Standalone Talk pricing isn't listed separately from the broader Nextcloud Enterprise plans on the pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Enterprise pricing scales per-user and requires minimum user counts (starting at 100 users on published tiers)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Advanced features like AI summaries and a High Performance Backend for large calls require enterprise tiers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Requires self-managed Nextcloud infrastructure unless using a third-party Nextcloud hosting provider$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Is Nextcloud Talk free?$q$, $q$Yes, Nextcloud Talk is open source and free to self-host as part of Nextcloud; paid Enterprise Talk plans add extended support and scaling features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Does Nextcloud Talk support end-to-end encryption?$q$, $q$Yes, it supports end-to-end encrypted calls and federated chat/video.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$What platforms does Nextcloud Talk support?$q$, $q$It's available on the web, desktop apps for Windows, macOS, and Linux, and mobile apps for Android and iOS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Can Nextcloud Talk run without internet access?$q$, $q$Yes, it supports on-premises and air-gapped deployments.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$What does the Enterprise Talk plan cost?$q$, $q$Published Enterprise Talk pricing starts at €42/user/year for 100 users, dropping to €31.50/user/year at 250 users.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Data-sovereign video meetings$q$, $q$Government agencies and enterprises self-host Nextcloud Talk to keep meeting data within their own infrastructure.$q$, $q$Government agencies and regulated enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Integrated team collaboration$q$, $q$Organizations already using Nextcloud Files and Groupware add Talk for meetings and chat within the same platform.$q$, $q$Existing Nextcloud users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Air-gapped communication$q$, $q$Organizations with strict network isolation requirements run Nextcloud Talk without internet connectivity.$q$, $q$High-security and defense-adjacent organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Standard Talk$q$, $q$€42/user/year$q$, $q$annual$q$, $q$["Secure online meetings, chat, and web conferencing","SIP bridge"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Standard Talk (250 users)$q$, $q$€31.50/user/year$q$, $q$annual$q$, $q$["Secure online meetings, chat, and web conferencing","SIP bridge"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$overview$q$, $q$What is Nextcloud Talk?$q$, 2, ARRAY[$q$Nextcloud Talk is a self-hosted, open-source communication app for meetings, chat, and webinars, integrated into the Nextcloud collaboration platform. It supports end-to-end encrypted calls, federated chat and video, threaded conversations, and AI-powered call summaries.$q$, $q$It integrates with other Nextcloud apps such as Files, Groupware, and Office, and can bridge with external networks like Teams, Slack, and Matrix. Nextcloud offers paid Enterprise Talk plans with extended support and a High Performance Backend for scaling large calls.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$who-its-for$q$, $q$Who Nextcloud Talk is for$q$, 2, ARRAY[$q$Nextcloud Talk is aimed at government agencies, universities, enterprises, and service providers that need self-hosted, GDPR-compliant video meetings and chat integrated with broader file and office collaboration tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Synapse ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Matrix homeserver implementation written in Python/Twisted and Rust, maintained by Element.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Synapse is the free, open-source reference Matrix homeserver implementation maintained by Element, licensed under AGPL-3.0.$q$,
  og_description = $q$Synapse is the free, open-source reference Matrix homeserver implementation maintained by Element, licensed under AGPL-3.0.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Matrix protocol homeserver$q$, $q$Synapse implements the Matrix decentralized communication protocol, allowing federation with other Matrix homeservers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Single Sign-On support$q$, $q$Supports SSO authentication for user login.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Admin API$q$, $q$Provides an administrative API for managing users and the instance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Pluggable modules$q$, $q$Supports pluggable modules for extending server behavior.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Worker processes for scaling$q$, $q$Can be split into worker processes to scale larger deployments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Monitoring and metrics$q$, $q$Integrates with monitoring and metrics tooling, plus structured logging options.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Free and open source, available under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Reference implementation of the open Matrix protocol, ensuring broad interoperability$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Actively maintained by Element on GitHub with an open contribution process$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Supports horizontal scaling via worker processes for larger deployments$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$A commercial license (Element Commercial License) is available for organizations that don't want AGPL obligations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Requires self-hosting and server administration; there is no first-party managed Synapse cloud$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$AGPL-3.0 licensing requires derivative works to be open-sourced unless a commercial license is purchased$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Written primarily in Python/Twisted with Rust components, requiring familiarity with that stack to operate or extend$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Scaling to large deployments requires configuring worker processes rather than working out of the box$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Is Synapse free?$q$, $q$Yes, Synapse is free and open source under the AGPL-3.0 license; a paid commercial license is also available from Element for organizations that need different license terms.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$What is Synapse used for?$q$, $q$Synapse is a homeserver implementation for the Matrix protocol, used to host and federate chat and communication data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Who maintains Synapse?$q$, $q$Synapse is maintained by Element, with the codebase hosted at github.com/element-hq/synapse.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$What language is Synapse written in?$q$, $q$Synapse is written primarily in Python/Twisted, with some components in Rust.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Can I self-host Synapse?$q$, $q$Yes, Synapse is designed to be installed and configured as a self-hosted Matrix homeserver.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Self-hosted Matrix homeserver$q$, $q$Organizations run their own Synapse instance to host Matrix-based chat for their users under their own control.$q$, $q$IT teams and organizations wanting a self-hosted messaging backend$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Federated communication infrastructure$q$, $q$Synapse powers federation between separate Matrix homeservers, enabling cross-organization messaging.$q$, $q$Organizations needing interoperable, decentralized messaging$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Foundation for Matrix clients$q$, $q$Developers use Synapse as the backend for Matrix clients such as Element or custom-built chat applications.$q$, $q$Developers building on the Matrix protocol$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$overview$q$, $q$What is Synapse?$q$, 2, ARRAY[$q$Synapse is the reference server implementation of the Matrix protocol, a decentralized standard for secure communication. It is written primarily in Python/Twisted with some Rust components and is maintained by Element on GitHub.$q$, $q$Synapse is free and open source under the AGPL-3.0 license, with a separate commercial license available from Element for organizations that need different terms. It supports SSO, an admin API, pluggable modules, and worker processes for scaling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$who-its-for$q$, $q$Who Synapse is for$q$, 2, ARRAY[$q$Synapse is aimed at operators who want to run their own Matrix homeserver, and developers building on the Matrix protocol who need a reference server implementation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Forem ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source community platform for building discussion and publishing communities, powering the dev.to network.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Forem is the open-source AGPL-3.0 community platform behind dev.to, letting you self-host a discussion and publishing community.$q$,
  og_description = $q$Forem is the open-source AGPL-3.0 community platform behind dev.to, letting you self-host a discussion and publishing community.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '104c1524-087c-4a12-b6f7-1c69780a1d4b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '104c1524-087c-4a12-b6f7-1c69780a1d4b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Article publishing$q$, $q$Members can publish articles and build a public profile within a community.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Discussion communities$q$, $q$Supports building communities for peers, customers, or any group that needs a shared space.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$AI-powered feed$q$, $q$Uses AI embeddings via PostgreSQL's pgvector extension to power semantic recommendations in the content feed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Self-hosted deployment$q$, $q$Forem can be self-hosted using Docker and Kamal deployment tooling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Open-source codebase$q$, $q$Built with Ruby on Rails on the backend and transitioning to Preact on the frontend, with an active open contribution process.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Powers dev.to$q$, $q$Dev.to, a large professional network for software developers, runs on the Forem platform as its flagship community.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Open source under AGPL-3.0 and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Proven at scale as the platform powering dev.to, a major developer community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Actively maintained, with tens of thousands of GitHub stars and thousands of commits$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Supports Docker-based self-hosted deployment via Kamal$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$AI-powered semantic feed recommendations built in$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$The standalone forem.com marketing site now redirects to dev.to, making it less clear how to evaluate Forem as a separate product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Self-hosting requires managing a Ruby on Rails stack with a PostgreSQL database and pgvector extension$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Contributors must sign a Contributor License Agreement to submit changes$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$No published pricing plans for a managed/hosted version of Forem itself$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Is Forem free?$q$, $q$Yes, Forem is open-source software under the AGPL-3.0 license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$What is the relationship between Forem and dev.to?$q$, $q$Dev.to is the flagship community built on and hosted by the Forem platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Can I self-host Forem?$q$, $q$Yes, Forem supports self-hosting using Docker and Kamal deployment tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$What tech stack does Forem use?$q$, $q$Forem's backend is built with Ruby on Rails, its frontend is transitioning to Preact, and it uses PostgreSQL with the pgvector extension for AI-powered feed features.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$When was Forem founded?$q$, $q$Forem was founded in 2017.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Developer and professional communities$q$, $q$Organizations use Forem to build article-publishing communities similar to dev.to for a specific audience or industry.$q$, $q$Community managers and professional networks$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Self-hosted brand communities$q$, $q$Companies self-host Forem to run a discussion and publishing space for their customers or fans under their own infrastructure.$q$, $q$Businesses building owned-and-operated communities$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Open-source contribution$q$, $q$Developers contribute to the Forem codebase itself to add features used across all Forem-powered communities.$q$, $q$Open-source contributors and Ruby on Rails developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$overview$q$, $q$What is Forem?$q$, 2, ARRAY[$q$Forem is open-source software for building communities — discussion and publishing spaces for peers, customers, fanbases, or any group that needs a shared space. It was founded in 2017, and dev.to, a large professional network for software developers, is its flagship community.$q$, $q$Forem is built with Ruby on Rails and is transitioning its frontend to Preact, using PostgreSQL with the pgvector extension to power AI-based feed recommendations. The project is licensed under AGPL-3.0 and can be self-hosted via Docker and Kamal.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$who-its-for$q$, $q$Who Forem is for$q$, 2, ARRAY[$q$Forem is aimed at organizations and community builders who want to run a self-hosted, article-publishing discussion community similar to dev.to, as well as developers who want to contribute to or build on the open-source platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── HumHub ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source intranet and community platform with a free self-hosted edition plus paid Professional and Enterprise editions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$From €36/month (Professional Edition, hosted SaaS base tier)$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = $q$Munich, Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$HumHub is an open-source intranet and community platform with a free self-hosted edition plus paid Professional and Enterprise plans.$q$,
  og_description = $q$HumHub is an open-source intranet and community platform with a free self-hosted edition plus paid Professional and Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5a7a7d03-38e8-4c10-aa13-d20c62a48b08';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5a7a7d03-38e8-4c10-aa13-d20c62a48b08' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$People profiles$q$, $q$User profiles and a searchable member directory.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Spaces$q$, $q$Dedicated areas for teams, projects, or interest groups.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Content tools$q$, $q$Posts, file sharing, and wiki pages inside each space.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$80+ modules$q$, $q$Marketplace extensions such as Wiki, Calendar, Messenger, and SAML-SSO.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Granular permissions$q$, $q$Configurable access control across spaces and content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Full-text search$q$, $q$Search across posts, files, and spaces.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Dashboard and notifications$q$, $q$Central activity feed and notification system.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Free, self-hostable Community Edition with full source access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$80+ optional modules for extending functionality$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Choice of on-premise or GDPR-compliant EU SaaS hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Transparent, monthly-cancellable SaaS billing with no lock-in between hosting types$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Premium support, commercial license, and exclusive modules require a paid Professional or Enterprise edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$SaaS pricing scales with user count and requires configuration on the pricing page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Enterprise-tier pricing is custom/quote-based$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Is HumHub free to use?$q$, $q$The Community Edition is free and open source for self-hosting. Professional and Enterprise editions add paid support, hosting, and extra modules.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Can HumHub be self-hosted?$q$, $q$Yes, both the free Community Edition and the paid Professional Edition support on-premise deployment, alongside an optional SaaS hosting option.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$What does the Professional SaaS plan cost?$q$, $q$Pricing starts around €36/month and scales with the number of user accounts and the chosen onboarding package, billed monthly or annually.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Where is HumHub based?$q$, $q$HumHub GmbH & Co. KG is headquartered in Munich, Germany.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Company intranet$q$, $q$Centralize internal communication, files, and team spaces for an organization.$q$, $q$Businesses and internal IT/HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Nonprofit and public sector collaboration$q$, $q$Provide a GDPR-compliant collaboration hub for nonprofits and public institutions.$q$, $q$Nonprofits and public institutions$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$University community platform$q$, $q$Support student and staff collaboration in an academic setting.$q$, $q$Universities$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Self-hosted","Open source","Core platform features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Professional Edition$q$, $q$From €36/month (SaaS)$q$, $q$monthly$q$, $q$["On-premise or SaaS hosting","Premium support","Commercial license","Onboarding packages"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Enterprise Edition$q$, $q$Custom$q$, NULL, $q$["Dedicated support","Individual workshops","Tailored project plans"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$overview$q$, $q$What is HumHub?$q$, 2, ARRAY[$q$HumHub is an open-source intranet and community collaboration platform built around four pillars: People, Spaces, Content, and Modules. Organizations use it to run internal social intranets, project spaces, and knowledge hubs.$q$, $q$It ships as a free, self-hostable Community Edition, with paid Professional and Enterprise editions adding hosted SaaS options, premium support, a commercial license, and access to additional modules.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$who-its-for$q$, $q$Who HumHub is for$q$, 2, ARRAY[$q$HumHub is aimed at companies, nonprofits, public institutions, and universities that want an intranet or community platform they can either self-host for free or run as a supported, hosted service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mastodon ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mastodon is free, open-source, decentralized microblogging software built on the ActivityPub federation protocol.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mastodon is free, open-source, decentralized microblogging software that lets anyone join or self-host a federated social network.$q$,
  og_description = $q$Mastodon is free, open-source, decentralized microblogging software that lets anyone join or self-host a federated social network.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9fecdcd9-2620-4cdf-982f-3615b76750b1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9fecdcd9-2620-4cdf-982f-3615b76750b1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Federated network$q$, $q$Connects independently operated servers into the ActivityPub-based fediverse.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Chronological timeline$q$, $q$No algorithmic ranking or ad-driven feed manipulation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Rich media posts$q$, $q$Support for images, video, audio attachments, and polls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Accessibility tools$q$, $q$Content warnings and image alt-text descriptions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Custom emoji$q$, $q$Server-specific custom emoji support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Self-hosting$q$, $q$Run an independent instance with full server-level moderation control.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Official mobile apps$q$, $q$Official iOS and Android apps for accessing Mastodon.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Free and open-source software (AGPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$No advertising or algorithmic feed manipulation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Fully self-hostable for complete control over data and moderation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Official iOS and Android apps in addition to web access$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Interoperates with other ActivityPub fediverse platforms$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$No official managed hosting sold directly by the Mastodon project$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Self-hosting an instance requires server administration skills$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Sustained by donations and sponsors rather than a dedicated commercial support tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Is Mastodon free?$q$, $q$Yes, Mastodon is entirely free and open-source software, sustained by donations rather than paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Can I self-host Mastodon?$q$, $q$Yes, anyone can self-host their own Mastodon instance, or join an existing public server such as mastodon.social.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$What license is Mastodon released under?$q$, $q$Mastodon's source code is released under the AGPL-3.0 license.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Does Mastodon have mobile apps?$q$, $q$Yes, official iOS and Android apps are available in addition to the web interface.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Personal microblogging$q$, $q$Post and follow others on the open, ad-free social web.$q$, $q$Individuals seeking a decentralized microblogging platform$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Community-run instances$q$, $q$Organizations or communities can self-host their own moderated Mastodon server.$q$, $q$Communities and organizations wanting to self-host social media$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$overview$q$, $q$What is Mastodon?$q$, 2, ARRAY[$q$Mastodon is free, open-source microblogging software launched in 2016 by Eugen Rochko. Instead of one central company, Mastodon runs as thousands of independently operated servers that interconnect via the ActivityPub protocol, collectively known as the fediverse.$q$, $q$Users can join an existing public server or self-host their own, with each server setting its own moderation rules while still being able to follow and interact with accounts on other servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$who-its-for$q$, $q$Who Mastodon is for$q$, 2, ARRAY[$q$Mastodon suits individuals who want an ad-free, non-algorithmic social feed, as well as communities and organizations that want to self-host and moderate their own corner of the social web.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Misskey ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Misskey is free, open-source software for running a decentralized, ActivityPub-based social network.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Misskey is free, open-source, self-hosted social networking software with ActivityPub federation and a highly customizable UI.$q$,
  og_description = $q$Misskey is free, open-source, self-hosted social networking software with ActivityPub federation and a highly customizable UI.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bbcea426-8b22-4fd5-96ad-4e11c6da8bd2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bbcea426-8b22-4fd5-96ad-4e11c6da8bd2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$ActivityPub federation$q$, $q$Connects self-hosted instances to the wider fediverse.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Deck UI$q$, $q$Customizable, column-based layout for organizing content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$MFM rich text$q$, $q$Misskey Flavored Markdown for expressive note formatting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Custom emoji and themes$q$, $q$Server-level custom emoji, reactions, and visual themes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Channels and antennas$q$, $q$Tools for organizing and filtering content by topic.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Two-factor authentication$q$, $q$Built-in account security and privacy controls.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$REST API$q$, $q$Full API access on a Node.js backend with PostgreSQL.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Free and open-source software (AGPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Highly customizable interface (Deck UI, themes, custom emoji)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Actively developed, with over 1,300 releases on GitHub$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Full API access for building integrations and clients$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Maintained by a small volunteer team relying on donations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$No official managed hosting; requires self-hosting or joining a third-party instance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Self-hosting requires Node.js/PostgreSQL server administration$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Is Misskey free?$q$, $q$Yes, Misskey is fully free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$What license does Misskey use?$q$, $q$Misskey is released under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Who created Misskey?$q$, $q$Misskey was created by developer syuilo, with the project dating back to 2014.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Can I run my own Misskey server?$q$, $q$Yes, Misskey supports self-hosting, including Docker-based deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Self-hosted fediverse server$q$, $q$Run an independent, customizable social networking server.$q$, $q$Server admins and online communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Personal decentralized microblogging$q$, $q$Post and interact across the fediverse with a highly customizable client.$q$, $q$Individuals wanting a customizable fediverse experience$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$overview$q$, $q$What is Misskey?$q$, 2, ARRAY[$q$Misskey is free, open-source software for building decentralized, ActivityPub-based social networking services, in development since 2014 and maintained by the Misskey Project.$q$, $q$It is known for a highly customizable Deck UI, custom emoji and themes, and MFM (Misskey Flavored Markdown) for rich-text notes, alongside standard fediverse federation with platforms like Mastodon.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$who-its-for$q$, $q$Who Misskey is for$q$, 2, ARRAY[$q$Misskey is suited to server administrators and communities who want to self-host a customizable fediverse instance, and to developers building on its API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pleroma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pleroma is a free, open-source, lightweight fediverse server that federates with Mastodon, Pixelfed, and Misskey.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pleroma is a free, open-source, lightweight fediverse server with multiple frontend options and ActivityPub federation.$q$,
  og_description = $q$Pleroma is a free, open-source, lightweight fediverse server with multiple frontend options and ActivityPub federation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '87827575-d6b9-427d-9a29-d335e632d59f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '87827575-d6b9-427d-9a29-d335e632d59f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Lightweight architecture$q$, $q$Designed to run efficiently, suited to smaller servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$ActivityPub federation$q$, $q$Interoperates with Mastodon, Pixelfed, Misskey, and other fediverse software.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Multiple frontends$q$, $q$Choice of Pleroma FE, Soapbox, or Glitch-lily interfaces.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Customizable UX$q$, $q$Configurable frontend behavior and appearance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Self-hosting$q$, $q$Install and run your own instance on your own infrastructure.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Free and open-source software (AGPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Lightweight compared to some other fediverse server software$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Multiple frontend options to suit different user preferences$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Interoperable with Mastodon, Pixelfed, and Misskey via ActivityPub$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Some public instances have closed new registrations due to low staffing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Development is community/volunteer-driven and sustained by donations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$No official managed hosting sold by the project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Is Pleroma free?$q$, $q$Yes, Pleroma is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$What license does Pleroma use?$q$, $q$Pleroma is released under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Can I self-host Pleroma?$q$, $q$Yes, Pleroma is designed to be self-hosted; you can also join an existing public instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Does Pleroma federate with Mastodon?$q$, $q$Yes, Pleroma is compatible with other fediverse software including Mastodon, Pixelfed, and Misskey via ActivityPub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Lightweight self-hosted instance$q$, $q$Run a resource-efficient fediverse server for a small community.$q$, $q$Server admins with limited hosting resources$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$Custom frontend deployment$q$, $q$Choose or build a frontend tailored to a community's needs.$q$, $q$Communities wanting a customized fediverse experience$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$overview$q$, $q$What is Pleroma?$q$, 2, ARRAY[$q$Pleroma is a free, open-source fediverse server described by its maintainers as lightweight, built to enable free and open communication through the ActivityPub protocol.$q$, $q$It supports multiple frontends, including the customizable Pleroma FE, Soapbox, and Glitch-lily, and interoperates with other fediverse platforms such as Mastodon, Pixelfed, and Misskey.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$who-its-for$q$, $q$Who Pleroma is for$q$, 2, ARRAY[$q$Pleroma suits server administrators who want a resource-efficient fediverse server and communities that value frontend flexibility.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Friendica ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Friendica is a free, open-source decentralized social network federating via ActivityPub, OStatus, and diaspora*.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Friendica is free, open-source decentralized social networking software supporting ActivityPub, OStatus, and diaspora* federation.$q$,
  og_description = $q$Friendica is free, open-source decentralized social networking software supporting ActivityPub, OStatus, and diaspora* federation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7c0016ff-460a-49f3-a0f2-026bb26769d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7c0016ff-460a-49f3-a0f2-026bb26769d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Multi-protocol federation$q$, $q$Interoperates via ActivityPub, OStatus, and diaspora* protocols.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Access controls$q$, $q$Fine-grained privacy settings on posts and private group conversations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Photo sharing and events$q$, $q$Core posting, photo sharing, and event organization tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Email integration$q$, $q$Connects via IMAP4rev1/ESMTP for email-based communication.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$RSS/Atom feeds$q$, $q$Feed integration for following external content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Plugins and themes$q$, $q$Extensible via third-party plugins and custom themes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Free and open-source software (AGPLv3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Runs on standard PHP/MySQL hosting stacks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Interoperates across multiple federation protocols, not just ActivityPub$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Long-running project active since 2010 with regular releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Self-hosting requires PHP/MySQL server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Relies on volunteer development rather than a commercial vendor$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Feature set spans several legacy protocols, which can add configuration complexity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Is Friendica free?$q$, $q$Yes, Friendica is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$What license does Friendica use?$q$, $q$Friendica is released under the AGPLv3 (or later) license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Can Friendica connect with Mastodon?$q$, $q$Yes, Friendica federates with Mastodon, Pixelfed, and other ActivityPub-based platforms.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$What server software does Friendica need?$q$, $q$Friendica runs on a standard PHP and MySQL hosting stack.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Self-hosted social network$q$, $q$Run a personal or community server that connects to multiple federation protocols.$q$, $q$Individuals and communities familiar with self-hosting$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Cross-protocol communication hub$q$, $q$Bridge ActivityPub, OStatus, diaspora*, email, and RSS content in one place.$q$, $q$Users wanting a single hub for varied feeds and networks$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$overview$q$, $q$What is Friendica?$q$, 2, ARRAY[$q$Friendica is a free, open-source decentralized social network that has been in development since 2010. It federates across multiple protocols, including ActivityPub, OStatus, and diaspora*, and also integrates with email and RSS/Atom feeds.$q$, $q$It runs on standard PHP and MySQL infrastructure, and its official description notes that if you can run WordPress, you can run Friendica.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$who-its-for$q$, $q$Who Friendica is for$q$, 2, ARRAY[$q$Friendica is aimed at individuals and communities comfortable with self-hosting who want a social network that bridges several federation protocols rather than just ActivityPub.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pixelfed ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pixelfed is a free, open-source, decentralized photo-sharing platform built on ActivityPub, started in 2018.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2018,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pixelfed is a free, open-source, federated photo-sharing network with official iOS and Android apps and no algorithmic feed.$q$,
  og_description = $q$Pixelfed is a free, open-source, federated photo-sharing network with official iOS and Android apps and no algorithmic feed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '18949653-684b-4d6b-9f7f-0ba4d9594f29';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '18949653-684b-4d6b-9f7f-0ba4d9594f29' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$ActivityPub federation$q$, $q$Connects independent Pixelfed and fediverse instances.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Chronological feed$q$, $q$Photo timeline without algorithmic ranking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Self-hosting$q$, $q$Run your own independent instance with full control.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Official mobile apps$q$, $q$Official iOS and Android apps, launched in January 2025.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Hosted flagship instance$q$, $q$pixelfed.social is available as a ready-to-use public instance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Multi-language support$q$, $q$Translated via the Crowdin localization platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Free and open-source software (AGPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Official iOS and Android apps in addition to the web app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$No algorithmic feed manipulation or advertising$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Backed by sponsors including the NLnet Foundation, Fastly, and DigitalOcean$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Self-hosting requires Laravel/PHP server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$No official managed paid hosting sold directly by the Pixelfed project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Development is driven largely by a small core team$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Is Pixelfed free?$q$, $q$Yes, Pixelfed is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$What license does Pixelfed use?$q$, $q$Pixelfed is released under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Who created Pixelfed?$q$, $q$Pixelfed was started by developer Daniel Supernault (dansup) in 2018.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Does Pixelfed have a mobile app?$q$, $q$Yes, official iOS and Android apps launched in January 2025.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Decentralized photo sharing$q$, $q$Share photos on a federated, ad-free, chronological-feed platform.$q$, $q$Photographers and individuals seeking an Instagram alternative$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Self-hosted community instance$q$, $q$Run an independent, moderated photo-sharing server for a community.$q$, $q$Server admins and communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$overview$q$, $q$What is Pixelfed?$q$, 2, ARRAY[$q$Pixelfed is a free, open-source, decentralized photo-sharing platform built on the ActivityPub protocol, started by Daniel Supernault in 2018.$q$, $q$It offers a chronological, non-algorithmic feed, official iOS and Android apps launched in January 2025, and a hosted flagship instance at pixelfed.social, alongside the option to self-host an independent instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$who-its-for$q$, $q$Who Pixelfed is for$q$, 2, ARRAY[$q$Pixelfed suits individuals looking for an ad-free, algorithm-free photo-sharing alternative, as well as communities and admins who want to self-host their own federated photo server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Lemmy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lemmy is a free, open-source, federated link-aggregation and discussion platform built in Rust, a Reddit alternative.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Lemmy is a free, open-source, federated Reddit alternative built with Rust and self-hostable via Docker or Ansible.$q$,
  og_description = $q$Lemmy is a free, open-source, federated Reddit alternative built with Rust and self-hostable via Docker or Ansible.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f318e3fc-7f57-48b4-8872-a1885a2bafc0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f318e3fc-7f57-48b4-8872-a1885a2bafc0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Voting and threaded comments$q$, $q$Upvote/downvote system with nested comment discussions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Federated communities$q$, $q$Interconnected instances forming the 'Lemmyverse' via ActivityPub.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Multi-platform apps$q$, $q$Apps available across iOS, Android, desktop, and web.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Low resource usage$q$, $q$Rust backend keeps hosting requirements low enough to run on a Raspberry Pi.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Customizable themes$q$, $q$User and community tagging with emoji support, plus theme customization.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$30+ interface languages$q$, $q$Supports more than 30 languages in its user interface.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$RSS/Atom and email notifications$q$, $q$Feed export and email notification support.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Free and open-source software (AGPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$No advertising or user tracking$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Very low hosting resource requirements thanks to Rust$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Funded solely by donations, independent of venture or corporate backing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Self-hosting requires Docker/Ansible setup and server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$No official managed paid hosting sold by the project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Relies on volunteer development and community donations for sustainability$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Is Lemmy free?$q$, $q$Yes, Lemmy is free and non-commercial, with no ads or tracking, funded solely by donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$What license does Lemmy use?$q$, $q$Lemmy is released under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Can Lemmy run on low-power hardware?$q$, $q$Yes, its Rust backend keeps resource usage low enough to run on a small Raspberry Pi.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Are there mobile apps for Lemmy?$q$, $q$Yes, apps are available across iOS, Android, desktop, and web.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Community discussion forums$q$, $q$Host link-sharing and discussion communities as a Reddit alternative.$q$, $q$Communities and forum admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Self-hosted federated instance$q$, $q$Run a low-resource, independent instance connected to the wider Lemmyverse.$q$, $q$Server admins with limited hosting budgets$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$overview$q$, $q$What is Lemmy?$q$, 2, ARRAY[$q$Lemmy is a free, open-source, federated link-aggregation and discussion platform, functioning as a decentralized alternative to Reddit. Development began in 2019, and the software is built in Rust for low resource usage.$q$, $q$Lemmy instances federate with each other via ActivityPub, forming the 'Lemmyverse,' and the project is funded solely by donations rather than advertising or venture capital.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$who-its-for$q$, $q$Who Lemmy is for$q$, 2, ARRAY[$q$Lemmy is suited to communities and admins who want to run a link-aggregation/discussion forum without ads or tracking, including on low-cost or low-power hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Mobilizon ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mobilizon is free, open-source, federated software for creating, sharing, and finding events, originally built by Framasoft.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mobilizon is free, open-source, federated event-organizing software originally built by Framasoft and now maintained by Kaihuri.$q$,
  og_description = $q$Mobilizon is free, open-source, federated event-organizing software originally built by Framasoft and now maintained by Kaihuri.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6ab47ffe-4a96-4827-af17-8cd00e51800b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6ab47ffe-4a96-4827-af17-8cd00e51800b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Event creation and sharing$q$, $q$Create, edit, and share events with a public or private audience.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Group organization$q$, $q$Manage groups and coordinate members around shared events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Search and discovery$q$, $q$Find events by keyword, location, or date.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Moderation and roles$q$, $q$User roles distinguishing registered users from visitors, plus moderation tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$API and feeds$q$, $q$API access with ICS and RSS feed export.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$ActivityPub federation$q$, $q$Federates with other Mobilizon and fediverse instances.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Multilingual support$q$, $q$Available in 20+ languages.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Free and open-source software (AGPL-3.0), with publicly auditable source code on Framagit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Federated via ActivityPub rather than tied to one company's servers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Originally built by Framasoft and now maintained by the non-profit Kaihuri, with NLnet funding support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Purpose-built for event organizing rather than a general social feed$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$No public, self-serve pricing for managed hosting; professional hosting is arranged by contacting the team directly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Self-hosting requires server administration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Maintenance responsibility transitioned between organizations (Framasoft to Kaihuri in 2024), which can affect long-term roadmap continuity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Is Mobilizon free?$q$, $q$Yes, Mobilizon is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$What license does Mobilizon use?$q$, $q$Mobilizon is released under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Who built Mobilizon?$q$, $q$Mobilizon was originally created by the French non-profit Framasoft, with maintenance handed over to the non-profit Kaihuri in 2024.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Can I get hosted Mobilizon without self-hosting?$q$, $q$The project points users to contact the team for professional hosting services; no public self-serve pricing is listed.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Community event organizing$q$, $q$Create and share events for local clubs, activist groups, or associations without relying on a corporate social network.$q$, $q$Community groups and non-profits$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Federated event discovery$q$, $q$Find events across federated Mobilizon instances by keyword, location, or date.$q$, $q$Individuals looking for local or community events$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$overview$q$, $q$What is Mobilizon?$q$, 2, ARRAY[$q$Mobilizon is free, open-source software for creating, sharing, and finding events, publicly launched in October 2020 by the French non-profit Framasoft. Maintenance was handed over to the non-profit Kaihuri in 2024.$q$, $q$It federates via ActivityPub, so events and groups on one Mobilizon instance can be discovered and interacted with from other instances, and its source code is publicly auditable on Framagit.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$who-its-for$q$, $q$Who Mobilizon is for$q$, 2, ARRAY[$q$Mobilizon is aimed at communities, activist groups, and associations that want to organize and promote events without depending on a corporate social media platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pretix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pretix is open-source event ticketing software with a free self-hosted edition and a hosted SaaS priced per ticket.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$2.5% per paid ticket (max €15/ticket) on the hosted SaaS; self-hosted software is free and open source$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = $q$Heidelberg, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Pretix is open-source event ticketing software with a free self-hosted AGPLv3 edition and a hosted SaaS priced per ticket sold.$q$,
  og_description = $q$Pretix is open-source event ticketing software with a free self-hosted AGPLv3 edition and a hosted SaaS priced per ticket sold.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '283e6deb-e069-4af7-88a7-a176d867da95';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '283e6deb-e069-4af7-88a7-a176d867da95' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Customizable ticket shop$q$, $q$Branded online ticket shop with a built-in marketing toolkit.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Payment provider choice$q$, $q$Direct integration with providers including PayPal, Stripe, and Mollie.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$pretixPOS$q$, $q$Point-of-sale/cash register module for on-site ticket sales.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$pretixSCAN$q$, $q$Access control and badge printing for check-in.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$pretixKIOSK$q$, $q$Self-service ticket vending module.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Venueless integration$q$, $q$Add-on for running digital or hybrid event components.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Reporting and statistics$q$, $q$Built-in sales reports and event statistics.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Self-hosted core is free and open source (AGPLv3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Hosted SaaS has no monthly subscription fee, only pay-per-ticket pricing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$First 500 free tickets per year at no charge on the hosted plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Modular add-ons (POS, scanning, kiosk) for on-site event operations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$No long-term contract required$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Hosted pricing (2.5% of ticket price, capped at €15, plus payment fees) can add up for high-value tickets$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$The free-ticket quota (500/year) only grows further with paid ticket sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Add-on services such as lead scanning and e-invoicing carry extra per-unit fees$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Is pretix free?$q$, $q$The self-hosted core software is free and open source under AGPLv3. The hosted SaaS charges 2.5% per paid ticket (capped at €15) plus payment provider fees, with a limited free tier for free tickets.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Where is pretix based?$q$, $q$pretix GmbH is headquartered in Heidelberg, Germany.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Can pretix be self-hosted?$q$, $q$Yes, the open-source core (AGPLv3) can be self-hosted with the same feature set as the hosted service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$How does pretix charge for free tickets?$q$, $q$The first 500 free tickets issued per year on the hosted SaaS are free; additional free tickets cost €0.50 each.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Conference and festival ticketing$q$, $q$Sell and manage tickets for conferences, festivals, and concerts.$q$, $q$Event organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$On-site check-in and access control$q$, $q$Use pretixSCAN and pretixPOS for badge printing, entry control, and on-site sales.$q$, $q$Museums, exhibitions, and venues$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Self-Hosted$q$, $q$Free (open source, AGPLv3)$q$, NULL, $q$["Full feature set","Self-managed infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$Hosted SaaS$q$, $q$2.5% per paid ticket (max €15/ticket)$q$, $q$monthly$q$, $q$["First 500 free tickets/year included","€0.50 per additional free ticket","No monthly subscription fee","Optional add-ons: lead scanning, Peppol/e-invoicing"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$overview$q$, $q$What is Pretix?$q$, 2, ARRAY[$q$Pretix is open-source ticketing software for conferences, festivals, exhibitions, museums, and other events, developed since 2013 by pretix GmbH in Heidelberg, Germany.$q$, $q$The core software is free and self-hostable under the AGPLv3 license. Organizers who prefer not to self-host can use pretix's hosted SaaS, which charges no monthly fee but takes a percentage of paid ticket sales plus payment provider fees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$who-its-for$q$, $q$Who Pretix is for$q$, 2, ARRAY[$q$Pretix suits event organizers who need online ticket sales alongside on-site tools like point-of-sale, access control, and badge printing, whether they prefer to self-host or use the hosted service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── NocoDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$NocoDB is a no-code database platform that turns spreadsheets or existing SQL databases into collaborative, self-hostable apps.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12/user/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$Italian$q$, $q$Japanese$q$, $q$Korean$q$, $q$Russian$q$, $q$Bengali$q$]::text[],
  seo_meta_description = $q$NocoDB no-code database platform: pricing, self-hosting license, features, and how it compares as an Airtable alternative.$q$,
  og_description = $q$NocoDB no-code database platform: pricing, self-hosting license, features, and how it compares as an Airtable alternative.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8e0b83b6-71ce-4357-81d5-6f9274821112';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8e0b83b6-71ce-4357-81d5-6f9274821112' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Multiple views$q$, $q$Grid, Gallery, Form, Kanban, and Calendar views over the same underlying data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Spreadsheet-style editing$q$, $q$Linked records, lookups, rollups, and formula fields with create/read/update/delete operations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Connect to existing databases$q$, $q$Point NocoDB at an existing Postgres or MySQL database instead of migrating data into its own storage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Auto-generated REST APIs$q$, $q$Every base gets REST APIs, webhooks, and an SDK for programmatic access and automation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Role-based access control$q$, $q$Fine-grained permissions across five user roles.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$App Store integrations$q$, $q$Built-in connectors for Slack, Discord, AWS SES/S3, SMTP, and other services.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Self-hosted Community Edition$q$, $q$Free deployment via Docker or binary installers for macOS, Linux, and Windows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$AI on paid tiers$q$, $q$Single- and multi-provider AI options available on Business and Scale plans.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Free, unlimited-seat self-hosted Community Edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Can connect directly to an existing Postgres or MySQL database instead of requiring data migration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Large community per vendor claims: 64k+ GitHub stars and 20M+ Docker downloads$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Auto-generated REST APIs and a built-in App Store of integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Both cloud-hosted and self-hosted deployment options, with a genuine free cloud tier$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$The self-hosted Community Edition moved from AGPLv3 to the Sustainable Use License, a source-available license rather than an OSI-approved open-source license, which drew criticism from parts of the self-hosting community$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Cloud free plan is capped at 1,000 records and 1GB storage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$SSO, audit logs, and row-level security are reserved for Business/Scale/Enterprise tiers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$The Scale plan requires a minimum of 3 seats$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Is NocoDB free?$q$, $q$Yes. NocoDB offers a free cloud plan (3 editor seats, 1,000 records) and a free, self-hosted Community Edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$What license does NocoDB use?$q$, $q$The self-hosted Community Edition is distributed under the Sustainable Use License, a source-available license, after the project moved away from AGPLv3.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Can NocoDB connect to an existing database?$q$, $q$Yes, NocoDB can turn an existing Postgres or MySQL database into a spreadsheet-style interface rather than requiring data import.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Does NocoDB provide an API?$q$, $q$Yes, every base gets auto-generated REST APIs, webhooks, and an SDK.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Is NocoDB available self-hosted?$q$, $q$Yes, via Docker, binary installers for macOS/Linux/Windows, or an install script.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Internal business databases$q$, $q$Teams replace spreadsheets with a shared, permissioned database for tracking projects, inventory, or CRM-style records.$q$, $q$Small business and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$UI layer over an existing SQL database$q$, $q$Developers connect NocoDB to a Postgres/MySQL database to give non-technical staff a spreadsheet interface without migrating data.$q$, $q$Developers and IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Self-hosted data platform$q$, $q$Organizations that need to keep data on their own infrastructure deploy the free Community Edition via Docker.$q$, $q$IT and compliance teams needing data residency control$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Free (Cloud)$q$, $q$$0$q$, NULL, $q$["3 editor seats","10 commenter seats","1,000 records","1GB storage","100 automation runs","1,000 API calls/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Plus (Cloud)$q$, $q$$12/seat/month annual, $15/seat/month monthly$q$, $q$monthly$q$, $q$["Unlimited seats","50,000 records","20GB storage","10,000 automation runs","100,000 APIs/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Business (Cloud)$q$, $q$$24/seat/month annual, $30/seat/month monthly$q$, $q$monthly$q$, $q$["300,000 records","100GB storage","50,000 automation runs","10 external databases","private bases","SAML SSO"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Scale (Cloud)$q$, $q$$45/seat/month annual, $54/seat/month monthly$q$, $q$monthly$q$, $q$["Minimum 3 seats","1 million records","5 million APIs/month","row-level security","audit logs"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Enterprise (Cloud)$q$, NULL, NULL, $q$["SCIM","SSO","air-gapped installation","staging environment","priority support"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$Community (Self-Hosted)$q$, $q$$0$q$, NULL, $q$["Unlimited records & storage","unlimited seats","6 views","community support"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$overview$q$, $q$What is NocoDB?$q$, 2, ARRAY[$q$NocoDB is a no-code database platform that presents data through a familiar spreadsheet-style interface while storing it in a real relational database. It can either use its own database or connect directly to an existing Postgres or MySQL database, turning that data into views (Grid, Gallery, Form, Kanban, Calendar) that teams can filter, sort, and edit.$q$, $q$It is available as a hosted cloud product with tiered pricing, and as a self-hosted Community Edition that can be deployed with Docker or binary installers. The self-hosted edition is distributed under the Sustainable Use License, a source-available license the project adopted after moving away from AGPLv3.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$who-its-for$q$, $q$Who NocoDB is for$q$, 2, ARRAY[$q$NocoDB suits teams and developers who want a spreadsheet-like interface over structured data without giving up SQL underneath, especially those who already have a Postgres or MySQL database and want a collaborative UI on top of it, or who want to self-host their database tooling.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Baserow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Baserow is an open-source, self-hostable no-code database and application builder positioned as an Airtable alternative.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/user/month (billed annually)$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Baserow open-source no-code database: pricing plans, self-hosting options, MIT-licensed core, and key features compared.$q$,
  og_description = $q$Baserow open-source no-code database: pricing plans, self-hosting options, MIT-licensed core, and key features compared.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8a277ff8-0957-4069-9f79-4ef1be818b6e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Database Builder$q$, $q$Structure and view data through Grid, Gallery, Kanban, Calendar, Timeline, Form, and Survey views.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Application Builder$q$, $q$Build front-end apps and portals on top of Baserow data without code, publishable to a custom domain.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Automation Builder$q$, $q$Workflow automations with triggers, branches, conditions, and loops.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Dashboards$q$, $q$Chart-based dashboards for visualizing data stored in Baserow.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Kuma AI assistant$q$, $q$Builds data structures and automations from natural-language descriptions, available on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Integrations$q$, $q$Native HTTP, email, and webhook support, plus connectors for Zapier, Make, and n8n.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Flexible hosting$q$, $q$Cloud-hosted, or self-hosted via Docker, Docker Compose, Helm, Cloudron, Railway, Elestio, Heroku, DigitalOcean, or AWS.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Enterprise compliance$q$, $q$The cloud offering is GDPR, HIPAA, and SOC 2 Type II compliant.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$MIT-licensed open-source core with a genuine self-hosting option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Combines database, application, automation, and dashboard builders in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Cloud version is GDPR, HIPAA, and SOC 2 Type II compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$65+ templates included on the free plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Multiple self-hosting paths, including one-click deploys on Cloudron, Railway, Elestio, and Heroku$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Free plan is capped at 3,000 rows per workspace and 2GB storage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Kuma AI assistant and other premium features require a paid plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Audit logs and custom roles are limited to Advanced/Enterprise tiers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Smaller open-source community (about 5,400 GitHub stars) than some rival no-code database tools$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Is Baserow open source?$q$, $q$Yes, Baserow's core is released under the MIT license; premium and enterprise features are offered as a source-available add-on under an open-core model.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Can Baserow be self-hosted?$q$, $q$Yes, via Docker, Docker Compose, Helm, or hosted providers like Cloudron, Railway, Elestio, Heroku, Render, DigitalOcean, and AWS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Does Baserow have a free plan?$q$, $q$Yes. The Free plan includes 3,000 rows per workspace, 2GB storage, and 65+ templates.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Is Baserow HIPAA and SOC 2 compliant?$q$, $q$According to Baserow's website, the cloud-hosted version is GDPR, HIPAA, and SOC 2 Type II compliant.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Does Baserow include AI features?$q$, $q$Yes, its Kuma AI assistant can generate data structures and automations from natural-language descriptions, starting on the Premium plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$No-code internal database and app$q$, $q$Operations teams build a shared database plus a simple front-end app on top of it without writing code.$q$, $q$Operations and business teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Self-hosted Airtable alternative$q$, $q$Teams that want full data ownership migrate from Airtable to a self-hosted Baserow instance.$q$, $q$IT teams and privacy-conscious organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Workflow automation$q$, $q$Teams use the Automation Builder to replace manual, spreadsheet-driven processes with triggers and conditional logic.$q$, $q$Small business and process owners$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Free$q$, $q$$0$q$, NULL, $q$["3,000 rows per workspace","2GB storage","2,000 automation credits","500 external app users","65+ templates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Premium$q$, $q$$10/user/month annual, $12/user/month monthly$q$, $q$monthly$q$, $q$["50,000 rows per workspace","20GB storage","100,000 automation credits","all views","AI features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Advanced$q$, $q$$18/user/month annual, $22/user/month monthly$q$, $q$monthly$q$, $q$["250,000 rows per workspace","100GB storage","500,000 automation credits","role-based permissions","audit logs","180-day row history"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Enterprise$q$, NULL, NULL, $q$["1,000,000 rows per workspace","1,000GB storage","2,000,000 automation credits","unlimited external app users","implementation support","custom roles"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$overview$q$, $q$What is Baserow?$q$, 2, ARRAY[$q$Baserow is an open-source no-code platform for building databases and applications. Its core product lets teams structure data in Grid, Gallery, Kanban, Calendar, Timeline, Form, and Survey views, and pairs that with an Application Builder for creating front-end apps, an Automation Builder for workflows, and dashboards for visualization.$q$, $q$The core is MIT-licensed and can be self-hosted via Docker, Docker Compose, Helm, or one-click deploys on providers such as Cloudron, Railway, Elestio, Heroku, and DigitalOcean, in addition to Baserow's own cloud-hosted plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$who-its-for$q$, $q$Who Baserow is for$q$, 2, ARRAY[$q$Baserow fits teams looking for an Airtable-style database and app builder but who want the option to self-host for data ownership or compliance reasons, as well as organizations that need HIPAA, GDPR, or SOC 2 Type II compliance on a cloud-hosted no-code platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Grist ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Grist is an open-source spreadsheet-database hybrid that lets teams build no-code apps, forms, and automations from their data.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$8/user/month (billed annually)$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = $q$New York City, USA$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Grist open-source spreadsheet-database: pricing plans, self-hosting with grist-core, and key formula and access-control features.$q$,
  og_description = $q$Grist open-source spreadsheet-database: pricing plans, self-hosting with grist-core, and key formula and access-control features.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0a59332-e7cb-4428-afe9-3934017982dd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0a59332-e7cb-4428-afe9-3934017982dd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Python-syntax formulas$q$, $q$Calculated columns support Python-syntax formulas alongside common Excel-compatible functions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Multiple linked views$q$, $q$Grid, card, calendar, and chart widgets that stay linked to the same underlying data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Access rules$q$, $q$Granular row-, column-, and table-level permissions for controlling who can see or edit data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Native forms$q$, $q$Built-in form widget for data collection that writes directly into a Grist table.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$AI Assistant$q$, $q$Conversational assistant for building formulas and analyzing data, with credit-based usage limits.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$SQLite-based documents$q$, $q$Each Grist document is a self-contained, portable SQLite file.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Self-hosted Community Edition$q$, $q$Free, open-source (Apache 2.0) deployment via Docker, plus a desktop app for Linux, macOS, and Windows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$REST API and webhooks$q$, $q$Programmatic access to documents, with Zapier integration for automation.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Core (grist-core) is licensed under Apache License 2.0, an OSI-approved open-source license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Documents are portable, self-contained SQLite files, easing backup and export$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Desktop apps available for Linux, macOS, and Windows in addition to web and self-hosted use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Row-, column-, and table-level access rules for granular permission control$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Eligible small organizations (under $1M annual revenue) can request free activation keys for hosted features$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Free cloud plan is capped at 5,000 records per document and only 100 AI Assistant credits total, not recurring monthly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Business plan requires a minimum of 5 users; Enterprise requires a minimum of 50 users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Admin controls, automations, and the full AI Assistant on the self-hosted paid tier still require per-user licensing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Is Grist open source?$q$, $q$Yes, the core (grist-core) is released under the Apache License 2.0 and available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Can Grist be self-hosted for free?$q$, $q$Yes, the Community Edition is free and open source; organizations under $1M in annual revenue can also request free activation keys.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$What format does Grist store data in?$q$, $q$Each Grist document is a self-contained SQLite file.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Does Grist support formulas?$q$, $q$Yes, formulas can be written in Python syntax and also support common Excel functions.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Is there a Grist desktop app?$q$, $q$Yes, grist-desktop runs on Linux, macOS, and Windows.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Team databases with granular permissions$q$, $q$Organizations that need row- and column-level access control for shared data, such as HR or finance records.$q$, $q$HR, finance, and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Self-hosted data workspace$q$, $q$Teams run Grist on their own infrastructure for intranet operation or regulatory compliance using the open-source Community Edition.$q$, $q$IT and compliance-focused organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Formula-driven reporting$q$, $q$Analysts use Python-syntax formulas to build calculated views and reports directly from raw data.$q$, $q$Analysts and data-literate teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 5,000 records per document","100 AI Assistant credits (lifetime)","2 guests per doc","30-day backups"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Pro$q$, $q$$8/user/month annual, $10/user/month monthly$q$, $q$monthly$q$, $q$["Up to 100,000 records per document","3-year snapshot history","100 AI Assistant credits/month","unlimited documents"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Business$q$, $q$$24/user/month annual, $30/user/month monthly$q$, $q$monthly$q$, $q$["Minimum 5 users","Up to 150,000 records per document","5-year snapshot history","2,000 AI Assistant credits/month","automations","priority email support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Enterprise$q$, NULL, NULL, $q$["Minimum 50 users","custom record limits","dedicated server with regional selection","custom SSO and branding","audit log streaming"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$Community Edition (Self-Hosted)$q$, $q$$0$q$, NULL, $q$["Free and open source","community support","custom SSO, domain, and branding"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$overview$q$, $q$What is Grist?$q$, 2, ARRAY[$q$Grist is a relational spreadsheet-database hybrid built by Grist Labs. It combines a familiar spreadsheet grid with Python-syntax formulas, linked card and chart views, native forms, and row/column-level access rules, storing each document as a portable, self-contained SQLite file.$q$, $q$The core, grist-core, is open source under the Apache License 2.0 and can be self-hosted via Docker or run as a desktop app on Linux, macOS, and Windows. Grist Labs also offers a cloud-hosted product with Free, Pro, Business, and Enterprise plans, plus paid self-hosted tiers with added admin and AI features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$who-its-for$q$, $q$Who Grist is for$q$, 2, ARRAY[$q$Grist suits teams that want spreadsheet-like flexibility with database-grade structure and access control, particularly organizations that value data portability (SQLite files), open-source self-hosting, or need row- and column-level permissions that typical spreadsheets don't offer.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── SeaTable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SeaTable combines a spreadsheet interface with database power for no-code app building, automation, and team collaboration, hosted in the EU or self-hosted.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€7/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Mainz, Germany$q$,
  languages = ARRAY[$q$German$q$, $q$English$q$, $q$French$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$Russian$q$]::text[],
  seo_meta_description = $q$SeaTable: no-code spreadsheet-database platform with automation, AI credits, EU cloud hosting, and self-hosted on-premises options.$q$,
  og_description = $q$SeaTable: no-code spreadsheet-database platform with automation, AI credits, EU cloud hosting, and self-hosted on-premises options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Base Editor & multiple views$q$, $q$Organize data in tables with Gallery, Kanban, Timeline, and Calendar views alongside the standard grid, plus linked records between bases.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Automation rules & Python scripts$q$, $q$Build workflows with built-in automation rules and run Python scripts against your data, with usage limits scaling by plan (from 100 script runs/month on Free up to 1,000/user on Enterprise).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$AI-assisted workflows$q$, $q$Paid plans include monthly AI credits (12.5 on Free up to 500/user on Enterprise) for AI-supported automations, plus a self-hosted AI server option for GDPR-compliant deployments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$REST API and integrations$q$, $q$A documented SeaTable API (api.seatable.com) plus native integrations with Zapier, Make, and n8n let teams connect SeaTable to other tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Flexible deployment$q$, $q$Choose EU-hosted cloud (certified German data centers), SeaTable Dedicated, or fully self-hosted on-premises server licenses, including a permanently free 3-user on-premises license.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Templates$q$, $q$Pre-built, customizable templates help teams start new bases quickly for common use cases.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Multiple deployment options including EU cloud hosting and self-hosted on-premises servers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Generous view types (Gallery, Kanban, Timeline, Calendar) beyond a standard grid$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Built-in Python scripting and automation rules for custom workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$A permanently free 3-user on-premises license is available$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Lists large organizations such as the United Nations and Max Planck Society as users, per SeaTable's site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Core server components (e.g., dtable-server) are proprietary, not fully open source$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Row, storage, API call, and AI credit limits vary by plan and are limited on the Free tier (10,000 rows, 2GB storage)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Higher-tier on-premises licensing (50+ users) requires contacting sales for custom pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Multi-year on-premises license terms are needed to unlock discounted pricing$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Is SeaTable open source?$q$, $q$SeaTable's codebase uses a mix of licenses: some components (dtable-web, dtable-events, thumbnail-server) are Apache License v2, the seaf-server component is AGPLv3, and dtable-server is proprietary — so it is not a single fully open-source stack.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Can SeaTable be self-hosted?$q$, $q$Yes. SeaTable offers on-premises server licenses, including a permanently free plan for up to 3 users, in addition to its EU cloud and Dedicated Cloud hosting options.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Does SeaTable have a free plan?$q$, $q$Yes, the Free cloud plan supports up to 25 users with 10,000 rows, 2GB storage, 3,000 API calls, and 12.5 AI credits.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$What automation options does SeaTable support?$q$, $q$SeaTable includes built-in automation rules and Python script execution, plus integrations with Zapier, Make, and n8n.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Where is SeaTable's data hosted?$q$, $q$SeaTable's cloud plans are hosted in certified German data centers within the EU; on-premises and Dedicated Cloud options let organizations control data location directly.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$No-code internal app building$q$, $q$Teams use SeaTable's App Builder and Base Editor to create custom internal tools without writing code.$q$, $q$Operations and business teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Project and workflow tracking$q$, $q$Kanban, Timeline, and Calendar views combined with automation rules support project management and task tracking.$q$, $q$Project managers and cross-functional teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$GDPR-sensitive data management$q$, $q$EU-hosted cloud plans and self-hosted on-premises licenses let regulated organizations keep data within Germany or on their own infrastructure.$q$, $q$Organizations with strict data residency requirements$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Free$q$, $q$€0$q$, $q$monthly$q$, $q$["Up to 25 users","10,000 rows","2GB storage","1-month snapshots","100 Python script runs","3,000 API calls","12.5 AI credits"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Plus$q$, $q$€7/user/month (billed annually) or €9/user/month (billed monthly)$q$, $q$annual$q$, $q$["Unlimited users","50,000 rows","50GB storage","6-month snapshots","250 Python script runs/user","10,000 API calls/user","50 AI credits/user"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Enterprise$q$, $q$€14/user/month (billed annually) or €18/user/month (billed monthly)$q$, $q$annual$q$, $q$["Unlimited users, rows, and bases","100GB storage","12-month snapshots","1,000 Python script runs/user","50,000 API calls/user","500 AI credits/user","5,000 automations/user","Advanced customization"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$Dedicated Cloud$q$, $q$Custom (100-user minimum, annual billing)$q$, $q$annual$q$, $q$["1,000GB storage","24-month snapshots","Unlimited rows, Python runs, API calls, and automations","Enterprise admin panel","SAML/OAuth support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$On-Premises 3-User License$q$, $q$€0$q$, NULL, $q$["Permanently free","Self-hosted","Up to 3 users"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$overview$q$, $q$What is SeaTable?$q$, 2, ARRAY[$q$SeaTable is a database and app-building platform that pairs a familiar spreadsheet interface with database-level structure — support for linked records, multiple view types, and unlimited rows within a single base. It is developed by SeaTable GmbH, headquartered in Mainz, Germany, and offers EU cloud hosting alongside self-hosted on-premises deployment.$q$, $q$Beyond data storage, SeaTable includes a no-code App Builder for creating custom applications, built-in automation rules, Python script execution, and paid-tier AI credits for AI-assisted workflows. Its component licensing is mixed: some parts are Apache-2.0 or AGPLv3, while the core dtable-server component is proprietary.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$who-its-for$q$, $q$Who SeaTable is for$q$, 2, ARRAY[$q$SeaTable suits teams that need database-grade data management without writing SQL, particularly organizations with data-residency requirements that want the option of EU-hosted or fully self-hosted deployment. It's used for internal app building, project tracking, and automation by organizations including the United Nations and the Max Planck Society, per SeaTable's website.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Teable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Teable is an open-source, no-code database platform built on Postgres that combines a spreadsheet interface with AI-assisted app and workflow building.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Teable: open-source, Postgres-backed no-code database with AI fields, automation, and self-hosted or cloud deployment options.$q$,
  og_description = $q$Teable: open-source, Postgres-backed no-code database with AI fields, automation, and self-hosted or cloud deployment options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Postgres-backed no-code database$q$, $q$Teable stores data in PostgreSQL, letting it scale to millions of rows while still offering a spreadsheet-like grid interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Multiple views$q$, $q$Grid, Form, Kanban, Gallery, and Calendar views let teams visualize and interact with the same underlying data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$AI fields and AI chat$q$, $q$Plans include AI-assisted features such as AI fields, AI chat, an app builder for natural-language app generation, and an AI agent called CuppyClaw.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Automation with a credit system$q$, $q$Workflows use triggers, actions, and rules, with usage metered through a credit system (200 credits on Free up to 2,000/seat on Business).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Self-hosting via Docker$q$, $q$The Community Edition is AGPL-3.0 licensed and can be self-hosted with Docker or one-click deployed to platforms like Railway, Sealos, and Zeabur.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$SQL querying and API access$q$, $q$Teable supports direct SQL querying, formulas, filtering, aggregation, and API access alongside import/export and version history.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Built on PostgreSQL, so it handles millions of rows rather than the row limits typical of no-code tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Community Edition is open source (AGPL-3.0) and self-hostable via Docker$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Includes AI-assisted features (AI fields, AI chat, app builder) starting on the free tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$ISO 9001 and ISO 27001 certifications, per Teable's site$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Multiple one-click deployment options (Railway, Sealos, Zeabur) in addition to Docker$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Enterprise Edition features are proprietary and not part of the open-source Community Edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$AI and automation usage is metered by a credit system, which can add cost for heavy users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Free plan is limited to 1,000 rows and 1GB of attachments$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Headquarters and founding year are not clearly published on the official site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Is Teable open source?$q$, $q$Teable's Community Edition is licensed under AGPL-3.0 and free to self-host; an Enterprise Edition with additional features is available under a proprietary license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Can Teable be self-hosted?$q$, $q$Yes, the Community Edition can be self-hosted via Docker, with one-click deployment options for platforms like Railway, Sealos, and Zeabur.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$What database does Teable use?$q$, $q$Teable is built on PostgreSQL, which lets it handle millions of rows — more than typical spreadsheet-style no-code tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Does Teable have a free plan?$q$, $q$Yes, the Free plan includes 200 credits, 100 automation runs per month, 1,000 rows, and 1GB of attachments per seat.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$What AI features does Teable offer?$q$, $q$Teable includes AI chat, AI-powered fields, a natural-language app builder, and an AI agent called CuppyClaw, available starting on the Free plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$No-code app and workflow building$q$, $q$Teams use Teable's app builder and automation rules to turn spreadsheet-style data into workflows and internal applications without code.$q$, $q$Operations teams and no-code builders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Large-scale data management$q$, $q$Because Teable runs on PostgreSQL, it supports datasets with millions of rows that would exceed typical spreadsheet-tool limits.$q$, $q$Teams migrating from spreadsheets or legacy systems$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Self-hosted database applications$q$, $q$Organizations that need to keep data on their own infrastructure can self-host the AGPL-3.0 Community Edition via Docker.$q$, $q$Engineering teams with data residency or compliance requirements$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Free$q$, $q$$0/seat/month$q$, $q$monthly$q$, $q$["200 credits","100 automation runs","1,000 rows","1GB attachments","AI chat, AI field, app builder, CuppyClaw agent access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Pro$q$, $q$$10/seat/month (yearly) or $12/seat/month (monthly)$q$, $q$annual$q$, $q$["1,000 credits/seat","25,000 automation runs","250,000 rows","10GB attachments","All field types","Credit subscriptions"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Business$q$, $q$$20/seat/month (yearly) or $24/seat/month (monthly)$q$, $q$annual$q$, $q$["2,000 credits/seat","100,000 automation runs","1,000,000 rows","100GB attachments","Custom app domain","Authority matrix","Domain verification","SSO","3-year data retention history"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$500 Credits Add-on$q$, $q$$5/space/month (yearly) or $6/month$q$, $q$annual$q$, $q$["Additional credits billed at cost with 0% markup","Available for Pro plan and above"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$overview$q$, $q$What is Teable?$q$, 2, ARRAY[$q$Teable is a no-code database platform that pairs a spreadsheet-style grid with a PostgreSQL backend, letting it scale to millions of rows while keeping an Airtable-like editing experience. It offers Grid, Form, Kanban, Gallery, and Calendar views, formulas, filtering, SQL querying, and version history.$q$, $q$The Community Edition is open source under AGPL-3.0 and can be self-hosted via Docker or deployed to platforms like Railway, Sealos, and Zeabur. An Enterprise Edition adds proprietary features such as SSO and custom domains, and Teable's cloud offering layers on AI features — AI fields, AI chat, an app builder, and a credit-based automation system — across Free, Pro, and Business plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$who-its-for$q$, $q$Who Teable is for$q$, 2, ARRAY[$q$Teable fits teams that have outgrown spreadsheet row limits but still want a no-code, spreadsheet-like editing experience, as well as engineering teams that want a self-hostable, Postgres-backed alternative to proprietary no-code database tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Mathesar ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mathesar is a free, open-source spreadsheet-like web interface for viewing, editing, and querying PostgreSQL databases without writing SQL.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mathesar: open-source (GPLv3), self-hosted spreadsheet interface for PostgreSQL, maintained by the nonprofit Mathesar Foundation.$q$,
  og_description = $q$Mathesar: open-source (GPLv3), self-hosted spreadsheet interface for PostgreSQL, maintained by the nonprofit Mathesar Foundation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Spreadsheet-like interface for Postgres$q$, $q$Mathesar lets users view, edit, and query PostgreSQL data through a spreadsheet-style UI without writing SQL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Works with native Postgres permissions$q$, $q$Access control is built on Postgres's own schemas and permissions rather than a separate abstraction layer.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Self-hosted via Docker$q$, $q$Mathesar installs on your own infrastructure using Docker, so data stays on your own servers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Forms and query builders$q$, $q$Includes forms, query builders, schema management, and relationship mapping for working with relational data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Production-ready scalability$q$, $q$Because it operates directly on Postgres, Mathesar's scalability follows PostgreSQL's own capabilities rather than a separate data layer.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$100% open source (GPLv3) and maintained by the nonprofit Mathesar Foundation, a 501(c)(3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$No pricing tiers or paid lock-in — free to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Works directly on your existing PostgreSQL database using native permissions, not a separate abstraction$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Docker-based install described by the project as installable in minutes$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Public Beta status — the project describes itself as stable enough for production but has not reached a stable 1.0 release$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Requires an existing PostgreSQL database and self-hosting/Docker setup; no first-party managed hosting was confirmed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$No documented native mobile apps$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Limited public information on team size, roadmap timeline, or enterprise support options$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Is Mathesar free?$q$, $q$Yes. Mathesar is 100% open source under GPLv3 and maintained by the nonprofit Mathesar Foundation, with no paid tiers required to use it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Do I need my own PostgreSQL database to use Mathesar?$q$, $q$Yes, Mathesar is a UI layer that connects to and operates directly on an existing PostgreSQL database using Postgres's native schemas and permissions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$How is Mathesar deployed?$q$, $q$Mathesar is self-hosted using Docker on your own infrastructure, so your data does not leave your own servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Is Mathesar production-ready?$q$, $q$Mathesar is in Public Beta. The project describes it as stable enough for production deployment, but it has not reached a stable 1.0 release.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Who maintains Mathesar?$q$, $q$Mathesar is maintained by the Mathesar Foundation, a 501(c)(3) nonprofit organization.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$No-code database administration$q$, $q$Non-technical staff can view, filter, and edit PostgreSQL data through a spreadsheet-like UI instead of writing SQL.$q$, $q$Non-technical database users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Self-hosted data management for regulated teams$q$, $q$Organizations that must keep data on their own infrastructure can self-host Mathesar via Docker against their existing Postgres instance.$q$, $q$Engineering and IT teams with data residency requirements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$Collaborative Postgres data editing$q$, $q$Teams collaborate on viewing, editing, and querying shared Postgres data using native Postgres permissions for access control.$q$, $q$Cross-functional teams sharing a Postgres database$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$overview$q$, $q$What is Mathesar?$q$, 2, ARRAY[$q$Mathesar is an open-source web application that gives PostgreSQL databases a spreadsheet-like interface for viewing, editing, and querying data. It's built to work directly with Postgres's own schemas and permissions rather than introducing a separate data layer, and it's licensed under GPLv3.$q$, $q$The project is maintained by the Mathesar Foundation, a registered 501(c)(3) nonprofit, and is currently in Public Beta. It is self-hosted via Docker so that data remains on the user's own infrastructure, and includes forms, query builders, and relationship mapping for relational data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$who-its-for$q$, $q$Who Mathesar is for$q$, 2, ARRAY[$q$Mathesar is aimed at teams and individuals who want spreadsheet-like ease of use over a real PostgreSQL database — including non-technical users who need to edit data without SQL, and engineering teams that want a free, self-hosted, open-source alternative to proprietary no-code database tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── KeystoneJS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$KeystoneJS is a free, open-source Node.js headless CMS that generates a GraphQL API and admin UI from a schema you define.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$KeystoneJS: free, open-source (MIT) Node.js headless CMS with an auto-generated GraphQL API, admin UI, and Prisma-based database migrations.$q$,
  og_description = $q$KeystoneJS: free, open-source (MIT) Node.js headless CMS with an auto-generated GraphQL API, admin UI, and Prisma-based database migrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Schema-driven GraphQL API$q$, $q$Define your data schema once and Keystone automatically generates a full GraphQL API with pagination, sorting, filtering, and CRUD operations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Auto-generated Admin UI$q$, $q$A customizable admin interface is generated from your schema, including a rich text WYSIWYG editor for content editing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Fine-grained access control$q$, $q$Built-in access control lets developers restrict operations at the field, list, and operation level.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Prisma-based migrations$q$, $q$Database schema migrations are handled automatically through Prisma.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Session management$q$, $q$Includes built-in user session handling for authentication flows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Custom logic via hooks$q$, $q$Supports event hooks and custom GraphQL queries/mutations for extending default behavior.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$TypeScript-first$q$, $q$Written in TypeScript (99% of the codebase) with full TypeScript or JavaScript support for application code.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Free and fully open source under the MIT license, with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Auto-generates both a GraphQL API and an admin UI from a single schema definition$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Over 1 million npm installs and 250+ contributors, per the project's own site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Deployable to a wide range of hosts (DigitalOcean, Heroku, Render, Vercel, AWS, Azure, Google Cloud) or custom infrastructure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Database migrations handled automatically via Prisma$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Requires Node.js development skills — it is a developer framework, not a no-code tool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Keystone 5 is in maintenance mode; only Keystone 6 receives active development$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Paid support is only available as a separate enterprise contract through Thinkmill, not a packaged pricing tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$No official managed hosting/cloud product — self-hosting or third-party PaaS deployment is required$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Is KeystoneJS free?$q$, $q$Yes, KeystoneJS is free and open source under the MIT license. Paid enterprise support is available separately through Thinkmill.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$What does KeystoneJS generate from my schema?$q$, $q$Defining a schema in Keystone automatically produces a GraphQL API with CRUD, pagination, sorting, and filtering, plus a customizable admin UI.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$What database tooling does KeystoneJS use?$q$, $q$Keystone uses Prisma to handle database migrations automatically.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Is Keystone 5 still supported?$q$, $q$Keystone 5 is in maintenance mode; Keystone 6 (published under the @keystone-6/* npm namespace) is the actively developed version.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Who maintains KeystoneJS?$q$, $q$KeystoneJS is developed and maintained by Thinkmill, an Australian design and development consultancy, with contributions from 250+ people since the project's first commit in 2013.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Headless CMS for custom front ends$q$, $q$Developers use Keystone's generated GraphQL API to power custom websites, apps, or storefronts while editors use the auto-generated admin UI.$q$, $q$Developers building custom content-driven applications$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Internal admin tools and data APIs$q$, $q$Because Keystone generates a full CRUD GraphQL API and admin UI from a schema, teams use it to quickly stand up internal data management tools.$q$, $q$Engineering teams needing a fast backend and admin UI$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$overview$q$, $q$What is KeystoneJS?$q$, 2, ARRAY[$q$KeystoneJS is a free, open-source (MIT-licensed) headless content management framework for Node.js. Developers define a data schema, and Keystone automatically generates a GraphQL API — with pagination, sorting, filtering, and CRUD operations — along with a customizable admin UI.$q$, $q$Built with TypeScript, GraphQL, and Prisma, Keystone handles database migrations automatically and includes built-in session management, fine-grained access control, and support for custom hooks and GraphQL queries/mutations. The current major version is Keystone 6 (Keystone 5 is in maintenance mode), maintained by Thinkmill with over 1 million npm installs and 250+ contributors since its first commit in 2013.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$who-its-for$q$, $q$Who KeystoneJS is for$q$, 2, ARRAY[$q$KeystoneJS is built for developers who want a code-first, schema-driven headless CMS rather than a no-code tool — teams that need a customizable GraphQL API and admin UI backing a custom-built front end, and that are comfortable deploying and hosting a Node.js application themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── TinaCMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, Git-backed headless CMS with visual editing for Markdown/MDX content, self-hostable or via Tina Cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$24/month$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TinaCMS: open-source, Git-backed headless CMS with visual editing, a GraphQL API, and free or paid Tina Cloud hosting plans.$q$,
  og_description = $q$TinaCMS: open-source, Git-backed headless CMS with visual editing, a GraphQL API, and free or paid Tina Cloud hosting plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Git-backed content storage$q$, $q$Content is saved directly to your Git repository (e.g. GitHub) as Markdown, MDX, JSON, or YAML, giving full version history.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Visual, in-context editing$q$, $q$Content authors can edit live pages through a visual editor, with changes synced back to Git.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$GraphQL content API$q$, $q$An auto-generated GraphQL API lets any frontend query and mutate content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Framework integrations$q$, $q$Documented integrations with Next.js, Astro, Hugo, and Jekyll.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Editorial workflow$q$, $q$Approval-based editorial workflows are available on Team Plus and higher Tina Cloud plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Self-hostable backend$q$, $q$The Apache-2.0 licensed backend can be self-hosted on any platform supporting Express, as an alternative to Tina Cloud.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Role-based access$q$, $q$Tina Cloud plans include configurable user roles for managing team permissions.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Open source (Apache-2.0) with a self-hostable backend, avoiding vendor lock-in.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Free Tina Cloud tier available for individuals with 2 users.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Content is stored as plain Markdown/MDX/JSON/YAML in Git, preserving full version history.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Visual, in-context editing experience aimed at non-technical content editors.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Active open-source project with over 13,000 GitHub stars and frequent releases.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Editorial workflow and API access are gated behind paid Team Plus/Business Tina Cloud tiers.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$AI features on Tina Cloud were still in development at time of review.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Self-hosting the backend requires developer setup of a Git provider, database adapter, and auth provider.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Tina Cloud paid plans are billed per project, which can add up for agencies managing many sites.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Is TinaCMS free?$q$, $q$TinaCMS's code is open-source under Apache-2.0, and Tina Cloud offers a free plan with 2 users; paid Tina Cloud plans start at $24/month for more users and features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Does TinaCMS require Tina Cloud?$q$, $q$No. TinaCMS can be self-hosted using your own database, Git provider, and auth provider instead of the hosted Tina Cloud service.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$What content formats does TinaCMS support?$q$, $q$TinaCMS supports Markdown, MDX, JSON, and YAML content stored in a Git repository.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Who maintains TinaCMS?$q$, $q$TinaCMS was originally launched by Forestry.io and has been maintained by SSW, an Australian software consultancy, since SSW acquired the project in 2024.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$What frameworks does TinaCMS integrate with?$q$, $q$TinaCMS documents integrations with Next.js, Astro, Hugo, and Jekyll, among other static site generators.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Developer-led marketing sites$q$, $q$Teams building Next.js, Astro, or Hugo sites who want Git-based content with a visual editor for marketing content.$q$, $q$Web development teams and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Documentation and blog sites$q$, $q$Projects storing Markdown/MDX docs or blog posts in Git that need a friendlier editing UI for non-technical writers.$q$, $q$Content writers and technical bloggers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Self-hosted enterprise content$q$, $q$Organizations needing full control over their CMS backend and data by self-hosting instead of using Tina Cloud.$q$, $q$Enterprises with data sovereignty requirements$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["2 users","2 roles","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Team$q$, $q$$24/month or $290/year$q$, $q$monthly$q$, $q$["Up to 3 users (10 max with add-ons)","2 roles","Team support","Additional seats $90/year"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Team Plus$q$, $q$$41/month or $490/year$q$, $q$monthly$q$, $q$["Up to 5 users (20 max with add-ons)","2 roles","Team support","Editorial workflow","AI features in development"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Business$q$, $q$$249/month or $2,990/year$q$, $q$monthly$q$, $q$["20 users (unlimited with add-ons)","3 roles (beta)","Business support","Editorial workflow","API (beta)","AI features in development"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom user counts and roles","Enterprise support","GitHub Enterprise support","SSO","No user limits"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$overview$q$, $q$What is TinaCMS?$q$, 2, ARRAY[$q$TinaCMS is an open-source, Git-backed headless CMS that stores content as Markdown, MDX, JSON, or YAML files directly in a Git repository. It combines a GraphQL content API with a visual, in-context editor that lets content authors edit live pages and sync changes back to Git.$q$, $q$The project, originally launched by Forestry.io, has been maintained by SSW, an Australian software consultancy, since SSW acquired TinaCMS in 2024. TinaCMS's backend is Apache-2.0 licensed and can be self-hosted, or run through the hosted Tina Cloud service, which offers a free tier plus paid Team, Team Plus, Business, and Enterprise plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$who-its-for$q$, $q$Who TinaCMS is for$q$, 2, ARRAY[$q$TinaCMS suits developers and content teams already working with Git-based static sites (Next.js, Astro, Hugo, Jekyll) who want a visual editing layer without giving up version-controlled, file-based content. It also fits organizations wanting to self-host their CMS backend for full data control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Cockpit CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, MIT-licensed headless CMS with REST/GraphQL APIs, flexible content models, and optional paid Pro addons.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€299 one-time$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cockpit CMS: free, self-hosted, MIT-licensed API-first headless CMS with optional one-time-purchase Pro addons.$q$,
  og_description = $q$Cockpit CMS: free, self-hosted, MIT-licensed API-first headless CMS with optional one-time-purchase Pro addons.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '26315baf-61aa-4fda-b2de-4986fe3babe9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '26315baf-61aa-4fda-b2de-4986fe3babe9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$API-first architecture$q$, $q$REST and GraphQL APIs for querying content, compatible with Next.js, React, Vue, Svelte, PHP, and Node.js.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Flexible content models$q$, $q$Collections, Singletons, and Trees with custom and conditional fields for structuring content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Self-hosted deployment$q$, $q$Runs on your own server (PHP 7.3+, SQLite or MongoDB) with no vendor lock-in and no required account.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Localization$q$, $q$Built-in multi-language content and key-based language strings, with optional AI-assisted translation via DeepL or LibreTranslate.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Asset management$q$, $q$Cloud storage support, nestable asset folders, automatic color extraction, and an image API for thumbnail generation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Role-based permissions$q$, $q$Fine-grained access control for multiple user roles.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Content revisions$q$, $q$Ability to revert content to previous versions.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Pro addons$q$, $q$Optional paid add-ons including Autopilot (AI assistant), Detektivo (Meilisearch full-text search), Sync (environment deployment), and Layouts & Pages (visual page builder).$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$MIT-licensed open-source core that is free forever, with no required account or vendor lock-in.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Fully self-hosted, giving organizations complete control over their data.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Supports both REST and GraphQL APIs, usable with a wide range of frontend and backend stacks.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$One-time Pro license (€299) instead of a mandatory recurring subscription.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Flexible content modeling with Collections, Singletons, and Trees.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Advanced features (AI assistant, full-text search, visual page builder, environment sync) require the paid Pro add-on license.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Self-hosting requires managing your own PHP server environment (PHP 7.3+, SQLite/MongoDB, Apache with mod_rewrite).$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Pro license renewal (€99/year) is needed to keep receiving updates after the first year.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Smaller GitHub community than some competitors, with under 6k stars on the legacy agentejo/cockpit repository.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Is Cockpit CMS free?$q$, $q$Yes, the Cockpit core is MIT-licensed and free forever; a paid Pro tier (€299 one-time per project, €99/year for continued updates) unlocks additional addons, and custom Enterprise pricing is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Is Cockpit CMS self-hosted?$q$, $q$Yes, Cockpit is designed to be installed on your own server and requires PHP 7.3+, PDO with SQLite or MongoDB, and Apache with mod_rewrite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Does Cockpit CMS support GraphQL?$q$, $q$Yes, Cockpit offers both REST and GraphQL APIs for content access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$What are Cockpit's Pro addons?$q$, $q$Paid Pro addons include Autopilot (AI content and image generation), Detektivo (Meilisearch-powered full-text search), Sync (environment-to-environment deployment), Layouts & Pages (visual page building with SEO tools), and Inbox (form submissions).$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Who makes Cockpit CMS?$q$, $q$Cockpit is made by Agentejo, with current development continuing under the Cockpit-HQ organization on GitHub.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Custom frontend content backends$q$, $q$Developers building sites or apps in Next.js, React, Vue, or Svelte who need a lightweight, self-hosted API-first CMS.$q$, $q$Frontend and full-stack developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Data-sovereign content management$q$, $q$Organizations needing to keep content on their own infrastructure for data control or compliance reasons.$q$, $q$Public sector and education organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Multi-language content projects$q$, $q$Teams managing localized content across multiple languages using Cockpit's built-in localization and optional AI translation add-ons.$q$, $q$Content teams managing multilingual sites$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Core (Open Source)$q$, $q$Free$q$, NULL, $q$["MIT-licensed core CMS","Self-hosted","REST & GraphQL APIs","No account required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Pro$q$, $q$€299 one-time per project$q$, NULL, $q$["All Pro addons (Autopilot, Detektivo, Sync, Layouts & Pages, Inbox)","Covers one production instance plus unlimited dev/staging environments","One year of updates included","€99/year optional renewal for continued updates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom licensing terms","Individual consulting","High-level support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$overview$q$, $q$What is Cockpit CMS?$q$, 2, ARRAY[$q$Cockpit is a self-hosted, API-first headless content management platform made by Agentejo. Its core is MIT-licensed and free to use, letting developers structure content with Collections, Singletons, and Trees, and expose it through REST or GraphQL APIs to any frontend or backend stack.$q$, $q$Beyond the free core, Cockpit offers a one-time-purchase Pro tier (€299 per project, with optional €99/year update renewals) that unlocks addons such as Autopilot (AI content generation), Detektivo (full-text search via Meilisearch), Sync (environment deployment), and Layouts & Pages (visual page building). Custom Enterprise pricing is also available for organizations with specific licensing or support needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$who-its-for$q$, $q$Who Cockpit CMS is for$q$, 2, ARRAY[$q$Cockpit fits developers and organizations that want to self-host their content backend rather than use a SaaS CMS, particularly those with data sovereignty requirements or teams that prefer a one-time license over recurring subscription costs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Statamic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Statamic is a Laravel-based flat-file CMS with a free Core edition and a paid Pro tier for teams and enterprises.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$349/site (Pro, first year; $99/year renewal)$q$,
  founded_year = 2012,
  company_size = $q$6 employees (core team)$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Statamic is a Laravel-powered flat-file/hybrid CMS with a free Core edition and paid Pro and Enterprise tiers.$q$,
  og_description = $q$Statamic is a Laravel-powered flat-file/hybrid CMS with a free Core edition and paid Pro and Enterprise tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Bard block editor$q$, $q$A block-based rich content editor with fly-out previews for building flexible page layouts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$40+ Fieldtypes & Blueprints$q$, $q$Content is modeled using Blueprints with a library of 40+ fieldtypes, including Assets, Markdown, and Video.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Flat-file or database mode$q$, $q$Content can be stored as flat files or in a database, letting projects scale as needed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Live Preview$q$, $q$Editors can preview content changes in the control panel before publishing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Multi-site support$q$, $q$Manage multiple languages, domains, or sub-brands from a single install (Pro).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$REST API and GraphQL$q$, $q$Headless delivery via a REST API or GraphQL endpoint (Pro).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Git integration$q$, $q$Automatic Git commits and automation tied to content changes in the control panel (Pro).$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Core edition is free forever with no per-site licensing fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Built on Laravel, familiar to PHP/Laravel developers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Flexible flat-file or database-backed content storage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Headless delivery via REST API and GraphQL (Pro)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Active Discord community and a network of certified partner agencies$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Multi-user accounts, revisions/drafts, and API access require the paid Pro license ($349/site + $99/year)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Requires PHP/Laravel hosting and development knowledge, unlike no-code site builders$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Core team is small (6 full-time members)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Enterprise pricing is custom and not published$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Is Statamic free?$q$, $q$Statamic Core is free forever. The Pro tier costs $349 per site for the first year (including updates), then $99 per year for continued updates.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$What is Statamic built on?$q$, $q$Statamic is built on the Laravel PHP framework.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Does Statamic support headless or API-based use?$q$, $q$Yes, REST API and GraphQL access are available with a Statamic Pro license.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Can Statamic run without a database?$q$, $q$Yes, Statamic can run in flat-file mode, storing content as files rather than in a database.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Who created Statamic?$q$, $q$Statamic was founded in 2012 by Jack McDade and Mubashar Iqbal.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Content-driven marketing sites$q$, $q$Blueprints, Bard, and Live Preview support building and maintaining editorial content sites.$q$, $q$Agencies and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Multi-site and multilingual publishing$q$, $q$Statamic Pro supports managing multiple sites, domains, or languages from one install.$q$, $q$Enterprises and agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Headless content backend$q$, $q$Statamic Pro's REST API and GraphQL endpoint let teams power custom frontends.$q$, $q$Developers building decoupled frontends$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Core$q$, $q$Free$q$, NULL, $q$["One admin user account","One content form","Blueprints and 40+ fieldtypes","Unlimited collections & taxonomies","Asset management","Live Preview"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Pro$q$, $q$$349 per site (first year), $99/year renewal$q$, $q$annual$q$, $q$["Unlimited user accounts & roles","Revisions, drafts & content history","Headless, REST API, and GraphQL","Multi-site, multilingual & multi-user editing","White Label customization","Git integration and automation","Basic Developer Support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated Premium Support with SLAs","Custom procurement and compliance options","Priority bug resolution and feature requests","SSO, 2FA, Audit Logging","Onboarding, training, and consulting","Offline/Private License Validation"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$overview$q$, $q$What is Statamic?$q$, 2, ARRAY[$q$Statamic is a content management system built on the Laravel PHP framework, launched in 2012 by Jack McDade and Mubashar Iqbal. It can run in flat-file mode, storing content as Markdown and YAML files, or in database mode as projects scale.$q$, $q$Content is structured using Blueprints and a library of 40+ fieldtypes, with the Bard block editor providing flexible, block-based content authoring and Live Preview inside the control panel.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$who-its-for$q$, $q$Who Statamic is for$q$, 2, ARRAY[$q$Statamic suits Laravel and PHP developers and agencies who want a self-hosted CMS with a free Core edition, and who can upgrade to Pro for multi-user roles, revisions, multi-site management, and headless REST/GraphQL delivery.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Craft CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Craft CMS is a self-hosted content management system from Pixel & Tonic with a free Solo edition and paid Team/Pro editions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$279/project (Team, self-hosted, first year; $99/year renewal)$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = $q$Bend, Oregon, USA$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Craft CMS is a self-hosted CMS with a free Solo edition, paid Team/Pro editions, and managed Craft Cloud hosting.$q$,
  og_description = $q$Craft CMS is a self-hosted CMS with a free Solo edition, paid Team/Pro editions, and managed Craft Cloud hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '35e4bc85-6298-43d3-bc27-0854ea063792';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '35e4bc85-6298-43d3-bc27-0854ea063792' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Twig templating & GraphQL API$q$, $q$Build frontends with Twig templates or go headless via the GraphQL API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Multi-site & localization$q$, $q$Translate and localize content across an unlimited number of sites; the control panel itself is translated into 25 languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Plugin ecosystem$q$, $q$Extend Craft through the built-in Plugin Store and an extensibility framework.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Craft Commerce integration$q$, $q$Add e-commerce functionality with Craft's companion Commerce product and Stripe integration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Craft Cloud hosting$q$, $q$Optional managed, push-to-deploy hosting with a global CDN and automatic build pipeline for Composer and npm.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Content versioning & scheduling$q$, $q$Track content history and schedule entries for future publication.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Live Preview & image editor$q$, $q$Preview content changes and edit images directly in the control panel.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Free Solo edition available for self-hosting with one user account$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Deep multi-site and localization support, with the admin translated into 25 languages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Established ecosystem: 150,000+ sites created and 240 partner agencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Optional Craft Cloud managed hosting with push-to-deploy workflows$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Source code is publicly viewable on GitHub$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Not open source in the traditional sense — governed by a proprietary Pixel & Tonic license (BSD-3-Clause code display, but restrictive commercial license terms) that limits reuse$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Solo edition is limited to a single user account$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Team and Pro self-hosted editions require a per-project license fee ($279 and $399, plus $99/year renewal)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Craft Cloud hosting is billed separately per project ($120-$240/month) in addition to any license$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Is Craft CMS free?$q$, $q$The Solo edition is free forever for self-hosting with one user account. Team costs $279 per project and Pro costs $399 per project (each including one year of updates, then $99/year).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Is Craft CMS open source?$q$, $q$Craft CMS's source code is publicly viewable on GitHub, but it is distributed under a proprietary Pixel & Tonic license rather than a standard open-source license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$What powers Craft CMS?$q$, $q$Craft CMS uses Twig templates and a GraphQL API, and is built on the Yii PHP framework.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Does Craft CMS offer hosting?$q$, $q$Yes, Craft Cloud offers managed hosting starting at $120/month per project for the Team plan and $240/month for Pro.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Who makes Craft CMS?$q$, $q$Craft CMS is made by Pixel & Tonic, Inc., headquartered in Bend, Oregon, USA. Craft 1.0 shipped in 2013.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Multi-site and multilingual publishing$q$, $q$Craft's localization tools support unlimited sites and locales from one install.$q$, $q$Agencies and enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$E-commerce content sites$q$, $q$Craft Commerce with Stripe integration adds e-commerce on top of Craft's content model.$q$, $q$Businesses running online stores$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Custom-built marketing sites$q$, $q$Twig templating and a content-first structure let developers build tailored frontends.$q$, $q$Developers and agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Solo (self-hosted)$q$, $q$Free$q$, NULL, $q$["One user account","Unlimited content types, entries, pages, locales","Asset management","Multi-site support","Live Preview & image editor","Content versioning & scheduling"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Team (self-hosted)$q$, $q$$279 per project (first year), $99/year renewal$q$, $q$annual$q$, $q$["Everything in Solo","Up to 5 user accounts","One user group","Developer support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Pro (self-hosted)$q$, $q$$399 per project (first year), $99/year renewal$q$, $q$annual$q$, $q$["Everything in Team","Unlimited user accounts and user groups","Branded control panel","Branded communication"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Pro","First-party SAML SSO","Custom license agreement","Procurement support","Dedicated premium support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Craft Cloud - Team$q$, $q$$120/month per project$q$, $q$monthly$q$, $q$["Craft Team license included","2 environments (production + staging)","10GB asset storage per environment","Unlimited build minutes and database storage"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$Craft Cloud - Pro$q$, $q$$240/month per project$q$, $q$monthly$q$, $q$["Craft Pro license included","3 environments","20GB asset storage per environment","Everything in Cloud Team"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$overview$q$, $q$What is Craft CMS?$q$, 2, ARRAY[$q$Craft CMS is a content management system built by Pixel & Tonic, headquartered in Bend, Oregon. Craft 1.0 shipped in 2013 after being previewed under the working title 'Blocks CMS'.$q$, $q$It is built with the Yii framework and uses Twig templates or a GraphQL API for decoupled, headless implementations, with multi-site and localization support including an admin interface translated into 25 languages.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$who-its-for$q$, $q$Who Craft CMS is for$q$, 2, ARRAY[$q$Craft CMS suits developers and agencies who want a self-hosted, content-first CMS with a free Solo edition for single-user projects, and paid Team/Pro editions or Craft Cloud hosting for multi-user teams and larger deployments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Grav ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Grav is a free, MIT-licensed flat-file CMS built on PHP and Symfony that stores content as files instead of a database.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Grav is an open-source, MIT-licensed flat-file CMS built on PHP 8.3+ and Symfony 7, requiring no database.$q$,
  og_description = $q$Grav is an open-source, MIT-licensed flat-file CMS built on PHP 8.3+ and Symfony 7, requiring no database.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Flat-file architecture$q$, $q$Content is stored as Markdown and YAML files in folders rather than in a database, making it version-controllable with Git.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Modern PHP/Symfony stack$q$, $q$Runs on PHP 8.3+ and Symfony 7, with Twig 3 for templating.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$SvelteKit admin panel$q$, $q$A SvelteKit 5 and Tailwind 4 based admin with instant SPA navigation, a customizable dashboard, and real-time collaborative editing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$REST API$q$, $q$A stable, plugin-extensible REST API powers the admin and respects Grav's permission model.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Built-in MCP server$q$, $q$A Model Context Protocol server is built in, allowing AI agents to interact with a Grav site.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Built-in internationalization$q$, $q$Multi-language support is built into the core.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Performance caching$q$, $q$Aggressive caching is designed to deliver sub-100ms page loads.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Completely free and MIT-licensed open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$No database required, content is stored as version-controllable files$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Modern technology stack (PHP 8.3+, Symfony 7, SvelteKit-based admin)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Large plugin and theme ecosystem, with 15,571+ GitHub stars$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Built-in MCP server for AI agent integration$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Used by organizations including Microsoft, Xbox, Cisco, and the USDA$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Core project is primarily led by a small team (Trilby Media/Andy Miller) with community and sponsor support$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Premium themes (e.g., Helios at $50) and the YetiSearch Pro search plugin are paid add-ons outside the free core$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$No official managed hosting or cloud plan; self-hosting is required$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Flat-file, no-database architecture may not suit projects needing complex relational data$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Is Grav free?$q$, $q$Yes, Grav's core is MIT-licensed and free. Some premium themes and plugins, such as the Helios theme and YetiSearch Pro, are sold separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Does Grav use a database?$q$, $q$No, Grav stores content as Markdown and YAML files instead of using a database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$What powers Grav?$q$, $q$Grav runs on PHP 8.3+, Symfony 7, and Twig 3, with a SvelteKit-based admin panel.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Does Grav support AI or agent integration?$q$, $q$Yes, Grav includes a built-in Model Context Protocol (MCP) server for AI agent access.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Who created Grav?$q$, $q$Grav was created by Andy Miller and is maintained under Trilby Media, with the project dating to 2014.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Documentation sites$q$, $q$Grav's flat-file, Git-friendly structure and speed suit technical documentation, and is used for this purpose by organizations like Microsoft and Cisco.$q$, $q$Development and documentation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Version-controlled blogs and websites$q$, $q$Storing content as files lets teams manage sites with standard Git workflows.$q$, $q$Developers who want Git-based content workflows$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Fast, database-free marketing sites$q$, $q$Sub-100ms cached page performance suits lightweight marketing and brochure sites.$q$, $q$Agencies and freelancers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Grav Core$q$, $q$Free$q$, NULL, $q$["MIT-licensed, self-hosted","Flat-file Markdown/YAML content","REST API","SvelteKit-based admin panel","Built-in MCP server"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$Premium themes & plugins$q$, $q$From $50 (e.g. Helios theme)$q$, NULL, $q$["Optional premium themes such as Helios","YetiSearch Pro premium search plugin","Bundles up to $200"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$overview$q$, $q$What is Grav?$q$, 2, ARRAY[$q$Grav is a flat-file content management system created by Andy Miller, with the project dating to 2014 and maintained under Trilby Media. It stores content as Markdown and YAML files rather than in a database, and is released under the MIT license.$q$, $q$The current stack runs on PHP 8.3+, Symfony 7, and Twig 3, with a SvelteKit 5 and Tailwind 4 based admin panel offering real-time collaborative editing, plus a built-in REST API and Model Context Protocol (MCP) server for AI agent access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$who-its-for$q$, $q$Who Grav is for$q$, 2, ARRAY[$q$Grav suits developers and teams who want a free, self-hosted, database-free CMS with Git-friendly version control, fast cached page delivery, and an extensible plugin/theme ecosystem, including organizations building documentation sites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── October CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$October CMS is a self-hosted, Laravel-based CMS with a plugin marketplace and a free first-year license.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$39/year$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$October CMS: a self-hosted Laravel PHP CMS with a plugin marketplace, a free first-year license, and paid annual licensing plans.$q$,
  og_description = $q$October CMS: a self-hosted Laravel PHP CMS with a plugin marketplace, a free first-year license, and paid annual licensing plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '960def45-b280-43d5-9fc8-858cdf44c8e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '960def45-b280-43d5-9fc8-858cdf44c8e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Laravel foundation$q$, $q$Built on the Laravel PHP framework, so it follows Laravel conventions and can use the wider Laravel ecosystem.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Marketplace$q$, $q$Hundreds of plugins and themes are available through the October CMS Marketplace.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$CMS components$q$, $q$Reusable "components" let developers add functionality to pages without writing custom code from scratch.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Self-hosted deployment$q$, $q$Runs on your own server or hosting environment rather than a fixed SaaS platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Update Gateway$q$, $q$Licensed installs receive core and plugin updates through October CMS's Update Gateway.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Publicly viewable source$q$, $q$Source code is published on GitHub (not compiled or encrypted), currently at 11.1k+ stars on the octobercms/october repo.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Built on the widely used Laravel PHP framework, giving developers access to Laravel's conventions and ecosystem.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Source code is publicly viewable on GitHub rather than compiled or obfuscated.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Marketplace offers hundreds of plugins and themes for extending functionality.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$New accounts get a free, full-featured license for the first year for personal or commercial use.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Cited by October CMS as used by large organizations, including Toyota, KFC, and Nestlé.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Continuing to receive updates after the first free year requires a paid license ($39/year per site, or an Unlimited Licenses subscription).$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Licensed under a proprietary End User License Agreement with Responsiv Pty Ltd, not an OSI-approved open-source license.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Tied specifically to the Laravel/PHP ecosystem, so it requires Laravel familiarity to use fully.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Is October CMS free?$q$, $q$New accounts get a free, full-featured license for the first year. After that, continuing to receive updates requires a paid license starting at $39/year for a single site, or an Unlimited Licenses subscription for agencies.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$What is October CMS built on?$q$, $q$It is built on the Laravel PHP framework.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Can October CMS be self-hosted?$q$, $q$Yes, October CMS is self-hosted software that you install and run on your own server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Is October CMS open source?$q$, $q$Its source code is published on GitHub and is not compiled or encrypted, but it is licensed under a proprietary EULA with Responsiv Pty Ltd rather than an OSI-approved open-source license.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$What does the Unlimited Licenses subscription include?$q$, $q$It provides unlimited site licenses plus access to October CMS's Partner Program, priced at $26/month billed annually ($312/year) or $30/month billed monthly ($360/year).$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Agency website builds$q$, $q$Agencies managing multiple client sites can use the Unlimited Licenses subscription to cover unlimited projects.$q$, $q$Web development agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Laravel-based custom sites$q$, $q$Developers already working in Laravel can build content-driven sites using familiar tooling and conventions.$q$, $q$Laravel/PHP developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Freelance and small-business sites$q$, $q$Freelancers can use the free first-year license or a $39/year Single License for individual client projects.$q$, $q$Freelance developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Free License$q$, $q$Free$q$, $q$annual$q$, $q$["One year of system updates included","Full feature set for personal or commercial use","Extendable for $39/year afterward"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Single License$q$, $q$$39/license$q$, $q$annual$q$, $q$["One year of system updates included","Covers one production or non-production site","Extendable annually for $39/year"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Unlimited Licenses (annual billing)$q$, $q$$26/month ($312/year)$q$, $q$annual$q$, $q$["Unlimited site licenses","Partner Program access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$Unlimited Licenses (monthly billing)$q$, $q$$30/month ($360/year)$q$, $q$monthly$q$, $q$["Unlimited site licenses","Partner Program access"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$overview$q$, $q$What is October CMS?$q$, 2, ARRAY[$q$October CMS is a self-hosted content management system built on the Laravel PHP framework. Its source code is published on GitHub, and new accounts include a free, full-featured license for the first year.$q$, $q$Continued use of the platform after year one relies on a licensing system: a single-site license renews at $39/year, or agencies can use an Unlimited Licenses subscription for multiple projects. A Marketplace offers hundreds of plugins and themes to extend a site's functionality.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$who-its-for$q$, $q$Who October CMS is for$q$, 2, ARRAY[$q$October CMS suits developers and agencies already working in the Laravel/PHP ecosystem who want a self-hosted CMS with a plugin marketplace, rather than a fully managed SaaS platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── ProcessWire ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ProcessWire is a free, open-source CMS and web framework with an API-driven core and optional paid Pro modules.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ProcessWire: a free, open-source CMS and web framework with an API-driven core, hierarchical page trees, and built-in multi-language support.$q$,
  og_description = $q$ProcessWire: a free, open-source CMS and web framework with an API-driven core, hierarchical page trees, and built-in multi-language support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$API-driven core$q$, $q$Provides a simple, consistent API for accessing and manipulating content with minimal code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Hierarchical page tree$q$, $q$Organizes content in an unlimited-depth page tree structure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Custom fieldtypes$q$, $q$Lets developers define custom fields without requiring extra configuration overhead.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Built-in multi-language support$q$, $q$Core support for multi-language sites and translatable fields, including language packs such as German.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Role-based access control$q$, $q$Granular permissions system for controlling what editors and users can do.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Hooks system$q$, $q$Extends or modifies core behavior via hooks without altering core files.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Pro Shop add-ons$q$, $q$Optional paid modules, including ProCache, Form Builder, and PAGEGRID Page Builder, are sold separately.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Free and open source since 2010, licensed mainly under Mozilla Public License 2.0 (with some MIT-licensed components).$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Developer-friendly API described by ProcessWire as allowing simple, one-line access to content.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Built-in multi-language support without requiring third-party plugins.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Designed for long-term stability; ProcessWire states sites can run "for years without maintenance or updates" if needed.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Unlimited-depth hierarchical page tree gives flexible content structuring.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Smaller ecosystem than mainstream CMS platforms, with about 1.1k GitHub stars on the core processwire/processwire repo.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Some advanced capabilities (ProCache, Form Builder, PAGEGRID Page Builder) require paid Pro Shop modules.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$API-first design requires PHP development knowledge, making it less turnkey for non-developers.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Is ProcessWire free?$q$, $q$Yes, ProcessWire's core CMS and framework have been free and open source since 2010. Optional Pro modules are sold separately through the Pro Shop.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$What license does ProcessWire use?$q$, $q$Most of the core is licensed under Mozilla Public License 2.0, with some components under the MIT license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Does ProcessWire support multiple languages?$q$, $q$Yes, multi-language support, including language packs and translatable fields, is built into the core.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Who created ProcessWire?$q$, $q$ProcessWire was founded in 2010; Ryan Cramer is credited as the author of its core modules.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Can ProcessWire be self-hosted?$q$, $q$Yes, ProcessWire is self-hosted software that you install and run on your own server.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Developer-built custom sites$q$, $q$Developers who want full control over markup and data structure can use ProcessWire's API-first approach.$q$, $q$PHP developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Multi-language websites$q$, $q$Built-in multi-language fields and language packs make it suited for sites that need translated content.$q$, $q$Organizations publishing multilingual content$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$Long-term, low-maintenance sites$q$, $q$ProcessWire states its sites can run for years without required updates, suiting owners who want minimal ongoing maintenance.$q$, $q$Site owners wanting low-maintenance deployments$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$overview$q$, $q$What is ProcessWire?$q$, 2, ARRAY[$q$ProcessWire is a free, open-source content management system and web application framework built for developers who want direct API access to content, alongside an editor-friendly admin interface.$q$, $q$Its core has been free since 2010 and is licensed mainly under Mozilla Public License 2.0. Optional paid modules, such as ProCache, Form Builder, and PAGEGRID Page Builder, are available through the ProcessWire Pro Shop.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$who-its-for$q$, $q$Who ProcessWire is for$q$, 2, ARRAY[$q$ProcessWire suits PHP developers who want a lightweight, API-first framework with a hierarchical content model, including for multi-language sites and long-lived, low-maintenance deployments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Concrete CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Concrete CMS is an open-source, MIT-licensed CMS for teams, self-hostable for free or usable via paid hosted plans from $4.99/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$4.99/month$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = $q$Portland, Oregon, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Concrete CMS: an open-source, MIT-licensed CMS for teams, with role-based editing and workflow approvals, plus hosted plans from $4.99/month.$q$,
  og_description = $q$Concrete CMS: an open-source, MIT-licensed CMS for teams, with role-based editing and workflow approvals, plus hosted plans from $4.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$In-context editing$q$, $q$WYSIWYG editing directly on the live page rather than a separate back-end form.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Role-based permissions$q$, $q$Access control down to individual content blocks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Workflow approvals and versioning$q$, $q$Built-in approval workflows, version history, and change logs for content changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Open-source core$q$, $q$MIT-licensed codebase that can be downloaded and self-hosted for free.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Compliance-oriented hosting$q$, $q$Concrete CMS states its hosting can offer SOC 2 and HIPAA-compliant options, and describes its security as ISO 27001 certified.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Custom SLA / self-managed deployment$q$, $q$The Custom SLA tier supports self-managed deployment via GitLab with custom CI/CD pipelines.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Open-source core licensed under MIT, so it can be self-hosted for free.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Long track record: development began in 2003, originally released as concrete5, giving it a mature codebase.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Granular role-based permissions down to individual content blocks.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Built-in workflow approvals, version control, and change logs support team collaboration.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Compliance-oriented hosting options (SOC 2, HIPAA) are available on paid plans, per Concrete CMS's site.$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Concrete CMS states it is used by hundreds of thousands of organizations, including Fortune 500 companies and the U.S. Military.$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Entry-level paid hosted plan (Starter) has low included limits: 1 editor, 10,000 monthly page views, 2GB storage.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$The self-managed enterprise tier (Custom SLA) requires custom quoting rather than published pricing.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Smaller market share and plugin/theme ecosystem than the largest CMS platforms.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Is Concrete CMS free?$q$, $q$Its core is open source under the MIT license and can be self-hosted for free. Concrete CMS also sells paid hosted plans starting at $4.99/month (Starter, billed annually).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$What was Concrete CMS previously called?$q$, $q$It was originally released as concrete5, with development starting in 2003, before the branding was updated to Concrete CMS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Who maintains Concrete CMS?$q$, $q$PortlandLabs, based in Portland, Oregon.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Does Concrete CMS offer enterprise support?$q$, $q$Yes, a Custom SLA tier with quote-based enterprise pricing is available.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$What compliance options does Concrete CMS hosting offer?$q$, $q$Concrete CMS states its hosting can offer SOC 2 and HIPAA-compliant options, and describes its security as ISO 27001 certified.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Self-hosted enterprise sites$q$, $q$Organizations needing full infrastructure control can self-host the open-source, MIT-licensed core.$q$, $q$Enterprises and government/military organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Managed team collaboration$q$, $q$Teams use paid hosted plans for role-based editing, workflow approvals, and version history.$q$, $q$Content teams and agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Compliance-sensitive sites$q$, $q$Hosting plans with SOC 2 and HIPAA-compliant options suit regulated industries.$q$, $q$Organizations with compliance requirements$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Starter$q$, $q$$4.99/month$q$, $q$annual$q$, $q$["1 editor","10,000 monthly page views","2GB storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Business$q$, $q$$19/month$q$, $q$annual$q$, $q$["5 editors","50,000 monthly page views","20GB storage","CDN","DDoS protection"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$Custom SLA$q$, $q$Custom quote$q$, NULL, $q$["Self-managed deployment via GitLab with custom CI/CD pipelines","Enterprise support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$overview$q$, $q$What is Concrete CMS?$q$, 2, ARRAY[$q$Concrete CMS is an open-source content management system for teams, originally released as concrete5 with development beginning in 2003. Its core is licensed under MIT and can be downloaded and self-hosted for free.$q$, $q$Concrete CMS, maintained by PortlandLabs in Portland, Oregon, also sells paid hosted plans starting with a Starter tier at $4.99/month, a Business tier at $19/month, and a quote-based Custom SLA enterprise tier that supports self-managed deployment via GitLab CI/CD.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$who-its-for$q$, $q$Who Concrete CMS is for$q$, 2, ARRAY[$q$Concrete CMS suits teams that want in-context editing, role-based permissions down to the block level, and workflow approvals, whether self-hosting the open-source core or using a paid hosted plan with compliance-oriented options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── TYPO3 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$TYPO3 is a free, open-source enterprise CMS (GPL v2) with native multi-site and multi-language support, popular across Europe.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 1997,
  company_size = NULL,
  headquarters = $q$Baar, Switzerland (TYPO3 Association); Düsseldorf, Germany (TYPO3 GmbH)$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$TYPO3: a free, open-source GPL v2 enterprise CMS with built-in multi-site and multi-language support, widely used in Europe.$q$,
  og_description = $q$TYPO3: a free, open-source GPL v2 enterprise CMS with built-in multi-site and multi-language support, widely used in Europe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5534f256-62d0-46af-b02c-4c789873abc7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5534f256-62d0-46af-b02c-4c789873abc7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Multi-site & multi-language core$q$, $q$A single TYPO3 installation can run many websites in many languages, sharing templates and resources without extra modules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Backend translations$q$, $q$The admin backend can be translated into 40+ languages via the community-maintained Crowdin translation project.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Long-Term Support (LTS) releases$q$, $q$TYPO3 offers LTS release cycles with several years of stability, security, and maintenance, plus optional Extended LTS (ELTS).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Extension ecosystem$q$, $q$Functionality can be extended through the TYPO3 Extension Repository (TER).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Democratic open governance$q$, $q$The nonprofit TYPO3 Association (1,000+ members) governs the project via a General Assembly voting process.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Enterprise support network$q$, $q$TYPO3 GmbH and a network of certified Solution and Enterprise partners provide paid implementation, training, and SLA-backed support.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Fully free and open source under GPL v2, with no licensing fees for the core CMS$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Native multi-site/multi-language architecture built into the core$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$LTS release cycles (plus optional Extended LTS) suited to long-running enterprise projects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Backed by a formal nonprofit association and a global certified-partner network$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Widely adopted by government and public-sector organizations in Europe$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Steeper learning curve than simpler CMS platforms given its enterprise feature set$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Pricing for enterprise support, certification, and partner services is not published and requires direct contact$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Backend language packs are community-maintained, so translation completeness varies by language$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Is TYPO3 free to use?$q$, $q$Yes, the TYPO3 core CMS is free and open source, released under the GNU General Public License v2 (or later).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Who maintains TYPO3?$q$, $q$The nonprofit TYPO3 Association, based in Baar, Switzerland, governs the project. TYPO3 GmbH, based in Düsseldorf, Germany and fully owned by the Association, provides commercial services.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Does TYPO3 support multiple languages and sites?$q$, $q$Yes, TYPO3 has built-in support for running many websites and languages from a single installation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$How old is TYPO3?$q$, $q$TYPO3 was first created in 1997 by Danish developer Kasper Skårhøj.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Is paid enterprise support available?$q$, $q$Yes, through TYPO3 GmbH and its network of certified TYPO3 partners, though pricing for these services is quote-based rather than publicly listed.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Government and public-sector websites$q$, $q$Built-in access controls, LTS release cycles, and multi-language support suit agencies managing large, regulated web presences.$q$, $q$Government bodies and public-sector organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Multinational corporate websites$q$, $q$A single installation can serve many country- and language-specific sites from shared content and templates.$q$, $q$Large enterprises with multi-country web presence$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Universities and large institutions$q$, $q$Handles complex site structures and long-term maintenance needs typical of large institutional web portfolios.$q$, $q$Universities and large institutions$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Community$q$, $q$Free$q$, NULL, $q$["Full TYPO3 CMS core","Self-hosted","GPL v2 (or later) licensed","Community support via forums and Slack"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$overview$q$, $q$What is TYPO3?$q$, 2, ARRAY[$q$TYPO3 is a free, open-source content management system first created in 1997 by Danish developer Kasper Skårhøj. It is released under the GNU General Public License v2 (or later) and governed by the nonprofit TYPO3 Association, with commercial services provided by TYPO3 GmbH.$q$, $q$The CMS has native, built-in support for running multiple websites and multiple languages from a single installation, and offers Long-Term Support release cycles aimed at organizations that need years of stability without recurring licensing fees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$who-its-for$q$, $q$Who TYPO3 is for$q$, 2, ARRAY[$q$TYPO3 is best suited to organizations with professional web teams managing complex, multi-site, or multi-language projects, such as government agencies, universities, and multinational enterprises, that need a mature, self-hosted CMS backed by a certified-partner support network.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Umbraco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Umbraco is an open-source, MIT-licensed .NET CMS, self-hostable for free or available as managed Umbraco Cloud plans from €45/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€45/month$q$,
  founded_year = 2005,
  company_size = NULL,
  headquarters = $q$Odense, Denmark$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Italian$q$, $q$Dutch$q$, $q$Danish$q$, $q$Polish$q$, $q$Portuguese$q$, $q$Russian$q$, $q$Japanese$q$, $q$Korean$q$, $q$Swedish$q$, $q$Turkish$q$, $q$Ukrainian$q$, $q$Chinese$q$, $q$Norwegian Bokmål$q$, $q$Romanian$q$, $q$Croatian$q$, $q$Czech$q$, $q$Welsh$q$, $q$Hebrew$q$, $q$Bosnian$q$]::text[],
  seo_meta_description = $q$Umbraco: MIT-licensed open-source .NET CMS, self-hosted for free or via managed Umbraco Cloud plans starting at €45/month.$q$,
  og_description = $q$Umbraco: MIT-licensed open-source .NET CMS, self-hosted for free or via managed Umbraco Cloud plans starting at €45/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$MIT-licensed open-source core$q$, $q$The Umbraco CMS source is open source under the MIT license and free to self-host, with source available on GitHub.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Umbraco Cloud$q$, $q$Managed hosting on Microsoft Azure with automatic security updates, Cloudflare CDN, and a managed SQL database, available across four plan tiers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Content Delivery API$q$, $q$A Website & Delivery API is included, with an SLA on Standard tier and above of Umbraco Cloud.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Add-ons suite$q$, $q$Official add-ons cover personalization, e-commerce, forms, content workflows, and UI building; some (e.g. Umbraco Forms, Umbraco Deploy) require separate commercial licenses.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$AI tooling for editors$q$, $q$Umbraco includes built-in AI tools for content editors with governance controls, per umbraco.com.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Localized backoffice$q$, $q$The admin backoffice ships with translations for more than 20 languages, including English, German, French, Spanish, and Japanese.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Core CMS is free, open source (MIT license), and self-hostable with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Managed Umbraco Cloud has published, transparent pricing starting at €45/month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Backoffice interface localized into 20+ languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Runs on .NET / ASP.NET Core, fitting into Microsoft-based infrastructure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Used by well-known brands including Domino's, Volvo, and Heineken, per umbraco.com$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Higher Umbraco Cloud tiers (Professional at €730/month, Enterprise custom) are priced well above small-site budgets$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Some official add-ons, such as Umbraco Forms and Umbraco Deploy, require separate commercial licenses on top of the core CMS$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Self-hosting requires .NET hosting knowledge, unlike simpler PHP-based CMS options$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Is Umbraco free?$q$, $q$Yes, the core Umbraco CMS is open source under the MIT license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$What is Umbraco Cloud?$q$, $q$A managed hosting service on Microsoft Azure with published plans starting at €45/month (Starter) and going up to custom Enterprise pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Who founded Umbraco?$q$, $q$Niels Hartvig founded Umbraco, first released in 2005.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$What languages is the Umbraco backoffice available in?$q$, $q$Umbraco ships with backoffice translations for more than 20 languages, including English, German, French, Spanish, and Japanese.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Was Umbraco acquired?$q$, $q$Umbraco A/S was acquired by growth investor Monterro in 2021, according to a Business Wire announcement.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Enterprise marketing websites$q$, $q$Combines a free, flexible CMS core with managed Umbraco Cloud hosting for organizations that want scalability without managing infrastructure.$q$, $q$Enterprises and marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Agency-built client sites$q$, $q$Digital agencies use Umbraco's flexible content modeling and .NET foundation to build custom client sites.$q$, $q$Digital agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$.NET development teams$q$, $q$Development teams already working in the Microsoft/.NET ecosystem can build on Umbraco without adopting a new stack.$q$, $q$.NET developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Starter$q$, $q$€45/month$q$, $q$monthly$q$, $q$["Microsoft Azure hosting across 5 regions","Automatic security updates","Cloudflare CDN","Forms Builder included","Managed SQL database","Unlimited team members","5 GB media storage","50 GB bandwidth/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Standard$q$, $q$€280/month$q$, $q$monthly$q$, $q$["Website & Delivery API SLA","Multiple environments","Prioritized hosting resources","50 GB media storage","300 GB bandwidth/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Professional$q$, $q$€730/month$q$, $q$monthly$q$, $q$["Full business hours support","Extra dedicated resources","500 GB media storage","1,000 GB bandwidth/month"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["24/7 support","Expanded SLA","Dedicated Customer Success Manager","Architectural advising and code review","Custom usage limits"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$overview$q$, $q$What is Umbraco?$q$, 2, ARRAY[$q$Umbraco is an open-source .NET content management system founded by Niels Hartvig in 2005 and headquartered in Odense, Denmark. The core CMS is released under the MIT license and can be self-hosted for free.$q$, $q$Alongside the free open-source core, Umbraco offers Umbraco Cloud, a managed hosting service on Microsoft Azure with published pricing plans ranging from a €45/month Starter tier to custom Enterprise pricing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$who-its-for$q$, $q$Who Umbraco is for$q$, 2, ARRAY[$q$Umbraco suits organizations and agencies already working in the .NET ecosystem that want a flexible, self-hostable CMS with the option to move to fully managed cloud hosting as needs grow, from marketing teams to enterprise development teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Backdrop CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Backdrop CMS is a free, open-source PHP CMS (GPL v2) forked from Drupal 7 in 2013, built for budget-conscious websites.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Backdrop CMS: a free, open-source PHP content management system forked from Drupal 7, with 1,300+ modules and themes.$q$,
  og_description = $q$Backdrop CMS: a free, open-source PHP content management system forked from Drupal 7, with 1,300+ modules and themes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Drupal 7 fork$q$, $q$Backdrop CMS was forked from Drupal 7 in 2013, retaining a similar architecture and offering a built-in upgrade path from Drupal 7 sites.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$1,300+ modules and add-ons$q$, $q$Add-ons and themes can be browsed and installed directly from the Backdrop CMS site.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Runs on modest hosting$q$, $q$Backdrop is designed for fast page performance even on shared/budget hosting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$No-code content creation$q$, $q$Content can be created and managed without programming knowledge.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Community governance$q$, $q$The project is guided by a Project Management Committee (PMC), modeled on the Apache Software Foundation's governance approach.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Software Freedom Conservancy member$q$, $q$Backdrop CMS is a member project of the Software Freedom Conservancy, a nonprofit that supports open-source projects.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Completely free, open source (GPL v2 or later), with no paid tiers or licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Straightforward upgrade path for existing Drupal 7 sites$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Runs well on modest or shared hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$1,300+ community modules and add-ons available$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Backed by nonprofit Software Freedom Conservancy membership$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Smaller ecosystem than Drupal or WordPress, with roughly 3,600 known sites and under 3,000 community members$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$No official managed cloud hosting product; users must self-host or arrange third-party hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$As a Drupal 7-era fork, it does not carry forward newer Drupal 8+/9+ core features and modules$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Is Backdrop CMS free?$q$, $q$Yes, Backdrop CMS is entirely free and open source under the GPL version 2 (or later) license, with no paid plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$What is Backdrop CMS based on?$q$, $q$It was forked from Drupal 7 in 2013 by Drupal developers Nate Lampton and Jen Lampton.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Can I upgrade a Drupal 7 site to Backdrop?$q$, $q$Yes, Backdrop CMS provides a built-in upgrade path from Drupal 7.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Who governs Backdrop CMS?$q$, $q$A community Project Management Committee (PMC) modeled on Apache Software Foundation governance; Backdrop is a member project of the Software Freedom Conservancy.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$How many sites use Backdrop CMS?$q$, $q$The Backdrop CMS website reports more than 3,600 known sites running the platform.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Budget-conscious nonprofit and community sites$q$, $q$Backdrop targets organizations like nonprofits, schools, museums, and libraries that need Drupal 7-style functionality without expensive upkeep.$q$, $q$Nonprofits, schools, museums, libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Drupal 7 migration path$q$, $q$Sites still running end-of-life Drupal 7 can move to Backdrop using its built-in upgrade path while retaining familiar architecture.$q$, $q$Existing Drupal 7 site owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Small business and personal websites$q$, $q$Runs efficiently on shared/budget hosting for smaller sites and blogs.$q$, $q$Small businesses and individuals$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Backdrop CMS$q$, $q$Free$q$, NULL, $q$["Full CMS core","1,300+ modules and themes","Self-hosted","GPL v2 (or later) licensed"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$overview$q$, $q$What is Backdrop CMS?$q$, 2, ARRAY[$q$Backdrop CMS is a free, open-source content management system written in PHP and forked from Drupal 7 in 2013 by developers Nate Lampton and Jen Lampton. It is released under the GNU General Public License v2 (or later).$q$, $q$Backdrop retains much of Drupal 7's functionality and architecture while offering a built-in upgrade path from Drupal 7, more than 1,300 modules and themes, and community governance through a Project Management Committee. It is a member project of the Software Freedom Conservancy.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$who-its-for$q$, $q$Who Backdrop CMS is for$q$, 2, ARRAY[$q$Backdrop CMS is aimed at organizations and individuals who want the feature set of Drupal 7 without expensive upkeep, including nonprofits, schools, museums, libraries, small businesses, and existing Drupal 7 site owners looking to migrate off an end-of-life platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Silverstripe CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Silverstripe CMS is a free, open-source BSD-licensed PHP CMS and framework, with 50,000+ live installations and optional paid Cloud hosting.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2000,
  company_size = NULL,
  headquarters = $q$Wellington, New Zealand$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Silverstripe CMS: a free, open-source BSD-licensed PHP CMS and framework with 50,000+ live sites and 2,500+ modules.$q$,
  og_description = $q$Silverstripe CMS: a free, open-source BSD-licensed PHP CMS and framework with 50,000+ live sites and 2,500+ modules.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Open-source core under the BSD license$q$, $q$Silverstripe CMS is free to self-host, distributed under the permissive BSD license.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Templating engine$q$, $q$A dedicated templating engine handles frontend rendering and theming.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Granular permission controls$q$, $q$Role-based access management lets teams restrict editing and publishing rights.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$2,500+ modules$q$, $q$The community has published more than 2,500 modules extending core functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Silverstripe Cloud$q$, $q$A quote-based managed hosting platform, ISO/IEC 27001 certified, run by commercial backer Silverstripe Limited.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Multi-audience design$q$, $q$The platform is built to serve four groups: developers, marketers, content authors, and IT managers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Free and open source under the permissive BSD license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Large install base, with 50,000+ live Silverstripe CMS sites reported by silverstripe.org$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$2,500+ community modules extend core functionality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Backed by commercial company Silverstripe Limited, offering support and a certified Cloud hosting platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Used by notable organizations including Lenovo, Westpac, and Lord's Cricket Ground$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Silverstripe Cloud pricing is not publicly listed and requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Smaller module ecosystem than larger CMS platforms like WordPress or Drupal$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Requires PHP development expertise to customize beyond out-of-the-box functionality$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Is Silverstripe CMS free?$q$, $q$Yes, the core CMS is free and open source, distributed under the BSD License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Who created Silverstripe?$q$, $q$Silverstripe was founded in 2000 in Wellington, New Zealand, by Sam Minnée, Sigurd Magnusson, and Tim Copeland.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$How many sites run on Silverstripe?$q$, $q$Silverstripe.org reports over 50,000 live Silverstripe CMS installations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Is there managed hosting for Silverstripe CMS?$q$, $q$Yes, Silverstripe Cloud offers managed, scalable hosting, but pricing is not publicly listed and requires contacting sales.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$What license is Silverstripe CMS released under?$q$, $q$The BSD License.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Government and enterprise websites$q$, $q$Granular permission controls and enterprise-level security updates suit organizations with strict access and compliance needs.$q$, $q$Government agencies and enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Agency-built custom sites$q$, $q$Agencies use Silverstripe's combined CMS and PHP framework to build tailored client websites.$q$, $q$Digital agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Developer-led custom builds$q$, $q$The underlying MVC framework lets developers extend and customize beyond typical CMS boundaries.$q$, $q$PHP developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$Silverstripe CMS$q$, $q$Free$q$, NULL, $q$["Open-source core","Self-hosted","BSD licensed","2,500+ modules"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$overview$q$, $q$What is Silverstripe CMS?$q$, 2, ARRAY[$q$Silverstripe CMS is a free, open-source content management system and PHP web framework founded in 2000 in Wellington, New Zealand, by Sam Minnée, Sigurd Magnusson, and Tim Copeland. The core software is released under the BSD License.$q$, $q$Silverstripe.org reports more than 50,000 live Silverstripe CMS installations and 2,500+ community modules. Commercial backer Silverstripe Limited also operates Silverstripe Cloud, a quote-priced managed hosting platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$who-its-for$q$, $q$Who Silverstripe CMS is for$q$, 2, ARRAY[$q$Silverstripe CMS is designed for developers, marketers, content authors, and IT managers, and is commonly used by agencies and organizations, including government and enterprise clients, that need a customizable, security-focused PHP CMS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Publii ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Publii is a free, open-source desktop CMS for building and publishing static websites without server-side hosting requirements.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Free, open-source desktop CMS (GPL-3.0) for building static websites, with deployment to GitHub Pages, Netlify, S3, and more.$q$,
  og_description = $q$Free, open-source desktop CMS (GPL-3.0) for building static websites, with deployment to GitHub Pages, Netlify, S3, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Multiple post editors$q$, $q$Includes image galleries, video support, and code syntax highlighting for writing posts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Built-in performance tools$q$, $q$Automatic HTML/CSS compression, lazy-loaded responsive images, and WebP conversion.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$GDPR/CCPA compliance tools$q$, $q$Advanced cookie banner and Google Consent Mode v2 support built into the app.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$SEO structured data$q$, $q$Structured data markup, Open Graph tags, and auto-generated XML sitemaps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Flexible deployment$q$, $q$Publish directly to GitHub Pages, GitLab, Netlify, Amazon S3, Google Cloud, or SFTP/FTPS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Cross-platform desktop app$q$, $q$Runs natively on Windows 10+, macOS 12+, and 64-bit Linux.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Free and open source under the GPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Generates static sites, so there's no server-side hosting to maintain or secure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Wide range of built-in deployment targets (GitHub Pages, Netlify, S3, etc.)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Built-in SEO and GDPR/CCPA compliance tooling$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Works fully offline as a local desktop app$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Desktop-only workflow with no browser-based editing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Publishing requires a manual build-and-deploy step from the app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Premium themes and plugins in the marketplace cost extra$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$No built-in multi-user/team collaboration$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Is Publii free to use?$q$, $q$Yes, the core Publii desktop app is free and open source under the GPL-3.0 license. Optional premium themes and plugins are sold separately in its marketplace.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$What platforms does Publii run on?$q$, $q$Publii is a desktop application available for Windows 10+, macOS 12+, and 64-bit Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Where can I host a site built with Publii?$q$, $q$Publii can deploy to GitHub Pages, GitLab, Netlify, Amazon S3, Google Cloud, SFTP/FTPS, or manually export files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Is Publii open source?$q$, $q$Yes. Publii is built with Electron and Vue.js and its source code is available on GitHub under the GPL-3.0 license.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Static blogging without a server$q$, $q$Write and publish posts locally, then deploy a static site with no backend to maintain.$q$, $q$Independent bloggers and writers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Privacy-first business websites$q$, $q$Use built-in GDPR/CCPA and cookie-consent tooling to publish compliant marketing sites.$q$, $q$Small businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Free static hosting workflows$q$, $q$Deploy directly to free static hosts like GitHub Pages or Netlify from the desktop app.$q$, $q$Developers and technical users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Publii App$q$, $q$Free$q$, NULL, $q$["Full desktop CMS application","GPL-3.0 open source","Deployment to GitHub Pages, Netlify, S3, and more"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$overview$q$, $q$What is Publii?$q$, 2, ARRAY[$q$Publii is a free, open-source static site CMS delivered as a desktop application for Windows, macOS, and Linux. Rather than running on a web server, Publii lets you write and manage content locally, then build and publish a static website to a host of your choosing.$q$, $q$The app includes built-in tools for SEO (structured data, Open Graph, XML sitemaps) and privacy compliance (GDPR/CCPA cookie banners), along with support for deploying to GitHub Pages, GitLab, Netlify, Amazon S3, Google Cloud, or SFTP/FTPS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$who-its-for$q$, $q$Who Publii is for$q$, 2, ARRAY[$q$Publii suits bloggers, writers, and small businesses who want a traditional CMS-style editing experience without paying for server hosting or managing site security. It also appeals to developers who want a free, open-source way to generate and deploy static sites to platforms like GitHub Pages or Netlify.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Micro.blog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Micro.blog is a blogging and podcasting platform starting at $5/month for hosting at your own custom domain.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$5/month$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Micro.blog offers blog and podcast hosting from $5/month, with cross-posting to Mastodon, Threads, and Bluesky.$q$,
  og_description = $q$Micro.blog offers blog and podcast hosting from $5/month, with cross-posting to Mastodon, Threads, and Bluesky.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Custom domain hosting$q$, $q$Host short posts, essays, photo blogs, or newsletters at your own domain name.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Automatic cross-posting$q$, $q$Cross-post content to Mastodon, Threads, and Bluesky from the base plan.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Fediverse and IndieWeb support$q$, $q$Built-in compatibility with fediverse protocols and IndieWeb standards.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Email newsletters (Premium)$q$, $q$Send email newsletters and archive bookmarks or highlighted web pages on the Premium plan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Multiple blogs (Premium)$q$, $q$Premium plan supports up to 5 blogs per account.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Family collaboration (Family plan)$q$, $q$Up to 5 members can write or edit posts across any blog on the account.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Video and podcast hosting (Studio)$q$, $q$Studio plan adds video hosting up to 20 minutes, podcast recording, and multi-resolution video with cross-posting to Bluesky.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Publishing to your own custom domain from $5/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Built-in cross-posting to Mastodon, Threads, and Bluesky$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Fediverse and IndieWeb protocol support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Tiered plans for families and podcasters, not just single bloggers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Founded in 2017 with an established, focused product$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$No free plan advertised$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Multiple blogs, newsletters, and video hosting require upgrading past the base $5/month tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Top Studio tier costs $20/month for full video/podcast features$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$How much does Micro.blog cost?$q$, $q$Plans start at $5/month for the base Micro.blog plan, with Premium at $10/month, Family at $15/month, and Studio at $20/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$What's included in the Premium plan?$q$, $q$Premium adds support for up to 5 blogs, email newsletters, bookmark archiving, and web page highlighting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Does Micro.blog support podcasts and video?$q$, $q$Yes, the Studio plan adds video hosting up to 20 minutes, podcast recording, multiple resolutions, and video cross-posting to Bluesky.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Who founded Micro.blog?$q$, $q$Micro.blog was founded in 2017 by Manton Reece.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Independent microblogging$q$, $q$Publish short posts and essays to your own domain with fediverse cross-posting.$q$, $q$Independent bloggers and writers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Family or small-team blogging$q$, $q$Use the Family plan to let up to 5 people write or edit posts across shared blogs.$q$, $q$Families and small teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Podcasting and video publishing$q$, $q$Record and host podcasts and short videos using the Studio plan.$q$, $q$Podcasters and video creators$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Micro.blog$q$, $q$$5/month$q$, $q$monthly$q$, $q$["Blog hosting at your own domain","Cross-posting to Mastodon, Threads, Bluesky","Inkwell feed reader"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Micro.blog Premium$q$, $q$$10/month$q$, $q$monthly$q$, $q$["Up to 5 blogs","Email newsletters","Bookmark archiving","Web page highlighting"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Micro.blog Family$q$, $q$$15/month$q$, $q$monthly$q$, $q$["Up to 5 members can write/edit posts","All Premium features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Micro.blog Studio$q$, $q$$20/month$q$, $q$monthly$q$, $q$["Video hosting up to 20 minutes","Podcast recording","Multiple video resolutions","Video cross-posting to Bluesky","All Family and Premium features"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$overview$q$, $q$What is Micro.blog?$q$, 2, ARRAY[$q$Micro.blog is a blogging platform, founded in 2017 by Manton Reece, that lets users publish short posts, essays, photo blogs, and email newsletters at their own domain name. It integrates with the fediverse and IndieWeb standards and automatically cross-posts content to networks like Mastodon, Threads, and Bluesky.$q$, $q$Pricing starts at $5/month for the base plan and scales up through Premium ($10/month), Family ($15/month), and Studio ($20/month), each adding capabilities such as multiple blogs, newsletters, multi-user collaboration, and podcast/video hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$who-its-for$q$, $q$Who Micro.blog is for$q$, 2, ARRAY[$q$Micro.blog fits independent writers who want to own their content at a custom domain while staying connected to the fediverse, as well as families or small groups who want to co-manage blogs, and podcasters who need built-in recording and hosting through the Studio plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Blot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Blot turns a synced folder into a website for $6/month per site, with hosting and templates included.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$6/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Blot is a $6/month hosted blogging tool that publishes a folder of files as a website, no CMS required.$q$,
  og_description = $q$Blot is a $6/month hosted blogging tool that publishes a folder of files as a website, no CMS required.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53ba4185-9c98-4925-94b6-7aa6336c54d0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53ba4185-9c98-4925-94b6-7aa6336c54d0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Folder-to-website publishing$q$, $q$Turns a folder of files into a live website rather than requiring a web-based CMS.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Drag-and-drop publishing$q$, $q$Add or edit content by dragging files into your synced folder.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Editor integration$q$, $q$Designed to work alongside existing text editors you already use.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$All templates included$q$, $q$Every plan includes access to all available site templates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Custom domains and SSL$q$, $q$Custom domain support and SSL certificates are included in the price.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Simple, file-based publishing workflow with no CMS interface to learn$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$All templates included at a single flat price$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Custom domain and SSL support included$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Over a decade of operating history$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Annual billing available for a discount on the base monthly rate$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$No free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Single flat pricing plan offers less flexibility than tiered platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Priced per site, so multi-site use adds up$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$No dedicated mobile or desktop apps mentioned$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$How much does Blot cost?$q$, $q$Blot costs $6 per month per site, billed monthly by default with an annual billing option available after signup.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Is there a free trial?$q$, $q$No free trial is advertised on Blot's pricing page.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$What's included in the price?$q$, $q$Hosting, all templates, custom domain support, SSL certificates, and customer support are included.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$How does Blot publishing work?$q$, $q$Blot turns a folder of files into a website — you add, edit, or delete files and Blot publishes the changes.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$What payment methods does Blot accept?$q$, $q$Blot processes payments through Stripe and PayPal, and subscriptions can be canceled anytime.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Folder-based blogging$q$, $q$Publish a website directly from a folder of files using your existing text editor.$q$, $q$Writers who prefer working locally$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Migrating existing notes online$q$, $q$Turn an existing folder of documents or notes into a public site.$q$, $q$People with existing file-based archives$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Blot$q$, $q$$6/month per site$q$, $q$monthly$q$, $q$["Hosting","All templates","Custom domain support","SSL certificates","Customer support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$overview$q$, $q$What is Blot?$q$, 2, ARRAY[$q$Blot is a hosted publishing tool that turns a folder of files into a website. Instead of writing posts inside a web-based CMS, users add or edit files in a folder using their own text editor, and Blot publishes the changes automatically.$q$, $q$The service costs $6 per month per site, with that price covering hosting, all available templates, custom domain support, and SSL certificates. Blot has operated for over a decade and offers documentation, example sites, and developer resources.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$who-its-for$q$, $q$Who Blot is for$q$, 2, ARRAY[$q$Blot is aimed at writers and developers who'd rather work in their existing text editor and file system than a browser-based CMS, including people looking to publish an existing folder of notes or documents as a public website.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Bear Blog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bear Blog is a free, open-source blogging platform with no trackers, ads, or JavaScript, and ~2.7kb pages.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bear Blog is a free, privacy-first blogging platform with zero trackers, ads, or JavaScript and tiny page sizes.$q$,
  og_description = $q$Bear Blog is a free, privacy-first blogging platform with zero trackers, ads, or JavaScript and tiny page sizes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3bc33713-c005-4ff3-a44a-039f94585dff';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3bc33713-c005-4ff3-a44a-039f94585dff' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Zero trackers, ads, or JavaScript$q$, $q$Pages are built without client-side scripts, ad code, or analytics trackers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Extremely lightweight pages$q$, $q$Average page size is approximately 2.7kb.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Custom domain support$q$, $q$Blogs can be published under a custom domain.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$RSS and Atom feeds$q$, $q$Built-in feed support for readers and aggregators.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Free themes$q$, $q$A selection of free themes is available out of the box.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Open-source codebase$q$, $q$Source code is publicly available on GitHub (HermanMartinus/bearblog).$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Free to use with no advertised paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Open source, with the code available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$No trackers, ads, or JavaScript, supporting a strong privacy stance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Very small average page size (~2.7kb) for fast loading$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Custom domain support included$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Deliberately minimal feature set compared to full-featured CMS platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$No stated support tiers or SLAs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Design customization is limited by the platform's no-bloat philosophy$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Is Bear Blog free?$q$, $q$Yes, Bear Blog is free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Is Bear Blog open source?$q$, $q$Yes, its source code is publicly available on GitHub at HermanMartinus/bearblog.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Does Bear Blog use JavaScript or trackers?$q$, $q$No. Bear Blog is built with no JavaScript, ads, or trackers by design.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Can I use a custom domain with Bear Blog?$q$, $q$Yes, custom domain support is included.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Distraction-free writing$q$, $q$Publish text-focused posts on a fast, minimal platform without extra bloat.$q$, $q$Writers who prioritize content over design$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Privacy-conscious blogging$q$, $q$Run a blog with no trackers, ads, or client-side scripts.$q$, $q$Privacy-conscious bloggers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Self-hostable, inspectable blogging$q$, $q$Review or adapt the open-source codebase on GitHub.$q$, $q$Developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$overview$q$, $q$What is Bear Blog?$q$, 2, ARRAY[$q$Bear Blog is a free, open-source blogging platform built around simplicity and speed. Pages contain no trackers, ads, or JavaScript, and average roughly 2.7kb in size, with the project's source code publicly available on GitHub.$q$, $q$It includes custom domain support, RSS and Atom feeds, and a set of free themes, positioning itself against feature-heavy, script-laden blogging platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$who-its-for$q$, $q$Who Bear Blog is for$q$, 2, ARRAY[$q$Bear Blog suits writers who want a fast, no-frills place to publish text-first content, along with privacy-conscious users who want to avoid trackers and ads, and developers interested in an open-source blogging codebase.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Shopware ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Shopware is a German ecommerce platform with a free open-source Community Edition and paid plans from around €600/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€600/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Shopware offers a free MIT-licensed Community Edition plus paid SaaS/PaaS ecommerce plans starting around €600/month.$q$,
  og_description = $q$Shopware offers a free MIT-licensed Community Edition plus paid SaaS/PaaS ecommerce plans starting around €600/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4129c50a-55d6-450e-8940-28027dd14508';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4129c50a-55d6-450e-8940-28027dd14508' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Shopware Intelligence Copilot$q$, $q$AI-assisted commerce management built into the platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Integrated CMS, SEO, and analytics$q$, $q$Built-in content management, search visibility, and data-analysis tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Flow Builder and Rule Builder$q$, $q$Visual tools for automation and custom business logic.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$B2B components$q$, $q$Enterprise-level features for business-to-business selling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Omnichannel connect$q$, $q$Multi-channel sales capabilities across storefronts and channels.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Digital sales rooms$q$, $q$Specialized B2B sales environments available on higher tiers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Shopware Payments$q$, $q$Integrated payment processing within the platform.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Free, open-source Community Edition under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Flexible deployment options: self-hosted, SaaS, or PaaS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Large partner ecosystem with 1,200+ certified agencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Strong B2B feature set alongside B2C capabilities$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Named a Visionary in the 2025 Gartner Magic Quadrant for Digital Commerce$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Top-tier Beyond plan requires a custom sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Pricing is tied to gross merchandise value (GMV) and other business factors, not fully transparent$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Evolve and Beyond tiers are enterprise-priced (€2,400+/month)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Full AI feature set (Shopware Intelligence+) costs extra (€19–€29/month)$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Is Shopware free?$q$, $q$Shopware Community Edition is free and open source under the MIT license. Paid Rise, Evolve, and Beyond plans add cloud hosting and additional features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$How much does Shopware cost?$q$, $q$Rise starts from €600/month, Evolve from €2,400/month (both excl. VAT), and Beyond is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Is Shopware open source?$q$, $q$Yes, the Community Edition is open source and MIT licensed.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Where is Shopware based?$q$, $q$Shopware is headquartered in Germany.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Enterprise omnichannel commerce$q$, $q$Run B2C and B2B storefronts across multiple sales channels with built-in CMS and AI tools.$q$, $q$Enterprise brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Self-hosted open-source ecommerce$q$, $q$Deploy the free Community Edition and manage infrastructure independently.$q$, $q$Merchants and developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$B2B wholesale commerce$q$, $q$Use B2B components and digital sales rooms for wholesale and enterprise buying.$q$, $q$B2B wholesalers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open-source, MIT-licensed core","Self-managed deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Rise$q$, $q$From €600/month (excl. VAT)$q$, $q$monthly$q$, $q$["Shopware Intelligence","3D capabilities","Unlimited sales channels","Basic support (8-hour response time)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Evolve$q$, $q$From €2,400/month (excl. VAT)$q$, $q$monthly$q$, $q$["B2B components","Advanced search","Dynamic access","Enhanced support (4-hour response time, phone support)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Beyond$q$, $q$Custom$q$, NULL, $q$["Digital sales rooms","Multi-inventory","Customer-specific pricing","Subscriptions","24/7 priority support with dedicated account manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$overview$q$, $q$What is Shopware?$q$, 2, ARRAY[$q$Shopware is a German ecommerce platform offering a free, open-source Community Edition (MIT licensed) alongside paid SaaS and PaaS plans. It includes an integrated CMS, SEO and analytics tools, a Flow Builder for automation, and B2B-specific features such as digital sales rooms and dynamic access rules.$q$, $q$Paid plans start with Rise from €600/month, scale to Evolve from €2,400/month, and top out with the custom-priced Beyond tier, each adding support levels, B2B capabilities, and access to features like the Shopware Intelligence Copilot.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$who-its-for$q$, $q$Who Shopware is for$q$, 2, ARRAY[$q$Shopware serves both self-hosting merchants using the free Community Edition and enterprise brands needing managed cloud hosting, B2B wholesale functionality, and omnichannel selling, supported by a network of 1,200+ certified partner agencies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Sylius ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sylius is an open-source, MIT-licensed headless ecommerce platform built on Symfony and PHP, based in Opole, Poland.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Opole, Poland$q$,
  languages = '{}',
  seo_meta_description = $q$Sylius is a free, open-source headless ecommerce platform for PHP/Symfony developers, with a paid Sylius Plus tier.$q$,
  og_description = $q$Sylius is a free, open-source headless ecommerce platform for PHP/Symfony developers, with a paid Sylius Plus tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$REST APIs via API Platform$q$, $q$Powerful REST APIs built on API Platform for headless commerce implementations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$B2C and B2B support$q$, $q$Designed to support both business-to-consumer and business-to-business commerce models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Docker and Kubernetes-ready$q$, $q$Scalable architecture that supports containerized deployment.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Behavior-Driven Development testing$q$, $q$Built with a BDD testing approach for reliability.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Modular, customizable architecture$q$, $q$Core platform designed to be extended and customized for bespoke commerce needs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Multi-vendor marketplace (Dafre)$q$, $q$Dedicated product for building multi-vendor marketplaces.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$B2B setup (Elesto)$q$, $q$Dedicated product offering B2B-specific setup options.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Free, open-source Community Edition under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Strong developer and testing culture with Behavior-Driven Development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Large community: 7,400+ developers on Slack and 700+ contributors$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Used by major brands including Mytheresa, Carrefour, and Jägermeister$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Headless, API-first architecture built on Symfony$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Requires PHP/Symfony expertise; not a no-code platform$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Sylius Plus pricing is not publicly disclosed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Best suited to mid-market/enterprise needs rather than very small stores$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Is Sylius free?$q$, $q$Yes, Sylius Community Edition is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$What is Sylius Plus?$q$, $q$Sylius Plus is the commercial edition, offering support and advanced features on top of the Community Edition.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$What technology does Sylius use?$q$, $q$Sylius is built on PHP and the Symfony framework, using API Platform for its REST APIs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Where is Sylius based?$q$, $q$Sylius is headquartered in Opole, Poland.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Custom headless commerce$q$, $q$Build bespoke B2C or B2B storefronts using Sylius's REST API and modular architecture.$q$, $q$Mid-market and enterprise brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Symfony-based commerce development$q$, $q$Use an ecommerce framework built for PHP/Symfony teams with a BDD testing culture.$q$, $q$Development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Marketplace and B2B commerce$q$, $q$Build multi-vendor marketplaces (Dafre) or B2B storefronts (Elesto) on top of Sylius.$q$, $q$Marketplace operators and B2B companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source (MIT)","Core ecommerce framework","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Sylius Plus$q$, $q$Custom$q$, NULL, $q$["Commercial support","Advanced features"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$overview$q$, $q$What is Sylius?$q$, 2, ARRAY[$q$Sylius is an open-source, headless ecommerce platform built on PHP and Symfony, using API Platform to expose REST APIs for custom commerce implementations. It's designed for mid-market and enterprise brands that need bespoke solutions rather than an out-of-the-box storefront.$q$, $q$The Community Edition is free and MIT licensed, while Sylius Plus adds commercial support and advanced features. The company behind Sylius is headquartered in Opole, Poland, and its ecosystem includes over 700 contributors and 7,400+ developers on Slack.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$who-its-for$q$, $q$Who Sylius is for$q$, 2, ARRAY[$q$Sylius fits development teams and CTOs who need a customizable, API-first ecommerce framework built on familiar PHP/Symfony tooling, including companies building multi-vendor marketplaces or B2B storefronts on top of the core platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Medusa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Medusa is an open-source, MIT-licensed commerce platform with 35k+ GitHub stars and Medusa Cloud from $29/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Medusa is an open-source (MIT) commerce platform for developers, with a managed Medusa Cloud plan starting at $29/month.$q$,
  og_description = $q$Medusa is an open-source (MIT) commerce platform for developers, with a managed Medusa Cloud plan starting at $29/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8c235fd0-f6aa-40a1-a259-80552567229d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8c235fd0-f6aa-40a1-a259-80552567229d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Advanced product management$q$, $q$Rich product pages, bundles, and bulk editing tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Multiple sales channels$q$, $q$Support for multi-store, point-of-sale, and app-based sales channels with channel-specific rules.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Inventory and multi-warehousing$q$, $q$Order reservations and synchronization across multiple warehouses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Multi-regional support$q$, $q$Multiple currencies, local tax rules, and region-specific shipping and payments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Promotion engine$q$, $q$Advanced campaign rules, customer-specific pricing, and discounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Customizable admin dashboard$q$, $q$An extensible dashboard for managing commerce operations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Model Context Protocol (MCP) support$q$, $q$Built-in support for AI/agent integrations via MCP, plus a Cloud CLI and Development Agent.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Fully open source under the MIT license, with 35k+ GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Medusa Cloud has no GMV-based fees — pay only for infrastructure usage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Modular architecture for custom commerce logic$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Built-in multi-regional and multi-currency support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$AI/agent-oriented tooling via Model Context Protocol support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Developer-oriented setup requiring technical implementation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Medusa Cloud pricing scales with infrastructure usage rather than a flat rate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$AI/agent features may require additional configuration$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Is Medusa free?$q$, $q$Yes, the core Medusa platform is open source and free under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$How much does Medusa Cloud cost?$q$, $q$Medusa Cloud starts at $29/month with no GMV tax or hidden license fees; you pay for infrastructure usage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$What license does Medusa use?$q$, $q$Medusa is licensed under MIT.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Does Medusa support AI agents?$q$, $q$Yes, Medusa supports the Model Context Protocol (MCP) for AI and agent-driven development, along with a Development Agent and Cloud CLI tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Custom commerce backends$q$, $q$Build B2C or B2B commerce logic using Medusa's modular open-source framework.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Open-source alternative to SaaS commerce$q$, $q$Self-host the free core platform instead of a proprietary SaaS commerce system.$q$, $q$Teams avoiding vendor lock-in$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$AI/agent-driven commerce$q$, $q$Use MCP support and agentic tooling to build AI-assisted commerce experiences.$q$, $q$Teams building AI-powered storefronts$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted","MIT-licensed core","Full commerce modules"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$Medusa Cloud$q$, $q$From $29/month$q$, $q$monthly$q$, $q$["Managed infrastructure","AI/agent features","Cloud CLI tools","No GMV fees"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$overview$q$, $q$What is Medusa?$q$, 2, ARRAY[$q$Medusa is an open-source commerce platform, MIT licensed and with 35k+ GitHub stars, built for developers to create customized B2C, B2B, and marketplace commerce solutions. It includes modules for product management, multi-warehouse inventory, multi-regional pricing, and a promotion engine.$q$, $q$Beyond the free self-hosted core, Medusa Cloud offers managed infrastructure starting at $29/month with no GMV-based fees, along with AI and agent tooling including Model Context Protocol (MCP) support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$who-its-for$q$, $q$Who Medusa is for$q$, 2, ARRAY[$q$Medusa is aimed at developers and technical teams who want an open-source, customizable commerce backend instead of a closed SaaS platform, including teams building AI-agent-driven commerce experiences using Medusa's MCP support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Saleor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Saleor is an open-source, BSD-licensed headless commerce API with Saleor Cloud plans starting at $1,599/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$1,599/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Saleor is a GraphQL-native, open-source commerce API (BSD-3-Clause) with Saleor Cloud plans from $1,599/month.$q$,
  og_description = $q$Saleor is a GraphQL-native, open-source commerce API (BSD-3-Clause) with Saleor Cloud plans from $1,599/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$GraphQL-native API$q$, $q$Native GraphQL API with 160+ webhooks for integrations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Extensible admin dashboard$q$, $q$Administration dashboard with 45+ mount points for custom UI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Dynamic product modeling$q$, $q$Products and data structures can be adapted on the fly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Omnichannel processing$q$, $q$Supports web, mobile, retail, and agentic sales channels.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$OpenTelemetry observability$q$, $q$Distributed system monitoring using the OpenTelemetry standard.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Configurator CLI$q$, $q$Automates configuration and syncs between the API and a repository.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Open-source core under the BSD-3-Clause license, with 23.1k+ GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$GraphQL-native, API-first architecture$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$SOC 2 Type II, GDPR, and PCI-DSS compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Proven at scale: reported 1B+ requests and 400k orders processed monthly$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Tech-agnostic integration via APIs and webhooks$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Saleor Cloud starts at $1,599/month for the Select tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Overage fees (0.2%–0.8%) apply beyond each plan's GMV limit$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Requires engineering resources; not a no-code/out-of-the-box solution$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Enterprise tier requires custom sales negotiation$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Is Saleor free?$q$, $q$The open-source Saleor core is free and BSD-3-Clause licensed. A free Sandboxes tier on Saleor Cloud is also available for non-commercial prototyping and testing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$How much does Saleor Cloud cost?$q$, $q$Select is $1,599/month (up to $200,000 GMV, 0.8% overage), Volume is $3,999/month (up to $1,000,000 GMV, 0.4% overage), and Enterprise is custom-priced with overage rates as low as 0.2%.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$What license does Saleor use?$q$, $q$Saleor's core is licensed under BSD-3-Clause.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Is Saleor headless?$q$, $q$Yes, Saleor is a GraphQL-native, API-only headless commerce platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Full-control headless commerce$q$, $q$Build custom storefronts on top of a GraphQL-native API with no black-box layers.$q$, $q$Commerce engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Compliance-sensitive commerce$q$, $q$Run commerce infrastructure that meets SOC 2 Type II, GDPR, and PCI-DSS requirements.$q$, $q$Enterprises with compliance needs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Omnichannel storefronts$q$, $q$Serve web, mobile, retail, and agentic channels from a single API.$q$, $q$Teams building omnichannel experiences$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Sandboxes$q$, $q$Free$q$, NULL, $q$["Forever free for non-commercial use","Prototyping and testing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Select$q$, $q$$1,599/month$q$, $q$monthly$q$, $q$["Up to $200,000 GMV monthly","0.8% fee on orders exceeding GMV limit","Fair API usage policy"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Volume$q$, $q$$3,999/month$q$, $q$monthly$q$, $q$["Up to $1,000,000 GMV monthly","0.4% fee on orders exceeding GMV limit","Fair API usage policy"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom negotiated pricing","Overage rates as low as 0.2%","Best unit economics for scale"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$overview$q$, $q$What is Saleor?$q$, 2, ARRAY[$q$Saleor is an open-source, headless commerce platform built around a GraphQL-native API. The core is BSD-3-Clause licensed with 23.1k+ GitHub stars, and includes an extensible admin dashboard, 160+ webhooks, and OpenTelemetry-based observability.$q$, $q$Beyond the free open-source core and a free Sandboxes tier for prototyping, Saleor Cloud offers managed plans starting at $1,599/month for the Select tier, scaling to $3,999/month for Volume and custom Enterprise pricing, each with GMV-based limits and overage fees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$who-its-for$q$, $q$Who Saleor is for$q$, 2, ARRAY[$q$Saleor targets commerce teams that want full control over a GraphQL-native, API-first backend and are equipped to build a custom storefront, rather than teams looking for an out-of-the-box store builder. Its compliance certifications also suit enterprises with strict security requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Vendure ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Vendure is an open-source, GPLv3 headless commerce platform built with TypeScript and GraphQL, with a paid Platform tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vendure is a free, open-source (GPLv3) TypeScript/GraphQL commerce platform, with paid Platform and Cloud tiers.$q$,
  og_description = $q$Vendure is a free, open-source (GPLv3) TypeScript/GraphQL commerce platform, with paid Platform and Cloud tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b6f6733-ef4d-4430-95f2-717f687caf82';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b6f6733-ef4d-4430-95f2-717f687caf82' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$B2B workflows$q$, $q$Quote-to-cash flows, bulk SKU entry, saved requisition lists, and repeat-order flows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Advanced pricing$q$, $q$Customer-specific pricing, contract pricing, store credit, gift cards, and packaging-unit pricing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Governance tools$q$, $q$SSO, audit trails, row-level permissions, and content versioning.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Search and discovery$q$, $q$Typesense-backed catalog search, a command palette, and wishlists.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Workflow engine$q$, $q$Custom entities and approval policies for complex ordering processes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Enterprise storefront$q$, $q$A production-ready Next.js storefront with company accounts and multi-step checkout, included with Platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Core is free forever and open source under GPLv3, with 8.2k+ GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Built on a modern TypeScript, Node.js (NestJS), and GraphQL stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Deep B2B feature set: quote-to-cash, approvals, contract pricing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Plugin-first architecture avoids forking the core$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Used by known brands including IBM, Breitling, Swile, and Munch$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Platform tier pricing is not publicly disclosed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Vendure Cloud is not yet generally available (design-partner stage, GA targeted Q4 2026)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Developer-oriented setup requiring Node.js/TypeScript expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Is Vendure free?$q$, $q$Yes, Vendure Core is free forever and licensed under GPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$What is Vendure Platform?$q$, $q$Platform is the paid commercial tier, adding a production-ready Next.js storefront, 20+ enterprise plugins, AI tooling, dedicated support, and quarterly roadmap calls on top of Core.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Is Vendure Cloud available?$q$, $q$Vendure Cloud is available now for design partners, with general availability targeted for Q4 2026.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$What technology does Vendure use?$q$, $q$Vendure is built with TypeScript, Node.js (NestJS), GraphQL, and React.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Complex B2B commerce$q$, $q$Run quote-to-cash and approval workflows for wholesale or enterprise buyers.$q$, $q$B2B retailers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$TypeScript/GraphQL commerce backend$q$, $q$Build a custom commerce backend using a familiar Node.js/GraphQL stack.$q$, $q$Developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Multi-channel enterprise commerce$q$, $q$Run D2C, marketplace, and B2B commerce on one unified backend across multiple regions and currencies.$q$, $q$Enterprise organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Core$q$, $q$Free$q$, NULL, $q$["Full commerce framework and admin dashboard","GPLv3 open source","Plugin model","Multi-channel/region/currency support","Community support via Discord and GitHub"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Platform$q$, $q$Custom (contact sales)$q$, $q$annual$q$, $q$["Everything in Core","Production-ready Next.js storefront","20+ enterprise plugins","AI tooling","Dedicated support","Quarterly roadmap calls"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$Cloud$q$, $q$Not disclosed (design partners only)$q$, NULL, $q$["Managed infrastructure","Auto-scaling","Automatic backups","Global regions","EU-only data residency option"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$overview$q$, $q$What is Vendure?$q$, 2, ARRAY[$q$Vendure is an open-source, headless commerce platform built with TypeScript, Node.js (NestJS), and GraphQL. Its Core edition is free forever under GPLv3 and includes a full commerce framework, admin dashboard, and plugin model, with 8.2k+ GitHub stars.$q$, $q$A paid Platform tier adds a production-ready Next.js storefront, enterprise plugins, AI tooling, and dedicated support, while Vendure Cloud — currently available to design partners ahead of a targeted Q4 2026 general availability — offers managed hosting for either Core or Platform projects.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$who-its-for$q$, $q$Who Vendure is for$q$, 2, ARRAY[$q$Vendure is built for developers and enterprises that need complex B2B commerce capabilities — quote-to-cash, contract pricing, approval workflows — on a modern TypeScript/GraphQL stack, without forking the core platform to add custom logic.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;


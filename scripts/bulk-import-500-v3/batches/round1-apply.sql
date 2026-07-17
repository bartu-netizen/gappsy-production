-- Enrichment batch: SuiteCRM, EspoCRM, YetiForce, OroCRM, Monica, Dolibarr, ERPNext, Tryton, Metasfresh, Axelor, Apache OFBiz, iDempiere, ADempiere, OrangeHRM, IceHrm, Frappe HR, OpenCATS, Recruiterflow, Recruit CRM, Dover, Metaview, Paraform, Juicebox, Findem, HireEZ, SeekOut, Leapsome, 15Five, Culture Amp, Officevibe, WorkTango, Bonusly, Kudos, Motivosity, Nectar HR, Assembly Employee Recognition, Awardco, Perkbox, Benepass, Forma Benefits, Pave, Figures, Ravio, Compa, ChartHop, Orgvue, Pingboard, Sift Org Chart, KnowledgeOwl, GitBook, BookStack, Wiki.js, DokuWiki, XWiki, MediaWiki, TiddlyWiki, Logseq, Anytype, Affine, AppFlowy, Superlist, Ellie Planner, Timestripe, Tweek, Lunatask, Amazing Marvin, Sorted 3, NotePlan, Bear, Ulysses, Obsidian, Capacities, Heptabase, Milanote, Scrintal, Plane Project Management, OpenProject, Taiga, Leantime
-- Publishes 79 bulk-imported tool(s) with full editorial content.

-- ── SuiteCRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SuiteCRM is a free, open-source CRM for sales, marketing, and customer service, with optional paid hosting and support.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$£50/month (fully managed hosting)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SuiteCRM: free open-source CRM with sales, marketing and support tools, plus optional managed hosting, support and SuiteASSURED plans.$q$,
  og_description = $q$SuiteCRM: free open-source CRM with sales, marketing and support tools, plus optional managed hosting, support and SuiteASSURED plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Flexible data model$q$, $q$Build a tailored customer data repository that can be customized to fit specific business processes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Reporting and dashboards$q$, $q$Get visibility into key sales, marketing and service metrics through built-in reporting tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Lead and opportunity management$q$, $q$Capture leads and track opportunities through the sales pipeline.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Marketing segmentation$q$, $q$Automate customer segmentation and run targeted marketing campaigns.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Customer service tools$q$, $q$Manage support cases in one place to reduce information silos across teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Open REST API$q$, $q$Connect SuiteCRM to third-party systems using an open API.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Third-party integrations$q$, $q$Plugin ecosystem covering Outlook, Xero, DocuSign, Mailchimp, QuickBooks, Zoom, WhatsApp and more.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Core software is free and open source with no per-user licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Self-hosted deployment gives full ownership and customization freedom$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Large plugin ecosystem for integrations (Outlook, Xero, DocuSign, Mailchimp, QuickBooks, Zoom)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$SuiteCRM Ltd is ISO 9001 and ISO 27001 certified and a Crown Commercial Service supplier$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Fully managed hosting and SuiteASSURED support packages are available for teams without in-house IT$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Self-hosting requires technical resources to install, maintain and secure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Professional support, implementation (Quick Start) and SuiteASSURED plans cost extra on top of the free software$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Community support tier is limited to forums and documentation only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Is SuiteCRM free?$q$, $q$Yes, the core SuiteCRM software is free and open source. You pay only if you choose managed hosting, implementation services or a support package.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Can SuiteCRM be self-hosted?$q$, $q$Yes, SuiteCRM can be downloaded and self-hosted on your own infrastructure at no software cost.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Does SuiteCRM offer hosted plans?$q$, $q$Yes, SuiteCRM Hosted provides fully managed cloud hosting starting from £50 per month, including a free trial option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$What is SuiteASSURED?$q$, $q$SuiteASSURED is a paid support package, from £3,350 per year, that includes warranty, legal protections, priority support and care hours.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Salesforce alternative for cost-conscious teams$q$, $q$Organizations seeking CRM functionality similar to commercial platforms without per-user licensing fees.$q$, $q$SMBs and enterprises with budget constraints$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Self-hosted CRM with custom integrations$q$, $q$Technical teams that want full control of their CRM data and infrastructure, using the open REST API to connect other business systems.$q$, $q$In-house IT and development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Managed CRM for teams without IT staff$q$, $q$Businesses that want SuiteCRM's functionality without managing servers, using the fully managed hosting option.$q$, $q$Small businesses without dedicated IT resources$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Free open-source software","You provide and manage your own infrastructure","Best for technical teams with in-house IT"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Fully Managed Hosting$q$, $q$From £50/month$q$, $q$monthly$q$, $q$["Hosting, security, updates and backups included","Best for teams without in-house IT resources"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Quick Start Implementation$q$, $q$From £2,520 (one-time)$q$, NULL, $q$["Configuration and one day of training","Best for most teams getting started"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Standard Support$q$, $q$£1,200/year for 10 hours$q$, $q$annual$q$, $q$["Configuration help and multi-channel support","20% discount when bundled with managed hosting"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$SuiteASSURED$q$, $q$From £3,350/year$q$, $q$annual$q$, $q$["Warranty and legal protections","Priority support","10 care hours included"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$overview$q$, $q$What is SuiteCRM?$q$, 2, ARRAY[$q$SuiteCRM is an open-source customer relationship management platform built to give organizations a 360-degree view of customers and business operations. It covers sales, marketing and customer service through a flexible data model, reporting dashboards, lead and opportunity management, and automated segmentation.$q$, $q$The software itself is free to download and self-host, with no per-user licensing fees. SuiteCRM Ltd, which develops the platform, also sells optional managed hosting, implementation and support packages, including a warranty-backed SuiteASSURED plan, for teams that want additional assurance or don't have in-house IT.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$who-its-for$q$, $q$Who SuiteCRM is for$q$, 2, ARRAY[$q$SuiteCRM suits organizations looking for a customizable, lower-cost alternative to proprietary CRM platforms, from technical teams that want to self-host and extend the open REST API, to businesses that prefer fully managed hosting and professional support instead of running their own servers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── EspoCRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$EspoCRM is an open-source CRM for managing contacts, companies and opportunities, available self-hosted or as a paid cloud service.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€12.90/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$EspoCRM: open-source CRM software, self-hosted for free or on Basic, Enterprise and Ultimate cloud plans from €12.90/user/month.$q$,
  og_description = $q$EspoCRM: open-source CRM software, self-hosted for free or on Basic, Enterprise and Ultimate cloud plans from €12.90/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e1f5c4e-47f2-4e4f-84ee-91538babece0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Contact and company management$q$, $q$Track contacts, companies, projects and opportunities in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Self-hosted or cloud deployment$q$, $q$Install on Windows, macOS or Linux via Docker, or run on EspoCRM's cloud hosted on Google Cloud, AWS or Azure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$API access$q$, $q$Connect EspoCRM to other systems through its API.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$2,000+ integrations$q$, $q$Cloud plans include access to over 2,000 third-party integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Advanced Pack extensions$q$, $q$All cloud plans include nine official extensions such as Sales Pack, Project Management, Google Integration and Outlook Integration at no extra cost.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$12x5 support$q$, $q$Cloud plans include support during business hours across the week.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Free, self-hosted open-source edition with no license cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Used by over 50,000 companies across 163 countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Cloud plans include 2,000+ integrations and the Advanced Pack extensions at no extra charge$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$30-day free trial available on cloud plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Runs on Windows, macOS and Linux via Docker for self-hosting$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Cloud plans require a minimum number of users (3 for Basic, 5 for Enterprise, 10 for Ultimate)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Cloud pricing is billed for 6 months or a year, not month-to-month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Record limits on the Basic and Enterprise cloud plans require upgrading or paying extra to extend$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Self-hosting requires managing your own server infrastructure$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Is EspoCRM free?$q$, $q$Yes, EspoCRM can be self-hosted for free as open-source software. EspoCRM also sells paid cloud hosting plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$What does EspoCRM Cloud cost?$q$, $q$Cloud plans start at €12.90 per user per month (Basic, minimum 3 users), up to €59 per user per month for the Ultimate plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Is there a free trial?$q$, $q$Yes, EspoCRM cloud plans include a 30-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Can EspoCRM be self-hosted?$q$, $q$Yes, EspoCRM can be installed on your own Windows, macOS or Linux server, including via Docker.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Self-hosted CRM for technical teams$q$, $q$Organizations that want to run EspoCRM on their own infrastructure at no license cost.$q$, $q$IT teams and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Managed cloud CRM for growing teams$q$, $q$Businesses that prefer EspoCRM's cloud hosting on Google Cloud, AWS or Azure over self-managing servers.$q$, $q$Sales, retail, real estate, education and healthcare teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Multi-department customer management$q$, $q$Companies in wholesale, e-commerce, banking, call centers and manufacturing tracking customer relationships across departments.$q$, $q$Mid-sized to large organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Basic$q$, $q$€12.90/user/month$q$, NULL, $q$["Minimum 3 users","3GB storage per user","Up to 100,000 records","All extensions and API access","2,000+ integrations","12x5 support","Billed for 6 months or 1 year"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Enterprise$q$, $q$€22.00/user/month$q$, NULL, $q$["Minimum 5 users","10GB storage per user","Up to 10,000,000 records","All extensions and API access","12x5 support","Billed for 6 months or 1 year"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$Ultimate$q$, $q$€59.00/user/month$q$, NULL, $q$["Minimum 10 users","400GB total storage","Unlimited records","Dedicated IP, private server and custom domain","12x5 support","Billed for 6 months or 1 year"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$overview$q$, $q$What is EspoCRM?$q$, 2, ARRAY[$q$EspoCRM is a web-based CRM application for tracking contacts, companies, projects and opportunities. It is open source and can be self-hosted for free on Windows, macOS or Linux, including via Docker.$q$, $q$EspoCRM also offers cloud-hosted plans on Google Cloud, AWS or Azure, priced per user per month across Basic, Enterprise and Ultimate tiers. All cloud plans include API access, over 2,000 integrations and a set of official extensions at no extra cost.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', $q$who-its-for$q$, $q$Who EspoCRM is for$q$, 2, ARRAY[$q$EspoCRM is used across industries including wholesale, e-commerce, banking, call centers, manufacturing, education, travel, real estate, healthcare and insurance, by teams that want either a free self-hosted CRM or a managed cloud alternative.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e1f5c4e-47f2-4e4f-84ee-91538babece0', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── YetiForce ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$YetiForce is a free, open-source CRM/ERP system with 80+ modules for sales, marketing, support, finance and HR.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Warsaw, Poland$q$,
  languages = '{}',
  seo_meta_description = $q$YetiForce: free open-source CRM/ERP with 80+ modules for sales, marketing, support, finance, logistics and HR, used by 23,000+ firms.$q$,
  og_description = $q$YetiForce: free open-source CRM/ERP with 80+ modules for sales, marketing, support, finance, logistics and HR, used by 23,000+ firms.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ad091561-b390-481a-bf66-f43ea55efb9d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ad091561-b390-481a-bf66-f43ea55efb9d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$80+ ready-made modules$q$, $q$Modules cover marketing, sales, project management, customer support, finance, logistics, HR and office administration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Dynamic report builder$q$, $q$Build custom reports and analytics without external tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Invoicing$q$, $q$Generate invoices directly within the system.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$CRM and ERP in one system$q$, $q$Combines customer relationship management with enterprise resource planning capabilities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Self-hosted, open-source deployment$q$, $q$Install and customize YetiForce on your own infrastructure at no software cost.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Completely free and open-source with no license fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Broad functionality with 80+ modules spanning CRM and ERP$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Used by roughly 23,000 firms across 100 countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Proven at scale, with a largest deployment of 12,500 users$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Recognized on review platforms including Capterra, G2 and SourceForge$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Optional paid support and subscription services are needed for enterprise-level assistance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Self-hosted deployment requires technical setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Official site discloses limited detail on specific third-party integrations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Is YetiForce free?$q$, $q$Yes, YetiForce is free, open-source software. Paid support and subscription services are available separately through its marketplace.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Is YetiForce a CRM or an ERP?$q$, $q$YetiForce combines both, with 80+ modules covering CRM functions like sales and marketing alongside ERP functions like finance and HR.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Who develops YetiForce?$q$, $q$YetiForce is developed and maintained by Stohid Technology S.A., based in Warsaw, Poland.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$How many organizations use YetiForce?$q$, $q$YetiForce reports around 23,000 firms using the platform across 100 countries, with a largest single deployment of 12,500 users.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Combined CRM/ERP for growing businesses$q$, $q$Organizations that want sales, marketing, finance and HR modules in one open-source system.$q$, $q$Small to large businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Large-scale self-hosted deployments$q$, $q$Companies needing a system proven to scale to thousands of users, as demonstrated by YetiForce's largest deployment.$q$, $q$Enterprises with large user bases$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$Cost-sensitive organizations$q$, $q$Businesses that want extensive CRM/ERP functionality without ongoing license fees.$q$, $q$SMBs and budget-conscious teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$overview$q$, $q$What is YetiForce?$q$, 2, ARRAY[$q$YetiForce is a free, open-source CRM/ERP system built by Stohid Technology S.A. in Warsaw, Poland. It ships with 80+ ready-made modules covering marketing, sales, project management, customer support, finance, logistics, HR and office administration, plus a dynamic report builder and built-in invoicing.$q$, $q$The core software is open source and self-hosted at no license cost. Stohid Technology also offers optional paid support and subscription services through a marketplace for organizations that want additional assistance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', $q$who-its-for$q$, $q$Who YetiForce is for$q$, 2, ARRAY[$q$YetiForce fits businesses of any size looking for a single free system that covers both CRM and ERP needs, from small teams to large organizations, with reported deployments as large as 12,500 users at a single firm.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad091561-b390-481a-bf66-f43ea55efb9d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OroCRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OroCRM is an open-source, Symfony-based CRM with a free Community Edition and a paid Enterprise edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OroCRM: open-source Symfony-based CRM with a free Community Edition and a paid Enterprise edition for larger organizations.$q$,
  og_description = $q$OroCRM: open-source Symfony-based CRM with a free Community Edition and a paid Enterprise edition for larger organizations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '63ad3ef7-5046-461f-a151-5b360a08cc61';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '63ad3ef7-5046-461f-a151-5b360a08cc61' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$360-degree customer view$q$, $q$Track customer interactions and sales performance across the business.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Contact, lead and opportunity management$q$, $q$Manage the sales pipeline from first contact through to closed opportunity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Workflow automation$q$, $q$Automate business processes and task management within the CRM.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Customizable reporting and dashboards$q$, $q$Build reports and dashboards tailored to specific business metrics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Built on Symfony$q$, $q$OroCRM is built on the Symfony PHP framework, allowing deep customization and extension.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Open-source Community Edition$q$, $q$The Community Edition is fully functional and licensed under OSL-3.0, distributed as source code on GitHub.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Free, open-source Community Edition with source code publicly available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Built on the established Symfony PHP framework, enabling deep customization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Designed with flexibility in mind for businesses with specific CRM requirements$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$An Enterprise edition is available for organizations that need additional capabilities$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Enterprise edition pricing is not publicly disclosed on Oro's official channels$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Requires PHP/Symfony technical expertise to deploy, customize and maintain$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Public documentation on feature differences between Community and Enterprise editions is limited$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Is OroCRM free?$q$, $q$The OroCRM Community Edition is free and open source, licensed under OSL-3.0. Oro also offers a paid Enterprise edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$What is OroCRM built on?$q$, $q$OroCRM is built on the Symfony PHP framework.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Is OroCRM's source code available?$q$, $q$Yes, the Community Edition source code is published on GitHub under oroinc/crm-application.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Is there an Enterprise version of OroCRM?$q$, $q$Yes, Oro offers an Enterprise edition alongside the free Community Edition, though enterprise pricing is not publicly listed.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Developer-customized CRM$q$, $q$Development teams that want to build on a Symfony-based open-source CRM foundation and extend it to fit specific workflows.$q$, $q$PHP/Symfony developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$B2B-focused customer management$q$, $q$Businesses wanting an extensible CRM for tracking contacts, leads and opportunities.$q$, $q$B2B sales teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open-source under OSL-3.0","Source code available on GitHub","Fully functional CRM application"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$overview$q$, $q$What is OroCRM?$q$, 2, ARRAY[$q$OroCRM is an open-source customer relationship management application built on the Symfony PHP framework. Its Community Edition is free, fully functional, and distributed as source code on GitHub under the OSL-3.0 license, giving businesses the ability to customize and extend the CRM to fit specific needs.$q$, $q$Alongside the free Community Edition, Oro also offers a paid Enterprise edition for organizations that need additional capabilities, though detailed public pricing for the Enterprise tier is not published on Oro's official channels.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', $q$who-its-for$q$, $q$Who OroCRM is for$q$, 2, ARRAY[$q$OroCRM suits development teams comfortable working with PHP and Symfony who want an open-source CRM they can deeply customize, as well as businesses considering the paid Enterprise edition for additional support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63ad3ef7-5046-461f-a151-5b360a08cc61', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Monica ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Monica is an open-source personal CRM for tracking relationships, self-hosted for free or hosted for $9/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$9/month$q$,
  founded_year = 2018,
  company_size = NULL,
  headquarters = $q$Canada$q$,
  languages = '{}',
  seo_meta_description = $q$Monica: open-source personal CRM to track relationships, contacts and reminders. Free plan, $9/month unlimited plan, or self-host for free.$q$,
  og_description = $q$Monica: open-source personal CRM to track relationships, contacts and reminders. Free plan, $9/month unlimited plan, or self-host for free.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ec2fcab-82e1-40ba-a312-37feb11695e6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ec2fcab-82e1-40ba-a312-37feb11695e6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Contact and relationship management$q$, $q$Organize information about family, friends and other personal connections.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Activity logging and reminders$q$, $q$Log activities with contacts and set reminders for important dates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Journal$q$, $q$Keep a personal journal alongside contact records.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Personal details tracking$q$, $q$Store details like gift ideas, tasks, debts, pets and work information for each contact.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Self-hosting option$q$, $q$Install Monica's open-source code on your own server at no cost.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Open-source code is publicly available and can be self-hosted for free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Paid plan uses flat pricing with unlimited contacts and no per-contact fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$No advertising, and the company states it does not exploit user data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Cancel anytime with no cancellation fees$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Free hosted plan requires no credit card to sign up$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Free hosted plan is limited to 10 contacts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Some features are restricted on the free tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Users wanting full privacy without a subscription must self-host, which requires technical setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Is Monica free?$q$, $q$Monica has a free hosted plan limited to 10 contacts, and the open-source code can be self-hosted for free without limits. A paid hosted plan removes the contact limit.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$How much does Monica cost?$q$, $q$The paid hosted plan is $9/month or $90/year, with unlimited contacts and reminders at a flat rate.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Can I cancel anytime?$q$, $q$Yes, Monica states there are no commitments and you can cancel anytime with no cancellation fees.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Can Monica be self-hosted?$q$, $q$Yes, Monica's source code is open source and available on GitHub for self-hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Tracking personal relationships$q$, $q$Individuals who want to remember important details and milestones about family and friends.$q$, $q$Busy professionals and family-oriented individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Privacy-focused personal CRM$q$, $q$Users who prefer to self-host their personal relationship data rather than use a hosted service.$q$, $q$Privacy-conscious users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Managing a large personal network$q$, $q$People with many contacts who want unlimited contacts and reminders at a flat monthly rate.$q$, $q$Networkers and people with large personal circles$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Free$q$, $q$$0$q$, NULL, $q$["Limited to 10 contacts","Some features restricted","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Paid Hosted$q$, $q$$9/month or $90/year$q$, $q$monthly$q$, $q$["Unlimited contacts","Unlimited reminders","Flat rate, no per-contact fees","Cancel anytime"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Open-source code available on GitHub","Install on your own server"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$overview$q$, $q$What is Monica?$q$, 2, ARRAY[$q$Monica is an open-source personal CRM for organizing information about the people in your life, from family and friends to broader personal connections. It supports contact management, activity logging, reminders, and a personal journal.$q$, $q$Monica offers a free hosted plan limited to 10 contacts, a paid hosted plan at $9/month (or $90/year) with unlimited contacts and no per-contact fees, and a self-hosted option using the open-source code, which is free to run on your own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', $q$who-its-for$q$, $q$Who Monica is for$q$, 2, ARRAY[$q$Monica is built for individuals who want to keep track of relationships and personal details without advertising or data monetization, whether they choose the affordable hosted plan or self-host for full control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ec2fcab-82e1-40ba-a312-37feb11695e6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Dolibarr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Dolibarr is a free, open-source ERP and CRM suite for managing sales, HR, finance, inventory and projects.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2009,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Dolibarr: free open-source ERP/CRM suite covering sales, HR, finance, inventory and projects for SMEs, freelancers and associations.$q$,
  og_description = $q$Dolibarr: free open-source ERP/CRM suite covering sales, HR, finance, inventory and projects for SMEs, freelancers and associations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'da85131f-6520-4e7e-b70d-0a49a665a0fa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'da85131f-6520-4e7e-b70d-0a49a665a0fa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$CRM and sales$q$, $q$Manage customers, proposals, orders, contracts and a help desk.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$HR management$q$, $q$Handle employee records, expense reports, leave requests and timesheets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Finance$q$, $q$Manage billing, accounting and bank reconciliation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Inventory$q$, $q$Track products, stock, purchasing and manufacturing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Productivity tools$q$, $q$Manage projects, tasks, interventions and an agenda.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$APIs and import/export$q$, $q$Integrate with other systems and move data in and out of Dolibarr.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Free, open-source ERP and CRM suite with no license fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Modular design lets organizations enable only the features they need$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Runs on Windows, Mac, Linux, Docker and cloud deployments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Backed by a large international community of developers, translators and testers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Dolibarr Association, founded in 2009, oversees the project$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Paid hosting and support are only available through third-party partners, not Dolibarr directly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Self-hosted deployment requires technical setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$No pricing details for partner-provided hosting or support are published on the official site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Is Dolibarr free?$q$, $q$Yes, Dolibarr is free open-source software. Optional paid hosting and support are available through partner companies.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$What does Dolibarr cover?$q$, $q$Dolibarr covers CRM and sales, HR, finance, inventory and productivity in one integrated suite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$What platforms does Dolibarr support?$q$, $q$Dolibarr supports Windows, Mac and Linux, as well as Docker and cloud deployments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Who maintains Dolibarr?$q$, $q$The Dolibarr Association, founded in 2009, promotes and oversees the open-source project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$All-in-one ERP/CRM for SMEs$q$, $q$Small and medium-sized businesses wanting a free, integrated system covering sales, finance and inventory.$q$, $q$SMEs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Free invoicing and CRM for freelancers$q$, $q$Independent professionals needing billing, proposals and customer tracking without licensing costs.$q$, $q$Freelancers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$Low-cost management for associations$q$, $q$Nonprofits and associations needing an integrated management tool on a limited budget.$q$, $q$Associations and nonprofits$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$overview$q$, $q$What is Dolibarr?$q$, 2, ARRAY[$q$Dolibarr is a free, open-source ERP and CRM suite that brings together customer management, HR, finance, inventory and project tools in one web application. It is overseen by the Dolibarr Association, founded in 2009.$q$, $q$The software is free to download and self-host on Windows, Mac, Linux, Docker or the cloud. Paid hosting and support are available, but only through third-party partner companies rather than Dolibarr itself.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$who-its-for$q$, $q$Who Dolibarr is for$q$, 2, ARRAY[$q$Dolibarr is designed for SMEs, large companies, freelancers and associations that want an integrated, free ERP and CRM system they can run themselves or deploy with a hosting partner.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── ERPNext ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ERPNext is a free, open-source ERP covering accounting, sales, inventory, manufacturing and HR, with paid Frappe Cloud hosting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$14/month (Frappe Cloud)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ERPNext: free open-source ERP for accounting, sales, inventory, manufacturing and HR, or hosted on Frappe Cloud from $14/month.$q$,
  og_description = $q$ERPNext: free open-source ERP for accounting, sales, inventory, manufacturing and HR, or hosted on Frappe Cloud from $14/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Accounting$q$, $q$General ledger, multi-currency support, financial statements, fixed assets and tax compliance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Procurement$q$, $q$Purchase orders, supplier management and multi-level approvals.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Sales and invoicing$q$, $q$Order-to-cash workflows, pricing rules and payment processing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$CRM$q$, $q$Lead and opportunity management, quotations and SLA management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Inventory$q$, $q$Item tracking, warehouses, and serial/batch management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Manufacturing$q$, $q$Bill of materials, production planning, quality checks and subcontracting.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$HR and payroll$q$, $q$People operations management alongside other ERP modules.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$No-code/low-code customization$q$, $q$Customize the system without extensive coding, with a mobile-friendly interface.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Self-hosted edition is free and open source with no per-user licensing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Frappe Cloud managed hosting is available starting at $14/month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Broad module coverage from accounting to manufacturing to HR in a single platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$200+ certified implementation partners globally$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Adopted by 30,000+ companies worldwide$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Described as 100% mobile-friendly across modules$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Self-hosting requires technical setup and customization knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Frappe Cloud pricing is compute-based rather than a flat per-user fee, which can make costs less predictable$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Enterprise-level support and some integrations may require engaging a certified partner$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Is ERPNext free?$q$, $q$Yes, ERPNext can be self-hosted for free as open-source software. Frappe Cloud offers paid managed hosting starting at $14/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Who develops ERPNext?$q$, $q$ERPNext is developed and maintained by Frappe Technologies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Does ERPNext charge per user?$q$, $q$No, ERPNext does not use per-user pricing; Frappe Cloud pricing is based on compute resources instead.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$How many companies use ERPNext?$q$, $q$ERPNext reports more than 30,000 companies using the platform globally.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Free all-in-one ERP for SMBs$q$, $q$Small and medium businesses wanting accounting, sales, inventory and HR in one open-source system.$q$, $q$SMBs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Manufacturing planning and quality control$q$, $q$Manufacturers needing bill of materials, production planning and quality checks.$q$, $q$Manufacturing companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Cost-effective ERP for nonprofits and education$q$, $q$Organizations wanting vendor independence and lower ERP costs compared to proprietary systems.$q$, $q$Nonprofits, education and professional services$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Open-source, no per-user licensing","Full module access","Requires self-managed infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$Frappe Cloud$q$, $q$From $14/month to $108/month$q$, $q$monthly$q$, $q$["Managed hosting","Compute-based pricing","Scales with usage"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$overview$q$, $q$What is ERPNext?$q$, 2, ARRAY[$q$ERPNext is a free and open-source ERP developed by Frappe Technologies, covering accounting, procurement, sales, CRM, inventory, manufacturing, projects, point of sale, HR/payroll, quality management and helpdesk functions in a single platform.$q$, $q$ERPNext can be self-hosted at no cost, or run on Frappe Cloud, the company's managed hosting service, with compute-based pricing starting at $14/month and scaling to $108/month depending on usage. Frappe Technologies also supports a network of 200+ certified implementation partners.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', $q$who-its-for$q$, $q$Who ERPNext is for$q$, 2, ARRAY[$q$ERPNext serves SMBs and enterprises across manufacturing, trading, retail, healthcare, education, professional services and nonprofit sectors that want a cost-effective, customizable ERP without per-user SaaS pricing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3628bd49-6c29-4ce5-8ea4-3d3c7f5e7026', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Tryton ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tryton is a 100% free and open-source, modular ERP covering accounting, sales, inventory, CRM and manufacturing.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tryton: 100% free, open-source modular ERP with accounting, sales, inventory, CRM and manufacturing, governed by a Foundation.$q$,
  og_description = $q$Tryton: 100% free, open-source modular ERP with accounting, sales, inventory, CRM and manufacturing, governed by a Foundation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fac895ab-84a4-44ef-95ce-d865e6760f3c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fac895ab-84a4-44ef-95ce-d865e6760f3c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Financial and analytic accounting$q$, $q$Manage general and analytic accounting within the platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Sales order management$q$, $q$Handle sales orders as part of an integrated workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Inventory and stock tracking$q$, $q$Track stock levels and inventory movements.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$CRM$q$, $q$Manage customer relationships alongside other business operations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Purchasing and supply chain$q$, $q$Manage purchasing and supply chain operations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Manufacturing with bill of materials$q$, $q$Support manufacturing processes using bills of materials.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Project management$q$, $q$Manage projects within the same integrated system.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Third-party integrations$q$, $q$Automate communication with banks, carriers and websites.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$100% free and open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Fully modular, so businesses can use only the components they need$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Governed by an independent Foundation rather than a single vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Network of independent service providers available for support and implementation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Distributed under CC BY-SA 3.0 with a protected trademark$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$No official hosted/cloud offering is advertised, so deployment is self-managed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Support comes only through third-party service providers rather than a central vendor$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$The official site provides no user or customer statistics to gauge adoption scale$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Is Tryton free?$q$, $q$Yes, Tryton is described as 100% open source and free to install and deploy.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Who governs Tryton?$q$, $q$Tryton is governed by a Foundation with a board, supporters and a network of service providers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$What license does Tryton use?$q$, $q$Tryton is distributed under the CC BY-SA 3.0 license, with a protected trademark.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Does Tryton include CRM?$q$, $q$Yes, Tryton includes a CRM module alongside accounting, sales, inventory and manufacturing modules.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Modular open-source ERP for any size business$q$, $q$Companies wanting to enable only the accounting, sales, inventory or manufacturing modules they need.$q$, $q$Businesses of any size$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Avoiding vendor lock-in$q$, $q$Organizations that want an ERP governed by a Foundation rather than a single commercial vendor.$q$, $q$Businesses concerned about vendor dependency$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$Integrated accounting, CRM and manufacturing$q$, $q$Companies needing accounting, customer management and manufacturing in one connected system.$q$, $q$SMEs and manufacturers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$overview$q$, $q$What is Tryton?$q$, 2, ARRAY[$q$Tryton is a 100% open-source, modular business application suite covering financial and analytic accounting, sales order management, inventory and stock tracking, CRM, purchasing, manufacturing with bill of materials, project management and third-party integrations with banks and carriers.$q$, $q$The project is governed by an independent Foundation, distributed under the CC BY-SA 3.0 license with a protected trademark, and supported by a network of independent service providers rather than a single vendor.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', $q$who-its-for$q$, $q$Who Tryton is for$q$, 2, ARRAY[$q$Tryton fits companies of any size that want comprehensive, integrated business management software without proprietary licensing costs or vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac895ab-84a4-44ef-95ce-d865e6760f3c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Metasfresh ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$metasfresh is a Fraunhofer-validated cloud ERP for the DACH region, covering supply chain, production and billing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$€79/user/month (excl. VAT)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$metasfresh: Fraunhofer-validated cloud ERP for DACH-region SMEs, covering supply chain, production and billing, from €79/user/month.$q$,
  og_description = $q$metasfresh: Fraunhofer-validated cloud ERP for DACH-region SMEs, covering supply chain, production and billing, from €79/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '590b2d7a-0185-4363-87ce-75d530896404';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '590b2d7a-0185-4363-87ce-75d530896404' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Planning and demand forecasting$q$, $q$Plan operations and forecast demand across the supply chain.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Procurement and goods receipt$q$, $q$Manage purchasing and incoming goods.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Production and warehouse logistics$q$, $q$Coordinate production runs alongside warehouse logistics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Shipping and distribution$q$, $q$Manage outbound shipping and distribution processes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Billing and traceability$q$, $q$Handle invoicing with traceability across the supply chain.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$German-hosted cloud infrastructure$q$, $q$Runs as cloud-based SaaS hosted in German data centers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Fraunhofer IML-validated since March 2022, an independent research institute endorsement$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Built on an open-source foundation with proprietary support and hosting services$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Strong DACH-region focus with German data center hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Integrates with DATEV accounting and established EDI/B2B and GS1 partners$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$States sustainability commitments including renewable energy and carbon offsetting$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Pricing is relatively high for smaller businesses, at €79-99/user/month plus €249-299/month hosting (excl. VAT)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Primarily focused on Germany, Austria and Switzerland, which may limit fit elsewhere$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Starter package requires a custom implementation quote rather than transparent self-serve pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Is metasfresh open source?$q$, $q$metasfresh is built on an open-source foundation, but the hosted product is sold as a paid cloud ERP with user and hosting fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$How much does metasfresh cost?$q$, $q$User fees run €79-99/month per user, plus cloud hosting from €249-299/month, all excluding VAT, alongside a custom-quoted Starter implementation package.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Who is metasfresh for?$q$, $q$metasfresh targets small-to-medium enterprises in the DACH region, including food industry, wholesale and green industry (agriculture/horticulture) companies.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Has metasfresh been independently validated?$q$, $q$Yes, metasfresh has been Fraunhofer IML-validated since March 2022.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Supply chain traceability for food and wholesale$q$, $q$Companies in the food industry and wholesale needing traceability from procurement through billing.$q$, $q$Food industry and wholesale businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Agriculture and horticulture ERP$q$, $q$Green industry businesses needing supply chain and production management.$q$, $q$Agriculture and horticulture companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$German-compliant hosted ERP$q$, $q$DACH-region SMEs wanting Fraunhofer-validated ERP with local data hosting and DATEV integration.$q$, $q$German-speaking SMEs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Starter Package$q$, $q$Price on request$q$, NULL, $q$["One-time implementation","System setup, customization and training","For startups through large SMEs"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$User License$q$, $q$€79-99/month per user (excl. VAT)$q$, $q$monthly$q$, $q$["Ongoing per-user access fee","Price varies with billing frequency"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$Cloud Hosting$q$, $q$From €249-299/month (excl. VAT)$q$, $q$monthly$q$, $q$["Hosted in German data centers"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$overview$q$, $q$What is metasfresh?$q$, 2, ARRAY[$q$metasfresh is a cloud-based ERP built on open-source technology and operated by metas GmbH, focused on mid-sized companies in the DACH region (Germany, Austria, Switzerland). It covers the full supply chain: planning and demand forecasting, procurement and goods receipt, production and warehouse logistics, shipping and distribution, and billing with traceability.$q$, $q$The system has been Fraunhofer IML-validated since March 2022. Pricing is a hybrid model: a custom-quoted Starter implementation package, plus ongoing user fees of €79-99/month and cloud hosting from €249-299/month, hosted in German data centers, all excluding VAT.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', $q$who-its-for$q$, $q$Who metasfresh is for$q$, 2, ARRAY[$q$metasfresh is aimed at small-to-medium enterprises in the DACH region, particularly in the food industry, wholesale and green industry (agriculture/horticulture) sectors that need supply chain automation with German-hosted infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('590b2d7a-0185-4363-87ce-75d530896404', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Axelor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Axelor is a low-code/no-code open-source business suite combining ERP, CRM, BPM and BI, with an AI module supporting multiple providers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = $q$100+ employees$q$,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Axelor: open-source low-code ERP/CRM/BPM suite with a free Community edition and paid Pro/Enterprise tiers with AI and advanced BI.$q$,
  og_description = $q$Axelor: open-source low-code ERP/CRM/BPM suite with a free Community edition and paid Pro/Enterprise tiers with AI and advanced BI.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Studio$q$, $q$Drag-and-drop customization of the application without coding.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$BPM (Business Process Management)$q$, $q$No-code workflow automation for business processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Business Intelligence$q$, $q$Interactive reports and dashboards built into the platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Axelor Connect$q$, $q$Integrate with 2,000+ third-party applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Axelor AI$q$, $q$AI integration across processes, with support for OpenAI, Mistral, Anthropic, Google and other model providers (Enterprise tier).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Portal$q$, $q$Customer collaboration and communication tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$50+ business applications$q$, $q$Covers accounting, HR, sales, procurement, production and more in one suite.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Free, open-source Community edition available for download$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$No-code Studio and BPM tools reduce the need for custom development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$AI module supports multiple LLM providers including OpenAI, Mistral, Anthropic and Google$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Axelor Connect offers integration with 2,000+ applications$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$ISO 27001 certified with a global presence across 7 agencies on 4 continents$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Reports over 1 million users, from SMBs to large enterprises such as Trenitalia, Stellantis and ArcelorMittal$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Pro and Enterprise pricing is not public and requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Pro plans require a minimum of 10 users and Enterprise plans a minimum of 20 users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Advanced features such as SSO, advanced BI and the integrated AI module are reserved for the Enterprise tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Is Axelor free?$q$, $q$Axelor offers a free, open-source Community edition. Pro and Enterprise editions are paid and require a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$What's the difference between Axelor's plans?$q$, $q$Community is free and open source; Pro (minimum 10 users) adds all business modules and standard support; Enterprise (minimum 20 users) adds SSO, advanced BI, an integrated AI module and priority support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Does Axelor support AI?$q$, $q$Yes, the Axelor AI module integrates with providers including OpenAI, Mistral, Anthropic and Google, and is included in the Enterprise tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$How many people use Axelor?$q$, $q$Axelor reports over 1 million users ranging from small and medium businesses to large enterprises.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Free open-source ERP/CRM/BPM$q$, $q$SMEs wanting a no-cost, unified ERP, CRM and business process management platform.$q$, $q$SMEs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Vertical solutions for regulated industries$q$, $q$Manufacturing, construction and public sector organizations needing tailored business applications.$q$, $q$Manufacturing, construction and public sector organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$No-code process automation with AI$q$, $q$Enterprises wanting to automate workflows using Studio and BPM, enhanced with the AI module.$q$, $q$Large enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Community$q$, $q$€0$q$, NULL, $q$["Open-source platform","Essential modules","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Pro$q$, $q$Custom quote (minimum 10 users)$q$, NULL, $q$["Commercial license","All business modules","Updates and electronic invoices","Standard support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Enterprise$q$, $q$Custom quote (minimum 20 users)$q$, NULL, $q$["All Pro features","CAS/SSO authentication","Advanced BI and analytics","Advanced screen modification studio","Integrated AI module","Priority support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$overview$q$, $q$What is Axelor?$q$, 2, ARRAY[$q$Axelor is an open-source business application suite that combines ERP, CRM, BPM, business intelligence and web portals in one platform. It includes Studio for drag-and-drop customization, no-code BPM workflow automation, and Axelor Connect for integrating with 2,000+ applications.$q$, $q$Axelor is offered in three tiers: a free open-source Community edition, a Pro edition for a minimum of 10 users, and an Enterprise edition for a minimum of 20 users that adds SSO, advanced business intelligence and the Axelor AI module, which supports providers including OpenAI, Mistral, Anthropic and Google.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$who-its-for$q$, $q$Who Axelor is for$q$, 2, ARRAY[$q$Axelor serves organizations across manufacturing, professional services, construction, public sector and distribution, from SMEs using the free Community edition to large enterprises such as Trenitalia, Stellantis and ArcelorMittal on paid Pro or Enterprise plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Apache OFBiz ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, Apache-licensed Java web framework and suite of business applications for ERP, CRM, and e-commerce.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Apache OFBiz is a free, open-source Java ERP suite with accounting, CRM, order management, warehousing, and manufacturing modules.$q$,
  og_description = $q$Apache OFBiz is a free, open-source Java ERP suite with accounting, CRM, order management, warehousing, and manufacturing modules.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3e08b2a0-8365-4535-9e4d-361aee66a19f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Accounting$q$, $q$Includes general ledger, accounts receivable, accounts payable, and fixed assets management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$CRM, Order Management & E-Commerce$q$, $q$Handles customer relationship management alongside order processing and online storefront capabilities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Warehousing and Inventory$q$, $q$Supports supply chain fulfillment and inventory tracking across the warehouse.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Manufacturing & MRP$q$, $q$Provides manufacturing resource planning tools for production operations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Product and catalog management$q$, $q$Manage product catalogs, promotions, and pricing rules.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Entity, service, and widget engine$q$, $q$Built as a Java-based web framework including an entity engine, a service engine, and a widget-based UI, giving developers a common architecture to extend or enhance the platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Completely free with no licensing fees, under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Covers a broad suite of business applications (accounting, CRM, order management, warehousing, manufacturing) in one framework$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Common underlying architecture makes it possible for developers to extend or enhance the platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Backed by The Apache Software Foundation as a long-running top-level project$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Requires the Java Development Kit and manual setup via README instructions, implying developer effort to install and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$No hosted/managed version mentioned, so users must self-host and self-support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Official site does not document supported operating systems or deployment environments beyond Java$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Is Apache OFBiz free to use?$q$, $q$Yes. OFBiz has no upfront costs and no licensing fees, and it is licensed under the Apache License, Version 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Who maintains Apache OFBiz?$q$, $q$It is maintained by The Apache Software Foundation and has been an Apache top-level project for 10 years.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$What business functions does OFBiz cover?$q$, $q$Its core modules include Accounting, CRM/Order Management/E-Commerce, Warehousing and Inventory, and Manufacturing & MRP.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$What do I need to install Apache OFBiz?$q$, $q$Installation requires the Java Development Kit, following the setup instructions provided in the project's README file.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Multi-module ERP for growing businesses$q$, $q$Companies can run accounting, CRM, order management, warehousing, and manufacturing on one common framework without licensing fees.$q$, $q$Businesses across industries needing an extensible, self-hosted ERP$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Custom ERP development platform$q$, $q$Developers use OFBiz's entity engine, service engine, and widget-based UI as a base architecture to build or extend tailored business applications.$q$, $q$Developers and system integrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$overview$q$, $q$What is Apache OFBiz?$q$, 2, ARRAY[$q$Apache OFBiz is described on its official site as a suite of business applications flexible enough to be used across any industry, built on a common architecture that lets developers easily extend or enhance it.$q$, $q$Technically, it is a Java-based web framework that includes an entity engine, a service engine, and a widget-based UI, and it is licensed under the Apache License, Version 2.0 with no upfront costs or licensing fees.$q$, $q$It is maintained by The Apache Software Foundation and has been an Apache top-level project for 10 years, with core modules covering Accounting, CRM/Order Management/E-Commerce, Warehousing and Inventory, and Manufacturing & MRP.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$who-its-for$q$, $q$Who Apache OFBiz is for$q$, 2, ARRAY[$q$OFBiz addresses both developers and business users, with dedicated onboarding resources for each group, according to the official site.$q$, $q$It suits organizations that want a free, extensible, self-hosted ERP framework covering accounting, order management, warehousing, and manufacturing, as well as developers who want a common architecture to build custom business applications on top of.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── iDempiere ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source Tier II ERP/CRM/SCM system built on Java, ZK, and OSGi, maintained by a volunteer community.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2011,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$iDempiere is a free, open-source Tier II ERP/CRM/SCM system with enterprise accounting, multi-entity support, and Java/ZK/OSGi architecture.$q$,
  og_description = $q$iDempiere is a free, open-source Tier II ERP/CRM/SCM system with enterprise accounting, multi-entity support, and Java/ZK/OSGi architecture.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Enterprise-grade accounting$q$, $q$Provides accounting capabilities suited to enterprise use.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Multi-entity support$q$, $q$Supports multiple business entities from a single login.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Scalable architecture$q$, $q$Scales from small servers up to environments serving hundreds of concurrent users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Open technology stack$q$, $q$Built on Java, ZK, and OSGi, with compatibility for both Oracle and PostgreSQL databases, using Maven for project management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$LTS releases$q$, $q$The iDempiere 13 'Orion' release is a long-term support (LTS) version with security enhancements and performance improvements.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Completely free and open-source, with the project stating it 'will be open forever'$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Avoids vendor lock-in associated with proprietary ERP software$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Maintained by an active volunteer community of specialists, implementors, developers, and end-users worldwide$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Scales from small servers to hundreds of concurrent users$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Supports both Oracle and PostgreSQL databases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Relies on volunteer community maintenance rather than a dedicated commercial vendor$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Official site does not document specific supported languages or company/headquarters details$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Requires familiarity with Java, ZK, OSGi, and Maven-based setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Is iDempiere free to use?$q$, $q$Yes, iDempiere is completely free and open-source, and the project states it will remain open forever.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$When was iDempiere founded?$q$, $q$iDempiere has been operating since its founding in 2011.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Who maintains iDempiere?$q$, $q$A volunteer community of subject matter specialists, implementors, developers, and end-users from various countries maintains the project.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$What technology does iDempiere run on?$q$, $q$It is built on Java, ZK, and OSGi, and is compatible with Oracle and PostgreSQL databases, using Maven for project management.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$What is the latest iDempiere release?$q$, $q$The latest mentioned release is iDempiere 13 'Orion,' a long-term support (LTS) version with security enhancements and performance improvements.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Multi-entity enterprise ERP$q$, $q$Organizations managing multiple business entities can operate them from a single login with enterprise-grade accounting.$q$, $q$Mid-size to large organizations with multiple business units$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$Vendor lock-in-free ERP adoption$q$, $q$Companies seeking affordable ERP without proprietary software constraints can deploy iDempiere as a free, permanently open alternative.$q$, $q$Cost-conscious businesses worldwide avoiding proprietary licensing$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$overview$q$, $q$What is iDempiere?$q$, 2, ARRAY[$q$iDempiere is described on its official site as a powerful, Tier II, open-source ERP/CRM/SCM system that has been operating since its founding in 2011.$q$, $q$The software is completely free with no licensing costs, and the project emphasizes that iDempiere will be open forever, protecting users from vendor lock-in.$q$, $q$It is built on Java, ZK, and OSGi, compatible with Oracle and PostgreSQL databases, and maintained by a skilled volunteer community of specialists, implementors, developers, and end-users from various countries and professional backgrounds.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$who-its-for$q$, $q$Who iDempiere is for$q$, 2, ARRAY[$q$iDempiere serves companies worldwide seeking affordable enterprise resource planning solutions without proprietary software constraints.$q$, $q$It fits organizations needing enterprise-grade accounting and multi-entity management, and that can scale from small servers to deployments with hundreds of concurrent users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ADempiere ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source ERP/CRM/MFG/SCM/POS business suite licensed under GPL-2.0 and developed by a global community.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ADempiere is a free, open-source GPL-licensed ERP suite covering CRM, manufacturing, supply chain, and point of sale.$q$,
  og_description = $q$ADempiere is a free, open-source GPL-licensed ERP suite covering CRM, manufacturing, supply chain, and point of sale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$ERP, CRM, MFG, SCM & POS modules$q$, $q$A business suite spanning enterprise resource planning, customer relationship management, manufacturing, supply chain management, and point of sale.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Business process management$q$, $q$Tools for managing and automating core business processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Material management$q$, $q$Functionality for managing inventory and materials across the supply chain.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Modern Vue-based UI$q$, $q$A newly developed user interface built with JavaScript and Vue.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Container-native deployment$q$, $q$Supports Docker, Helm charts, and a Kubernetes Operator for deployment.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$HR, warehouse & financial modules$q$, $q$Includes specialized modules for HR/payroll, warehouse management, distribution, and financial operations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Completely free and open-source under the GPL-2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Broad functional coverage spanning ERP, CRM, manufacturing, supply chain, and POS in one suite$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Active community with a Discord server, GitHub repository (875+ stars, 795+ forks), and a nonprofit ADempiere Foundation overseeing governance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Modern container-native deployment options via Docker, Helm, and a Kubernetes Operator$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Long-running project with thousands of commits and a track record of community conferences$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Requires self-hosting and technical expertise (Java, Docker/Kubernetes) to deploy and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$No official managed/hosted edition is described on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Founding year, headquarters, and company size are not disclosed by the project$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Latest documented release (3.9.4, December 2023) suggests a slower release cadence than commercial SaaS competitors$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Is ADempiere free to use?$q$, $q$Yes, ADempiere is completely free and open-source, licensed under GPL-2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$What modules does ADempiere include?$q$, $q$It covers ERP, CRM, manufacturing (MFG), supply chain management (SCM), and point of sale (POS), plus specialized HR, warehouse, and financial modules.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$How is ADempiere deployed?$q$, $q$It supports Docker, Helm charts, and a Kubernetes Operator, alongside a newer Vue-based user interface.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Who governs the ADempiere project?$q$, $q$The ADempiere Foundation, an independent nonprofit, oversees development alongside a community council and board, with contributors coordinating via Discord and GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Self-hosted multi-module ERP$q$, $q$Run ERP, CRM, manufacturing, supply chain, and POS from one open-source suite without licensing fees.$q$, $q$Organizations wanting a free, extensible ERP they fully control$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Container-based ERP deployment$q$, $q$Deploy and scale ADempiere using Docker, Helm, and Kubernetes Operator tooling.$q$, $q$DevOps and IT teams managing containerized infrastructure$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Community-driven ERP customization$q$, $q$Extend or customize the platform through its GPL-licensed codebase and active contributor community.$q$, $q$Developers and implementors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$overview$q$, $q$What is ADempiere?$q$, 2, ARRAY[$q$ADempiere is a free, open-source ERP/CRM/MFG/SCM/POS business suite developed in an open, community-driven "Bazaar" model and licensed under GPL-2.0.$q$, $q$The project includes a newly developed user interface built with JavaScript and Vue, and supports modern container-native deployment through Docker, Helm charts, and a Kubernetes Operator.$q$, $q$Governance is handled by the independent nonprofit ADempiere Foundation, supported by a community council and board, with an active contributor base coordinating through Discord and GitHub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$who-its-for$q$, $q$Who ADempiere is for$q$, 2, ARRAY[$q$ADempiere suits organizations that want a free, self-hosted ERP suite covering business processes, materials management, manufacturing, supply chain, and point of sale without ongoing license costs.$q$, $q$It also fits developers and implementors comfortable working with a Java-based, GPL-licensed codebase who want to customize or extend the platform as part of its open community.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OrangeHRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An all-in-one HR management system covering employee management, recruitment, onboarding, leave, and performance.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OrangeHRM offers a free open-source Starter edition plus a modular paid Advanced edition for HR, recruitment, and performance management.$q$,
  og_description = $q$OrangeHRM offers a free open-source Starter edition plus a modular paid Advanced edition for HR, recruitment, and performance management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c2a56d2f-1e25-421f-af5c-1494914a3095';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c2a56d2f-1e25-421f-af5c-1494914a3095' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Employee Management$q$, $q$Centralized HR administration and employee records management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Recruitment & Applicant Tracking$q$, $q$An ATS module to manage job postings and candidate pipelines.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Onboarding$q$, $q$Tools to manage new-hire onboarding workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Leave Management$q$, $q$PTO and leave request tracking and approvals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Time & Attendance Tracking$q$, $q$Tracks employee working hours and attendance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Performance Management$q$, $q$Tools for reviews, goals, and career development tracking.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$OrangeHRM AI$q$, $q$Listed intelligent automation capabilities within the platform.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Reporting & Analytics$q$, $q$Built-in reporting across HR modules.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Free, open-source Starter edition with core HR functionality at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Modular Advanced pricing lets organizations pay only for the modules they need$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Available as both cloud-hosted and on-premise deployments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$30-day free trial offered for the Advanced edition$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Claims over 5 million users on its site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Advanced edition pricing is not published and requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Supported languages are not documented on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Is OrangeHRM free?$q$, $q$Yes, OrangeHRM offers a completely free, open-source Starter edition alongside a paid Advanced edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Does OrangeHRM offer a free trial?$q$, $q$Yes, a 30-day free trial is offered for the Advanced edition.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$How is OrangeHRM Advanced priced?$q$, $q$Advanced uses a modular, pick-and-choose module pricing model; exact prices require contacting sales for a quote.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Can OrangeHRM be self-hosted?$q$, $q$Yes, OrangeHRM supports both cloud-hosted and on-premise deployment options.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Core HR administration$q$, $q$Manage employee records, leave, and attendance in one system.$q$, $q$HR teams at small to mid-sized organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Recruitment and onboarding$q$, $q$Run applicant tracking and structured onboarding workflows.$q$, $q$Talent acquisition teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Performance and career development$q$, $q$Track goals, reviews, and training programs.$q$, $q$People managers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Starter (Open Source)$q$, $q$Free$q$, NULL, $q$["HR Administration","Employee Management","PTO/Leave Management","Reporting & Analytics","Performance Management","Recruitment","Time Tracking","Mobile App","Onboarding/Offboarding","Request Desk","Career Development","Training"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$Advanced$q$, $q$Custom quote (modular, per-module pricing)$q$, $q$monthly$q$, $q$["All Starter features","People Management module","Talent Management module","Compensation module","Culture module","30-day free trial"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$overview$q$, $q$What is OrangeHRM?$q$, 2, ARRAY[$q$OrangeHRM is an all-in-one HR management system with modules spanning employee management, recruitment and onboarding, performance management, and leave management.$q$, $q$It is offered as a free, open-source Starter edition and as a paid, modular Advanced edition where organizations select and pay for only the modules they need, with a 30-day free trial available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', $q$who-its-for$q$, $q$Who OrangeHRM is for$q$, 2, ARRAY[$q$OrangeHRM suits organizations that want a free open-source starting point for core HR tasks, as well as larger teams that need to add modular, paid capabilities like advanced talent management and compensation as they grow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── IceHrm ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A complete HR toolkit covering employee management, leave, attendance, payroll, performance reviews, and recruitment.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2,499 one-time (IceHrmPro self-hosted)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Australia$q$,
  languages = '{}',
  seo_meta_description = $q$IceHrm is an HR toolkit with a free open-source edition plus paid self-hosted Pro and fully managed Cloud editions.$q$,
  og_description = $q$IceHrm is an HR toolkit with a free open-source edition plus paid self-hosted Pro and fully managed Cloud editions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bffd64e4-dad4-418b-a22e-4efecf3333f5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Employee Management$q$, $q$Centralizes all employee data in one secure location.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Leave Management$q$, $q$Streamlines leave requests with automated workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Time & Attendance$q$, $q$Tracks hours with punch-in/out, timesheets, and overtime calculations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Payroll & Reports$q$, $q$Generates payroll reports with customizable salary components.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Performance Reviews$q$, $q$360-degree evaluations with customizable review templates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Recruitment$q$, $q$Job postings, candidate management, and interview scheduling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Task Management$q$, $q$Assign and track tasks for employees.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Free, self-hosted open-source edition available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Mobile apps available on the iOS App Store and Google Play Store$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Choice of self-hosted (one-time cost) or fully managed cloud hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Cloud edition includes 99.9% uptime SLA, automatic updates, and daily backups$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Used in 150+ countries per the vendor's site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$IceHrmPro self-hosted license is a $2,499 one-time cost, not published as a subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$IceHrm Cloud pricing is custom/quote-only and not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Founding year, company size, and supported languages are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Is IceHrm free?$q$, $q$Yes, IceHrm offers a free, self-hosted open-source community edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$What does IceHrmPro cost?$q$, $q$IceHrmPro, the self-hosted paid edition, is listed at $2,499 as a one-time price.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Is there a cloud-hosted version of IceHrm?$q$, $q$Yes, IceHrm Cloud is a fully managed hosting option with a 99.9% uptime SLA; pricing is custom.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Does IceHrm have mobile apps?$q$, $q$Yes, IceHrm has mobile apps on the iOS App Store and Google Play Store.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Self-hosted HR management$q$, $q$Deploy the open-source or Pro edition on your own infrastructure.$q$, $q$Organizations wanting full data control$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Managed cloud HR$q$, $q$Use IceHrm Cloud for fully managed hosting with backups and uptime SLA.$q$, $q$Teams that prefer not to manage hosting$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Attendance and leave tracking$q$, $q$Automate punch-in/out, timesheets, and leave workflows.$q$, $q$HR and operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$Opensource (Community)$q$, $q$Free$q$, NULL, $q$["Employee Management","Attendance & Timesheets","Document Management","Training & Travel","Free extensions included","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$IceHrmPro$q$, $q$$2,499 one-time$q$, NULL, $q$["All Opensource features","Leave Management","Performance Reviews","Task Management","All premium extensions included","Installation support","Email & Slack support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$IceHrm Cloud$q$, $q$Custom pricing$q$, NULL, $q$["All Pro features","Automatic updates","Daily backups","99.9% uptime SLA","All extensions included","Email support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$overview$q$, $q$What is IceHrm?$q$, 2, ARRAY[$q$IceHrm is an HR toolkit covering employee management, leave, attendance, payroll and reports, performance reviews, recruitment, and task management.$q$, $q$It is offered in three editions: a free open-source self-hosted community edition, a paid self-hosted IceHrmPro edition ($2,499 one-time), and a fully managed IceHrm Cloud edition with custom pricing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', $q$who-its-for$q$, $q$Who IceHrm is for$q$, 2, ARRAY[$q$IceHrm fits organizations that want to self-host HR software for free or a one-time fee, as well as teams that prefer a fully managed cloud option with an uptime SLA and automatic backups.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bffd64e4-dad4-418b-a22e-4efecf3333f5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Frappe HR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A 100% open-source HR and payroll platform built on the Frappe Framework, covering the full employee lifecycle.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/month (Frappe Cloud site hosting)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Frappe HR is a 100% open-source HR and payroll solution, free to self-host or deployable on Frappe Cloud starting at $5/month.$q$,
  og_description = $q$Frappe HR is a 100% open-source HR and payroll solution, free to self-host or deployable on Frappe Cloud starting at $5/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c2e1130d-9c44-4370-a41a-c2cdb9ce88e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Recruitment$q$, $q$Plan, publish, analyze, and evaluate hiring, through to offers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Employee Lifecycle Management$q$, $q$Handles onboarding, exits, transfers, and promotions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Shifts & Attendance$q$, $q$Mobile check-ins and roster management for shift-based attendance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Leave Management$q$, $q$Supports complex leave policies and encashments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Expense Management$q$, $q$Advance payouts and travel expense accounting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Performance Management$q$, $q$Goals, KRAs, appraisals, and feedback.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Payroll$q$, $q$Diverse pay structure mapping with integrated accounting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Payroll Tax & Reports$q$, $q$Regional tax configuration and reporting.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$100% open source under the AGPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$8.2K GitHub stars, indicating an active community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Integrates with ERPNext accounting and supports REST APIs, webhooks, biometric and bank integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Can be self-hosted for free or deployed on Frappe Cloud starting at $5/month$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Supports multi-company operations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Frappe HR-specific cloud pricing is not separated from general Frappe Cloud hosting pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Supported languages are not documented on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Is Frappe HR open source?$q$, $q$Yes, Frappe HR is 100% open source under the AGPL-3.0 license, with 8.2K GitHub stars.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Can Frappe HR be self-hosted?$q$, $q$Yes, it can be self-hosted for free, or deployed on the managed Frappe Cloud platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$How much does Frappe Cloud hosting cost?$q$, $q$Frappe Cloud site plans start at $5/month, with server plans starting at $40/month; a 14-day free trial is available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Does Frappe HR integrate with accounting?$q$, $q$Yes, it integrates with ERPNext accounting and supports REST APIs and webhooks for other integrations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Open-source HR self-hosting$q$, $q$Deploy Frappe HR on your own infrastructure at no license cost.$q$, $q$Organizations wanting full control and no per-user fees$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Payroll and accounting integration$q$, $q$Run payroll with integrated accounting via ERPNext.$q$, $q$Finance and HR teams already using Frappe/ERPNext$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Managed cloud hosting$q$, $q$Host Frappe HR on Frappe Cloud instead of self-managing servers.$q$, $q$Teams that want managed infrastructure$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Self-hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["Full Frappe HR feature set","AGPL-3.0 licensed","Self-managed infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Frappe Cloud - Site Plan$q$, $q$$5/month$q$, $q$monthly$q$, $q$["Shared server hosting","Quick install for 150+ apps","Multi-region hosting","Custom domain","SSH access","Offsite backups","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$Frappe Cloud - Server Plan$q$, $q$$40/month$q$, $q$monthly$q$, $q$["Dedicated virtual machine","Unlimited sites and benches","Server analytics","Auto-scaling","Optional priority SLA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$overview$q$, $q$What is Frappe HR?$q$, 2, ARRAY[$q$Frappe HR is a 100% open-source HR and payroll solution built on the Frappe Framework, covering recruitment, employee lifecycle management, shifts and attendance, leave, expenses, performance, and payroll.$q$, $q$It can be self-hosted for free or deployed on Frappe Cloud, which offers site hosting starting at $5/month and server hosting starting at $40/month with a 14-day free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', $q$who-its-for$q$, $q$Who Frappe HR is for$q$, 2, ARRAY[$q$Frappe HR suits organizations already using or considering ERPNext/Frappe Framework tools, and teams that want a fully open-source HR system without per-user SaaS pricing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2e1130d-9c44-4370-a41a-c2cdb9ce88e0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenCATS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source applicant tracking system and recruiting CRM that you host yourself.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenCATS is a free, self-hosted, open-source applicant tracking system and recruiting CRM for staffing agencies and in-house recruiting teams.$q$,
  og_description = $q$OpenCATS is a free, self-hosted, open-source applicant tracking system and recruiting CRM for staffing agencies and in-house recruiting teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '448ec905-8c58-4b0c-931b-b7bedf89db12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '448ec905-8c58-4b0c-931b-b7bedf89db12' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Candidate management$q$, $q$Keeps candidate records, resumes, notes, status history, and recruiting activity in one open system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Recruiting CRM$q$, $q$Supports staffing agencies, internal recruiting teams, and hiring workflows in a single platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Job requisition tracking$q$, $q$Tracks open job requisitions through the hiring process.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Submission management$q$, $q$Manages candidate submissions against open job requisitions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Company and contact management$q$, $q$Stores company and contact records associated with recruiting activity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Self-hosted deployment$q$, $q$Runs on infrastructure you control, so you can host the software yourself and inspect the code.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Completely free and open-source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Self-hosted, so data stays under the organization's control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Source code can be inspected, since it is open source$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Maintained in the open by users and contributors on GitHub$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Active community support via GitHub and a Reddit community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Requires self-hosting and technical setup rather than offering a managed SaaS option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$No AI features are documented on the official site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$No published integrations list on the official site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$No mobile apps mentioned on the official site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Is OpenCATS free to use?$q$, $q$Yes, OpenCATS is free, community-maintained applicant tracking and recruiting CRM software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Do I need to host OpenCATS myself?$q$, $q$Yes, OpenCATS uses a self-hosted deployment model, meaning you install and run it on your own infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Who maintains OpenCATS?$q$, $q$OpenCATS is maintained in the open by users and contributors, with development happening on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Where can I get support for OpenCATS?$q$, $q$Support resources include installation documentation, GitHub Security Advisories, and a Reddit community (r/openCATS).$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Staffing agency candidate tracking$q$, $q$Manage candidate records, submissions, and job requisitions across client placements.$q$, $q$Staffing agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Internal recruiting management$q$, $q$Track hiring activity, candidates, and job requisitions for an in-house recruiting team.$q$, $q$Internal recruiting teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$Self-hosted ATS for data control$q$, $q$Run a recruiting system on owned infrastructure without depending on a third-party vendor.$q$, $q$Organizations requiring full data control$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$overview$q$, $q$What is OpenCATS?$q$, 2, ARRAY[$q$OpenCATS is a free, community-maintained applicant tracking system and recruiting CRM. It is described on its official site as offering "applicant tracking that stays in your hands," reflecting its self-hosted model where organizations host the software themselves and can inspect the code.$q$, $q$The platform centers on candidate management, keeping candidate records, resumes, notes, status history, and recruiting activity in one open system, alongside job requisition tracking, submission management, and company/contact management.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('448ec905-8c58-4b0c-931b-b7bedf89db12', $q$who-its-for$q$, $q$Who OpenCATS is for$q$, 2, ARRAY[$q$OpenCATS is built for teams that need candidate management without vendor dependency, including staffing agencies and internal recruiting teams that want to self-host their applicant tracking system and maintain direct control over their data and code.$q$]::text[], 1);


-- ── Recruiterflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-native recruiting CRM and ATS for executive search firms and recruiting agencies, starting at $149/user/month.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$149/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Recruiterflow is an AI-native ATS and CRM for recruiting agencies and executive search firms, with automation, sequences, and an open API.$q$,
  og_description = $q$Recruiterflow is an AI-native ATS and CRM for recruiting agencies and executive search firms, with automation, sequences, and an open API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$ATS and CRM$q$, $q$Combines applicant tracking for candidate pipelines with CRM functionality for lead and client management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Multichannel sequences$q$, $q$Runs outreach sequences across email, LinkedIn, and phone.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Recruitment and sales automation$q$, $q$Automates recruiting and sales workflows to reduce manual work.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Recruiterflow AI agents$q$, $q$A suite of built-in intelligent agents, including AIRA Notetaker which automatically summarizes key points from candidate calls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$AIRA Search$q$, $q$Natural language search technology for finding candidates or records.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Job Change Alerts$q$, $q$Tracks when candidates switch roles or companies.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Reporting and BI$q$, $q$Advanced reporting, Recruiterflow BI, and goals/leaderboards tracking.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Open API$q$, $q$Provides an open API for integrating with other tools.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Rated 4.8 out of 5 on both G2 and Capterra$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Used by 2,100+ search firms globally$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$SOC 2 and ISO 27001 certified, with GDPR compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Combines ATS and CRM functionality with sales automation in one platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Includes AI-driven features such as AIRA Notetaker and natural-language AIRA Search$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Starting price of $149 per user/month is higher than many entry-level ATS tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$AI-focused AIRA plan uses custom, quote-only pricing rather than published rates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$How much does Recruiterflow cost?$q$, $q$The Platform plan is $149 per user per month, billed monthly or annually. The AIRA plan, which adds further AI agents, uses custom pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Does Recruiterflow include AI features?$q$, $q$Yes, Recruiterflow AI includes a suite of built-in intelligent agents, AIRA Search for natural language search, and AIRA Notetaker, which automatically summarizes candidate calls.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Is there an API available?$q$, $q$Yes, the Platform plan includes API access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$What is Recruiterflow's review rating?$q$, $q$Recruiterflow is rated 4.8 out of 5 on both G2 and Capterra.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Who uses Recruiterflow?$q$, $q$Recruiterflow is used by executive search firms, recruiting agencies, and staffing companies; it reports 2,100+ search firms globally as users.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Executive search pipeline management$q$, $q$Track candidate pipelines and client relationships for retained search engagements.$q$, $q$Executive search firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Agency outreach automation$q$, $q$Run multichannel sequences across email, LinkedIn, and phone to engage candidates and clients.$q$, $q$Recruiting agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$AI-assisted call notes and search$q$, $q$Use AIRA Notetaker to summarize candidate calls and AIRA Search for natural-language candidate lookup.$q$, $q$Recruiters and search consultants$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$Platform$q$, $q$$149/user/month$q$, $q$monthly$q$, $q$["ATS and CRM","Multichannel Sequences","Recruitment Automation","Sales Automation","Client and Team Access Control","Bulk Sourcing using Chrome Extension","Reports","API Access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$AIRA$q$, $q$Custom pricing$q$, NULL, $q$["Everything in Platform plan","AIRA Notetaker","AIRA Matchmaker","AIRA Job Change Alerts","AIRA Field Updates Agent","AIRA Submission Agent","AIRA Task Agent","Omnichannel Communication Sync","Custom BI Dashboards"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$overview$q$, $q$What is Recruiterflow?$q$, 2, ARRAY[$q$Recruiterflow is an AI-native applicant tracking system and CRM platform built for recruitment agencies and executive search firms. It combines candidate pipeline tracking with client relationship management, multichannel outreach sequences, and workflow automation.$q$, $q$The platform includes Recruiterflow AI, a suite of built-in intelligent agents, along with AIRA Search for natural-language search and AIRA Notetaker, which automatically summarizes key points from candidate calls. Recruiterflow reports SOC 2 and ISO 27001 certification along with GDPR compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$who-its-for$q$, $q$Who Recruiterflow is for$q$, 2, ARRAY[$q$Recruiterflow targets executive search firms, recruiting agencies, and staffing companies that need a combined ATS and CRM with automation and AI-assisted workflows. The company reports over 2,100 search firms globally as users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e1cdadd8-bcfb-4fe7-a40d-88b82d009576', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Recruit CRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-first ATS and CRM for recruitment agencies, with AI sourcing, resume parsing, and native mobile apps.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Recruit CRM is an AI-first ATS and CRM for recruitment agencies, offering AI sourcing, resume parsing, and iOS and Android apps.$q$,
  og_description = $q$Recruit CRM is an AI-first ATS and CRM for recruitment agencies, offering AI sourcing, resume parsing, and iOS and Android apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '16d7a916-ff92-4379-8cb9-06913256e22d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '16d7a916-ff92-4379-8cb9-06913256e22d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$AI agents$q$, $q$Includes a resume formatting agent, an email reply agent that generates personalized replies, and a candidate submission agent that prepares structured submissions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$AI sourcing$q$, $q$Sources candidates on LinkedIn using natural-language queries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$AI candidate matching$q$, $q$Compares candidate profiles against job requirements using AI.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Chrome sourcing extension$q$, $q$Captures candidate profiles from LinkedIn, Xing, Gmail, and Outlook.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Resume parser$q$, $q$Converts PDF and Word resumes into structured candidate records.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Kanban pipeline view$q$, $q$Provides a visual, drag-and-drop view of candidate pipelines.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Job multiposting$q$, $q$Posts jobs to 5,000+ job boards from within the platform.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Workflow automation and integrations$q$, $q$Automates workflows and connects with 1,000+ third-party integrations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Rated 4.9/5 on Capterra, with top ratings on G2 and SoftwareAdvice$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Offers native mobile apps for both Android and iOS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Unlimited free trial with no time limit (restricted premium features)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$AI-first feature set including AI sourcing, matching, and resume formatting agents$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Reports 1,000+ integrations and job multiposting to 5,000+ job boards$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Used by agencies in 100+ countries, per the company$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Pricing is not published; the pricing page shows no dollar figures for Pro, Business, or Enterprise plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Enterprise plan requires contacting the company for a custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Does Recruit CRM offer a free trial?$q$, $q$Yes, Recruit CRM offers an unlimited free trial with no time limit, though some premium features are restricted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$How much does Recruit CRM cost?$q$, $q$Recruit CRM's pricing page lists Pro, Business, and Enterprise plans, but does not display specific dollar prices; monthly and annual billing are available, with up to 20% savings on annual billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Does Recruit CRM have mobile apps?$q$, $q$Yes, Recruit CRM offers native mobile apps for Android and iOS in addition to its web platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Does Recruit CRM include AI features?$q$, $q$Yes, it includes AI agents for resume formatting, email replies, and candidate submissions, plus AI-powered sourcing and candidate matching.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$How many job boards can I post to with Recruit CRM?$q$, $q$Recruit CRM supports job multiposting to 5,000+ job boards.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Agency candidate sourcing and submissions$q$, $q$Use AI sourcing and the Chrome extension to capture candidates from LinkedIn and other sources, then submit them to clients with AI-assisted formatting.$q$, $q$Recruitment agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Contract staffing pipeline management$q$, $q$Track candidate pipelines with a Kanban view and manage job postings across thousands of job boards.$q$, $q$Contract staffing firms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Mobile recruiting on the go$q$, $q$Manage candidates and pipelines from native iOS and Android apps.$q$, $q$Freelance recruiters and in-house recruiting teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Pro$q$, NULL, NULL, $q$["Chrome Sourcing Extension","AI Resume Parser","GPT Integration","Unlimited email templates","Fully integrated mailbox","Deal Pipelines","Phone calling & recording","Complete Reporting Suite","Unlimited open jobs","Job board posting","AI sourcing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Business$q$, NULL, NULL, $q$["Everything in Pro plan","Automated email sequencing","Bulk texting","Executive Search Report Generator","Resume formatting","Custom roles & teams","Multiple hiring pipelines","Whitelist IP address","Audit Logs","Single Sign On (SSO)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$Enterprise$q$, $q$Custom pricing$q$, NULL, $q$["Everything in Business plan","Workflow Automation","Advanced Analytics","LinkedIn Messaging Integration","Data Enrichment (Phone & Email)","Calling & Texting Credits","Recruit Craft","Job Multiposting & Direct Apply Support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$overview$q$, $q$What is Recruit CRM?$q$, 2, ARRAY[$q$Recruit CRM describes itself as "the AI-first ATS + CRM that helps recruitment agencies place more candidates, faster." It combines AI agents, automation, and customizable workflows aimed at reducing administrative recruiting work.$q$, $q$The platform includes AI sourcing on LinkedIn with natural-language queries, AI candidate matching, a resume parser, a Chrome sourcing extension, and job multiposting to 5,000+ job boards, alongside native mobile apps for Android and iOS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', $q$who-its-for$q$, $q$Who Recruit CRM is for$q$, 2, ARRAY[$q$Recruit CRM is aimed at recruitment agencies, contract staffing firms, in-house recruiting teams, and freelance recruiters, with the company stating it is trusted by agency recruiters across 100+ countries.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16d7a916-ff92-4379-8cb9-06913256e22d', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Dover ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Dover pairs a free ATS with a marketplace of fractional recruiters and AI sourcing tools to help startups hire faster.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$199/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Dover offers a free ATS, AI sourcing tools, and a vetted fractional-recruiter marketplace built for startups hiring at scale.$q$,
  og_description = $q$Dover offers a free ATS, AI sourcing tools, and a vetted fractional-recruiter marketplace built for startups hiring at scale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Free ATS$q$, $q$Unlimited users and jobs, posting to 100+ job boards, and Gmail/Outlook integration at no cost.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$AI applicant scoring$q$, $q$AI reviews and scores incoming resumes against role requirements to help teams prioritize candidates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$AI-generated job content$q$, $q$Generates careers pages and job descriptions automatically as part of the ATS workflow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Recruiter marketplace$q$, $q$Matches startups with vetted fractional recruiters and shows transparent, upfront cost-per-hire pricing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Sourcing tools$q$, $q$Includes a LinkedIn extension for outreach and employee-referral tracking for internal sourcing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Agency portal$q$, $q$Gives hiring teams visibility into candidate pipelines and costs when working with outside recruiters.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Core ATS is free with no user or job limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Recruiter marketplace shows cost-per-hire pricing upfront instead of hidden agency fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$AI resume scoring and AI note-taking speed up candidate review$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Used by 2,000+ companies including Descript and Benchling$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Premium ATS tier costs a flat $199/month regardless of team size$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Recruiter marketplace fees are on top of any software cost$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$No public information on company founding date or headquarters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Is Dover's ATS really free?$q$, $q$Yes, Dover offers a free ATS tier with unlimited users and jobs, posting to 100+ job boards, and Gmail/Outlook integration.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$What does the Premium ATS add?$q$, $q$For $199/month, Premium adds unlimited free LinkedIn and X job posts, AI applicant scoring, AI note-taking, onboarding, and premium support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$How does the recruiter marketplace work?$q$, $q$Dover matches startups with vetted fractional recruiters; recruiters set their own rates and cost breakdowns are shown before engagement.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Who uses Dover?$q$, $q$Dover is built for startups from seed through Series C+ that want to hire without bringing on a full-time in-house recruiter.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Free applicant tracking for early-stage startups$q$, $q$Teams use Dover's free ATS to post jobs, track candidates, and manage a hiring pipeline without software cost.$q$, $q$Early-stage startup founders and hiring managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$On-demand recruiter support$q$, $q$Growing companies tap Dover's marketplace to bring on fractional recruiters for specific roles with transparent pricing.$q$, $q$Startups scaling headcount without a full recruiting team$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Free ATS$q$, $q$$0$q$, $q$monthly$q$, $q$["Unlimited users and jobs","100+ job board integrations","Gmail/Outlook integration","Candidate tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Premium ATS$q$, $q$$199/month$q$, $q$monthly$q$, $q$["Everything in Free","Unlimited free LinkedIn and X job posts","AI applicant scoring","AI note-taking","Premium support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$Recruiting Marketplace$q$, $q$Recruiters set their own rates$q$, NULL, $q$["Access to vetted fractional recruiters","Transparent cost-per-hire pricing","Agency portal for pipeline visibility"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$overview$q$, $q$What is Dover?$q$, 2, ARRAY[$q$Dover is a hiring platform for startups that combines a free applicant tracking system with a marketplace of fractional recruiters and AI-powered sourcing tools.$q$, $q$The free ATS lets teams post to more than 100 job boards, track candidates, and use AI to score resumes and draft job descriptions, while the recruiter marketplace connects companies with vetted recruiters at transparent, disclosed rates.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$who-its-for$q$, $q$Who Dover is for$q$, 2, ARRAY[$q$Dover is aimed at startups from seed through Series C+ that need to hire quickly but don't want to staff a full internal recruiting team, using the free ATS for day-to-day tracking and the marketplace when extra recruiting help is needed.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Metaview ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Metaview is an agentic AI recruiting platform that sources candidates, reviews applications, and takes interview notes.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$100/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Metaview uses AI agents to source candidates, review applications, and capture interview notes for recruiting teams.$q$,
  og_description = $q$Metaview uses AI agents to source candidates, review applications, and capture interview notes for recruiting teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '337159a2-d409-432a-86c7-1ec8ab203620';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '337159a2-d409-432a-86c7-1ec8ab203620' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Sourcing Agent$q$, $q$Autonomously finds candidates and sends outreach based on a defined hiring brief.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Application review$q$, $q$AI reviews inbound applications against set criteria and surfaces top matches for recruiters.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Notetaker$q$, $q$Automatically captures structured notes from interviews.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Reports$q$, $q$A customizable reporting engine that surfaces talent insights and hiring trends.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Job posts$q$, $q$Built-in job posting functionality within the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Fillmore$q$, $q$An autonomous AI coworker that finds, contacts, and schedules screening calls with candidates.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Free tier available to try AI sourcing with no commitment$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Integrates with major ATS platforms including Ashby, Greenhouse, Lever, Gem, and SmartRecruiters$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Learns from past hiring decisions to refine candidate profiles$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Includes enterprise security features like audit trails and compliance alerts$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Sourcing agent pricing scales per user, which can add up for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Full agentic recruiting platform (beyond sourcing) requires custom Enterprise pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$No public information on founding year or headquarters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Does Metaview have a free plan?$q$, $q$Yes, the Sourcing Agent Free tier includes the first 100 profiles sourced per month at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$What does the Pro sourcing plan cost?$q$, $q$The Pro tier is $100/month per user for 200 sourced profiles per month with infinite concurrent searches.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$What ATS platforms does Metaview integrate with?$q$, $q$Metaview integrates with ATS platforms including Ashby, Greenhouse, Lever, Gem, and SmartRecruiters.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$What is Fillmore?$q$, $q$Fillmore is Metaview's autonomous AI coworker that finds candidates, reaches out, and schedules screening calls without manual intervention.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Automated candidate sourcing$q$, $q$Recruiters use the Sourcing Agent to continuously find and contact candidates that match a hiring brief.$q$, $q$In-house recruiters and executive search partners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Interview documentation$q$, $q$Hiring teams use the Notetaker to automatically capture structured notes during interviews.$q$, $q$Hiring managers and interview panels$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Sourcing Agent Free$q$, $q$$0$q$, $q$monthly$q$, $q$["First 100 profiles sourced free","Infinite concurrent searches"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Sourcing Agent Pro$q$, $q$$100/month per user$q$, $q$monthly$q$, $q$["200 profiles sourced per month","Infinite concurrent searches"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Sourcing Agent Max$q$, $q$$300/month per user$q$, $q$monthly$q$, $q$["Unlimited profiles sourced","Infinite concurrent searches"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Sourcing Agent Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom volume and usage","Dedicated support and training","Enterprise security features"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$Agentic Recruiting Platform Enterprise$q$, $q$Custom$q$, NULL, $q$["Sourcing, Application Review, Notes, and Reports agents","Premium features"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$overview$q$, $q$What is Metaview?$q$, 2, ARRAY[$q$Metaview is an agentic AI recruiting platform built to automate hiring workflows from sourcing through interview notes and reporting.$q$, $q$Its AI agents include a Sourcing Agent that finds and contacts candidates, an Application Review agent that scores inbound applicants, a Notetaker that captures interview notes, and Fillmore, an agent that schedules screening calls autonomously.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', $q$who-its-for$q$, $q$Who Metaview is for$q$, 2, ARRAY[$q$Metaview targets recruiters, hiring managers, and executive search partners at companies ranging from startups to Fortune 500 organizations who want to automate repetitive parts of the recruiting workflow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Paraform ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Paraform connects companies with a network of 10,000+ specialized recruiters supported by custom AI matching agents.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Paraform pairs companies with specialized recruiters and AI agents to fill open roles faster across industries.$q$,
  og_description = $q$Paraform pairs companies with specialized recruiters and AI agents to fill open roles faster across industries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0abb883b-fe31-411e-a600-34ef2c9cdba6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0abb883b-fe31-411e-a600-34ef2c9cdba6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Recruiter network$q$, $q$Access to more than 10,000 specialized recruiters with track records in specific hiring needs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Custom AI agents$q$, $q$AI agents that learn from each hiring cycle to improve candidate matching over time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$White-glove support$q$, $q$Dedicated talent strategists manage engagements on an ongoing basis.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Recruiter toolkit$q$, $q$A free AI toolkit for recruiters covering sourcing, candidate matching, CRM, note-taking, and scheduling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Back-office support$q$, $q$Paraform handles client communications, feedback collection, and payment processing between companies and recruiters.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Recruiter network spans legal, engineering, and enterprise specialties$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Notable clients include Palantir, Rippling, Cognition AI, and Scale AI$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Reports a 98% satisfaction rate and a 70% interview rate for placements$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Recruiter toolkit is free to use for independent and agency recruiters$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$No public pricing is listed for companies using the platform$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Model depends on working through third-party recruiters rather than self-serve software$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$No public information on founding year, headquarters, or company size$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$How does Paraform match recruiters to roles?$q$, $q$Paraform uses custom AI agents that learn from each hiring cycle to connect companies with recruiters who have a track record in similar roles.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Is Paraform's toolkit free for recruiters?$q$, $q$Yes, Paraform provides a free AI toolkit for recruiters covering sourcing, candidate matching, CRM, note-taking, and scheduling.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$What companies use Paraform?$q$, $q$Paraform's stated clients include Palantir, Rippling, Cognition AI, Scale AI, Thomson Reuters, and Basis.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Does Paraform publish pricing?$q$, $q$No, pricing is not published on Paraform's website; details are handled directly between companies and recruiters on the platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Specialized role hiring$q$, $q$Companies use Paraform to reach recruiters with proven experience filling legal, engineering, or executive roles.$q$, $q$Startups and enterprises hiring for specialized positions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$Recruiter deal flow$q$, $q$Independent and agency recruiters use Paraform's free toolkit to find open roles and manage candidates.$q$, $q$Independent and agency recruiters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$overview$q$, $q$What is Paraform?$q$, 2, ARRAY[$q$Paraform is a hiring platform that connects companies with a network of more than 10,000 specialized recruiters, supported by custom AI agents that learn from each hiring cycle to improve candidate matching.$q$, $q$The platform also gives recruiters a free AI toolkit for sourcing, CRM, note-taking, and scheduling, while Paraform's back office manages client communication and payments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$who-its-for$q$, $q$Who Paraform is for$q$, 2, ARRAY[$q$Paraform serves companies from early-stage startups to enterprises that need specialized recruiting help, as well as independent and agency recruiters looking for deal flow and tooling.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0abb883b-fe31-411e-a600-34ef2c9cdba6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Juicebox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Juicebox (PeopleGPT) lets recruiters search 800M+ candidate profiles using natural language and automate outreach.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Juicebox's PeopleGPT search lets recruiters find candidates across 800M+ profiles with natural language queries.$q$,
  og_description = $q$Juicebox's PeopleGPT search lets recruiters find candidates across 800M+ profiles with natural language queries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4cc45ff7-31f0-4735-be09-538439350dbc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4cc45ff7-31f0-4735-be09-538439350dbc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$PeopleGPT search$q$, $q$Search across 800M+ profiles from 30+ sources using natural language queries with enriched candidate profiles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$AI agents$q$, $q$Automated agents that continuously search for candidates, learn from hiring patterns, and run outreach around the clock.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Talent insights$q$, $q$Real-time market data and talent pool analytics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Automated outreach$q$, $q$Dynamic, multi-step outreach sequences with personalized messaging.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$ATS/CRM integrations$q$, $q$Connects with 41 ATS systems and 21 CRMs, including Lever, Greenhouse, Ashby, Workday, and Bullhorn.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Chrome extension$q$, $q$A browser extension for sourcing candidates while browsing the web.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Free tier available to try searches before paying$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Searches across 800M+ profiles from 30+ sources$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Wide ATS/CRM integration coverage (41 ATS, 21 CRMs)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Annual billing offers a discount over monthly pricing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Higher-volume Business tier requires contacting sales for custom pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Contact and export credits are capped by plan, which can limit heavy sourcing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Juicebox Agents are a separate $199/agent/month add-on$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Is there a free version of Juicebox?$q$, $q$Yes, Juicebox offers a Free plan with limited free searches and AI email templates.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$How much is the Starter plan?$q$, $q$The Starter plan is $99/month for one seat, with unlimited searches and 500 contact and export credits.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$What does the Growth plan include?$q$, $q$Growth is $179/month for up to 5 seats and adds talent insights, 1,500 contact and export credits, and additional mailboxes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Does Juicebox integrate with ATS systems?$q$, $q$Yes, Juicebox integrates with 41 ATS platforms and 21 CRMs, including Greenhouse, Lever, Ashby, and Workday.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Natural-language candidate search$q$, $q$Recruiters use PeopleGPT to describe a role in plain language and surface matching candidates from 800M+ profiles.$q$, $q$In-house recruiters and boutique recruiting agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Automated outbound recruiting$q$, $q$Teams set up AI agents to continuously source and message candidates without manual follow-up.$q$, $q$Talent acquisition teams running high-volume outreach$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Free$q$, $q$$0/seat/month$q$, $q$monthly$q$, $q$["Limited free searches","AI email templates","Agent setup"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Starter$q$, $q$$99/month$q$, $q$monthly$q$, $q$["1 seat","Unlimited searches","500 contact credits","500 export credits","1 mailbox"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Growth$q$, $q$$179/month$q$, $q$monthly$q$, $q$["Up to 5 seats","Talent insights","1,500 contact credits","1,500 export credits","3 mailboxes per user"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$Business$q$, $q$Custom$q$, NULL, $q$["Unlimited contact credits","Onboarding and training","ATS/CRM integrations","6 mailboxes per user","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$overview$q$, $q$What is Juicebox?$q$, 2, ARRAY[$q$Juicebox, also known as PeopleGPT, is an AI recruiting platform that lets recruiters search more than 800 million candidate profiles across 30+ sources using natural language.$q$, $q$Beyond search, Juicebox offers AI agents that continuously source candidates and run multi-step outreach sequences, plus integrations with 41 ATS platforms and 21 CRMs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', $q$who-its-for$q$, $q$Who Juicebox is for$q$, 2, ARRAY[$q$Juicebox is built for recruiters at organizations of any size, from boutique agencies to large enterprises, who need to find hard-to-source talent and automate candidate outreach.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Findem ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Findem is an AI talent intelligence platform combining assistive, agentic, and embedded AI for sourcing and analytics.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Findem uses assistive and agentic AI to power sourcing, screening, scheduling, and workforce analytics for talent teams.$q$,
  og_description = $q$Findem uses assistive and agentic AI to power sourcing, screening, scheduling, and workforce analytics for talent teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Assistive AI$q$, $q$AI-assisted sourcing, talent marketing, executive search, analytics, and market intelligence.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Agentic AI$q$, $q$Includes an Intelligent Job Post agent, Application Boost Agent, Screening Agent, and Scheduling Agent that plan and execute hiring workflow steps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Data Labeling Engine$q$, $q$Part of Findem's Build AI, used to create AI-ready talent datasets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Embedded AI$q$, $q$Includes an AI Job Board, Sourcing Copilot, and agent/MCP support for embedding Findem's AI elsewhere.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Success and relationship signals$q$, $q$Analyzes career history and network connections to evaluate candidate potential beyond a resume.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Combines assistive, agentic, and embedded AI in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Covers the full funnel from sourcing to scheduling with dedicated agents$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Used across talent acquisition, executive search, and analytics use cases$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$No public pricing; requires a demo request to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$No public information on founding year, headquarters, or company size$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Specific integration list is not detailed on the main site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$What is agentic AI in Findem?$q$, $q$Findem's agentic AI includes agents such as Intelligent Job Post, Application Boost, Screening, and Scheduling that plan, execute, and improve hiring workflows.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Does Findem publish pricing?$q$, $q$No, Findem does not publish pricing; prospective customers need to request a demo to receive a quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Who uses Findem?$q$, $q$Findem is used by talent acquisition teams, executive search firms, HR departments, and VC/PE firms, according to its website.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Talent sourcing and screening$q$, $q$Talent acquisition teams use Findem's assistive and agentic AI to source, screen, and schedule candidates.$q$, $q$In-house talent acquisition teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$Workforce and market intelligence$q$, $q$HR and analytics teams use Findem's signals to understand candidate potential and market trends.$q$, $q$HR analytics and workforce planning teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$overview$q$, $q$What is Findem?$q$, 2, ARRAY[$q$Findem is an AI talent intelligence platform that combines assistive AI, agentic AI, and embedded AI to support sourcing, talent marketing, executive search, and workforce analytics.$q$, $q$Its agentic AI includes agents for job posting, application review, candidate screening, and interview scheduling, while its Data Labeling Engine creates AI-ready talent datasets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$who-its-for$q$, $q$Who Findem is for$q$, 2, ARRAY[$q$Findem targets talent acquisition teams, executive search firms, HR departments, and investment firms that need AI-driven sourcing and workforce analytics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── HireEZ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$hireEZ is an agentic AI recruiting layer that sources, screens, and schedules candidates on top of an existing ATS.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$hireEZ adds agentic AI sourcing, screening, and scheduling on top of your existing ATS without replacing it.$q$,
  og_description = $q$hireEZ adds agentic AI sourcing, screening, and scheduling on top of your existing ATS without replacing it.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '75de4905-e02e-4641-aa2f-074c25a04d63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '75de4905-e02e-4641-aa2f-074c25a04d63' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$AI sourcing$q$, $q$Searches across 45+ external platforms plus internal ATS data to surface candidates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Applicant review$q$, $q$AI-powered candidate matching and shortlisting from inbound applicants.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Conversational AI screening$q$, $q$Voice-based phone screening that adapts in real time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$AI scheduler$q$, $q$Automated calendar coordination and interview booking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Talent CRM$q$, $q$Nurtures pipelines and resurfaces past applicants for new roles.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Hiring intelligence$q$, $q$Market insights and performance reporting for recruiting teams.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Works on top of existing ATS platforms like Workday, iCIMS, Greenhouse, and SAP without a rip-and-replace migration$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Used by 70+ Fortune 500 companies according to the vendor$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Covers sourcing, screening, and scheduling in one layer$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Serves multiple industries including tech, healthcare, and financial services$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$No public pricing; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Performance metrics (e.g. time-to-fill reduction) are vendor-reported claims, not independently verified$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$No public information on founding year or headquarters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Does hireEZ replace my ATS?$q$, $q$No, hireEZ operates as a layer on top of existing ATS systems such as Workday, iCIMS, Greenhouse, and SAP rather than replacing them.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$What does hireEZ's AI sourcing search?$q$, $q$It searches across more than 45 external platforms in addition to a company's internal ATS data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Is hireEZ pricing public?$q$, $q$No, hireEZ does not publish pricing; visitors are directed to contact sales.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$What industries use hireEZ?$q$, $q$hireEZ lists customers across tech/AI, healthcare, staffing/RPO, defense and aerospace, insurance, financial services, manufacturing, and energy.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Sourcing on top of an existing ATS$q$, $q$Talent teams use hireEZ to source candidates across external platforms while keeping their current ATS.$q$, $q$Talent acquisition leaders and recruiters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$Automated screening and scheduling$q$, $q$Recruiters use conversational AI screening and the AI scheduler to move candidates through the pipeline faster.$q$, $q$Recruiters and hiring managers handling high applicant volume$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$overview$q$, $q$What is HireEZ?$q$, 2, ARRAY[$q$hireEZ is an agentic AI recruiting platform that acts as a 'system of actions' layer on top of an organization's existing ATS, automating sourcing, applicant review, screening, and scheduling.$q$, $q$It searches across 45+ external platforms in addition to internal ATS data, and includes conversational AI for phone screening and an AI scheduler for interview coordination.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', $q$who-its-for$q$, $q$Who HireEZ is for$q$, 2, ARRAY[$q$hireEZ is aimed at talent acquisition leaders, recruiters, sourcers, and hiring managers at organizations that want to add AI automation without migrating off their current ATS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SeekOut ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SeekOut is an agentic AI recruiting platform that searches 1B+ profiles and automates screening and outreach.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$149/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Bellevue, WA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$SeekOut searches over 1 billion candidate profiles with AI screening, outreach, and ATS integrations for recruiters.$q$,
  og_description = $q$SeekOut searches over 1 billion candidate profiles with AI screening, outreach, and ATS integrations for recruiters.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Intelligent search$q$, $q$Context-aware AI search across 1B+ candidate profiles and connected ATS systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$AI screening$q$, $q$Automated video interviews that evaluate candidates against custom criteria.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Inbound evaluation$q$, $q$Processes large volumes of applicants with same-day AI scoring.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Personalized outreach$q$, $q$AI-crafted, multi-touch candidate engagement campaigns.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Talent rediscovery$q$, $q$Surfaces past applicants and silver-medalist candidates from an existing ATS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$SeekOut MCP$q$, $q$Integrates SeekOut with AI assistants including Claude, ChatGPT, Gemini, and Microsoft Copilot.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$14-day free trial available on the self-serve Core plan with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Searches across 1 billion or more candidate profiles$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Broad ATS integration list including Workday, Greenhouse, iCIMS, Lever, and Ashby$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$750+ customers including DocuSign, Sony, and Microsoft, per the vendor$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Advanced sourcing, integration, and full-funnel plans require custom quotes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$AI screening and evaluation features add complexity that may require setup time$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Core self-serve plan pricing is higher on month-to-month billing ($179/month) than annual ($149/month)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Does SeekOut offer a free trial?$q$, $q$Yes, the SeekOut Recruit Core plan includes a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$How much does SeekOut Recruit Core cost?$q$, $q$Core is $149/month billed annually, or $179/month billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$What ATS systems does SeekOut integrate with?$q$, $q$SeekOut integrates with Workday, Greenhouse, iCIMS, Lever, Ashby, Avature, Beamery, Bullhorn, Gem, Jobvite, Phenom, SAP SuccessFactors, SmartRecruiters, and Talemetry.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$What is SeekOut MCP?$q$, $q$SeekOut MCP lets recruiters access SeekOut's data through AI assistants such as Claude, ChatGPT, Gemini, and Microsoft Copilot.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$High-volume candidate sourcing$q$, $q$Recruiters use SeekOut's search across 1B+ profiles to find candidates for hard-to-fill roles.$q$, $q$Individual recruiters and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Automated inbound screening$q$, $q$Talent acquisition teams use SeekOut Sam and AI screening to evaluate large volumes of applicants same-day.$q$, $q$Enterprise talent acquisition teams handling high applicant volume$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Recruit Core$q$, $q$$149/month (annual) or $179/month (monthly)$q$, $q$monthly$q$, $q$["Unlimited search across 1B+ profiles","500 contact credits/month","1,000 exports/month","AI multi-step campaigns","14-day free trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Recruit — Sourcing$q$, $q$Custom$q$, $q$annual$q$, $q$["750 contacts/month per seat","5,000 exports/month per seat","Advanced diversity filters","SSO","Dedicated customer success"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Recruit — Sourcing + Integration$q$, $q$Custom$q$, $q$annual$q$, $q$["ATS rediscovery","Unified external + ATS search","Recruiter benchmarks","Market intelligence"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$Recruit — Full Recruiting Funnel$q$, $q$Custom$q$, $q$annual$q$, $q$["Agentic AI workflows","Inbound evaluation","Job-specific rubrics","White-glove implementation"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$overview$q$, $q$What is SeekOut?$q$, 2, ARRAY[$q$SeekOut is an agentic AI recruiting platform that helps talent acquisition teams source, screen, and engage candidates across a database of more than 1 billion profiles.$q$, $q$It combines AI-powered search with automated video screening, inbound applicant evaluation, and personalized multi-touch outreach, plus integrations with major ATS systems and AI assistants via SeekOut MCP.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', $q$who-its-for$q$, $q$Who SeekOut is for$q$, 2, ARRAY[$q$SeekOut serves individual recruiters and small teams through its self-serve Core plan, and larger talent acquisition organizations and enterprises through custom Sourcing, Integration, and Full Recruiting Funnel plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d5a700-1eb4-4e5e-b5cd-3a7dc302fad1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Leapsome ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Leapsome unifies HRIS and talent management, covering performance reviews, engagement surveys, goals, and AI agents.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$€199/month per user$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, NY, USA and Berlin, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Leapsome combines HRIS, performance reviews, engagement surveys, and AI agents in one modular HR platform.$q$,
  og_description = $q$Leapsome combines HRIS, performance reviews, engagement surveys, and AI agents in one modular HR platform.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fdee0987-278e-4695-be35-6f8d4a24d46b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fdee0987-278e-4695-be35-6f8d4a24d46b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$HRIS module$q$, $q$Employee records, documents and e-signatures, absence management, time tracking, onboarding, and payroll prep.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Talent suite$q$, $q$Recruiting, performance reviews, engagement surveys, goals and OKRs, learning management, and compensation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$AI agents$q$, $q$Generate automations, dashboards, and team insights, and provide personalized employee coaching.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Continuous feedback and 1:1s$q$, $q$Tools for ongoing feedback and structured one-on-one meetings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Integrations$q$, $q$Connects with 100+ tools including BambooHR, Slack, Workday, HiBob, Deel, Personio, and Greenhouse.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$14-day free trial available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Combines HRIS and talent management in a single platform, reducing tool sprawl$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$European hosting in Germany with GDPR, ISO 27001:2022, and EU AI Act compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Used by 2,000+ organizations including Spotify, Notion, and Sony$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Pricing is modular and quote-based rather than fixed self-serve tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Minimum 1-year contract length$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$No public information on founding year or exact company size$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$How is Leapsome priced?$q$, $q$Leapsome uses a modular pricing model based on employee count, selected modules, and contract length, with plans starting around €199/month per user.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Does Leapsome offer a free trial?$q$, $q$Yes, Leapsome offers a 14-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Where is Leapsome based?$q$, $q$Leapsome has offices in New York, NY and Berlin, Germany.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$What integrations does Leapsome support?$q$, $q$Leapsome integrates with 100+ tools including BambooHR, Slack, Workday, HiBob, Deel, Personio, SAP, Greenhouse, Rippling, Microsoft Teams, and ADP.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Unified HR operations$q$, $q$Companies replace separate HRIS and performance tools with Leapsome's combined platform.$q$, $q$People operations and HR leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Manager and employee coaching$q$, $q$Managers use Leapsome's AI agents for team insights and personalized coaching during 1:1s.$q$, $q$Managers and team leads$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$Modular plan$q$, $q$From €199/month per user$q$, $q$monthly$q$, $q$["Choice of HRIS and/or Talent Suite modules","AI Agents, Workflows, and Analytics included","Multi-module and volume discounts","14-day free trial"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$overview$q$, $q$What is Leapsome?$q$, 2, ARRAY[$q$Leapsome is an AI-powered HR platform that unifies HRIS functions like employee records and time tracking with talent management tools such as performance reviews, engagement surveys, goals and OKRs, and compensation.$q$, $q$Its AI agents can generate workflow automations and dashboards, surface team insights, and provide personalized coaching for employees and managers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', $q$who-its-for$q$, $q$Who Leapsome is for$q$, 2, ARRAY[$q$Leapsome serves companies of varying sizes, from startups to larger organizations, across industries including tech, e-commerce, fintech, and professional services, that want HRIS and talent management combined in one system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── 15Five ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$15Five is an AI-powered performance management platform for reviews, engagement surveys, and manager coaching.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$4/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$15Five combines performance reviews, engagement surveys, and AI manager coaching in one people management platform.$q$,
  og_description = $q$15Five combines performance reviews, engagement surveys, and AI manager coaching in one people management platform.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '172aeb66-4aac-42c5-b5fb-820fded05cd2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$AI-assisted performance reviews$q$, $q$Helps write and structure performance reviews with AI support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Engagement surveys$q$, $q$Employee engagement surveys with predictive analytics on engagement drivers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Kona AI assistant$q$, $q$AI coaching tool that guides managers with real-time recommendations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Goals and OKR tracking$q$, $q$Tools for setting and tracking team and individual goals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Compensation insights$q$, $q$Pay range management and compensation insight tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$1-on-1 meeting tools$q$, $q$Structured templates and tracking for manager-employee 1:1s.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Mobile apps$q$, $q$iOS and Android apps for accessing reviews, check-ins, and feedback on the go.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Transparent, published per-user pricing across three tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Serves 3,000+ customers and 250,000+ employees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Mobile apps available for iOS and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Combines engagement surveys, reviews, and manager coaching in one platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$No free plan; all tiers require a paid subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$AI Assistant (Kona), Manager Products, and Compensation are separate add-ons on top of base pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$No public information on founding year or headquarters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$How much does 15Five cost?$q$, $q$15Five's published plans are Engage at $4/user/month, Perform at $11/user/month, and Total Platform at $16/user/month, billed annually per user.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Does 15Five have a free plan?$q$, $q$No, 15Five's plans are paid subscriptions; no free tier is listed on its pricing page.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$What is Kona?$q$, $q$Kona is 15Five's AI assistant that provides manager coaching and guidance, available as an add-on.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Is 15Five available on mobile?$q$, $q$Yes, 15Five offers mobile apps for both iOS and Android.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Performance reviews and 1:1s$q$, $q$Managers use 15Five's Perform tier for structured performance reviews, OKRs, and 1-on-1 meetings.$q$, $q$Mid-market and enterprise managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Employee engagement tracking$q$, $q$HR teams use 15Five's Engage tier to run surveys and analyze engagement drivers.$q$, $q$HR and people operations teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Engage$q$, $q$$4/user/month$q$, $q$annual$q$, $q$["Engagement surveys","Predictive analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Perform$q$, $q$$11/user/month$q$, $q$annual$q$, $q$["Performance reviews","1-on-1 meetings","OKRs","Career growth tools"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Total Platform$q$, $q$$16/user/month$q$, $q$annual$q$, $q$["All Engage and Perform features combined"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$overview$q$, $q$What is 15Five?$q$, 2, ARRAY[$q$15Five is an AI-powered continuous performance management platform that unifies performance reviews, employee engagement surveys, compensation insights, and manager enablement tools.$q$, $q$It offers three published pricing tiers—Engage, Perform, and Total Platform—along with add-ons like the Kona AI assistant for manager coaching, and mobile apps for iOS and Android.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$who-its-for$q$, $q$Who 15Five is for$q$, 2, ARRAY[$q$15Five is aimed at mid-market and enterprise organizations that want to combine performance management, engagement tracking, and manager coaching in a single platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Culture Amp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Culture Amp is an employee experience platform for engagement surveys, performance management, and people analytics.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Culture Amp offers employee engagement surveys, performance reviews, and AI-powered people analytics for HR teams.$q$,
  og_description = $q$Culture Amp offers employee engagement surveys, performance reviews, and AI-powered people analytics for HR teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8260c82f-10fa-4ece-b662-6c99bd5967eb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8260c82f-10fa-4ece-b662-6c99bd5967eb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Engage$q$, $q$Employee surveys, pulse surveys, retention insights, DEI assessments, and benchmarking with AI comment summaries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Perform$q$, $q$Continuous feedback, performance reviews, 1-on-1 meeting tools, goal management, and 360-degree feedback.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$AI Coach$q$, $q$Provides instant insights intended to help accelerate performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Performance Culture Quadrant$q$, $q$An assessment tool for evaluating organizational culture and performance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Survey templates and action plans$q$, $q$Ready-to-use survey templates paired with suggested action plans.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Used by 6,000+ companies including Canva, Etsy, and Intercom, per the vendor$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Integrates with major HR SaaS products and HRIS systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$SOC II, ISO, and GDPR compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Tiered customer success support based on company size, from group support to dedicated enterprise coaching$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$No public pricing; requires requesting a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Billing is annual, which may not suit companies wanting monthly flexibility$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$No public information on founding year or specific company size$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Does Culture Amp publish pricing?$q$, $q$No, Culture Amp does not list specific prices; it directs visitors to request a quote based on employee count, products selected, and service tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$What products does Culture Amp offer?$q$, $q$Culture Amp's main products are Engage for surveys and engagement, Perform for performance management, and Develop as an add-on for talent growth.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$What compliance certifications does Culture Amp have?$q$, $q$Culture Amp is SOC II, ISO, and GDPR compliant.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Does Culture Amp integrate with other HR systems?$q$, $q$Yes, Culture Amp states it integrates with every major HR SaaS product in the market, including HRIS data synchronization and Slack/Microsoft Teams integration.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Employee engagement surveys$q$, $q$HR teams use Culture Amp's Engage product to run pulse surveys and analyze retention risk.$q$, $q$HR leaders and people teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$Performance management$q$, $q$Managers use Culture Amp's Perform product for continuous feedback, reviews, and goal tracking.$q$, $q$Managers and employees at mid-to-large organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$overview$q$, $q$What is Culture Amp?$q$, 2, ARRAY[$q$Culture Amp is an employee experience platform that combines engagement surveys, performance management, and people analytics to help organizations build and sustain company culture.$q$, $q$Its Engage product covers surveys, pulse checks, and DEI assessments, while Perform covers continuous feedback, reviews, and goal management, with an AI Coach providing insights across both.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', $q$who-its-for$q$, $q$Who Culture Amp is for$q$, 2, ARRAY[$q$Culture Amp serves HR executives, managers, and employees at organizations across professional services, financial services, software, and manufacturing, with service tiers scaled to company size.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8260c82f-10fa-4ece-b662-6c99bd5967eb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Officevibe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Workleap Officevibe is an employee engagement platform using pulse surveys, anonymous feedback, and AI insights to help managers act.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Workleap Officevibe: pulse surveys, anonymous feedback, and AI-powered engagement insights to help managers retain talent.$q$,
  og_description = $q$Workleap Officevibe: pulse surveys, anonymous feedback, and AI-powered engagement insights to help managers retain talent.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a31391fe-79aa-479e-ad05-f7def34d36ee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a31391fe-79aa-479e-ad05-f7def34d36ee' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Pulse & Custom Surveys$q$, $q$Collect employee feedback through pulse surveys and custom surveys to track sentiment over time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Anonymous Feedback$q$, $q$Employees can share honest feedback anonymously to surface real issues.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Good Vibes Recognition Cards$q$, $q$Peer-to-peer recognition cards let employees celebrate wins and each other.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$AI-Powered Highlights$q$, $q$AI explains survey results and metrics automatically for managers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$AI-Generated Recommended Actions$q$, $q$The platform suggests specific actions based on feedback data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Feedback Reply Assistance$q$, $q$AI helps managers draft replies to employee feedback and concerns.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$One-on-One Conversation Tools$q$, $q$Built-in agenda support for structured 1:1 conversations between managers and employees.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$AI-powered highlights and recommended actions help managers act on feedback faster$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Anonymous feedback collection encourages honest employee input$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Combines engagement surveys with peer recognition in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Integrates with Slack and Microsoft Teams$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Used by over 70,000 leaders worldwide, per the company$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Pricing is not published on the website and requires a demo request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Confirmed language support is limited to English and French$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Company founding year and headquarters are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Does Officevibe use AI?$q$, $q$Yes — it uses AI to generate highlights explaining survey metrics, recommend actions based on feedback, and help managers draft replies to employee comments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Is feedback anonymous in Officevibe?$q$, $q$Yes, the platform is built around anonymous feedback collection to encourage honest employee responses.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$What languages does Officevibe support?$q$, $q$The website's language selector shows English and French support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Does Officevibe integrate with Slack and Microsoft Teams?$q$, $q$Yes, Officevibe integrates with Slack, Microsoft Teams, and HRIS tools.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Is Officevibe part of a larger company?$q$, $q$Yes, Officevibe is a product of Workleap Technologies Inc.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Anonymous employee feedback$q$, $q$HR and managers use pulse surveys and anonymous feedback tools to surface real sentiment without fear of exposure.$q$, $q$HR leaders and people managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Manager action planning$q$, $q$AI-generated recommended actions help managers turn survey results into concrete next steps.$q$, $q$People managers at SMBs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$Peer recognition$q$, $q$Good Vibes cards let teams recognize wins and celebrate each other alongside survey-based engagement tracking.$q$, $q$Distributed and hybrid teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$overview$q$, $q$What is Officevibe?$q$, 2, ARRAY[$q$Officevibe (marketed as Workleap Officevibe) is an employee engagement and feedback platform that helps leaders collect insights, monitor engagement, and take action to retain talent. It centers on pulse and custom surveys, anonymous feedback collection, and AI-powered analysis of the results.$q$, $q$The platform pairs its listening tools with Good Vibes recognition cards for peer-to-peer appreciation, plus reporting on survey trends, turnover, and recognition activity. AI features generate highlights explaining metrics, suggest recommended actions, and help managers draft replies to feedback.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', $q$who-its-for$q$, $q$Who Officevibe is for$q$, 2, ARRAY[$q$Officevibe is positioned for small-to-medium businesses and their managers, spanning industries such as financial services, technology, and professional services. The company states it is used by more than 70,000 leaders worldwide.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a31391fe-79aa-479e-ad05-f7def34d36ee', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── WorkTango ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WorkTango is an employee experience platform combining recognition and rewards with AI-powered listening tool Constellation.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$WorkTango combines recognition, rewards, and AI-driven employee listening tool Constellation to improve engagement.$q$,
  og_description = $q$WorkTango combines recognition, rewards, and AI-driven employee listening tool Constellation to improve engagement.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f693b898-12c0-4472-a7d3-8ed4219d2443';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f693b898-12c0-4472-a7d3-8ed4219d2443' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Recognition & Rewards$q$, $q$Automated recognition programs, a rewards marketplace, service awards, and milestone celebrations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Employee Lifecycle Surveys$q$, $q$Engagement measurement across the employee lifecycle with dashboards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Constellation$q$, $q$AI-powered employee listening tool for deeper insight into feedback.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Action Planning$q$, $q$Tools to help leaders plan and track responses to survey results.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Anonymous Conversations$q$, $q$A two-way anonymous feedback channel between employees and leadership.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Leadership Enablement$q$, $q$Tools for managers to act on employee feedback.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Combines recognition & rewards with employee listening in a single platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Constellation AI tool is built specifically for surfacing engagement insights$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Supports action planning to close the loop on survey feedback$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Backed by Vista Equity Partners$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Serves multiple industries including manufacturing, education, SaaS/technology, and government$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Pricing is not published; a quote requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Specific integrations beyond general HRIS connectivity are not detailed on the website$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Headquarters and founding year are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$What is Constellation in WorkTango?$q$, $q$Constellation is WorkTango's AI-powered employee listening tool used to surface insights from feedback and surveys.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Does WorkTango offer employee recognition?$q$, $q$Yes, it includes automated recognition programs, a rewards marketplace, service awards, and milestone celebrations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Who backs WorkTango?$q$, $q$WorkTango is backed by Vista Equity Partners.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$What industries use WorkTango?$q$, $q$The company highlights use in manufacturing, education, SaaS & technology, and government.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Employee listening & action planning$q$, $q$HR teams use lifecycle surveys and the Constellation AI tool to measure engagement and plan follow-up actions.$q$, $q$HR and people leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Recognition & rewards programs$q$, $q$Organizations automate peer and manager recognition alongside service awards and milestone celebrations.$q$, $q$Managers and department leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$Anonymous feedback channels$q$, $q$Leadership uses anonymous conversation tools to gather honest input from employees.$q$, $q$Enterprise leadership teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$overview$q$, $q$What is WorkTango?$q$, 2, ARRAY[$q$WorkTango is an employee experience platform that combines recognition and rewards with employee listening. Its feature set includes automated recognition programs, a rewards marketplace, service awards, and milestone celebrations, alongside employee lifecycle surveys and engagement dashboards.$q$, $q$The platform's Constellation tool applies AI to employee listening data to help leaders identify what's driving engagement, and its action-planning tools are designed to help managers follow through on what surveys reveal. WorkTango is backed by Vista Equity Partners.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', $q$who-its-for$q$, $q$Who WorkTango is for$q$, 2, ARRAY[$q$WorkTango is aimed at HR and people leaders at organizations undergoing business transformation or supporting hybrid and remote work, with named use across manufacturing, education, SaaS & technology, and government sectors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f693b898-12c0-4472-a7d3-8ed4219d2443', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Bonusly ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bonusly is a peer-to-peer employee recognition platform with a free plan for up to 8 users and paid tiers from $3/user/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$3/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bonusly offers peer recognition, rewards, and AI features with a free plan for small teams and paid plans from $3/user/month.$q$,
  og_description = $q$Bonusly offers peer recognition, rewards, and AI features with a free plan for small teams and paid plans from $3/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6806207d-501f-442f-81f0-3c146ec0fedc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6806207d-501f-442f-81f0-3c146ec0fedc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Peer-to-Peer Recognition$q$, $q$Employees recognize each other's work in a shared feed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Rewards Catalog$q$, $q$Redeem points for gift cards, cash, or other rewards from a global catalog.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Check-ins$q$, $q$Structured 1:1 conversation tools for managers and employees.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Celebrations$q$, $q$Automated recognition for birthdays, anniversaries, and milestones.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Growth Tools$q$, $q$Goals, reflections, and 360-degree feedback built into daily use.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Insights$q$, $q$Real-time analytics on culture and team health.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Bizy AI$q$, $q$AI-powered feature available as an add-on or bundled with certain plans.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Free plan available forever for teams of up to 8 users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Paid Team plan starts at $3/user/month ($5/user/month with Bizy AI bundled)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Integrates with Slack, Microsoft Teams, and offers an API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$iOS and Android apps included even on the free plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Used by 3,400+ organizations, per the company$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Free plan is capped at 8 users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$SAML SSO and company-wide analytics require the custom-priced Organization plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Bizy AI costs an additional $2/user/month unless bundled into the Team or Organization plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Is there a free version of Bonusly?$q$, $q$Yes, Bonusly offers a free plan for up to 8 users with peer recognition and Slack/Teams integrations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$How much does Bonusly cost?$q$, $q$The Team plan starts at $3/user/month ($30/user/year annually) without AI, or $5/user/month with Bizy AI included. Organization-level pricing is custom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$What is Bizy AI?$q$, $q$Bizy AI is Bonusly's AI-powered feature, available standalone for $2/user/month or bundled into the Team and Organization plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Does Bonusly have mobile apps?$q$, $q$Yes, iOS and Android apps are included, even on the free plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$What integrations does Bonusly support?$q$, $q$Bonusly integrates with Slack and Microsoft Teams and offers an API, plus HRIS integrations on paid plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Small team recognition$q$, $q$Teams of up to 8 people can use the free plan for peer recognition without cost.$q$, $q$Small teams and startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Company-wide recognition & rewards$q$, $q$Mid-size and larger organizations use the Team or Organization plan for unlimited seats, automated milestones, and a rewards catalog.$q$, $q$HR and people ops teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Manager check-ins$q$, $q$Managers use Bonusly's check-in tools and smart 1:1 agendas alongside recognition data.$q$, $q$People managers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 8 users","Peer recognition","Slack and Microsoft Teams integrations","iOS and Android apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Team$q$, $q$$3/user/month ($30/user/year billed annually)$q$, $q$monthly$q$, $q$["Unlimited seats","Advanced pulse check analytics","Automated milestone celebrations","HRIS integrations and provisioning","24/7 chat support","Enhanced 1:1s with smart agendas"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Team + Bizy AI$q$, $q$$5/user/month ($50/user/year billed annually)$q$, $q$monthly$q$, $q$["All Team features","Bizy AI included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$Organization + Bizy AI$q$, $q$Custom$q$, $q$annual$q$, $q$["All Team features","Company announcements","Awards and incentives","Company-wide analytics","SAML SSO","Dedicated customer success manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$overview$q$, $q$What is Bonusly?$q$, 2, ARRAY[$q$Bonusly is a peer-to-peer employee recognition and rewards platform. Employees give each other recognition points that can be redeemed from a global rewards catalog for gift cards, cash, or other items, and the platform layers in check-ins, milestone celebrations, goals, and 360-degree feedback.$q$, $q$Bonusly offers a free-forever plan for teams of up to 8 users, with paid Team plans starting at $3/user/month and an optional Bizy AI add-on. The company reports more than 3,400 organizations use the platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', $q$who-its-for$q$, $q$Who Bonusly is for$q$, 2, ARRAY[$q$Bonusly suits small teams that want free peer recognition as well as larger organizations that need unlimited seats, HRIS integrations, and company-wide analytics on its paid tiers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6806207d-501f-442f-81f0-3c146ec0fedc', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Kudos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Kudos is a Canadian employee recognition platform offering peer recognition, rewards, and an AI Recognition Assistant.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Canada$q$,
  languages = '{}',
  seo_meta_description = $q$Kudos provides peer-to-peer employee recognition, rewards, and an AI Recognition Assistant for building workplace culture.$q$,
  og_description = $q$Kudos provides peer-to-peer employee recognition, rewards, and an AI Recognition Assistant for building workplace culture.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '45bbc3cd-e3e9-484a-8307-e4b104d0b92c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Peer Recognition Feed$q$, $q$A live activity feed for employees to give and see recognition.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Rewards Programs$q$, $q$Redeemable rewards tied to recognition points.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Spaces$q$, $q$Dedicated areas for sharing cultural moments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Milestones & E-Cards$q$, $q$Automated celebration of anniversaries and other milestones.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Awards & Nominations$q$, $q$Structured award and nomination management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Incentive Programs & Challenges$q$, $q$Gamified engagement challenges.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$AI Recognition Assistant$q$, $q$AI-assisted suggestions for giving recognition.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Reporting & Analytics$q$, $q$Dashboards for tracking recognition activity.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$AI Recognition Assistant helps automate recognition suggestions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Notable clients include DHL, ENGIE, MU Health Care, and Vanderbilt University$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Combines recognition, milestones, e-cards, and incentive challenges in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Canadian-headquartered company with an international client base$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Pricing is not published; requires a demo request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Specific integrations are not detailed on the public website$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Founding year and company size are not disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Where is Kudos headquartered?$q$, $q$Kudos describes itself as Canadian ('Proudly Canadian') on its website.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Does Kudos use AI?$q$, $q$Yes, it offers an AI Recognition Assistant to help automate recognition suggestions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Can I see Kudos pricing online?$q$, $q$No, Kudos does not publish pricing; you need to request a demo or contact the company.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$What kind of recognition features does Kudos offer?$q$, $q$Peer recognition with a live activity feed, milestones, e-cards, awards, nominations, and incentive challenges.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Peer recognition programs$q$, $q$Employees give recognition through a live activity feed and Spaces for sharing cultural moments.$q$, $q$HR teams and culture leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Milestone celebrations$q$, $q$Organizations automate anniversary and milestone recognition with e-cards.$q$, $q$People operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$Incentive challenges$q$, $q$Teams run gamified incentive programs and challenges to boost engagement.$q$, $q$Remote and hybrid teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$overview$q$, $q$What is Kudos?$q$, 2, ARRAY[$q$Kudos is an employee recognition and rewards platform built around peer-to-peer recognition, a live activity feed, and Spaces for sharing cultural moments. It also includes milestones, e-cards, awards and nomination management, and incentive challenges.$q$, $q$The platform includes an AI Recognition Assistant to help automate recognition suggestions, along with reporting and analytics on recognition activity. Kudos describes itself as a Canadian company and lists clients such as DHL, ENGIE, MU Health Care, and Vanderbilt University.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', $q$who-its-for$q$, $q$Who Kudos is for$q$, 2, ARRAY[$q$Kudos targets HR teams and managers at organizations focused on culture building, employee turnover reduction, and engagement among remote and hybrid teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45bbc3cd-e3e9-484a-8307-e4b104d0b92c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Motivosity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Motivosity is an AI-assisted employee recognition platform with a global rewards marketplace and support for 70+ languages.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Motivosity offers peer recognition, a global rewards marketplace, and Appreciation Intelligence AI across 70+ languages.$q$,
  og_description = $q$Motivosity offers peer recognition, a global rewards marketplace, and Appreciation Intelligence AI across 70+ languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Peer-to-Peer Recognition$q$, $q$Employees at all levels share appreciation with each other.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Manager Tools$q$, $q$Spot bonuses, nominations, awards, and milestone celebrations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Internal Communications$q$, $q$Streamlined company-wide messaging and engagement.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Rewards Marketplace$q$, $q$Access to 500 million+ reward options from Amazon to gift cards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$ThanksMatters Visa Card$q$, $q$Instant reward redemption via a dedicated card.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Pulse Surveys$q$, $q$eNPS tracking and employee sentiment measurement.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Employee Spaces$q$, $q$Community and group functionality.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Reporting & Dashboards$q$, $q$Analytics on retention, adoption, and spending.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Founded in 2012 with 1,200+ companies as customers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$G2 Leader (Winter 2026) with a 4.8-star rating from 10,000+ reviews$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Supports 70+ languages, 140 currencies, and rewards in 175+ countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$ThanksMatters Visa Card enables instant reward redemption$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Rewards marketplace offers 500 million+ options$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Pricing is not published; requires requesting a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Specific supported language list is not published, only a count of 70+$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Enterprise-style sales process may not suit very small teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$When was Motivosity founded?$q$, $q$Motivosity was founded in 2012.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$How many languages does Motivosity support?$q$, $q$The company states support for 70+ languages and 140 currencies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$What is the ThanksMatters Visa Card?$q$, $q$It's a card offered by Motivosity that lets employees instantly redeem rewards.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Does Motivosity use AI?$q$, $q$Yes, it markets an 'Appreciation Intelligence' AI designed to strengthen human connection rather than replace it.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Is Motivosity pricing public?$q$, $q$No, pricing isn't listed on the site; you need to request a demo.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Global recognition programs$q$, $q$Multinational companies use Motivosity's rewards marketplace and multi-language, multi-currency support for distributed teams.$q$, $q$Global HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Manager-driven recognition$q$, $q$Managers issue spot bonuses, nominations, and awards through built-in manager tools.$q$, $q$People managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$Engagement tracking$q$, $q$HR teams use pulse surveys and eNPS tracking to monitor sentiment alongside recognition data.$q$, $q$HR and people analytics teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$overview$q$, $q$What is Motivosity?$q$, 2, ARRAY[$q$Motivosity is an employee recognition and rewards platform that supports peer-to-peer, manager-to-employee, and company-wide recognition. It layers in a rewards marketplace with more than 500 million redemption options and a ThanksMatters Visa Card for instant reward access.$q$, $q$Founded in 2012, Motivosity also includes pulse surveys with eNPS tracking, Employee Spaces for community building, wellness challenges, and reporting on retention and spending. It markets an 'Appreciation Intelligence' AI and reports support for 70+ languages and 140 currencies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', $q$who-its-for$q$, $q$Who Motivosity is for$q$, 2, ARRAY[$q$Motivosity is used by 1,200+ companies across industries including financial services, healthcare, higher education, technology, and professional services, per the company.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abfa9c4a-e2db-41e9-9dbd-a6c6c0f65814', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Nectar HR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nectar combines peer-to-peer recognition, internal communications, and employee listening surveys in one culture platform.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nectar offers employee recognition, rewards, communications, and listening surveys, used by 1,700+ organizations.$q$,
  og_description = $q$Nectar offers employee recognition, rewards, communications, and listening surveys, used by 1,700+ organizations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Peer-to-Peer Recognition & Rewards$q$, $q$Recognition tied to a redeemable rewards catalog.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Challenges & Milestones$q$, $q$Gamified challenges and automated milestone recognition.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Mission & Values Alignment$q$, $q$Recognition tied to company values.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Nectar Comms$q$, $q$Internal communications for building, sending, and tracking announcements and updates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Nectar Engage$q$, $q$Employee listening with custom surveys and eNPS tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Culture Suite$q$, $q$Bundled offering combining recognition, communications, and listening.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Nomination Programs$q$, $q$Structured peer and manager nomination workflows.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Official SHRM partnership$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Used by 1,700+ organizations, including Coca-Cola, Major League Baseball, and the Golden State Warriors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Case studies report measurable turnover reduction, e.g. a 29% reduction at Statista$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Bundles recognition, communications, and employee listening into a single Culture Suite$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Pricing is not published; the site directs visitors to request a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Specific integrations are not detailed on the public site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Multiple bundles and products (Recognize, Engage, Comms, Culture Suite) can make plan comparison unclear without a sales conversation$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$What is Nectar's Culture Suite?$q$, $q$It's a bundle combining Nectar Recognize, Nectar Engage, and Nectar Comms into one offering, marketed as the platform's best value option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Does Nectar publish its pricing?$q$, $q$No, pricing is quote-based; the site directs visitors to request a demo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Is Nectar used by large organizations?$q$, $q$Yes, the company cites customers such as Coca-Cola, Major League Baseball, and the Golden State Warriors, and states 1,700+ organizations use the platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Does Nectar support employee listening?$q$, $q$Yes, via Nectar Engage, which includes custom surveys and eNPS tracking.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Reducing voluntary turnover$q$, $q$HR teams use recognition and listening data together; one customer case study cites a 29% reduction in voluntary turnover.$q$, $q$HR and retention teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Automating milestone recognition$q$, $q$Organizations automate birthday and service anniversary recognition instead of tracking manually.$q$, $q$People operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Company-wide communications$q$, $q$Nectar Comms is used to build, send, and track internal announcements alongside recognition.$q$, $q$Internal communications teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Nectar Recognize$q$, $q$Custom (contact sales)$q$, NULL, $q$["Peer-to-peer recognition","Rewards redemption","Challenges and milestones","Nomination programs"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Nectar Engage$q$, $q$Custom (contact sales)$q$, NULL, $q$["Everything in Recognize","Custom employee surveys","eNPS tracking","Engagement analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Nectar Comms$q$, $q$Custom (contact sales)$q$, NULL, $q$["Everything in Recognize","Internal announcements and updates","Communications tracking"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$Culture Suite$q$, $q$Custom (contact sales)$q$, NULL, $q$["Nectar Recognize, Engage, and Comms bundled together"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$overview$q$, $q$What is Nectar?$q$, 2, ARRAY[$q$Nectar is a culture platform built around peer-to-peer employee recognition, with rewards redemption, challenges, milestones, and nomination programs tied to company values. It's offered as Nectar Recognize, or bundled with internal communications (Nectar Comms) and employee listening surveys (Nectar Engage) into a combined Culture Suite.$q$, $q$The company holds an official SHRM partnership and states it is used by more than 1,700 organizations, including Coca-Cola, Major League Baseball, and the Golden State Warriors. Nectar's published case studies cite measurable improvements in turnover and engagement, such as a 29% reduction in voluntary turnover at one customer.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$who-its-for$q$, $q$Who Nectar is for$q$, 2, ARRAY[$q$Nectar is aimed at HR and people leaders across industries such as education, financial services, healthcare, hospitality, manufacturing, retail, and technology who want recognition, communications, and listening in one platform.$q$]::text[], 1);


-- ── Assembly Employee Recognition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Assembly is a peer-to-peer employee recognition platform starting at $3/user/month with an AI-powered Dora Hub.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$3/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Omaha, Nebraska, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Assembly offers peer recognition, rewards, and AI-powered Dora Hub insights from $3/user/month, rated 4.9/5 on G2.$q$,
  og_description = $q$Assembly offers peer recognition, rewards, and AI-powered Dora Hub insights from $3/user/month, rated 4.9/5 on G2.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b80f26c5-559d-4dd6-a520-9913d10938f6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Peer-to-Peer Recognition$q$, $q$Shoutouts and recognition between team members.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Rewards Program$q$, $q$Points-based system redeemable for gift cards or charity donations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Celebrations & Milestones$q$, $q$Automated birthday, anniversary, and new-hire recognition.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Custom Awards & Challenges$q$, $q$Awards and challenges tied to company values.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Manager Enablement$q$, $q$Notifications and AI-suggested prompts for managers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Dora Hub$q$, $q$AI-powered culture insights, nudges, and trend data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Real-Time Dashboards$q$, $q$Reporting on recognition and engagement activity.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Empower plan starts at $3/user/month billed yearly$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Rated 4.9/5 on G2 with 3,000+ reviews, ranked #1 for Employee Recognition & Rewards Platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Integrates with Slack, Microsoft Teams, and BambooHR$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$AI-powered Dora Hub surfaces culture insights and trends$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Reports 90%+ engagement from day one, per the company$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Assembly's website states it is in the process of joining Quantum Workplace, which could affect the product roadmap$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Enterprise plan requires a custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Founding year is not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$How much does Assembly cost?$q$, $q$The Empower plan starts at $3/user/month billed yearly; the Enterprise plan is custom-priced.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$What is Dora Hub?$q$, $q$Dora Hub is Assembly's AI feature that provides culture insights, nudges, and trend data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Where is Assembly headquartered?$q$, $q$Assembly lists an Omaha, Nebraska address on its website.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Is Assembly being acquired?$q$, $q$The company's website states Assembly is joining Quantum Workplace.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$What integrations does Assembly support?$q$, $q$Assembly integrates with Slack, Microsoft Teams, and BambooHR, among others.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Company-wide recognition$q$, $q$Teams give peer shoutouts and redeem points for gift cards or charity donations.$q$, $q$Small businesses to enterprise HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Culture insight tracking$q$, $q$Managers use the AI-powered Dora Hub to spot culture gaps and trends from recognition data.$q$, $q$People managers and HR leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Milestone automation$q$, $q$Organizations automate birthday, anniversary, and new-hire celebrations.$q$, $q$Remote, hybrid, and on-site teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Empower$q$, $q$$3/user/month$q$, $q$annual$q$, $q$["Milestone celebrations","Announcements","Awards & Challenges","Global reward catalog","Peer-to-peer recognition","Points and budget controls","Dora Hub AI insights","Advanced people analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Advanced security & compliance","Custom integrations","Enterprise-grade support","Tailored implementation"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$overview$q$, $q$What is Assembly?$q$, 2, ARRAY[$q$Assembly is an employee recognition and rewards platform that lets teams give peer-to-peer shoutouts, redeem points for gift cards or charity donations, and automate milestone celebrations like birthdays and work anniversaries. It also includes custom awards, challenges, and manager notification tools.$q$, $q$The platform's Dora Hub applies AI to recognition data to surface culture insights, nudges, and trends, backed by real-time dashboards. Assembly is headquartered in Omaha, Nebraska, is rated 4.9/5 on G2 from 3,000+ reviews, and its website states the company is in the process of joining Quantum Workplace.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$who-its-for$q$, $q$Who Assembly is for$q$, 2, ARRAY[$q$Assembly targets HR and people teams at organizations ranging from small businesses to enterprises, supporting remote, hybrid, and on-site teams, with an Empower plan starting at $3/user/month billed yearly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Awardco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Awardco is an employee recognition platform with a 300-million-option reward network and AI-enhanced recognition tools.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Awardco offers recognition, rewards, and AI-enhanced tools with a 300M-option network, rated 4.9/5 from 6,000+ G2 reviews.$q$,
  og_description = $q$Awardco offers recognition, rewards, and AI-enhanced tools with a 300M-option network, rated 4.9/5 from 6,000+ G2 reviews.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Peer & Manager Recognition$q$, $q$Recognition capabilities across the organization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Rewards Network$q$, $q$A configurable network with 300 million reward options.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Celebrations$q$, $q$Automated milestones and everyday moment recognition.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Custom Incentive Programs$q$, $q$Programs designed to drive specific employee behaviors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Benefits & Perks$q$, $q$Personalized employee benefits offerings.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Awardco Engage$q$, $q$Survey and feedback tool for measuring cultural change.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Awardco Intelligence$q$, $q$AI-enhanced recognition capabilities.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Founded in 2015$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Rated 4.9/5 stars from 6,000+ G2 reviews, ranked #1 highest-rated employee recognition platform by G2 customers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Reward network spans 135 countries and 163 currencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Partnerships with Workday and Amazon Business$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Customers include Okta, ClickUp, Zillow, and Cornell University$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Pricing is not published on the website; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Headquarters location is not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Specific supported languages are not listed, only described generally as multilingual$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$When was Awardco founded?$q$, $q$Awardco was founded in 2015.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$How many reward options does Awardco offer?$q$, $q$The company states its configurable reward network includes 300 million options.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$What is Awardco Intelligence?$q$, $q$It's Awardco's AI-enhanced recognition capability, though full details aren't published.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Does Awardco integrate with Workday?$q$, $q$Yes, the site references a Workday partnership, along with Amazon Business and integrations like Slack and Microsoft Teams.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$What is Awardco's G2 rating?$q$, $q$Awardco reports a 4.9/5 rating from more than 6,000 G2 reviews.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Global rewards programs$q$, $q$Organizations with international teams use Awardco's reward network spanning 135 countries and 163 currencies.$q$, $q$Global enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Custom incentive programs$q$, $q$Companies build custom incentive programs to drive specific employee behaviors toward business goals.$q$, $q$Sales and operations leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Culture measurement$q$, $q$Awardco Engage is used alongside recognition data to survey employees and measure cultural change.$q$, $q$HR and people analytics teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$overview$q$, $q$What is Awardco?$q$, 2, ARRAY[$q$Awardco is an employee recognition and rewards platform built around a configurable reward network of 300 million options, alongside recognition, celebrations, custom incentive programs, and benefits & perks offerings. It also includes Awardco Engage for surveying employees and Awardco Intelligence for AI-enhanced recognition.$q$, $q$Founded in 2015, Awardco reports a reward network spanning 135 countries and 163 currencies, partnerships with Workday and Amazon Business, and a 4.9/5 rating from more than 6,000 G2 reviews. Customers named on its site include Okta, ClickUp, Texas Roadhouse, Cornell University, Zillow, and Paramount.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$who-its-for$q$, $q$Who Awardco is for$q$, 2, ARRAY[$q$Awardco is positioned for mid-to-large enterprises across industries seeking a large, configurable rewards catalog alongside recognition and incentive programs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Perkbox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Perkbox is an employee benefits and rewards platform combining discounts, wellbeing support, and recognition tools.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Perkbox combines employee discounts, wellbeing support, salary sacrifice benefits, and recognition in one platform.$q$,
  og_description = $q$Perkbox combines employee discounts, wellbeing support, salary sacrifice benefits, and recognition in one platform.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '42ee2d70-9cde-4237-84bd-e916bc055119';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '42ee2d70-9cde-4237-84bd-e916bc055119' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Employee Discounts & Savings$q$, $q$Discounts at partner brands.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Wellbeing Support$q$, $q$Mental, physical, and financial wellness resources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Salary Sacrifice Benefits$q$, $q$Protected benefit schemes offered through salary sacrifice.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Recognition & Rewards$q$, $q$Peer-to-peer recognition and celebrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Culture & Communication Tools$q$, $q$Internal connection and engagement features.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Admin Dashboard$q$, $q$Simplified benefits management for HR admins.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Reports an 89% employee activation rate$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Employees reportedly saved £27.8+ million annually through the platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$106,938+ recognitions sent in the past year, per the company$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Notable clients include Oxford University Hospitals NHS, Bosch, and Schuh$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Pricing is not published; requires filling out an inquiry form$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Headquarters location and founding year are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$No AI features are mentioned on the website$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$How much does Perkbox cost?$q$, $q$Perkbox does not publish pricing; the site asks visitors to fill out a form for a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$What savings does Perkbox report?$q$, $q$The company states employees have saved £27.8+ million annually through the platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Does Perkbox include recognition features?$q$, $q$Yes, alongside discounts and benefits, Perkbox includes peer-to-peer recognition and celebration tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Who uses Perkbox?$q$, $q$Named clients include Schuh, Footasylum, Oxford University Hospitals NHS, Bosch, and Optiver.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Employee discounts & savings$q$, $q$Employees access discounts at partner brands through the platform, reportedly saving £27.8M+ annually.$q$, $q$All employees$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Wellbeing support$q$, $q$Organizations provide mental, physical, and financial wellness resources alongside benefits.$q$, $q$HR and people teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$Recognition alongside benefits$q$, $q$Teams combine peer-to-peer recognition and celebrations with benefits administration in one app.$q$, $q$Managers and team leads$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$overview$q$, $q$What is Perkbox?$q$, 2, ARRAY[$q$Perkbox is an employee benefits and rewards platform that centralizes discounts at partner brands, wellbeing support (mental, physical, and financial), salary sacrifice benefit schemes, and peer-to-peer recognition in one application, with an admin dashboard for HR teams.$q$, $q$The company reports an 89% employee activation rate, more than £27.8 million saved by employees annually, and 106,938+ recognitions sent in the past year. Clients named on its site include Schuh, Footasylum, Oxford University Hospitals NHS, and Bosch.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42ee2d70-9cde-4237-84bd-e916bc055119', $q$who-its-for$q$, $q$Who Perkbox is for$q$, 2, ARRAY[$q$Perkbox is aimed at business leaders, HR and people teams, and managers — including public sector organizations — who want to combine discounts, wellbeing, and recognition in a single benefits platform.$q$]::text[], 1);


-- ── Benepass ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Benepass is a benefits administration platform offering a single card for lifestyle spending accounts and pre-tax benefits.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Benepass provides lifestyle spending accounts, pre-tax benefits, and an AI compliance assistant via a single benefits card.$q$,
  og_description = $q$Benepass provides lifestyle spending accounts, pre-tax benefits, and an AI compliance assistant via a single benefits card.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Lifestyle Spending Accounts (LSAs)$q$, $q$Flexible spending on wellness, professional development, family care, and food.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Pre-Tax Benefits$q$, $q$Support for HSA, FSA, HRA, and commuter benefits.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Card-First Technology$q$, $q$Tap-to-pay functionality for benefit redemptions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$HRIS/Payroll Integrations$q$, $q$Automated enrollment and contribution management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Benefits Compliance GPT$q$, $q$AI assistant for compliance questions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Global Support$q$, $q$Operates in 90+ countries.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Mobile Apps$q$, $q$iOS and Android apps for managing benefits.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Reports 98% client retention rate$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$86% of transactions are instantly approved, per the company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Operates in 90+ countries with $1B+ in global benefits funded$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Benefits Compliance GPT offers AI-powered compliance guidance$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Raised a $40M Series B round (announced March 2026)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Pricing is not published; the site offers a savings calculator instead of listed prices$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Headquarters location and founding year are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Specific supported languages are not listed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$What is a Lifestyle Spending Account in Benepass?$q$, $q$It's a flexible benefit allowance employees can spend on wellness, professional development, family care, food, and other approved categories.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Does Benepass support pre-tax benefits?$q$, $q$Yes, including HSA, FSA, HRA, and commuter benefits.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$What is Benefits Compliance GPT?$q$, $q$It's Benepass's AI assistant for answering benefits compliance questions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$How many countries does Benepass support?$q$, $q$The company states it operates in 90+ countries.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Has Benepass raised funding?$q$, $q$Yes, the company announced a $40M Series B round in March 2026.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Global lifestyle benefits$q$, $q$Companies with international teams administer LSAs and pre-tax benefits across 90+ countries.$q$, $q$Global HR and benefits teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Compliance guidance$q$, $q$Benefits administrators use Benefits Compliance GPT to get AI-assisted answers to compliance questions.$q$, $q$HR and benefits administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Card-based benefit redemption$q$, $q$Employees use a single card with tap-to-pay for real-time benefit redemption instead of manual reimbursement.$q$, $q$Employees at mid-market to enterprise companies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$overview$q$, $q$What is Benepass?$q$, 2, ARRAY[$q$Benepass is a benefits administration platform that lets companies design flexible, customizable benefit programs — including Lifestyle Spending Accounts (LSAs) and pre-tax benefits like HSA, FSA, HRA, and commuter — delivered through a single card with tap-to-pay technology and a unified dashboard.$q$, $q$The platform integrates with HRIS and payroll systems for automated enrollment, and includes Benefits Compliance GPT, an AI assistant for compliance questions. Benepass reports operating in 90+ countries, a 98% client retention rate, and $1B+ in global benefits funded, and it announced a $40M Series B round in March 2026.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$who-its-for$q$, $q$Who Benepass is for$q$, 2, ARRAY[$q$Benepass is aimed at mid-market to enterprise companies, particularly those with global or distributed workforces, looking to modernize benefits administration.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Forma Benefits ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Flexible employee benefits platform for Lifestyle Spending Accounts, HSAs, FSAs, and HRAs.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Forma Benefits lets employers offer flexible LSA, HSA, FSA, and HRA spending accounts employees can use on benefits that fit their needs.$q$,
  og_description = $q$Forma Benefits lets employers offer flexible LSA, HSA, FSA, and HRA spending accounts employees can use on benefits that fit their needs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '558c959c-6ffc-4bcf-b6cc-8dce9830952a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Lifestyle Spending Accounts (LSAs)$q$, $q$Employers fund customizable accounts employees can spend on wellness, family, and lifestyle benefits.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Pre-tax accounts$q$, $q$Supports HSA and FSA account types alongside lifestyle spending options.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Health Reimbursement Arrangements$q$, $q$HRAs let employers reimburse employees for qualifying health expenses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Forma Store$q$, $q$A curated marketplace of vendors employees can use their allocated funds with.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Forma Visa Card$q$, $q$A card that lets employees pay for eligible benefits without fronting out-of-pocket costs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Claims administration$q$, $q$Handles claims processing and reimbursement for account-based benefits.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Analytics dashboard$q$, $q$Gives benefits teams reporting and utilization data across programs.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Combines LSAs, HSAs, FSAs, and HRAs in a single platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Forma Visa Card removes the need for employees to pay out of pocket$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Curated vendor marketplace (Forma Store) simplifies spending eligible funds$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Reports 87% annual utilization rate and 98% five-year member satisfaction$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Available on web, iOS, and Android$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$No public pricing; requires a demo or consultation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Specific integration partners are not listed publicly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$What account types does Forma support?$q$, $q$Forma supports Lifestyle Spending Accounts (LSAs), pre-tax HSAs and FSAs, and Health Reimbursement Arrangements (HRAs).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Is there a card for spending Forma funds?$q$, $q$Yes, the Forma Visa Card lets employees pay for eligible benefits directly without paying out of pocket first.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$How is Forma priced?$q$, $q$Forma does not publish pricing; companies need to request a demo for a quote.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Is Forma available on mobile?$q$, $q$Yes, Forma offers both iOS and Android apps in addition to its web platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Flexible benefits program design$q$, $q$HR and benefits teams build a customizable benefits program instead of a one-size-fits-all package.$q$, $q$HR and benefits professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$Global lifestyle spending$q$, $q$Companies offer lifestyle spending accounts that support benefits needs across a distributed or global workforce.$q$, $q$Global employers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$overview$q$, $q$What is Forma Benefits?$q$, 2, ARRAY[$q$Forma Benefits is an employee benefits platform that lets organizations offer Lifestyle Spending Accounts (LSAs), pre-tax HSAs and FSAs, and Health Reimbursement Arrangements (HRAs) so employees can choose benefits that match their individual needs.$q$, $q$The platform includes the Forma Store, a curated vendor marketplace, and the Forma Visa Card, which lets employees use allocated funds directly instead of paying out of pocket and seeking reimbursement.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', $q$who-its-for$q$, $q$Who Forma Benefits is for$q$, 2, ARRAY[$q$Forma is built for benefits professionals and HR teams that want to move beyond a fixed benefits package and offer employees more flexibility in how they spend allocated benefits funds, including companies with global or distributed workforces.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('558c959c-6ffc-4bcf-b6cc-8dce9830952a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pave ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered compensation management platform with real-time benchmarking from 9,000+ companies.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Market Data Lite)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Pave is a compensation management platform offering free and paid salary benchmarking, market pricing, and merit-cycle planning tools.$q$,
  og_description = $q$Pave is a compensation management platform offering free and paid salary benchmarking, market pricing, and merit-cycle planning tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '09bdd5ac-c605-4211-ad86-64bb2d399f8a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Real-time compensation benchmarks$q$, $q$Draws data from 9,000+ companies across 200+ job families and 16 business functions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$AI-assisted job matching$q$, $q$Uses machine learning to match roles to benchmark data for more accurate pricing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Market pricing and salary bands$q$, $q$Tools for building and maintaining salary ranges.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Compensation planning workflows$q$, $q$Supports merit cycle management and budget-based planning.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Total Rewards Portal$q$, $q$A portal for communicating total compensation to employees.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Visual Offer Letter$q$, $q$Generates visual offer letters for candidates.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Team View dashboards$q$, $q$Gives managers visibility into team compensation.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Free Market Data Lite tier for companies with 1-200 employees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Benchmark data sourced from 9,000+ companies$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Covers 55+ countries and 90+ cities/metros on the Pro tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$AI-assisted job matching for benchmark accuracy$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Unlimited user seats, search queries, and report downloads on all plans$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Market Data Pro and Full Suite pricing require booking a demo (not public)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Free tier is limited to U.S. market plus one additional market$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Does Pave have a free plan?$q$, $q$Yes, Market Data Lite is free for companies with 1-200 employees and includes base salary and new-hire equity benchmarks.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$How many companies contribute data to Pave's benchmarks?$q$, $q$Pave sources real-time data from 9,000+ companies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$What does Market Data Pro add over the free tier?$q$, $q$Market Data Pro adds access to 55+ countries and 90+ cities/metros, advanced equity insights, geo-differentials, peer groups, and custom report building.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Does Pave use AI?$q$, $q$Yes, Pave uses AI-assisted job matching and machine learning to power predictive compensation insights.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Startup salary benchmarking$q$, $q$Small companies use the free Market Data Lite tier to benchmark base salary and equity for new hires.$q$, $q$Startups (1-200 employees)$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Enterprise compensation planning$q$, $q$Larger organizations use Market Data Pro and Workflows to run merit cycles, build pay ranges, and communicate total rewards.$q$, $q$Compensation and total rewards teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Market Data Lite$q$, $q$Free$q$, NULL, $q$["Real-time data from 9,000+ companies","200+ job families across 16 business functions","U.S. market plus 1 additional market","AI-assisted job matching"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Market Data Pro$q$, $q$Custom$q$, NULL, $q$["Access to 55+ countries and 90+ cities/metros","Advanced equity insights and geo-differentials","Peer groups","Custom report building and export"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$Full Suite$q$, $q$Custom$q$, NULL, $q$["Market Data Pro","Team View","Market Pricing","Compensation Planning","Total Rewards Portal","Visual Offer Letter"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$overview$q$, $q$What is Pave?$q$, 2, ARRAY[$q$Pave is a compensation management platform that combines real-time market benchmarking, AI-assisted job matching, and compensation planning workflows. It sources data from more than 9,000 companies to help organizations set and communicate pay.$q$, $q$The platform ranges from a free Market Data Lite tier for small companies to a Full Suite that adds market pricing, planning workflows, and a Total Rewards Portal for employee communication.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', $q$who-its-for$q$, $q$Who Pave is for$q$, 2, ARRAY[$q$Pave serves compensation professionals, HR leaders, and total rewards teams at organizations ranging from early-stage startups to large global enterprises.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09bdd5ac-c605-4211-ad86-64bb2d399f8a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Figures ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Compensation management software for salary benchmarking, salary bands, and collaborative pay reviews.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Figures helps HR and managers benchmark pay, build salary bands, run compensation reviews, and analyze pay equity with real-time market data.$q$,
  og_description = $q$Figures helps HR and managers benchmark pay, build salary bands, run compensation reviews, and analyze pay equity with real-time market data.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '51568536-b7e1-4391-a01a-fb0353541bf4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '51568536-b7e1-4391-a01a-fb0353541bf4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Benchmark$q$, $q$Access to 3,500,000+ compensation datapoints for salary comparison.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Salary Bands$q$, $q$Structure pay grids as a documented source of truth for compensation ranges.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Compensation Review$q$, $q$Collaborative workflows for annual and off-cycle reviews with budget tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Pay Equity Analysis$q$, $q$Identifies and helps address pay gaps with data-backed insights.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Compliance tools$q$, $q$Supports requirements under the EU Pay Transparency Directive.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$HRIS integrations$q$, $q$Connects with 30+ HRIS and review systems.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$3,500,000+ benchmark datapoints$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Used by 10,000+ users according to the company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Notable customers include Doctolib, KPMG, TotalEnergies, EY, Qonto, and Swan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Built-in support for EU Pay Transparency Directive compliance$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Integrates with 30+ HRIS and review systems$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Pricing is not public and varies by employee count and modules selected$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Requires a demo to get a quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$How is Figures priced?$q$, $q$Figures pricing is based on the number of employees in your company and varies according to the modules you select; a personalized quote requires booking a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$What compensation data does Figures provide?$q$, $q$Figures gives access to more than 3,500,000 benchmark datapoints for comparing salaries against the market.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Does Figures support pay equity requirements?$q$, $q$Yes, Figures includes pay equity analysis and compliance tools supporting the EU Pay Transparency Directive.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$What plans does Figures offer?$q$, $q$Figures offers Structure, Companion, and a standalone Pay Transparency module, plus an optional Pay Equity Expert add-on.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Building salary bands$q$, $q$Compensation teams use Figures to build pay ranges backed by market benchmark data.$q$, $q$HR and compensation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Pay equity compliance$q$, $q$Organizations use Figures' pay equity analysis to prepare for EU Pay Transparency Directive requirements.$q$, $q$European employers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Structure$q$, $q$Custom$q$, NULL, $q$["Benchmark","Salary bands","Pay Equity Foundations","Compa-ratio and range penetration analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Companion$q$, $q$Custom$q$, NULL, $q$["Everything in Structure","Compensation reviews (annual and off-cycle)","Decision history tracking","Secure manager access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$Pay Transparency$q$, $q$Custom$q$, NULL, $q$["Standalone pay equity module"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$overview$q$, $q$What is Figures?$q$, 2, ARRAY[$q$Figures is compensation management software that gives HR teams and managers real-time market benchmarks, dynamic salary bands, and collaborative tools for running pay reviews.$q$, $q$The platform includes pay equity analysis and compliance features aligned with the EU Pay Transparency Directive, and connects with 30+ HRIS and performance review systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', $q$who-its-for$q$, $q$Who Figures is for$q$, 2, ARRAY[$q$Figures is built for HR and compensation teams that need to collaborate with managers on pay decisions, particularly organizations subject to European pay transparency requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('51568536-b7e1-4391-a01a-fb0353541bf4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ravio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Real-time compensation benchmarking and management platform for global tech companies.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$£5,000/year$q$,
  founded_year = 2022,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ravio provides real-time compensation benchmarking, salary bands, and pay equity tools sourced from 1,400+ companies across 50+ countries.$q$,
  og_description = $q$Ravio provides real-time compensation benchmarking, salary bands, and pay equity tools sourced from 1,400+ companies across 50+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '240f9156-e0ab-42ca-b567-928a9cab1bb2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '240f9156-e0ab-42ca-b567-928a9cab1bb2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Real-time compensation benchmarking$q$, $q$Live salary and total rewards data sourced from HR systems of 1,400+ companies across 50+ countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Salary bands$q$, $q$Build and maintain pay ranges backed by market data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Pay equity analysis$q$, $q$Tools to review and address pay equity across the organization.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Compensation reviews$q$, $q$Workflow support for running compensation review cycles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$HRIS integrations$q$, $q$Connects with 75+ HR systems, including HiBob, Workday, and Personio, to sync job, salary, and employee data automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Filterable benchmark data$q$, $q$Filter comparison data by location, industry, funding stage, and headcount.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Live data sourced directly from HR systems of 1,400+ companies$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Covers 50+ countries and 300+ roles$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Connects with 75+ HR systems including HiBob, Workday, and Personio$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Backed by $22M in total funding including a $12M Series A led by Spark Capital$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Annual plans start at £5,000, which may be significant for very small companies$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Company size and detailed AI capabilities are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Targeted primarily at high-growth tech companies, so vertical fit may vary$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$When was Ravio founded?$q$, $q$Ravio was founded in 2022.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Where is Ravio headquartered?$q$, $q$Ravio is headquartered in London, United Kingdom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$How much does Ravio cost?$q$, $q$Ravio's annual plans start from £5,000.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$What HR systems does Ravio integrate with?$q$, $q$Ravio integrates with 75+ HR systems, including HiBob, Workday, and Personio.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Real-time salary benchmarking$q$, $q$Compensation teams compare internal pay against live market data across countries and roles.$q$, $q$Compensation and HR teams at tech companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Building pay equity into reviews$q$, $q$Teams use Ravio's pay equity analysis during compensation review cycles.$q$, $q$High-growth tech companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$Standard$q$, $q$From £5,000/year$q$, $q$annual$q$, $q$["Real-time compensation benchmarking","Salary bands","Pay equity analysis"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$overview$q$, $q$What is Ravio?$q$, 2, ARRAY[$q$Ravio is a compensation management platform founded in 2022 and headquartered in London. It provides real-time salary and total rewards benchmarking sourced directly from the HR systems of 1,400+ companies across 50+ countries.$q$, $q$Beyond benchmarking, Ravio includes salary bands, pay equity analysis, and compensation review workflows, and integrates with 75+ HR systems including HiBob, Workday, and Personio.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', $q$who-its-for$q$, $q$Who Ravio is for$q$, 2, ARRAY[$q$Ravio is designed for high-growth tech and tech-enabled companies that need live, verified compensation data to manage pay across multiple countries.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('240f9156-e0ab-42ca-b567-928a9cab1bb2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Compa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI compensation intelligence platform giving enterprise teams live market data and AI agents for pay decisions.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$35,000/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Compa gives enterprise compensation teams AI agents and live market data across offers, employees, stock, and skills for pay decisions.$q$,
  og_description = $q$Compa gives enterprise compensation teams AI agents and live market data across offers, employees, stock, and skills for pay decisions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ceff3588-dc14-4fe3-b8e5-e42a8227d73e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Analyst Agent$q$, $q$An AI agent that automates compensation analysis for internal teams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Partner Agent$q$, $q$An AI agent that helps guide external-facing compensation decisions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Live market data$q$, $q$Tracks 9M+ observations including 1.2M+ offers, 4.8M+ employees, and 1.2M+ stock grants across 42+ countries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Compa Connect$q$, $q$Integrates compensation intelligence into Slack, Claude, ChatGPT, Microsoft Copilot, and Gemini.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$ATS and stock system integrations$q$, $q$Connects with systems including Workday, Oracle, Greenhouse, Carta, and E*TRADE.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Tracks 9M+ live compensation observations across 42+ countries$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$AI agents (Analyst Agent, Partner Agent) automate analysis and decision guidance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Compa Connect brings compensation data into Slack, ChatGPT, Copilot, Claude, and Gemini$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Integrates with major ATS and equity systems like Workday, Oracle, Greenhouse, and Carta$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Market Data starts at $35,000/year, positioning it for enterprise budgets$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Agents pricing requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$How much does Compa cost?$q$, $q$Compa's Market Data plan starts at $35,000/year; pricing for the Agents plan requires contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$What AI agents does Compa offer?$q$, $q$Compa offers an Analyst Agent for internal compensation analysis and a Partner Agent for external-facing decision guidance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Which tools does Compa Connect work with?$q$, $q$Compa Connect integrates with Slack, Claude, ChatGPT, Microsoft Copilot, and Gemini.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$What systems does Compa integrate with?$q$, $q$Compa integrates with ATS and stock systems including Workday, Oracle, Greenhouse, Carta, and E*TRADE.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Enterprise compensation analysis$q$, $q$Compensation teams use the Analyst Agent to automate analysis of offers and pay data.$q$, $q$Enterprise compensation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$AI-assisted pay decisions in existing tools$q$, $q$Teams query compensation data directly from Slack, ChatGPT, or Copilot via Compa Connect.$q$, $q$HR and talent acquisition teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Market Data$q$, $q$From $35,000/year$q$, $q$annual$q$, $q$["Employees, Peer Groups, Geo Tiers, Location Insights, Leveling Insights, Research","Optional add-ons: Offers, Stock, Frontline, Skills"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$Agents$q$, $q$Custom$q$, NULL, $q$["Everything in Market Data","Analyst Agent","Partner Agent"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$overview$q$, $q$What is Compa?$q$, 2, ARRAY[$q$Compa is an AI-powered compensation intelligence platform for enterprise teams. It combines live market data—tracking more than 9 million observations across offers, employees, stock grants, and skills in 42+ countries—with AI agents that automate compensation analysis.$q$, $q$Through Compa Connect, the platform's data and agents can be accessed directly inside Slack, Claude, ChatGPT, Microsoft Copilot, and Gemini.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', $q$who-its-for$q$, $q$Who Compa is for$q$, 2, ARRAY[$q$Compa is built for enterprise compensation and talent acquisition teams that need live market data and AI-assisted analysis integrated into the systems they already use, such as Workday, Oracle, Greenhouse, and Carta.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ceff3588-dc14-4fe3-b8e5-e42a8227d73e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ChartHop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered people analytics and workforce planning platform starting at $5 per employee per month.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$5/employee/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ChartHop is a people analytics platform with org charts, headcount planning, compensation, and performance modules from $5/employee/month.$q$,
  og_description = $q$ChartHop is a people analytics platform with org charts, headcount planning, compensation, and performance modules from $5/employee/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9d53613b-ce48-4bee-a738-96b4bc59bd46';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9d53613b-ce48-4bee-a738-96b4bc59bd46' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Headcount Planning$q$, $q$Visual org planning tools for HR, finance, and managers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$HRIS$q$, $q$Centralizes employee data and org chart management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Compensation$q$, $q$Pay cycle management with budget-aware workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Performance$q$, $q$Integrated performance review cycles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Engagement$q$, $q$Pulse surveys and sentiment analysis.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Goals$q$, $q$Real-time goal visibility aligned to business data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$ChartHop AI (Ask ChartHop)$q$, $q$Conversational AI that answers questions, fills forms, models org changes, and automates repeatable tasks using people and business data.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Modular pricing starting at $5/employee/month for the Core plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Connects with 100+ HRIS, ATS, and FP&A tools including ADP, Workday, Greenhouse, and BambooHR$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Ask ChartHop AI can model org changes and automate workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Rated 4.3/5 on G2 based on 150+ reviews (Winter 2026)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Named a G2 Leader and High Performer for Winter 2026$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Each additional module (HRIS, Headcount Planning, Compensation, Performance) costs extra per employee per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$ChartHop AI Pro is billed pay-as-you-go on top of module pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Enterprise pricing for large organizations is custom and not public$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Founding year, headquarters, and company size are not disclosed on the pricing page$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$How is ChartHop priced?$q$, $q$ChartHop Core starts at $5 per employee per month, with add-on modules like HRIS, Headcount Planning, and Compensation priced at $3-$4 per employee per month, billed annually.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Does ChartHop have AI features?$q$, $q$Yes, ChartHop AI Pro (Ask ChartHop) provides conversational AI that can answer questions, model org changes, and automate tasks, billed pay-as-you-go.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$What systems does ChartHop integrate with?$q$, $q$ChartHop connects with 100+ HRIS, ATS, and FP&A tools, including ADP, Workday, Greenhouse, SAP SuccessFactors, Gusto, BambooHR, and Lattice.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$What is ChartHop's G2 rating?$q$, $q$ChartHop holds a 4.3 out of 5 rating on G2 based on more than 150 reviews as of Winter 2026.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Headcount and budget planning$q$, $q$HR and finance teams jointly plan headcount changes with budget visibility.$q$, $q$People Ops and FP&A teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Compensation cycle management$q$, $q$Compensation teams run merit and promotion cycles with real-time budget tracking.$q$, $q$Compensation teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Conversational people analytics$q$, $q$Managers and executives ask Ask ChartHop natural-language questions about workforce data instead of building reports manually.$q$, $q$People leaders and executives$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$ChartHop Core$q$, $q$$5/employee/month$q$, $q$monthly$q$, $q$["People analytics dashboards","Ask ChartHop AI insights","Org chart","Employee profiles","Map view","Company calendar"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Add-on modules (HRIS, Headcount Planning, Compensation, Performance)$q$, $q$$4/employee/month each$q$, $q$monthly$q$, $q$["Module-specific workflows built on Core"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Add-on modules (Engagement, Goals)$q$, $q$$3/employee/month each$q$, $q$monthly$q$, $q$["Sentiment analysis","Goal tracking"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated support and account management","For organizations managing thousands of employees across multiple entities"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$overview$q$, $q$What is ChartHop?$q$, 2, ARRAY[$q$ChartHop is a people analytics and workforce planning platform that combines people, financial, and business data into modules for headcount planning, HRIS, compensation, performance, engagement, and goals.$q$, $q$Pricing is modular: the Core plan starts at $5 per employee per month, with additional modules priced separately, and Ask ChartHop AI automates tasks and answers natural-language questions about workforce data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', $q$who-its-for$q$, $q$Who ChartHop is for$q$, 2, ARRAY[$q$ChartHop serves people leaders, finance/FP&A teams, managers, and talent acquisition teams at mid-market to enterprise organizations that want to run workforce decisions from a single data platform rather than static reports.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d53613b-ce48-4bee-a738-96b4bc59bd46', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Orgvue ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Enterprise organizational design and workforce planning platform, founded in 2005 and based in London.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2005,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Orgvue is an organizational design and workforce planning platform for enterprises, now adding Henshaw AI capabilities.$q$,
  og_description = $q$Orgvue is an organizational design and workforce planning platform for enterprises, now adding Henshaw AI capabilities.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Organizational design$q$, $q$Tools to analyze and redesign organizational structures.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Workforce planning$q$, $q$Modeling and forecasting of workforce structures and skills.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Data import and harmonization$q$, $q$Connects and unifies workforce data from multiple sources.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Predictive modeling$q$, $q$Forecasts and monitors organizational changes over time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Henshaw Assistant$q$, $q$A conversational, natural-language AI interface (early access) that lets HR and workforce planning leaders ask questions about their data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Henshaw Roles$q$, $q$An AI capability (early access) that is part of the Henshaw suite for workforce design.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Established platform founded in 2005 with an enterprise focus$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Introducing Henshaw AI suite for natural-language workforce planning queries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Supports large-scale organizational and workforce transformation projects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Applies dedicated LLMs and stated data security/compliance procedures for AI features$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Pricing is entirely custom-quote based, with nothing public$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Henshaw AI features (Assistant, Roles) are in early access, not generally available$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Company size is not disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$When was Orgvue founded?$q$, $q$Orgvue was founded in 2005.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Where is Orgvue headquartered?$q$, $q$Orgvue is headquartered in London, United Kingdom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Does Orgvue have AI features?$q$, $q$Yes, Orgvue introduced the Henshaw AI suite, including Henshaw Assistant and Henshaw Roles, currently available through an early access program.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$How much does Orgvue cost?$q$, $q$Orgvue does not publish pricing; it is provided on a custom-quote basis tailored to enterprise needs.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Organizational redesign$q$, $q$Large organizations use Orgvue to analyze and redesign reporting structures and roles.$q$, $q$Enterprise HR and transformation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$Workforce transformation planning$q$, $q$Teams model and forecast workforce changes during M&A or restructuring.$q$, $q$Workforce planning leaders$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$overview$q$, $q$What is Orgvue?$q$, 2, ARRAY[$q$Orgvue is a cloud-based organizational design and workforce planning platform, founded in 2005 and headquartered in London. It lets enterprises import, visualize, model, and monitor workforce structures and skills.$q$, $q$The company has begun rolling out a Henshaw AI suite, including a conversational Henshaw Assistant and Henshaw Roles capability, currently available to customers through an early access program.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$who-its-for$q$, $q$Who Orgvue is for$q$, 2, ARRAY[$q$Orgvue is designed for large enterprises and global organizations undertaking organizational design, workforce transformation, or M&A-related restructuring.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pingboard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based org chart and employee directory software, now part of the Workleap employee experience suite.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$149/month (Basic, 20 users)$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = $q$Austin, Texas, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Pingboard, now part of Workleap, provides dynamic org charts and an employee directory for hybrid and remote teams.$q$,
  og_description = $q$Pingboard, now part of Workleap, provides dynamic org charts and an employee directory for hybrid and remote teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3e8b9691-f4ea-48a6-bf97-0daae2c823ac' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Dynamic org charts$q$, $q$Visualizes reporting structures, departments, and cross-functional teams that update automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Employee directory$q$, $q$Detailed view of employee roles, departments, and team composition.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Custom profiles$q$, $q$Displays colleague interests and skills to support collaboration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Who's Who game$q$, $q$An interactive face-to-name matching activity for team engagement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Planning org charts$q$, $q$Private charts for scenario planning around resource allocation, with commenting and feedback.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$HRIS data sync$q$, $q$Imports employee data via automated HRIS integrations or Excel upload.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Founded in 2013 with an established org chart product$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Now backed by Workleap's broader employee experience ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Used by over 70,000 leaders worldwide across Workleap's product suite$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Supports both automated HRIS sync and manual Excel import$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Acquired by Workleap; pricing and product direction now reflect Workleap's broader suite rather than a standalone company$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Historical published pricing (from $149/month for 20 users) may not reflect current Workleap pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$No AI capabilities are mentioned for the product$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$When was Pingboard founded?$q$, $q$Pingboard was founded in 2013 by Rob Eanes and Bill Boebel.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Is Pingboard still an independent company?$q$, $q$No, Pingboard is now part of Workleap and operates as one of its employee experience products, still under the Pingboard name.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$What does Pingboard's org chart tool do?$q$, $q$It creates dynamic, automatically updating org charts showing reporting lines, departments, and cross-functional teams, built from HRIS data or an Excel upload.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Does Pingboard have an employee directory?$q$, $q$Yes, Pingboard includes an employee directory with custom profiles showing roles, departments, and team composition.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Visualizing company structure$q$, $q$HR teams give remote and hybrid employees visibility into reporting lines and team composition.$q$, $q$HR and People Ops teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Workforce scenario planning$q$, $q$Leaders use private planning org charts to model resource allocation changes before rolling them out.$q$, $q$HR and operations leaders$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Basic$q$, $q$$149/month (20 users included)$q$, $q$monthly$q$, $q$["Org chart","Employee directory"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$Essential$q$, $q$$299/month (50 users included)$q$, $q$monthly$q$, $q$["Org chart","Employee directory","Additional features over Basic"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$overview$q$, $q$What is Pingboard?$q$, 2, ARRAY[$q$Pingboard is a cloud-based org chart and employee directory tool founded in 2013 and headquartered in Austin, Texas. It gives distributed and hybrid organizations dynamic visibility into reporting structures and team composition.$q$, $q$Pingboard has been acquired and now operates as part of Workleap's employee experience product suite, still under the Pingboard name, alongside Workleap's other engagement and recognition tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', $q$who-its-for$q$, $q$Who Pingboard is for$q$, 2, ARRAY[$q$Pingboard is used by HR and People Ops teams managing remote or hybrid workforces who need an up-to-date org chart and employee directory synced from their HRIS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e8b9691-f4ea-48a6-bf97-0daae2c823ac', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Sift Org Chart ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Organizational visibility platform for automated org charts, employee directories, and people search, based in Detroit.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$150/month (Org Chart plan, paid annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Detroit, Michigan, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sift Org Chart provides automated org charts, employee directories, and people search with a 14-day free trial, from $150/month.$q$,
  og_description = $q$Sift Org Chart provides automated org charts, employee directories, and people search with a 14-day free trial, from $150/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '54840d54-d23f-400b-9a21-c910db72a31a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '54840d54-d23f-400b-9a21-c910db72a31a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Automated org charts$q$, $q$Builds org charts from existing people data with real-time updates, including dotted-line relationships and open roles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Employee profiles$q$, $q$Customizable profiles showing skills, interests, pronouns, languages, and work experience.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Search and directory$q$, $q$Lets employees search, filter, and find colleagues by role, skill, or work experience.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Pages$q$, $q$Content organization capability within the platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Analytics$q$, $q$13 prebuilt organizational analytics reports on the Directory plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$API access$q$, $q$Developer API access available on the Directory and higher plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$14-day free trial with full platform access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Serves 500,000+ employees across client organizations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Integrates with Microsoft Teams and HRIS/identity systems$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Rated 4.8/5 on G2 and 4.6/5 on Capterra$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Volume, long-term, and 15% nonprofit discounts available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Minimum of 20 users required on the base plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Additional per-user fees apply on top of the base monthly price$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Enterprise plan requires custom pricing for organizations with 1,000+ employees$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Founding year and company size are not disclosed$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Does Sift offer a free trial?$q$, $q$Yes, Sift offers a 14-day free trial with full platform access.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$How much does Sift cost?$q$, $q$Sift Org Chart starts at $150/month paid annually, Directory starts at $175/month, and Sift Complete starts at $200/month, each with additional per-user fees and a 20-user minimum.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Where is Sift based?$q$, $q$Sift is headquartered in Detroit, Michigan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Does Sift have mobile apps?$q$, $q$Yes, Sift offers iOS and Android apps.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Automated org chart maintenance$q$, $q$HR teams keep org charts current automatically instead of manually updating slides or spreadsheets.$q$, $q$HR and People Ops teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Finding the right colleague$q$, $q$Employees search the directory by skill or role to find the right person for a project.$q$, $q$Employees at mid-size and enterprise organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Sift Org Chart$q$, $q$$150/month (plus $1.50/user for additional users)$q$, $q$annual$q$, $q$["Unlimited people charted","Interactive org chart","Dotted-line relationships","Open roles","Departmental charts"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Sift Directory$q$, $q$$175/month (plus $2.00/user for additional users)$q$, $q$annual$q$, $q$["Unlimited employee profiles","Search","API access","13 prebuilt analytics reports","Mobile apps"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Sift Complete$q$, $q$$200/month (plus $3.25/user for additional users)$q$, $q$annual$q$, $q$["Combines Org Chart and Directory capabilities"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Sift Enterprise$q$, $q$Custom$q$, NULL, $q$["For 1,000+ employee organizations","Security reviews","99.9% SLA","Volume discounts","Extended sandbox/POC"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$overview$q$, $q$What is Sift Org Chart?$q$, 2, ARRAY[$q$Sift Org Chart is an organizational visibility platform, headquartered in Detroit, that automatically builds org charts and employee directories from a company's existing people data.$q$, $q$Plans start at $150/month for Org Chart, $175/month for Directory, and $200/month for the combined Sift Complete, each billed annually with a 20-user minimum and a 14-day free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$who-its-for$q$, $q$Who Sift Org Chart is for$q$, 2, ARRAY[$q$Sift serves mid-sized and enterprise organizations, including companies like Sumitomo, Rocket Companies, Grant Thornton, and Ping Identity, that want employees to easily find colleagues and understand company structure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── KnowledgeOwl ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Knowledge base and documentation software with a built-in AI chatbot, plans starting at $100/month.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$100/month (Basic)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$KnowledgeOwl is knowledge base software with a closed-system AI chatbot, white-glove migration, and plans from $100/month.$q$,
  og_description = $q$KnowledgeOwl is knowledge base software with a closed-system AI chatbot, white-glove migration, and plans from $100/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'afdb353e-eadb-46f7-a2cf-7af280948165';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'afdb353e-eadb-46f7-a2cf-7af280948165' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Unlimited nested categories$q$, $q$Organize articles with drag-and-drop category reorganization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Built-in AI chatbot$q$, $q$A closed-system chatbot that only answers using content from your knowledge base and shows its sources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$White-glove migration$q$, $q$Assisted migration from platforms like Confluence, Zendesk, and SharePoint.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Custom theme design$q$, $q$Branding and theme customization for the knowledge base.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Analytics and deflection tracking$q$, $q$Built-in analytics with reader reports, ranging from 45 to 450+ days of data depending on plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Role-based access controls$q$, $q$Controls who can view or edit specific content.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Version history$q$, $q$Tracks document revisions over time.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Closed-system AI chatbot only answers from your own content and cites its sources$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$White-glove migration and theme build included on every paid plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$1:1 onboarding calls included, more frequent on higher tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Supports GDPR and HIPAA compliance needs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$In business for 11+ years$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$No free tier; entry plan starts at $100/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Article limits apply per plan (1,000 on Basic, 2,500 on Pro, 5,000 on Business)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$AI credits are capped by plan (500 on Pro, 1,000 on Business) rather than unlimited$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Additional authors ($25/month) and knowledge bases ($50/month) cost extra$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Headquarters and founding year are not disclosed on the site$q$, 4);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Does KnowledgeOwl have a free plan?$q$, $q$No, KnowledgeOwl's plans start at $100/month for the Basic tier; there is no free tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$How does KnowledgeOwl's AI chatbot work?$q$, $q$It is a closed-system AI chatbot that only answers using content from your own knowledge base, always shows its sources, and does not use your data to train external LLMs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$What platforms can KnowledgeOwl migrate from?$q$, $q$KnowledgeOwl offers white-glove migration from platforms including Confluence, Zendesk, and SharePoint.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$How long has KnowledgeOwl been around?$q$, $q$KnowledgeOwl states it has been in business for 11+ years.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Replacing scattered internal docs$q$, $q$Teams consolidate internal and external documentation that was previously spread across Confluence, SharePoint, or shared drives.$q$, $q$IT, support, and knowledge management teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Customer self-service with AI answers$q$, $q$Support teams deploy the built-in AI chatbot so customers get sourced answers directly from published documentation.$q$, $q$Customer support teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Basic$q$, $q$$100/month$q$, $q$monthly$q$, $q$["1 knowledge base, 1 author","Up to 1,000 articles","Unlimited readers","Monthly 1:1 onboarding calls","AI chatbot, search, and article creation","45 days of analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Pro$q$, $q$$250/month$q$, $q$monthly$q$, $q$["Up to 2,500 articles","500 AI credits","Bi-weekly 1:1 onboarding calls","90 days of data plus reader reports"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Business$q$, $q$$500/month$q$, $q$monthly$q$, $q$["Up to 5,000 articles","1,000 AI credits","Weekly 1:1 onboarding calls","450 days of data plus reader reports"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited articles and AI credits","Unlimited analytics data","99.9% uptime guarantee","Dedicated account management"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$overview$q$, $q$What is KnowledgeOwl?$q$, 2, ARRAY[$q$KnowledgeOwl is knowledge base and documentation software that lets teams create and share internal and external documentation from one platform. It includes a closed-system AI chatbot that only answers using content from the customer's own knowledge base and cites its sources.$q$, $q$Paid plans start at $100/month for the Basic tier and scale up to Business at $500/month, with an Enterprise tier offering unlimited articles, AI credits, and analytics. Every paid plan includes white-glove migration and a custom theme build.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', $q$who-its-for$q$, $q$Who KnowledgeOwl is for$q$, 2, ARRAY[$q$KnowledgeOwl targets organizations across healthcare, energy, financial services, education, manufacturing, IT services, and call centers that want to move off Confluence, SharePoint, or scattered documents into a dedicated knowledge base.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afdb353e-eadb-46f7-a2cf-7af280948165', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GitBook ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GitBook is a Git-synced documentation platform with an AI assistant, API playgrounds, and enterprise-grade security.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$65/site/month (billed annually)$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GitBook is a Git-synced documentation platform with an AI assistant and API playgrounds. Free plan available; paid plans start at $65/site/month.$q$,
  og_description = $q$GitBook is a Git-synced documentation platform with an AI assistant and API playgrounds. Free plan available; paid plans start at $65/site/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3af57a6b-aa7b-403a-a094-3150492f8e93';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3af57a6b-aa7b-403a-a094-3150492f8e93' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Git Sync$q$, $q$Sync documentation content with GitHub or GitLab repositories using branch-based workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$GitBook Agent$q$, $q$An AI agent that detects outdated content in your documentation and flags it for review.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$AI Assistant$q$, $q$Lets readers ask questions and get answers sourced directly from your documentation (Ultimate/Enterprise plans).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Interactive API playgrounds$q$, $q$Lets users test API calls directly from within API reference pages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Block-based visual editor$q$, $q$A block editor for building pages with custom content blocks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Enterprise security$q$, $q$SOC 2 and ISO 27001 certified infrastructure, with SAML SSO and access controls on higher tiers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Authenticated content$q$, $q$Restrict or personalize documentation access for signed-in readers on Ultimate and Enterprise plans.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Git-based sync fits developer workflows (GitHub/GitLab)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Built-in AI assistant and content-freshness agent$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$SOC 2 and ISO 27001 certified security$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Interactive API playgrounds built into docs$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Premium and Ultimate plans are priced per site plus a per-user add-on charge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$AI Assistant and GitBook Agent usage are capped on the Free and Premium tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Enterprise features like SAML SSO require custom/quote-only pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Does GitBook have a free plan?$q$, $q$Yes, GitBook offers a free plan with no credit card required, including the block editor, Git sync, and a GitBook Agent limited to 10 messages per week.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$How much does GitBook cost?$q$, $q$Paid plans start at $65 per site/month (billed annually) for Premium, with Ultimate at $249 per site/month; both add $12/month per user beyond the first.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Is there a free trial for paid plans?$q$, $q$Yes, Premium and Ultimate plans include a 14-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Does GitBook sync with GitHub or GitLab?$q$, $q$Yes, GitBook's Git Sync feature supports branch-based workflows with GitHub and GitLab.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$What security certifications does GitBook have?$q$, $q$GitBook's Free plan is ISO 27001 and SOC 2 certified; higher tiers add SAML SSO and Git Sync IP allowlisting.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Developer documentation$q$, $q$Teams sync docs to a GitHub or GitLab repo and publish API references with interactive playgrounds.$q$, $q$Software engineering and DevRel teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Internal knowledge bases$q$, $q$Ultimate and Enterprise plans support authenticated, permissioned content for internal-only docs.$q$, $q$Enterprise IT and internal ops teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Customer-facing product docs$q$, $q$Teams publish branded public documentation sites with AI-powered search and an assistant that answers reader questions.$q$, $q$Product and support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Free$q$, $q$$0/site/month$q$, NULL, $q$["Block-based editor","Git Sync with GitHub/GitLab","1 free user","API playground","Full text search","ISO 27001 & SOC 2 certified","GitBook Agent (10 messages/week)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Premium$q$, $q$$65/site/month$q$, $q$annual$q$, $q$["Everything in Free","Team collaboration","AI search","Custom domain","Advanced branding","Merge rules","$12/month per additional user","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Ultimate$q$, $q$$249/site/month$q$, $q$annual$q$, $q$["Everything in Premium","AI Assistant (500 answers included)","AI Insights","Unlimited GitBook Agent messages","Custom subdirectory/fonts","Slack/Linear/GitHub channels","$12/month per additional user","14-day free trial"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Ultimate","SAML SSO","White-glove migration","Dedicated account manager","Custom contracts"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$overview$q$, $q$What is GitBook?$q$, 2, ARRAY[$q$GitBook is a documentation platform that connects content to a Git repository, letting teams write, review, and publish docs using branch-based workflows.$q$, $q$The platform layers AI features on top of docs, including an assistant that answers reader questions and an agent that flags outdated pages, plus a free plan supporting GitHub/GitLab sync and a block-based editor.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', $q$who-its-for$q$, $q$Who GitBook is for$q$, 2, ARRAY[$q$GitBook suits engineering and DevRel teams that already work in Git and want documentation to follow the same branch/PR review process as their code.$q$, $q$Its higher tiers add SSO, authenticated content, and compliance certifications (SOC 2, ISO 27001) aimed at larger companies publishing both internal and customer-facing docs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── BookStack ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$BookStack is a free, open-source, self-hosted wiki platform for organizing documentation into books, chapters, and pages.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$BookStack: a free, MIT-licensed, self-hosted wiki app for organizing docs into books, chapters, and pages, with SSO, MFA, and a built-in diagram editor.$q$,
  og_description = $q$BookStack: a free, MIT-licensed, self-hosted wiki app for organizing docs into books, chapters, and pages, with SSO, MFA, and a built-in diagram editor.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1c979afd-7472-4f90-be81-546475814887';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1c979afd-7472-4f90-be81-546475814887' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Books, Chapters & Pages structure$q$, $q$Organizes content hierarchically into Books, Chapters, and Pages for easy navigation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$WYSIWYG and Markdown editors$q$, $q$Offers a visual editor as well as an optional Markdown editor with live preview.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Built-in diagrams$q$, $q$Includes diagrams.net drawing tools directly inside the page editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Full-text search$q$, $q$Search across all content, with the ability to link directly to specific paragraphs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Enterprise authentication$q$, $q$Supports OIDC, SAML2, and LDAP for self-hosted and enterprise login.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Multi-factor authentication$q$, $q$Supports TOTP-based MFA with backup codes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Roles & permissions$q$, $q$A role and permission system controls access to content.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Dark/light themes$q$, $q$Includes built-in dark and light UI themes.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Fully free and open source (MIT licensed)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Lightweight enough to run on low-cost VPS hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Built-in diagram editor (diagrams.net) with no extra setup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Enterprise-ready auth via OIDC, SAML2, and LDAP$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Simple Books > Chapters > Pages structure$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Self-hosted only — no official managed cloud/hosting plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Requires a PHP/Laravel/MySQL stack to install and maintain$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$No official native mobile apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Is BookStack free?$q$, $q$Yes, BookStack is fully free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Does BookStack require a database?$q$, $q$Yes, it runs on PHP with the Laravel framework and uses MySQL for storage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Can BookStack run on cheap hosting?$q$, $q$Yes — according to the project, it can run happily on a budget VPS such as a €2.50/month IONOS VPS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Does BookStack support single sign-on?$q$, $q$Yes, it supports OIDC, SAML2, and LDAP authentication for self-hosted and enterprise environments.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Where is the BookStack source code hosted?$q$, $q$The source code is available on Codeberg.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Team documentation$q$, $q$Organizations use BookStack to host internal documentation organized into books and chapters.$q$, $q$IT teams and internal knowledge managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Confluence alternative$q$, $q$Self-hosted teams use BookStack as a lower-cost alternative to enterprise wiki tools.$q$, $q$Small-to-medium businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$Personal or project wikis$q$, $q$Individuals and open-source projects self-host BookStack for organizing notes and project documentation.$q$, $q$Developers and hobbyists$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$overview$q$, $q$What is BookStack?$q$, 2, ARRAY[$q$BookStack is a self-hosted, open-source platform for organizing and storing documentation, using a Books, Chapters, and Pages hierarchy that keeps large amounts of content navigable.$q$, $q$It's released under the MIT license, runs on PHP/Laravel with a MySQL database, and includes a WYSIWYG editor, a Markdown editor, and a built-in diagrams.net drawing tool.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c979afd-7472-4f90-be81-546475814887', $q$who-its-for$q$, $q$Who BookStack is for$q$, 2, ARRAY[$q$BookStack fits teams and individuals who want to self-host their documentation rather than pay for a hosted SaaS wiki, and who are comfortable running a PHP/MySQL application on their own server.$q$, $q$Its support for OIDC, SAML2, and LDAP also makes it usable in enterprise environments that need centralized authentication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c979afd-7472-4f90-be81-546475814887', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Wiki.js ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Wiki.js is a free, open-source wiki platform with multiple editors, full version history, and support for over 40 languages.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Wiki.js: a free, open-source (AGPL-3.0) wiki app with Markdown/WYSIWYG editors, full version history, and support for 40+ languages including RTL.$q$,
  og_description = $q$Wiki.js: a free, open-source (AGPL-3.0) wiki app with Markdown/WYSIWYG editors, full version history, and support for 40+ languages including RTL.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b8287b9b-43ca-4726-b309-28a1246e0832';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b8287b9b-43ca-4726-b309-28a1246e0832' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Multiple editors$q$, $q$Choose from Markdown, visual WYSIWYG, plain HTML, and other editors for each page.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Full version history$q$, $q$All content changes are tracked, so pages can be reverted or deleted pages recovered at any time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$40+ languages with RTL support$q$, $q$The interface is available in over 40 languages, including native right-to-left language support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Flexible search$q$, $q$Includes a built-in database search plus integrations with Algolia and Elasticsearch.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Granular permissions$q$, $q$Supports user groups with page-level access controls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Multiple storage backends$q$, $q$Content can sync to Git, or use cloud storage like AWS S3 and Azure, alongside local/network backups.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Container-friendly deployment$q$, $q$Runs on Docker, Kubernetes, Linux, macOS, and Windows Server, with support for PostgreSQL, MySQL, MariaDB, MS SQL Server, and SQLite.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Free and open source (AGPL-3.0 license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Full page version history with revert/recovery$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Wide language support including RTL languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Multiple database backends supported$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$One-click DigitalOcean Marketplace install for easy hosting$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Self-hosted — no official managed cloud plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$AGPL-3.0 licensing may affect commercial derivative products$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Advanced search (Algolia/Elasticsearch) requires external services$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Is Wiki.js free?$q$, $q$Yes, Wiki.js is free and open source, released under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$How many languages does Wiki.js support?$q$, $q$The interface is available in over 40 languages, including right-to-left languages.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$What databases does Wiki.js support?$q$, $q$PostgreSQL, MySQL, MariaDB, MS SQL Server, and SQLite.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Can I deploy Wiki.js with Docker?$q$, $q$Yes, it supports Docker and Kubernetes deployments, as well as a one-click installer on the DigitalOcean Marketplace.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$How popular is Wiki.js?$q$, $q$It has over 100 million downloads and more than 28,100 stars on GitHub.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Engineering team documentation$q$, $q$Teams use Wiki.js's Git sync and version history to manage technical documentation alongside code.$q$, $q$Software engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Multilingual knowledge bases$q$, $q$Organizations serving global or RTL-language audiences use Wiki.js's 40+ language interface.$q$, $q$International organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$Self-hosted internal wikis$q$, $q$Teams that need full control over their data self-host Wiki.js via Docker or Kubernetes.$q$, $q$IT/DevOps teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$overview$q$, $q$What is Wiki.js?$q$, 2, ARRAY[$q$Wiki.js is a free, open-source wiki engine released under the AGPL-3.0 license, offering multiple content editors (Markdown, WYSIWYG, and plain HTML) and full version history for every page.$q$, $q$It supports several database backends (PostgreSQL, MySQL, MariaDB, MS SQL Server, SQLite) and storage integrations such as Git sync and AWS S3/Azure, and can be deployed via Docker, Kubernetes, or a one-click DigitalOcean installer.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', $q$who-its-for$q$, $q$Who Wiki.js is for$q$, 2, ARRAY[$q$Wiki.js suits teams that want a self-hosted, modular wiki they can extend with only the modules they need, rather than a one-size-fits-all tool.$q$, $q$Its 40+ language interface with RTL support also makes it a fit for international or multilingual documentation projects.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8287b9b-43ca-4726-b309-28a1246e0832', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── DokuWiki ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$DokuWiki is a free, open-source wiki engine that stores all content as plain text files, with no database required.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DokuWiki: a free, open-source (GPLv2) wiki engine with flat-file storage, no database required, maintained since 2004 by Andreas Gohr and the community.$q$,
  og_description = $q$DokuWiki: a free, open-source (GPLv2) wiki engine with flat-file storage, no database required, maintained since 2004 by Andreas Gohr and the community.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bac55456-ac21-473d-a96f-b37ba84bb107';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bac55456-ac21-473d-a96f-b37ba84bb107' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Flat-file storage$q$, $q$Stores all wiki pages and revisions as plain text files rather than in a database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$No database required$q$, $q$Runs without needing to set up or maintain a separate database server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Access control lists$q$, $q$Supports permission rules to control who can read or edit pages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Revision history$q$, $q$Tracks page changes so prior versions can be reviewed or restored.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Plugin and template ecosystem$q$, $q$Extensible through a large library of community plugins and templates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Simple markup syntax$q$, $q$Uses a lightweight wiki markup syntax for formatting pages.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Free and open source (GPL-2.0 license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$No database to install, back up, or maintain (flat-file storage)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Low system requirements, only needs PHP$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Actively maintained since 2004 with a large plugin ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Over 4,700 GitHub stars and hundreds of forks$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Self-hosted only — no official managed hosting plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Flat-file storage can be slower than a database for very large wikis$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$No official native mobile app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Is DokuWiki free?$q$, $q$Yes, DokuWiki is free and open source, licensed under GPL-2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Does DokuWiki need a database?$q$, $q$No — DokuWiki stores pages, revisions, and metadata as plain text files instead of using a database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Who maintains DokuWiki?$q$, $q$DokuWiki is maintained by creator Andreas Gohr and the DokuWiki community, with copyright dating to 2004.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Where can I get DokuWiki support or plugins?$q$, $q$Documentation, installation guides, and a plugin directory are available at dokuwiki.org.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Documentation without database overhead$q$, $q$Teams that want to avoid running a database server use DokuWiki's flat-file storage.$q$, $q$Small IT teams and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Personal or project wikis$q$, $q$Individuals and open-source projects self-host DokuWiki for lightweight note and documentation storage.$q$, $q$Developers and hobbyists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$Corporate intranets$q$, $q$Organizations use DokuWiki's access control lists to manage internal documentation with restricted permissions.$q$, $q$Internal IT/knowledge management teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$overview$q$, $q$What is DokuWiki?$q$, 2, ARRAY[$q$DokuWiki is a free, open-source wiki engine, first released in 2004 by Andreas Gohr, that stores all pages, revisions, and metadata as plain text files instead of requiring a database.$q$, $q$It's released under the GPL-2.0 license, runs on PHP, and is extended through a large ecosystem of community plugins and templates.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', $q$who-its-for$q$, $q$Who DokuWiki is for$q$, 2, ARRAY[$q$DokuWiki suits teams and individuals who want a lightweight, self-hosted wiki without the overhead of setting up and maintaining a database server.$q$, $q$Its access control lists and low system requirements also make it a fit for smaller organizations or personal projects running on modest hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── XWiki ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$XWiki is an open-source enterprise wiki platform, free to self-host as Community edition, with paid XWiki Cloud plans for teams.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$XWiki: open-source (LGPL-2.1) enterprise wiki platform, free to self-host as Community edition, with paid Cloud plans for teams and enterprises.$q$,
  og_description = $q$XWiki: open-source (LGPL-2.1) enterprise wiki platform, free to self-host as Community edition, with paid Cloud plans for teams and enterprises.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fb6f9f95-9f4c-4661-825d-e8c01f5894f4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fb6f9f95-9f4c-4661-825d-e8c01f5894f4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Structured wiki pages$q$, $q$Organize knowledge using structured wiki pages built on the XWiki Platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Self-hosted Community edition$q$, $q$Free, open-source edition (LGPL-2.1) that can be self-hosted for up to 25 users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$XWiki Cloud hosting$q$, $q$Cloud plans (Starter, Basic, Business, Enterprise) offer hosted deployment without managing servers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$On-premise deployment$q$, $q$Basic, Business, and Enterprise plans support on-premise as well as cloud deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Identity and SSO integrations$q$, $q$Higher-tier plans support multiple identity providers and SCIM provisioning.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Extensible applications$q$, $q$The platform can be extended into custom collaborative applications beyond a traditional wiki.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Free, open-source Community edition (LGPL-2.1)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Choice of self-hosted or cloud (XWiki Cloud) deployment$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Free XWiki Cloud Starter hosting offered to open-source projects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Scales from small teams (Community, 25 users) to enterprise (unlimited users)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Discounts available for NGOs and academic institutions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Cloud plan pricing (Starter through Enterprise) is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Community edition is capped at 25 users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Advanced identity/SCIM features are limited to higher-priced tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Is XWiki free?$q$, $q$The Community edition is free and open source (LGPL-2.1) and can be self-hosted for up to 25 users.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Does XWiki offer cloud hosting?$q$, $q$Yes, XWiki Cloud offers Starter, Basic, Business, and Enterprise plans, billed yearly or on 3-year terms.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Is XWiki Cloud pricing public?$q$, $q$No — pricing for the Starter, Basic, Business, and Enterprise cloud plans is not publicly listed and requires contacting XWiki's sales team.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Does XWiki offer discounts?$q$, $q$Yes, XWiki offers free Starter cloud hosting for open-source projects and discounts for NGOs and academic institutions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Enterprise knowledge management$q$, $q$Larger organizations use XWiki's Business or Enterprise cloud/on-premise plans as an alternative to Confluence or SharePoint.$q$, $q$Enterprise IT and knowledge management teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Self-hosted team wikis$q$, $q$Smaller teams self-host the free Community edition for internal documentation.$q$, $q$Small teams and open-source projects$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Custom collaborative applications$q$, $q$Developers build structured applications on top of the XWiki Platform beyond standard wiki pages.$q$, $q$Developers and IT teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Community$q$, $q$Free$q$, NULL, $q$["Self-hosted only","Up to 25 users","Open source, LGPL-2.1"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Starter$q$, $q$Custom (contact sales)$q$, $q$annual$q$, $q$["XWiki Cloud only","Up to 1,000 users","Free for open-source projects"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Basic$q$, $q$Custom (contact sales)$q$, $q$annual$q$, $q$["Cloud or on-premise","Up to 10,000 users"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Business$q$, $q$Custom (contact sales)$q$, $q$annual$q$, $q$["Cloud or on-premise","Unlimited users"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$annual$q$, $q$["Unlimited users","Custom domain, SCIM, dedicated account manager"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$overview$q$, $q$What is XWiki?$q$, 2, ARRAY[$q$XWiki is an open-source wiki platform, released under the LGPL-2.1 license, that offers structured pages and can be extended into custom collaborative applications.$q$, $q$The free, self-hostable Community edition supports up to 25 users, while XWiki SAS (the commercial entity behind xwiki.com) offers paid XWiki Cloud plans — Starter, Basic, Business, and Enterprise — with cloud or on-premise deployment for larger teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', $q$who-its-for$q$, $q$Who XWiki is for$q$, 2, ARRAY[$q$XWiki fits small teams and open-source projects that just need a free, self-hosted structured wiki, as well as larger organizations wanting a hosted or on-premise alternative to Confluence or SharePoint with SSO and identity provisioning.$q$, $q$Its tiered Cloud plans (up to 1,000, 10,000, or unlimited users) let organizations scale without managing their own infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb6f9f95-9f4c-4661-825d-e8c01f5894f4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── MediaWiki ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MediaWiki is the free, open-source wiki software that powers Wikipedia and is used by thousands of other websites.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2002,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MediaWiki: the free, open-source wiki software behind Wikipedia, maintained by a community, built for multilingual, extensible collaboration.$q$,
  og_description = $q$MediaWiki: the free, open-source wiki software behind Wikipedia, maintained by a community, built for multilingual, extensible collaboration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '56575211-4e45-4694-ace2-cf86a40a1535';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '56575211-4e45-4694-ace2-cf86a40a1535' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Powers Wikipedia$q$, $q$The same software that runs Wikipedia and other Wikimedia projects.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Multilingual$q$, $q$Built to support content and interfaces in many languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Extensible$q$, $q$Customizable through a large ecosystem of extensions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Free and open source$q$, $q$Released as free, open-source software available to download and self-host.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Community-maintained$q$, $q$Developed and maintained by a community of volunteer contributors.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Support desk and bug tracking$q$, $q$Users can get help via a support desk and report issues through established bug-tracking channels.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Free and open source, proven at Wikipedia scale$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Highly extensible via a large library of extensions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Multilingual support out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Backed by an active, long-running open-source community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Widely documented with installation, configuration, and admin guides$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Self-hosted setup and server maintenance required unless using a commercial host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$No official managed hosting from the MediaWiki project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Can require technical expertise to configure and extend$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Is MediaWiki free?$q$, $q$Yes, MediaWiki is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$What powers Wikipedia?$q$, $q$Wikipedia runs on MediaWiki.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Can I get MediaWiki hosting?$q$, $q$The project itself is free to download and self-host; users without their own servers can use third-party commercial hosting services.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Is professional support available?$q$, $q$Yes, professional development and consulting services are available from third parties, alongside community support channels.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$What was the latest release at the time of writing?$q$, $q$MediaWiki 1.46.0, per the project's release announcements.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Public encyclopedias and reference wikis$q$, $q$Organizations run large-scale public knowledge bases the same way Wikipedia does.$q$, $q$Nonprofits and community projects$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Internal corporate wikis$q$, $q$Companies self-host MediaWiki for internal documentation and knowledge sharing.$q$, $q$Enterprise IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$Extensible community platforms$q$, $q$Developers extend MediaWiki with custom extensions for specialized collaborative sites.$q$, $q$Developers building wiki-based communities$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$overview$q$, $q$What is MediaWiki?$q$, 2, ARRAY[$q$MediaWiki is the free, open-source wiki software that powers Wikipedia and is used by tens of thousands of other websites to collect and organize knowledge.$q$, $q$It's maintained by a community of volunteer contributors, is highly extensible, and supports multilingual content, with the software free of charge and optional commercial hosting or development services available from third parties.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', $q$who-its-for$q$, $q$Who MediaWiki is for$q$, 2, ARRAY[$q$MediaWiki fits organizations that need a proven, large-scale wiki platform — from public encyclopedic projects to internal corporate knowledge bases — and are comfortable self-hosting or contracting a third party to do so.$q$, $q$Its extension ecosystem also makes it a fit for developers who want to customize wiki functionality beyond the defaults.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56575211-4e45-4694-ace2-cf86a40a1535', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── TiddlyWiki ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$TiddlyWiki is a free, open-source, non-linear personal notebook that runs as a single self-contained HTML file.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TiddlyWiki: a free, open-source (BSD-3-Clause) personal notebook that runs as a single HTML file, in your browser or via Node.js.$q$,
  og_description = $q$TiddlyWiki: a free, open-source (BSD-3-Clause) personal notebook that runs as a single HTML file, in your browser or via Node.js.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9083bc49-72a1-47d8-94f0-9eca973868b2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9083bc49-72a1-47d8-94f0-9eca973868b2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Single-file wiki$q$, $q$Runs as a complete, self-contained wiki inside a single HTML file that opens in any browser.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Non-linear notes$q$, $q$Organizes notes as interlinked 'tiddlers' rather than a fixed linear structure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Node.js server mode$q$, $q$Can also run as a Node.js application for a client/server setup.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Hackable interface$q$, $q$The entire user interface is implemented in editable WikiText, making it customizable.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Multiple hosting options$q$, $q$Can be self-hosted as a file, run via Node.js/AWS Lambda, or hosted via the independent Tiddlyhost service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Command-line tooling$q$, $q$Includes command-line tools for managing wiki folders and rendering static HTML.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Free and open source (BSD-3-Clause license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$No server or database required — runs as a single portable HTML file$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Highly customizable, hackable interface$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Can also run as a Node.js app for more advanced setups$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Long-running project maintained since 2004 with an active community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Saving changes from the browser's File > Save menu does not work, which can confuse new users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Single-file/local model means no built-in real-time multi-user collaboration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Advanced customization requires learning its WikiText scripting system$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Is TiddlyWiki free?$q$, $q$Yes, TiddlyWiki is free and open source, released under the BSD-3-Clause license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Do I need to install anything to use TiddlyWiki?$q$, $q$No — it runs as a single HTML file that can be opened directly in a browser, though it can also run via Node.js.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Can I save changes using the browser's File > Save menu?$q$, $q$No, the project explicitly warns that using the browser's File/Save menu doesn't work; other saving methods are required depending on OS and browser.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Is there a hosted option?$q$, $q$Yes, Tiddlyhost is an independently run community service offering free hosted TiddlyWiki accounts.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Who created TiddlyWiki?$q$, $q$TiddlyWiki was created by Jeremy Ruston, first released in 2004; its copyright is now held in trust by the UnaMesa Association.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Personal knowledge management$q$, $q$Individuals use TiddlyWiki's non-linear tiddler system to capture and interlink personal notes.$q$, $q$Individual note-takers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Portable offline notebooks$q$, $q$Users who want a notebook that works without installing software carry TiddlyWiki as a single HTML file.$q$, $q$Users needing offline/portable notes$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$Custom wiki applications$q$, $q$Developers use TiddlyWiki's hackable WikiText interface and Node.js mode to build customized tools.$q$, $q$Developers and power users$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$overview$q$, $q$What is TiddlyWiki?$q$, 2, ARRAY[$q$TiddlyWiki is a free, open-source personal notebook, first released in 2004 by creator Jeremy Ruston, that runs as a complete interactive wiki packed into a single HTML file.$q$, $q$It's released under the BSD-3-Clause license, can also run as a Node.js application for client/server setups, and its entire interface is built in editable WikiText, making it deeply customizable.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', $q$who-its-for$q$, $q$Who TiddlyWiki is for$q$, 2, ARRAY[$q$TiddlyWiki suits individuals who want a portable, non-linear personal notebook that doesn't depend on any company's servers or software installation.$q$, $q$Its hackable WikiText interface and Node.js mode also make it a fit for developers who want to build customized note-taking or documentation tools on top of it.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9083bc49-72a1-47d8-94f0-9eca973868b2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Logseq ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Logseq is a privacy-first, open-source knowledge base for outlining notes in Markdown or Org-mode, with local-first storage.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Logseq: a free, open-source (AGPL-3.0), privacy-first, local-first knowledge base for Markdown/Org-mode notes, with desktop, web, and mobile apps.$q$,
  og_description = $q$Logseq: a free, open-source (AGPL-3.0), privacy-first, local-first knowledge base for Markdown/Org-mode notes, with desktop, web, and mobile apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5d057e5f-65df-488c-80d0-410c33bb681b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5d057e5f-65df-488c-80d0-410c33bb681b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Markdown and Org-mode support$q$, $q$Write notes in either Markdown or Org-mode file formats.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$PDF annotation$q$, $q$Annotate PDFs directly within Logseq.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Task management$q$, $q$Built-in tools for tracking tasks alongside notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Plugins and themes$q$, $q$An ecosystem of community plugins and themes extends functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Knowledge graph$q$, $q$Notes are linked together into a graph for non-linear organization.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Real-Time Collaboration (RTC)$q$, $q$An in-development feature for syncing graphs and multi-user editing across devices, currently in alpha.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Cross-platform apps$q$, $q$Desktop apps for macOS, Linux, and Windows, plus iOS and Android mobile apps and a web version.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Free and open source (AGPL-3.0 license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Privacy-first, local-first data storage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Supports both Markdown and Org-mode$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Available on desktop, mobile (iOS/Android), and web$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Backed by well-known investors per the company's funding announcements$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Real-Time Collaboration (RTC) sync is still in alpha testing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$AGPL-3.0 license may restrict certain commercial derivative uses$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Mobile apps provide most, but not all, desktop features$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Is Logseq free?$q$, $q$Yes, Logseq is free and open source, released under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$What file formats does Logseq use?$q$, $q$Notes can be written in Markdown or Org-mode.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Is Logseq available on mobile?$q$, $q$Yes, iOS and Android apps are available and provide most of the desktop app's features, alongside a web version at app.logseq.com.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Does Logseq sync across devices?$q$, $q$Logseq is developing a Real Time Collaboration (RTC) feature, currently in alpha, for syncing graphs across devices and multi-user collaboration.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Can I annotate PDFs in Logseq?$q$, $q$Yes, Logseq supports PDF annotation.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Personal knowledge graphs$q$, $q$Users link Markdown or Org-mode notes into an interconnected knowledge graph.$q$, $q$Individual knowledge workers and researchers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Reading and research notes$q$, $q$Researchers use Logseq's PDF annotation to take notes directly alongside source documents.$q$, $q$Students and researchers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$Task and project tracking$q$, $q$Users combine Logseq's task management tools with notes for lightweight project tracking.$q$, $q$Individuals and small teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$overview$q$, $q$What is Logseq?$q$, 2, ARRAY[$q$Logseq is a free, open-source (AGPL-3.0) knowledge base app that stores notes locally in Markdown or Org-mode files and links them into a knowledge graph.$q$, $q$It includes PDF annotation, task management, and a plugin/theme ecosystem, with desktop apps for macOS, Linux, and Windows, iOS and Android mobile apps, a web version, and an in-development Real Time Collaboration feature for multi-device sync.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', $q$who-its-for$q$, $q$Who Logseq is for$q$, 2, ARRAY[$q$Logseq fits individuals who want a privacy-first, local-first note-taking tool and prefer plain-text Markdown or Org-mode files over a proprietary format.$q$, $q$Its plugin ecosystem and cross-platform apps also make it a fit for researchers and knowledge workers who want to extend or sync their notes across desktop and mobile.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d057e5f-65df-488c-80d0-410c33bb681b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Anytype ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Anytype is a privacy-first, offline-first personal knowledge base app with local encrypted storage and optional peer-to-peer sync.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2018,
  company_size = NULL,
  headquarters = $q$Berlin, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Anytype: an offline-first, end-to-end encrypted personal knowledge base with composable blocks, a free tier, and paid Plus/Pro/Ultra memberships.$q$,
  og_description = $q$Anytype: an offline-first, end-to-end encrypted personal knowledge base with composable blocks, a free tier, and paid Plus/Pro/Ultra memberships.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Offline-first local storage$q$, $q$Stores data locally with an offline-first architecture, syncing peer-to-peer rather than through a central server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Zero-knowledge encryption$q$, $q$Uses end-to-end encryption via its any-sync protocol so data remains private.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Composable blocks and Types$q$, $q$Build pages from blocks like text, databases, kanban boards, and calendars, using customizable object Types.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Cross-platform apps$q$, $q$Desktop apps for macOS, Windows, and Linux, plus iOS and Android mobile apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Web clipper$q$, $q$Browser extension for Firefox and Chromium browsers to save web content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Membership tiers$q$, $q$Free tier plus paid Plus, Pro, and Ultra memberships with increasing remote storage.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Local-first, offline-capable storage with end-to-end encryption$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Free tier available alongside paid membership tiers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Cross-platform: desktop (macOS/Windows/Linux), mobile (iOS/Android), and browser clipper$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Discounts for students, faculty, and contributors$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$No centralized server required for core use$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Not released under a standard OSI-approved open-source license (uses the 'Any Source Available License 1.0')$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Exact membership pricing isn't published on the main site or docs — pricing is shown in-app and varies by platform$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Free tier remote storage is limited (100 MB) with a 10 shared-space cap$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Is Anytype free?$q$, $q$Yes, Anytype has a free membership tier with 100 MB of remote storage, 10 shared spaces, and unlimited private spaces.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Does Anytype require the internet?$q$, $q$No, it's offline-first — data is stored locally, with optional peer-to-peer sync across devices.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Is Anytype open source?$q$, $q$Anytype publishes its source code under the Any Source Available License 1.0, and is maintained by Any, a Swiss association.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$What platforms does Anytype support?$q$, $q$Desktop apps for macOS, Windows, and Linux, mobile apps for iOS and Android, and a web clipper for Firefox and Chromium browsers.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Are there paid plans?$q$, $q$Yes — Plus, Pro, and Ultra membership tiers offer more remote storage (1 GB, 10 GB, and 100 GB respectively) beyond the free tier.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Personal knowledge management$q$, $q$Individuals organize notes, tasks, and information into a private, locally-stored knowledge base.$q$, $q$Individual knowledge workers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Privacy-conscious note-taking$q$, $q$Users who want end-to-end encrypted, offline-first storage instead of a cloud-only note app choose Anytype.$q$, $q$Privacy-focused users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Custom structured databases$q$, $q$Users build custom object Types and databases (e.g., kanban, calendars) for personal or team workflows.$q$, $q$Power users and small teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Free$q$, $q$$0$q$, NULL, $q$["100 MB remote storage","10 shared spaces","Unlimited private spaces"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Plus$q$, $q$Paid (exact price not publicly listed)$q$, NULL, $q$["1 GB remote storage","Unlimited shared spaces","Unlimited private spaces"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Pro$q$, $q$Paid (exact price not publicly listed)$q$, NULL, $q$["10 GB remote storage","Unlimited shared spaces","Unlimited private spaces"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Ultra$q$, $q$Paid (exact price not publicly listed)$q$, NULL, $q$["100 GB remote storage","Unlimited shared spaces","Unlimited private spaces"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$overview$q$, $q$What is Anytype?$q$, 2, ARRAY[$q$Anytype is an offline-first personal knowledge base app that stores data locally and encrypts it end-to-end, syncing across devices peer-to-peer instead of relying on a central company server.$q$, $q$It's built around composable blocks — text, databases, kanban boards, calendars, and custom object Types — and is maintained by Any, a Swiss association, under the Any Source Available License 1.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$who-its-for$q$, $q$Who Anytype is for$q$, 2, ARRAY[$q$Anytype fits individuals and teams who want a privacy-first alternative to cloud note-taking apps, with data staying on-device unless they opt into sync.$q$, $q$Its free tier covers personal use with limited remote storage, while paid Plus, Pro, and Ultra memberships add more remote storage for those syncing across multiple devices or sharing spaces.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Affine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AFFiNE is an open-source Notion and Miro alternative combining docs, whiteboards, and databases in a local-first, AI-enabled workspace.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6.75/month (Pro plan, billed annually)$q$,
  founded_year = 2022,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$AFFiNE: open-source docs, whiteboard, and database workspace with a free plan (10 GB storage) and paid Pro/Team plans from $6.75/month.$q$,
  og_description = $q$AFFiNE: open-source docs, whiteboard, and database workspace with a free plan (10 GB storage) and paid Pro/Team plans from $6.75/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b3923df9-f933-42f3-a870-8a16aaef419f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b3923df9-f933-42f3-a870-8a16aaef419f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Unified docs and whiteboards$q$, $q$Combines writing, drawing, and planning in one workspace instead of separate apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Databases and tables$q$, $q$Build structured databases and tables alongside documents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Ready-to-use templates$q$, $q$Includes templates to start new documents or boards quickly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Local-first storage$q$, $q$Privacy-focused, local-first data model.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$AI add-on$q$, $q$An optional AI add-on assists with writing, visualization, and planning for an additional monthly fee.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Cross-platform apps$q$, $q$Desktop apps for Windows, macOS, and Linux, plus web and mobile (iOS/Android) apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Self-hosting and commercial licensing$q$, $q$MIT-licensed self-hosted editor, with commercial source licensing and OEM/white-label options for enterprises.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Open source with 70,000+ GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Free plan includes 10 GB of cloud storage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Combines docs, whiteboards, and databases in one app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Available on desktop, web, and mobile$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Self-hosting option with an MIT-licensed editor$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$AI features are a separate paid add-on ($8.90/month, billed annually)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Team plan requires a minimum of 10 seats$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Higher storage/file-size limits require paid Pro, Team, or Enterprise plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Is AFFiNE free?$q$, $q$Yes, AFFiNE has a free-forever plan with unlimited local workspaces, 10 GB of cloud storage, and up to 3 workspace members.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$How much does AFFiNE Pro cost?$q$, $q$$6.75/month billed annually, with 100 GB of cloud storage and up to 10 workspace members.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Does AFFiNE offer a lifetime plan?$q$, $q$Yes, the Believer plan is a one-time purchase of $499.99 that includes 1 TB of cloud storage for personal use.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Is AFFiNE open source?$q$, $q$Yes, AFFiNE's editor is open source and MIT-licensed, with over 70,000 GitHub stars, and can be self-hosted for free.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Does AFFiNE have AI features?$q$, $q$Yes, as a separate AI add-on priced at $8.90/month, billed annually.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$All-in-one workspace$q$, $q$Teams replace separate docs, whiteboard, and database tools with a single AFFiNE workspace.$q$, $q$Startups and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Self-hosted private workspace$q$, $q$Privacy-focused users and organizations self-host the free, MIT-licensed AFFiNE editor.$q$, $q$Privacy-conscious individuals and IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Visual planning and whiteboarding$q$, $q$Teams use AFFiNE's whiteboard alongside docs and databases for project planning.$q$, $q$Product and design teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Free$q$, $q$$0$q$, NULL, $q$["Unlimited local workspaces","10 GB cloud storage","10 MB max file size","Up to 3 workspace members","7-day version history","Up to 3 login devices"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Pro$q$, $q$$6.75/month$q$, $q$annual$q$, $q$["Everything in Free","100 GB cloud storage","100 MB max file size","Up to 10 workspace members","30-day version history","Community support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Team$q$, $q$$10/seat/month (10+ seats minimum)$q$, $q$monthly$q$, $q$["Everything in Pro","100 GB + 20 GB per seat storage","500 MB max file size","Unlimited team members","Multiple admin roles","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Believer (Lifetime)$q$, $q$$499.99 one-time$q$, NULL, $q$["Everything in Pro","1 TB cloud storage","Lifetime personal usage"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Private cloud/self-hosted deployment","Commercial source licensing","OEM/white-label options"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$overview$q$, $q$What is Affine?$q$, 2, ARRAY[$q$AFFiNE is an open-source workspace, founded in 2022, that combines documents, whiteboards, and databases in one local-first app, positioned as an alternative to Notion and Miro.$q$, $q$The editor is MIT-licensed and can be self-hosted for free, with over 70,000 GitHub stars, while hosted Pro, Team, and lifetime Believer plans add cloud storage, sync, and collaboration features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$who-its-for$q$, $q$Who Affine is for$q$, 2, ARRAY[$q$AFFiNE fits individuals and teams who want docs, whiteboards, and databases combined in one tool instead of juggling separate apps, with a free plan covering personal use.$q$, $q$Its self-hosted, MIT-licensed option and enterprise commercial licensing also make it a fit for privacy-conscious users and organizations that want to run or embed it themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── AppFlowy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, AI-powered workspace for docs, wikis, and projects that you can self-host or run in the cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AppFlowy is an open-source AI workspace for docs, wikis, and projects, with self-hosting and a free cloud plan.$q$,
  og_description = $q$AppFlowy is an open-source AI workspace for docs, wikis, and projects, with self-hosting and a free cloud plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a124a9a-48f0-4b4c-95da-4dc646598e63' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$AppFlowy AI$q$, $q$A built-in AI assistant that can answer questions, improve writing, and autofill tables and databases.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Open-source and self-hostable$q$, $q$The full codebase is open source, so teams can self-host AppFlowy instead of using the hosted cloud service.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Local AI models$q$, $q$Supports running local AI models such as Mistral 7B and Llama 3 for privacy-focused, offline AI use.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Customizable views and databases$q$, $q$Flexible blocks, views, and properties let users build wikis, grids, and project trackers in one workspace.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Multi-platform apps$q$, $q$Native apps are available for macOS, Windows, Linux, iOS, and Android, plus a web app.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Third-party AI model access$q$, $q$Paid AI add-ons provide access to models including GPT-5, Gemini 2.5 Pro, and Claude 3.7 Sonnet.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Open-source with a self-hosting option for full data control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Generous free plan that includes a limited number of AI responses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Available on all major desktop and mobile platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Offers a local/offline AI option (Vault Workspace) for privacy-sensitive use$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Unlimited AI responses and larger workspaces require paid add-ons on top of the base Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Free plan is capped at a 2-member workspace and limited storage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Advanced AI models (GPT-5, Gemini 2.5 Pro, Claude 3.7) require a separate paid AI subscription$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Is AppFlowy free to use?$q$, $q$Yes, AppFlowy has a free forever plan with a collaborative workspace for up to 2 members, unlimited pages, 5 GB storage, and a limited number of AI responses per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Can I self-host AppFlowy?$q$, $q$Yes, AppFlowy is open source and can be self-hosted instead of using the hosted AppFlowy Cloud.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$What AI models does AppFlowy support?$q$, $q$AppFlowy offers its own built-in AI assistant, local models like Mistral 7B and Llama 3 for offline use, and paid access to third-party models such as GPT-5, Gemini 2.5 Pro, and Claude 3.7 Sonnet.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$What platforms is AppFlowy available on?$q$, $q$AppFlowy is available on the web and as native apps for macOS, Windows, Linux, iOS, and Android.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Privacy-focused team workspace$q$, $q$Teams that want a shared wiki and project workspace without giving up control of their data can self-host AppFlowy.$q$, $q$Privacy-conscious teams and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$AI-assisted documentation$q$, $q$Individuals and teams use AppFlowy AI to draft, summarize, and autofill content within docs and databases.$q$, $q$Knowledge workers and small teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["1 collaborative workspace (up to 2 members)","Unlimited pages & blocks","5 GB storage","10 AI responses and 2 AI images per month","Mobile app and real-time collaboration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Pro$q$, $q$$10/user/month (annual, $12.5 monthly)$q$, $q$monthly$q$, $q$["Everything in Free","Unlimited storage","Up to 50 workspace members","Up to 100 guest editors","Unlimited AI responses","50 AI images per month","Custom namespace"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$AppFlowy AI MAX (add-on)$q$, $q$$8/user/month$q$, $q$monthly$q$, $q$["Access to GPT-5, Gemini 2.5 Pro, and Claude 3.7 Sonnet","Unlimited AI responses","Unlimited file uploads","50 AI images per month"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Vault Workspace (add-on)$q$, $q$$6/user/month$q$, $q$annual$q$, $q$["AI runs locally for privacy","Unlimited AI responses","Unlimited file size for AI chat"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$overview$q$, $q$What is AppFlowy?$q$, 2, ARRAY[$q$AppFlowy is an open-source workspace application that combines documents, wikis, and project databases with a built-in AI assistant. It is positioned as a customizable, data-ownership-focused alternative to closed workspace tools.$q$, $q$Because the project is open source, teams can either use AppFlowy's hosted cloud service or self-host the platform to keep full control of their data. AppFlowy also supports local AI models for users who want AI features without sending data to third-party providers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$who-its-for$q$, $q$Who AppFlowy is for$q$, 2, ARRAY[$q$AppFlowy suits teams and individuals who want a flexible workspace for wikis, notes, and lightweight project tracking, especially those who value self-hosting or data privacy over a purely managed SaaS product.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Superlist ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Task manager and to-do list app from the Wunderlist team, combining lists, notes, and AI-assisted planning.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/person/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Superlist is a task and note management app from the Wunderlist team, with real-time collaboration and AI features.$q$,
  og_description = $q$Superlist is a task and note management app from the Wunderlist team, with real-time collaboration and AI features.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Unified tasks and notes$q$, $q$Attach contextual notes and details directly to tasks instead of switching between separate apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Nested lists and subtasks$q$, $q$Break large projects down into nested lists and subtasks for more granular planning.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Voice-to-task input$q$, $q$Quickly add tasks by typing or speaking, including converting voice recordings into actionable items.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Real-time collaboration$q$, $q$Share lists with family, friends, or coworkers and collaborate on tasks in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$AI meeting notes and chat$q$, $q$Higher-tier plans include AI meeting note summarization and AI chat for managing tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Recurring tasks and widgets$q$, $q$Set up recurring tasks for routines and use home/lock screen widgets for fast task entry.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Free plan supports unlimited tasks and notes with up to 5 shared lists$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Built by the team behind Wunderlist, with a similar list-based workflow$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Available across macOS, iOS, Android, and web with offline support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$AI features for voice-to-task conversion and meeting note summaries on paid plans$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Free plan is capped at 5 private/shared lists and 5 people per shared list$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Voice AI and integrations require at least the Basic paid plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Unlimited AI chat and meeting notes are reserved for the top Super plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Is Superlist free?$q$, $q$Yes, Superlist has a free plan that includes unlimited tasks and notes, up to 5 private and shared lists, and up to 5 people per shared list.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Who made Superlist?$q$, $q$Superlist was created by the team behind Wunderlist, the task management app that was later discontinued.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Does Superlist have AI features?$q$, $q$Yes, paid plans include AI capabilities such as converting voice recordings into tasks, summarizing meeting notes, and an AI chat for task management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$What platforms does Superlist support?$q$, $q$Superlist is available on macOS, iOS, Android, and the web, with real-time sync and offline support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Personal and family task coordination$q$, $q$Individuals and families use shared lists to coordinate household tasks and errands.$q$, $q$Individuals and families$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Team project tracking$q$, $q$Teams use nested lists, notes, and AI meeting summaries to manage shared work.$q$, $q$Small teams and professionals$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Free$q$, $q$$0/person/month$q$, $q$monthly$q$, $q$["Up to 5 private and shared lists","Up to 5 people in shared lists","Unlimited tasks and notes","25MB uploads & 500MB storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Basic$q$, $q$$5/person/month ($59/year)$q$, $q$monthly$q$, $q$["Unlimited lists, sublists, and shared lists","All integrations","Unlimited team members","Voice AI for task management","100MB uploads & 25GB storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Super$q$, $q$$21/person/month ($249/year)$q$, $q$monthly$q$, $q$["Unlimited AI Meeting Notes","Unlimited AI Chat messages","AI generation with Make AI","Email + Slack task summarization"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$overview$q$, $q$What is Superlist?$q$, 2, ARRAY[$q$Superlist is a task management app that combines to-do lists, notes, and project planning in one workspace. It was created by the team that previously built Wunderlist.$q$, $q$The app supports nested lists, subtasks, recurring tasks, and real-time collaboration, along with AI features such as voice-to-task conversion and meeting note summarization on paid plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$who-its-for$q$, $q$Who Superlist is for$q$, 2, ARRAY[$q$Superlist is aimed at individuals, families, and small teams who want a single app for personal to-dos and shared project or household coordination.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Ellie Planner ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A day-planning app with drag-and-drop time blocking, brain dump, and calendar sync for iOS and web.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$9.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ellie is a day planner app with time blocking, brain dump, and calendar sync for iOS and web, with a free plan.$q$,
  og_description = $q$Ellie is a day planner app with time blocking, brain dump, and calendar sync for iOS and web, with a free plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cdc946d2-b06d-4438-be5e-2091531fcf59';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cdc946d2-b06d-4438-be5e-2091531fcf59' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Time blocking$q$, $q$Drag-and-drop scheduling lets users place tasks directly onto a visual daily calendar.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Brain dump$q$, $q$A dedicated space to offload tasks and ideas quickly to free up mental space.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Calendar integrations$q$, $q$Syncs with Google Calendar, Apple Calendar, and Outlook.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Recurring tasks$q$, $q$Supports repeating tasks for routines and rituals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Analytics and time tracking$q$, $q$Visualizes how time is spent across tasks and days.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Native iOS app$q$, $q$Includes Apple Calendar and Siri integration, plus iOS widgets and focus mode.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Free plan includes unlimited task creation with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Native iOS app with Siri and widget support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Supports Google, Apple, and Outlook calendar sync on paid plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Built and maintained by a solo, self-funded founder with a stated no-ads, no-data-selling policy$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Calendar sync, time boxing, and recurring tasks are locked behind the paid Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$One-time purchase option is priced significantly higher than a year of the monthly subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$No native Android or dedicated desktop app confirmed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Is Ellie free to use?$q$, $q$Yes, Ellie has a free plan with unlimited task creation, iOS and web app access, and brain dump, with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$How much does Ellie Pro cost?$q$, $q$Ellie Pro is $9.99/month as a subscription, or $299.99 as a one-time purchase for the same features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Does Ellie sync with my calendar?$q$, $q$Yes, Ellie Pro integrates with Google Calendar and Apple Calendar.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Who makes Ellie?$q$, $q$Ellie is built by an independent founder, Chris Raroque, and is self-funded through the founder's other apps.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Daily time blocking$q$, $q$Users plan their day by dragging tasks onto a calendar-style timeline.$q$, $q$Individuals seeking visual day planning$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$iOS-first task management$q$, $q$iPhone users rely on native Siri and widget integration to plan tasks on the go.$q$, $q$iOS users$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Unlimited task creation","iOS & Web App access","Brain dump"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Ellie Pro (subscription)$q$, $q$$9.99/month$q$, $q$monthly$q$, $q$["Timebox mode","Google Calendar integration","Apple Calendar integration","Unlimited labels & subtasks","Recurring tasks","Due dates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$Ellie Pro (one-time)$q$, $q$$299.99$q$, NULL, $q$["Same features as the Pro subscription, paid once"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$overview$q$, $q$What is Ellie Planner?$q$, 2, ARRAY[$q$Ellie is a day planner app built around drag-and-drop time blocking and a brain dump feature for offloading tasks. It runs as a native iOS app and a web app.$q$, $q$The free plan covers unlimited task creation, while a paid Pro plan adds calendar sync with Google and Apple Calendar, timebox mode, recurring tasks, and subtasks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', $q$who-its-for$q$, $q$Who Ellie is for$q$, 2, ARRAY[$q$Ellie is aimed at individuals who want a simple, visual day-planning system, particularly iPhone users who want native Siri and widget support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cdc946d2-b06d-4438-be5e-2091531fcf59', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Timestripe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A goal-planning app that organizes tasks across life horizons, from daily boards to multi-year goals.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Tallinn, Estonia$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Timestripe is a goal and task planning app organizing work across daily boards and long-term life horizons.$q$,
  og_description = $q$Timestripe is a goal and task planning app organizing work across daily boards and long-term life horizons.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Horizons planning system$q$, $q$Organizes goals across flexible timeframes, from daily tasks to multi-year plans.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Boards$q$, $q$Customizable lists for organizing tasks, ideas, and content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Climbs$q$, $q$Step-by-step guides for goal categories such as fitness, finance, and career.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Timestripe Clock$q$, $q$A visualization mode intended to help users reflect on how they use their time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Rich notes$q$, $q$Notes can embed video, images, files, and maps alongside tasks and goals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Shared templates$q$, $q$Includes shared templates and checklists for common planning use cases.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Free plan available with sync across devices$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Distinct long-term "horizons" planning model beyond typical daily to-do lists$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Available on web, iPhone/iPad, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$One-time multi-year plan option for users who prefer not to subscribe monthly$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Free plan limits goals per horizon and boards, and caps file uploads at 10MB per file$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$No confirmed native Mac or Windows desktop app, only a web app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Reviewers note limited integrations with other productivity tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Is Timestripe free to use?$q$, $q$Yes, Timestripe has a free plan with limited goals per horizon, limited boards, and sync across devices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$How much does Timestripe Pro cost?$q$, $q$The Pro plan is $5 per user per month and removes the limits on goals, boards, and climbs from the free plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Where is Timestripe based?$q$, $q$Timestripe is operated by Timestripe OÜ, headquartered in Tallinn, Estonia.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$What platforms does Timestripe support?$q$, $q$Timestripe is available as a web app and on iPhone, iPad, and Android.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Long-term goal planning$q$, $q$Users break down multi-year goals into yearly, monthly, and daily boards.$q$, $q$Individuals focused on long-term planning$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Guided goal progress$q$, $q$Users follow step-by-step Climbs to work toward goals like fitness or career milestones.$q$, $q$Self-improvement focused users$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["5 goals per horizon","10 goals per board list","3 custom boards","10MB file uploads (100MB account limit)","Sync across devices"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$PRO$q$, $q$$5/user/month$q$, $q$monthly$q$, $q$["Unlimited goals","Unlimited boards","Unlimited lists per board","Unlimited climbs","100MB file uploads (unlimited account storage)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$Strategists' 5 Year Plan$q$, $q$$250 one-time$q$, NULL, $q$["Same features as the PRO plan"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$overview$q$, $q$What is Timestripe?$q$, 2, ARRAY[$q$Timestripe is a goal-planning application that organizes tasks and goals across flexible time horizons, from daily boards up to multi-year plans. It combines a calendar view, customizable boards, and rich notes.$q$, $q$The app is built by Timestripe OÜ, based in Tallinn, Estonia, and is available on the web, iPhone, iPad, and Android.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$who-its-for$q$, $q$Who Timestripe is for$q$, 2, ARRAY[$q$Timestripe suits individuals who want to plan beyond simple daily to-do lists, connecting everyday tasks to longer-term goals and life horizons.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87249d5-d534-4dd2-b7ea-1a1690c96c53', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Tweek ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A minimalist weekly planner combining a to-do list with a calendar, with free and premium tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tweek is a minimalist weekly planner combining a to-do list and calendar, with Google/Apple Calendar sync.$q$,
  og_description = $q$Tweek is a minimalist weekly planner combining a to-do list and calendar, with Google/Apple Calendar sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0dd77a12-e3bc-4d46-ba35-97303cca0d1d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0dd77a12-e3bc-4d46-ba35-97303cca0d1d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Weekly board layout$q$, $q$Displays tasks in a paper-planner-style weekly view alongside a 'Someday' column for unscheduled items.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Calendar sync$q$, $q$Premium syncs with Google Calendar and Apple Calendar, plus Apple Reminders.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Shared calendars$q$, $q$Users can share schedules with clients, partners, teammates, or family members.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Recurring tasks and subtasks$q$, $q$Premium adds recurring tasks, subtasks, and file attachments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Printable planner$q$, $q$Weekly plans can be printed for a paper-planner-style workflow.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$API access$q$, $q$Offers read/write API access, with expanded limits on the Premium plan.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Permanent free plan with 2 active calendars and 3 Someday columns$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Simple, minimalist weekly-view interface$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Calendar sync with both Google and Apple Calendar on Premium$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Native mobile apps on the App Store and Google Play$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Free plan limits calendars, Someday columns, and custom colors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Calendar sync and reminders integration require the paid Premium plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$No monthly-view or theme customization on the free tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Is Tweek free?$q$, $q$Yes, Tweek has a permanent free plan with 2 active calendars, 3 Someday columns, and 2 custom colors.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$How much is Tweek Premium?$q$, $q$Tweek Premium costs $5.99/month or $49.99/year.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Does Tweek sync with Google or Apple Calendar?$q$, $q$Yes, calendar sync with Google Calendar, Apple Calendar, and Apple Reminders is available on the Premium plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Is Tweek available on mobile?$q$, $q$Yes, Tweek has apps on the App Store and Google Play, in addition to the web app.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Weekly personal planning$q$, $q$Individuals use the weekly board and Someday column to plan tasks in a paper-planner style.$q$, $q$Individuals who prefer minimalist planning$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Shared family or team scheduling$q$, $q$Families and small teams share calendars to coordinate schedules and responsibilities.$q$, $q$Families and small teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["2 active calendars","3 Someday columns","2 custom colors","Export & publishing","Limited API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$Premium$q$, $q$$5.99/month ($49.99/year)$q$, $q$monthly$q$, $q$["Unlimited calendars, Someday columns, and colors","Monthly view","Google/Apple Calendar sync","Apple Reminders","Subtasks & recurring tasks","File attachments","Expanded API limits"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$overview$q$, $q$What is Tweek?$q$, 2, ARRAY[$q$Tweek is a minimalist weekly planner that combines a to-do list with a calendar view. Its layout resembles a paper planner, with a weekly board and a 'Someday' column for unscheduled tasks.$q$, $q$A free plan is available indefinitely, while the Premium plan adds calendar sync with Google Calendar and Apple Calendar, recurring tasks, and file attachments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', $q$who-its-for$q$, $q$Who Tweek is for$q$, 2, ARRAY[$q$Tweek is aimed at individuals, families, and small teams who want a simple, minimalist alternative to a paper planner with optional calendar sync.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0dd77a12-e3bc-4d46-ba35-97303cca0d1d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Lunatask ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An encrypted, all-in-one productivity app combining tasks, habits, notes, and mood tracking, built for focus and privacy.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Lunatask combines encrypted task management, habit tracking, and journaling in one app, with a free plan available.$q$,
  og_description = $q$Lunatask combines encrypted task management, habit tracking, and journaling in one app, with a free plan available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Automatic task prioritization$q$, $q$Prioritizes tasks using methods like Kanban, Must/Should/Want, and the Eisenhower Matrix.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Calendar integration$q$, $q$Time blocking with Google, Outlook, and iCloud calendar support, plus joining Zoom, Meet, or Teams calls directly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Habit tracking$q$, $q$Tracks daily and weekly habits with streak counters and reminder notifications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Mood and wellness tracking$q$, $q$Logs emotion, energy level, and stress to help users spot patterns over time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Encrypted notes and journaling$q$, $q$Markdown-based notebooks with templates and optional PIN protection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Relationship tracker$q$, $q$A lightweight personal CRM with reconnect reminders for maintaining relationships.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$End-to-end encryption for tasks, notes, and journals$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Combines tasks, habits, mood tracking, and notes in one app rather than several$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Available on Windows, macOS, Linux, iOS, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Offers a one-time lifetime license as an alternative to subscribing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Free plan limits users to 2 areas of life, 7 daily habits, and 30 relationships$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Calendar integrations and advanced trackers require the paid Premium plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Lifetime license is not available on mobile or the Mac App Store$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Is Lunatask free?$q$, $q$Yes, Lunatask has a free plan limited to 2 areas of life, 7 daily habits, and 30 relationships, with basic features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$How much does Lunatask Premium cost?$q$, $q$Premium is $6/month billed annually, or $8/month billed monthly, and unlocks unlimited features and calendar integrations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Does Lunatask offer a lifetime license?$q$, $q$Yes, a one-time lifetime license is available for $300, though it is not available on mobile or the Mac App Store.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Is Lunatask data encrypted?$q$, $q$Yes, Lunatask emphasizes end-to-end encryption for tasks, notes, and journals.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$ADHD-friendly task management$q$, $q$Users prioritize tasks automatically and track habits to reduce decision fatigue.$q$, $q$People with ADHD$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Private life tracking$q$, $q$Individuals track mood, habits, and relationships in one encrypted app.$q$, $q$Privacy-conscious individuals$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["2 areas of life","7 daily habits","30 relationships","Basic task, habit, and note features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Premium$q$, $q$$6/month (billed annually) or $8/month (billed monthly)$q$, $q$monthly$q$, $q$["Unlimited areas, habits, and relationships","Calendar integrations","Advanced trackers"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$Lifetime License$q$, $q$$300 one-time$q$, NULL, $q$["Unlimited features","Not available on mobile or Mac App Store"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$overview$q$, $q$What is Lunatask?$q$, 2, ARRAY[$q$Lunatask is an all-in-one productivity app that combines task management, habit tracking, journaling, and mood tracking with end-to-end encryption. It is designed with ADHD-friendly workflows in mind.$q$, $q$The app is available on Windows, macOS, Linux, iOS, and Android, with a free plan and a Premium subscription that unlocks calendar integrations and unlimited tracking.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$who-its-for$q$, $q$Who Lunatask is for$q$, 2, ARRAY[$q$Lunatask is aimed at individuals with ADHD, students, teachers, and privacy-conscious users who want tasks, habits, and personal tracking combined in one encrypted app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Amazing Marvin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A highly customizable task manager built for ADHD and procrastination, with 100+ configurable productivity features.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$8/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Amazing Marvin is a customizable task manager for ADHD, with focus modes, time tracking, and a 14-day free trial.$q$,
  og_description = $q$Amazing Marvin is a customizable task manager for ADHD, with focus modes, time tracking, and a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '43183bc9-0de0-415c-ba7d-2669401c12df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '43183bc9-0de0-415c-ba7d-2669401c12df' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Super Focus Mode$q$, $q$Shows only one task at a time to reduce overwhelm and decision fatigue.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Task Jar$q$, $q$Randomly selects a task from a list to help overcome decision paralysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Procrastination Wizard$q$, $q$Walks users through breaking a task into smaller, more approachable steps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Day planning with capacity feedback$q$, $q$Schedules tasks onto a day view while giving feedback on planned workload.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Pomodoro timer and time tracking$q$, $q$Includes a customizable Pomodoro timer and time tracking per task.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Accountability Pledge$q$, $q$Lets users put financial stakes on hitting task deadlines.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Extremely customizable, with 100+ features and multiple view layouts (Kanban, list, grid, calendar)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Built specifically around ADHD and procrastination-focused workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Available on Mac, Windows, Web, iOS, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Offers pay-what-you-can pricing and a student discount for those facing financial barriers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$No free tier; only a 14-day free trial before requiring a subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Extensive customization options can create a learning curve for new users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Specific pricing tiers beyond the single Pro plan are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Does Amazing Marvin have a free plan?$q$, $q$No, Amazing Marvin does not have a free tier, but it offers a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$How much does Amazing Marvin cost?$q$, $q$Marvin Pro costs $8/month, or $96/year when billed annually (a 33% saving).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Who is Amazing Marvin designed for?$q$, $q$It is designed for people with ADHD, chronic procrastinators, and anyone wanting a highly personalized productivity system.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Is there a student discount?$q$, $q$Yes, Amazing Marvin offers a 50% student discount available upon request, plus a pay-what-you-can option for those facing financial hardship.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Overcoming task overwhelm$q$, $q$Users rely on Super Focus Mode and the Task Jar to reduce decision fatigue around what to work on next.$q$, $q$People with ADHD or chronic procrastination$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Customized productivity workflows$q$, $q$Users build a personalized system by combining Marvin's many optional features and views.$q$, $q$Productivity enthusiasts who want a tailored system$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$Marvin Pro$q$, $q$$8/month ($96/year)$q$, $q$monthly$q$, $q$["Unlimited tasks and projects","Custom workflows and views","Analytics and insights","Multi-platform access (web, Mac, Windows, iOS, Android)","Personal email support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$overview$q$, $q$What is Amazing Marvin?$q$, 2, ARRAY[$q$Amazing Marvin is a task management app built around deep customization, offering more than 100 optional features such as Super Focus Mode, a Task Jar, and a Procrastination Wizard. It was created by a founder addressing her own struggles with overwhelm in existing task managers.$q$, $q$The app is subscription-based with a single Pro plan, offered after a 14-day free trial, and is available on Mac, Windows, Web, iOS, and Android.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', $q$who-its-for$q$, $q$Who Amazing Marvin is for$q$, 2, ARRAY[$q$Amazing Marvin is aimed at people with ADHD, chronic procrastinators, and anyone who wants to build a highly personalized task management workflow rather than use a one-size-fits-all app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43183bc9-0de0-415c-ba7d-2669401c12df', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Sorted 3 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A hyper-scheduling app for Mac and iOS that unifies tasks, calendar events, and notes into one timeline.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$14.99 (iOS PRO, one-time)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sorted 3 combines tasks, calendar events, and notes into a unified timeline for Mac and iOS hyper-scheduling.$q$,
  og_description = $q$Sorted 3 combines tasks, calendar events, and notes into a unified timeline for Mac and iOS hyper-scheduling.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Unified timeline$q$, $q$Combines tasks, calendar events, and notes into a single scheduling timeline.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Auto-scheduling$q$, $q$Automatically places tasks into available time slots on the timeline.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Time Ruler$q$, $q$A visual time-blocking tool for planning the day in detail.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Support for simple and complex workflows$q$, $q$Works for basic task checking as well as more complex project management.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$4.8-star App Store rating across 21,000+ reviews$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Free tier available on both iOS and macOS before upgrading to PRO$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Recognized as App Store App of the Day in 130+ regions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Time-blocking and auto-scheduling combine tasks, events, and notes in one view$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$PRO unlock is priced separately on iOS ($14.99) and macOS ($24.99)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Only available on Apple platforms (iOS and macOS), no Android, Windows, or web version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Limited company information published on the official site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Is Sorted 3 free?$q$, $q$Yes, Sorted 3 has a free tier on both iOS and macOS, with a paid PRO unlock for additional features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$How much is Sorted 3 PRO?$q$, $q$PRO is $14.99 on iOS and $24.99 on macOS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$What platforms is Sorted 3 available on?$q$, $q$Sorted 3 is available on iOS and macOS only.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$What does Sorted 3 do?$q$, $q$It combines tasks, calendar events, and notes into a unified timeline, with auto-scheduling and time-blocking tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Hyper-scheduled daily planning$q$, $q$Users plan their entire day, including tasks and events, on one unified timeline.$q$, $q$Students and professionals seeking detailed scheduling$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$ADHD-friendly time blocking$q$, $q$Users with ADHD use the Time Ruler and auto-scheduling to structure their day visually.$q$, $q$People with ADHD$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Free (iOS)$q$, $q$$0$q$, NULL, $q$["Core task, calendar, and note features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$PRO (iOS)$q$, $q$$14.99$q$, NULL, $q$["Full unified timeline and auto-scheduling features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Free (macOS)$q$, $q$$0$q$, NULL, $q$["Core task, calendar, and note features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$PRO (macOS)$q$, $q$$24.99$q$, NULL, $q$["Full unified timeline and auto-scheduling features"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$overview$q$, $q$What is Sorted 3?$q$, 2, ARRAY[$q$Sorted 3 is a Mac and iOS app that combines tasks, calendar events, and notes into a single scheduling timeline, enabling what it calls 'hyper-scheduling' of daily activities.$q$, $q$It offers a free tier on both platforms, with a one-time PRO unlock that adds the full auto-scheduling and time-blocking feature set.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$who-its-for$q$, $q$Who Sorted 3 is for$q$, 2, ARRAY[$q$Sorted 3 targets students, professionals, and people with ADHD who want to schedule tasks, events, and notes together in one detailed timeline rather than juggling separate apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── NotePlan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A markdown-based notes, tasks, and calendar app storing plaintext files, with AI note tools for Mac, iOS, and web.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$8.33/month (billed annually)$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$NotePlan combines markdown notes, tasks, and a calendar in one plaintext-based app, with a 7-day free trial.$q$,
  og_description = $q$NotePlan combines markdown notes, tasks, and a calendar in one plaintext-based app, with a 7-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b839ece-85d0-4b47-9358-2feed4175b10';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b839ece-85d0-4b47-9358-2feed4175b10' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Daily, weekly, and monthly notes$q$, $q$Digital planning notes integrated with calendar views for different timeframes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Time-blocking$q$, $q$Schedule tasks directly onto the calendar with drag-and-drop time blocking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Bi-directional linking$q$, $q$Link notes together and reference tasks or notes across the workspace.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Plaintext markdown storage$q$, $q$All content is stored as plaintext markdown files, enabling portability and offline access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Google Calendar sync$q$, $q$View and create Google Calendar events directly inside NotePlan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$AI note tools$q$, $q$Includes a Smart Note Assistant for writing/summarizing and Memo AI, which turns voice notes into structured insights.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Plugins and templates$q$, $q$Supports JavaScript-based plugins, custom templates, and themes for automation and formatting.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Data is stored as plaintext markdown, avoiding lock-in to a proprietary format$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Combines notes, tasks, and calendar in a single app rather than separate tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$AI features for voice transcription and note summarization$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Ranked among Apple's Top 10 Notes apps$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$No free tier; only a 7-day free trial before requiring a subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Primarily built for the Apple ecosystem (Mac, iPhone, iPad), with a web app as the main non-Apple option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$No confirmed native Windows, Android, or Linux app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Does NotePlan have a free plan?$q$, $q$No, NotePlan does not have a permanent free plan, but it offers a 7-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$How much does NotePlan cost?$q$, $q$NotePlan is $8.33/month billed annually ($99.99/year), or $12/month billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$What platforms does NotePlan support?$q$, $q$NotePlan is available on Mac, iPhone, iPad, and as a web app.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$How is my data stored in NotePlan?$q$, $q$NotePlan stores notes as plaintext markdown files, which sync across devices and support offline access.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Unified planning and note-taking$q$, $q$Professionals combine daily notes, tasks, and calendar events in one workspace to avoid switching apps.$q$, $q$Tech-savvy professionals and entrepreneurs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Voice-to-note capture$q$, $q$Users record voice notes on iPhone that are transcribed and structured with AI.$q$, $q$Mobile-first note takers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Monthly$q$, $q$$12/month$q$, $q$monthly$q$, $q$["All core notes, tasks, and calendar features","AI note tools","7-day free trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$Annual$q$, $q$$8.33/month ($99.99/year)$q$, $q$annual$q$, $q$["All core notes, tasks, and calendar features","AI note tools","7-day free trial"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$overview$q$, $q$What is NotePlan?$q$, 2, ARRAY[$q$NotePlan is a productivity app that combines daily notes, task management, and calendar views, storing all content as plaintext markdown files. It has been available since 2016.$q$, $q$The app includes AI-assisted features such as a Smart Note Assistant for writing and summarizing, and Memo AI for turning voice recordings into structured notes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', $q$who-its-for$q$, $q$Who NotePlan is for$q$, 2, ARRAY[$q$NotePlan is built for tech-savvy professionals and entrepreneurs on Mac and iOS who want notes, tasks, and calendar events unified in a single, markdown-based workspace.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Bear ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A markdown notes app for Mac and iOS with tagging, iCloud sync, and export to multiple formats.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Bear is a markdown notes app for Mac and iOS with tags, iCloud sync, and export to PDF, DOCX, and more.$q$,
  og_description = $q$Bear is a markdown notes app for Mac and iOS with tags, iCloud sync, and export to PDF, DOCX, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Markdown editing$q$, $q$Write notes with markdown formatting, including text, photos, tables, and to-do lists.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Tag-based organization$q$, $q$Organize notes with nested tags and choose from over 250 icon options.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Multi-format export$q$, $q$Export notes as TXT, Markdown, PDF, HTML, DOCX, ePub, or JPG.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Document scanning and OCR$q$, $q$Scan documents into notes and search scanned or handwritten text via OCR.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$iCloud sync$q$, $q$Syncs notes across Apple devices via iCloud, available on the Pro plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Themes and customization$q$, $q$Includes 28+ themes and 15 app icon options for personalizing the interface.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Note encryption$q$, $q$Individual notes can be encrypted for added privacy.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Free tier available with local access, document scanning, and basic export$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Won an Apple Design Award (2017) and App of the Year (2016)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Deep markdown and export format support, including DOCX and ePub$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$7-day free trial before the Pro subscription begins$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$iCloud sync and full export formats require the paid Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Only available on Mac, iPhone, and iPad, with no Windows or Android app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Free tier is limited to 3 themes and 1 app icon$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Is Bear free?$q$, $q$Yes, Bear has a free tier with local note access, document scanning, basic export, 3 themes, and 1 app icon.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$How much does Bear Pro cost?$q$, $q$Bear Pro is $2.99/month or $29.99/year, after a 7-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$What platforms does Bear support?$q$, $q$Bear is available on Mac, iPhone, and iPad only.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Who makes Bear?$q$, $q$Bear is developed by Shiny Frog.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Everyday markdown note-taking$q$, $q$Users capture and organize notes with markdown formatting and tags across Apple devices.$q$, $q$Casual note-takers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Writing and long-form documents$q$, $q$Writers use Bear's export formats and organization to draft and export longer documents.$q$, $q$Writers and content creators$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Free$q$, $q$$0$q$, NULL, $q$["Local access","Document scanning","Basic export","3 themes","1 app icon"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Bear Pro$q$, $q$$2.99/month ($29.99/year)$q$, $q$monthly$q$, $q$["Advanced export formats","All themes","iCloud sync","OCR search"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$overview$q$, $q$What is Bear?$q$, 2, ARRAY[$q$Bear is a markdown note-taking app for Apple devices, focused on a simple, polished writing experience with tag-based organization and multiple export formats.$q$, $q$It offers a free tier for local note-taking, with a Pro subscription that adds iCloud sync, additional themes, and OCR search over scanned documents.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$who-its-for$q$, $q$Who Bear is for$q$, 2, ARRAY[$q$Bear suits Apple users who want an elegant, markdown-based notes app, from casual note-takers to writers managing longer documents and projects.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Ulysses ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ulysses is a distraction-free Markdown writing app for Mac, iPad, and iPhone with project organization and direct publishing.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$5.99/month ($39.99/year billed annually)$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ulysses is a Mac, iPad, and iPhone writing app with Markdown editing, project organization, and direct blog publishing. From $5.99/month.$q$,
  og_description = $q$Ulysses is a Mac, iPad, and iPhone writing app with Markdown editing, project organization, and direct blog publishing. From $5.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '96f26d26-8a1d-438a-a8a3-ab3602c704c2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '96f26d26-8a1d-438a-a8a3-ab3602c704c2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Markdown-based Editor$q$, $q$A distraction-free writing environment that uses simple text markup for formatting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Project Organization$q$, $q$Organize large writing projects with a library, groups, and filters.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Grammar & Style Checker$q$, $q$A built-in checker supports more than 20 languages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Multi-format Export$q$, $q$Export finished work to PDF, Word, ebook formats, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Direct Publishing$q$, $q$Publish directly to WordPress, Ghost, Medium, and Micro.blog.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Cross-device Sync$q$, $q$iCloud sync keeps writing up to date across Mac, iPad, and iPhone.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Writing Goals$q$, $q$Set word-count goals and track progress toward them.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Clean, distraction-free writing interface$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Deep project and library organization for long-form work$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Native apps for Mac, iPad, and iPhone with iCloud sync$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Built-in grammar and style checking in 20+ languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Direct publishing integrations to WordPress, Ghost, Medium, and Micro.blog$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$No Windows or web version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$No permanent free plan — a paid subscription is required after the trial$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Markup-based formatting has a learning curve for new users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$What platforms does Ulysses run on?$q$, $q$Mac, iPad, and iPhone; there is no Windows or web version.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Is there a free plan?$q$, $q$No permanent free plan; Ulysses offers a free trial before requiring a paid subscription.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$How much does Ulysses cost?$q$, $q$$5.99 per month, or $39.99 per year billed annually, per the official pricing page.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Can I publish directly from Ulysses?$q$, $q$Yes, to WordPress, Ghost, Medium, and Micro.blog.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Does Ulysses support grammar checking?$q$, $q$Yes, its built-in checker covers more than 20 languages.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Long-form authors$q$, $q$Writers drafting books or long manuscripts use Ulysses' library and project organization to manage multiple documents.$q$, $q$Novelists and long-form authors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Bloggers$q$, $q$Bloggers write in Ulysses and publish directly to WordPress, Ghost, or Medium without leaving the app.$q$, $q$Bloggers and content publishers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Academic and professional writers$q$, $q$Writers producing structured documents use goals and export options to move from draft to a finished PDF or Word file.$q$, $q$Students and professional writers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Ulysses Subscription (Monthly)$q$, $q$$5.99$q$, $q$monthly$q$, $q$["Access on Mac, iPad, and iPhone","iCloud sync","Apple Family Sharing for up to 5 members","Free trial included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$Ulysses Subscription (Annual)$q$, $q$$39.99$q$, $q$annual$q$, $q$["Same features as the monthly plan, billed yearly"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$overview$q$, $q$What is Ulysses?$q$, 2, ARRAY[$q$Ulysses is a writing application built around a distraction-free, Markdown-based editor combined with project management tools for large documents. It runs natively on Mac, iPad, and iPhone, syncing writing across devices via iCloud.$q$, $q$The app organizes work with a library and project structure, includes a grammar and style checker supporting more than 20 languages, and lets writers export or publish directly to formats like PDF, Word, and ebooks, or to platforms such as WordPress, Ghost, Medium, and Micro.blog.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', $q$who-its-for$q$, $q$Who Ulysses is for$q$, 2, ARRAY[$q$Ulysses suits authors, bloggers, and professional writers on Apple devices who want a focused writing environment with strong document organization, without needing Windows or web access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96f26d26-8a1d-438a-a8a3-ab3602c704c2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Obsidian ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Obsidian is a free, local-first Markdown note app with backlinks, graph view, canvas, and an open plugin API.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$4/user/month (Sync add-on, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Arabic$q$, $q$Bengali$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$, $q$Italian$q$, $q$Japanese$q$, $q$Korean$q$, $q$Polish$q$, $q$Portuguese (Brazilian)$q$, $q$Romanian$q$, $q$Russian$q$, $q$Swedish$q$, $q$Chinese (Simplified)$q$]::text[],
  seo_meta_description = $q$Obsidian is a free Markdown note-taking app with backlinks, graph view, canvas, and a plugin API. Optional paid Sync and Publish add-ons.$q$,
  og_description = $q$Obsidian is a free Markdown note-taking app with backlinks, graph view, canvas, and a plugin API. Optional paid Sync and Publish add-ons.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '45916754-f5bf-43e2-98ed-4d4cec40d20c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '45916754-f5bf-43e2-98ed-4d4cec40d20c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Local Markdown Files$q$, $q$Notes are stored as plain-text Markdown files you control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Bidirectional Linking$q$, $q$Link notes together and see backlinks for every note.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Graph View$q$, $q$Visualize the relationships between notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Canvas$q$, $q$A visual space for brainstorming and diagramming.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Plugin Ecosystem$q$, $q$Thousands of community plugins and themes, built on an open API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Optional Sync & Publish$q$, $q$Paid add-ons for cross-device sync and web publishing.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Core app is completely free with no feature limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Notes stored as local plain-text Markdown files, avoiding lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Extensive community plugin and theme ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Open API available for custom plugin development$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Optional end-to-end encrypted Sync$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Sync and Publish require separate paid subscriptions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Steeper learning curve than simpler note apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Organizational/commercial use requires a paid Commercial License$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Is Obsidian free?$q$, $q$Yes, the core app is free with no sign-up required; paid add-ons cover Sync and Publish.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Where are my notes stored?$q$, $q$As local plain-text Markdown files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Can I extend Obsidian?$q$, $q$Yes, via an open API and a large community plugin ecosystem.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$How much does Sync cost?$q$, $q$$4/user/month billed annually, or $5/user/month billed monthly.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Is there a commercial license?$q$, $q$Yes, $50/user/year for organizational use.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Personal knowledge management$q$, $q$Individuals build a personal wiki of linked notes stored locally as Markdown files.$q$, $q$Knowledge workers and researchers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Developers extending Obsidian$q$, $q$Developers build custom plugins and themes using Obsidian's open API.$q$, $q$Developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Teams needing shared vaults$q$, $q$Teams pay for Sync to collaborate on shared vaults across devices.$q$, $q$Small teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Obsidian Core$q$, $q$Free$q$, NULL, $q$["Unlimited local notes","No sign-up required","Full app functionality"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Sync$q$, $q$$4/user/month (annual) or $5/user/month (monthly)$q$, $q$monthly$q$, $q$["Cross-device sync","End-to-end encryption","Version history","Shared vault collaboration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Publish$q$, $q$$8/site/month (annual) or $10/site/month (monthly)$q$, $q$monthly$q$, $q$["Web publishing","Customizable themes","Graph and full-text search"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$Commercial License$q$, $q$$50/user/year$q$, $q$annual$q$, $q$["Organizational use license","Featured organization status"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$overview$q$, $q$What is Obsidian?$q$, 2, ARRAY[$q$Obsidian is a note-taking application that stores notes as local plain-text Markdown files and links them together with backlinks and a graph view. It includes a Canvas feature for visual brainstorming and diagramming.$q$, $q$The core app is free with no sign-up required and no feature limits. Obsidian's open API supports an extensive community ecosystem of plugins and themes, and optional paid Sync and Publish services add cross-device synchronization and web publishing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$who-its-for$q$, $q$Who Obsidian is for$q$, 2, ARRAY[$q$Obsidian fits people who want full ownership of their notes as local files, developers who want to extend the app via plugins, and teams willing to pay for Sync to collaborate on shared vaults.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45916754-f5bf-43e2-98ed-4d4cec40d20c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Capacities ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Capacities organizes notes as connected objects (people, books, projects) instead of files, with a free core plan and a paid Pro tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Capacities organizes notes as connected objects like people, books, and projects. Free core plan; Pro adds AI, queries, and calendar sync.$q$,
  og_description = $q$Capacities organizes notes as connected objects like people, books, and projects. Free core plan; Pro adds AI, queries, and calendar sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5816d708-5e16-4d8f-8847-bc4d396ab602';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5816d708-5e16-4d8f-8847-bc4d396ab602' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Object-based Notes$q$, $q$Treats entries as typed objects, such as people, books, or ideas, instead of plain files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Daily Notes Inbox$q$, $q$Capture thoughts in a daily inbox before organizing them.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Backlinks$q$, $q$See all connections to a note at a glance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Related Content$q$, $q$Automatic discovery of previously made connections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Custom Object Types$q$, $q$Define your own structured object types.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Full Data Export$q$, $q$Export all content in standard formats on any plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$AI Features (Pro)$q$, $q$AI chat, auto-fill properties, and smart queries on the Pro plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Free plan with full data export and no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Object-based model goes beyond simple file/folder note apps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Automatic related-content discovery surfaces existing connections$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$GDPR-compliant, EU-based data centers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$User-funded (Believer plan) rather than venture-capital backed$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Exact Pro and Believer prices are not published as fixed figures on the main pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$AI features are gated behind the paid Pro tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$No confirmed offline-first local file storage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Is Capacities free?$q$, $q$Yes, the core product is free with full export capability and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$What does Capacities Pro add?$q$, $q$AI chat, smart queries, calendar integration, and task actions with tools like Todoist.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$What is Capacities Believer?$q$, $q$A higher-tier subscription positioned as supporting the company's mission.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Can I export my data?$q$, $q$Yes, Capacities offers full data export in standard formats on every plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Is Capacities venture-backed?$q$, $q$No, the company describes itself as user-funded rather than VC-backed.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Personal knowledge management$q$, $q$Individuals capture daily notes and connect them into an object-based knowledge base.$q$, $q$Knowledge workers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Researchers organizing sources$q$, $q$Researchers use custom object types to track papers, people, and projects as linked entities.$q$, $q$Researchers and students$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Free$q$, $q$Free$q$, NULL, $q$["Full export capability","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Pro$q$, $q$Not publicly listed (monthly or yearly billing, ~16% annual savings)$q$, $q$monthly$q$, $q$["AI chat and auto-fill properties","Smart queries","Calendar integration","Task actions (e.g., Todoist)","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$Believer$q$, $q$Not publicly listed$q$, NULL, $q$["All Pro features","Supports company mission","Early access to features"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$overview$q$, $q$What is Capacities?$q$, 2, ARRAY[$q$Capacities is a note-taking platform that organizes information as interconnected objects, such as people, books, or projects, rather than files in folders. A daily notes inbox lets users capture ideas before sorting them into structured object types.$q$, $q$The core product is free, with full data export and no credit card required. Capacities Pro adds AI chat, smart queries, and calendar integration, while a Believer tier supports the company's development.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', $q$who-its-for$q$, $q$Who Capacities is for$q$, 2, ARRAY[$q$Capacities suits knowledge workers and researchers who want to organize information as structured, linked objects rather than a traditional folder hierarchy.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5816d708-5e16-4d8f-8847-bc4d396ab602', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Heptabase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Heptabase is a visual whiteboard-based knowledge base with an AI tutor and PDF annotation for students and researchers.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$8.99/month (Pro)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Heptabase is a visual whiteboard knowledge app with an AI tutor, PDF annotation, and Readwise/Zotero integration. Plans start at $8.99/month.$q$,
  og_description = $q$Heptabase is a visual whiteboard knowledge app with an AI tutor, PDF annotation, and Readwise/Zotero integration. Plans start at $8.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd2bd44f6-8343-46e6-bef6-8aab0d7ad1bf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd2bd44f6-8343-46e6-bef6-8aab0d7ad1bf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Visual Whiteboards$q$, $q$Card-based whiteboards for organizing notes and research.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$PDF Annotation$q$, $q$Highlight and annotate PDFs directly in the app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$AI Tutor$q$, $q$AI-guided learning sessions, included on the Premium plan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Bi-directional Linking$q$, $q$Connect notes and cards across whiteboards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Web Clipper$q$, $q$Capture web content into the knowledge base.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Readwise & Zotero Integration$q$, $q$Import highlights and references from Readwise and Zotero.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Real-time Collaboration$q$, $q$Work with others on shared whiteboards.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Cross-platform Availability$q$, $q$Available on macOS, Windows, Linux, iOS, Android, and the web.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Available on macOS, Windows, Linux, iOS, Android, and the web$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Visual whiteboard approach suited to research and learning workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Built-in PDF annotation with Readwise and Zotero import$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$AI tutor and AI chat included on paid plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Backed by Y Combinator, Kleiner Perkins, and other investors$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$No permanent free plan; only a 7-day free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$AI features are metered by monthly credit limits$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Premium/Premium+ tiers are required for unlimited PDF parsing and top-tier AI models$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Does Heptabase have a free plan?$q$, $q$No permanent free plan is offered; a 7-day free trial is available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$How much does Heptabase cost?$q$, $q$Pro is $8.99/month, Premium is $17.99/month, and Premium+ is $53.99/month (each cheaper billed yearly).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$What AI models does Heptabase support?$q$, $q$The Premium plan adds access to premium AI models from OpenAI, Google, and Anthropic.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Can I annotate PDFs?$q$, $q$Yes, and Premium plans add unlimited PDF parsing and OCR.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$What platforms is Heptabase available on?$q$, $q$macOS, Windows, Linux, iOS, Android, and the web.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Students building a knowledge base$q$, $q$Students use whiteboards and the AI tutor to organize course material into a lasting knowledge base.$q$, $q$Students$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Researchers managing literature$q$, $q$Researchers import Zotero references and Readwise highlights onto visual whiteboards.$q$, $q$Researchers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Pro$q$, $q$$8.99/month$q$, $q$monthly$q$, $q$["Unlimited notes, whiteboards, and tags","Image uploads and collaborator invites","PDF highlights and YouTube transcripts","AI chat with 100 AI credits/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Premium$q$, $q$$17.99/month$q$, $q$monthly$q$, $q$["Everything in Pro","Unlimited PDF uploads and OCR parsing","Premium AI models (OpenAI, Google, Anthropic)","AI tutor access","1,800 AI credits/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$Premium+$q$, $q$$53.99/month$q$, $q$monthly$q$, $q$["Everything in Premium","33% discount on additional AI credits","8,100 AI credits/month"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$overview$q$, $q$What is Heptabase?$q$, 2, ARRAY[$q$Heptabase is a visual knowledge base built around card-based whiteboards, aimed at students, researchers, and lifelong learners. It combines note-taking, PDF annotation, and an AI tutor for guided learning sessions.$q$, $q$The app is available on macOS, Windows, Linux, iOS, Android, and the web, and integrates with Readwise and Zotero for importing highlights and references. Paid plans range from Pro at $8.99/month up to Premium+ at $53.99/month, each with a different monthly AI credit allowance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', $q$who-its-for$q$, $q$Who Heptabase is for$q$, 2, ARRAY[$q$Heptabase is aimed at students and researchers who want a visual, whiteboard-driven way to organize course material, papers, and notes, with AI assistance for learning and review.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2bd44f6-8343-46e6-bef6-8aab0d7ad1bf', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Milanote ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Milanote is a visual tool for organizing creative projects with notes, images, and boards, offering a free plan and paid Pro/Team tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$9.99/month billed annually ($12.50/month billed monthly)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Milanote helps creative teams organize projects with visual boards, notes, and images. Free plan available; Pro plans start at $9.99/month.$q$,
  og_description = $q$Milanote helps creative teams organize projects with visual boards, notes, and images. Free plan available; Pro plans start at $9.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05e24cd3-962a-414e-b238-79b5d2f5477f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05e24cd3-962a-414e-b238-79b5d2f5477f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Visual Boards$q$, $q$Combine notes, images, and files on a flexible visual board.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Multi-format Content$q$, $q$Save notes, images, video, and sketches from multiple sources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Industry Templates$q$, $q$Templates for filmmaking, writing, design, photography, marketing, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Team Collaboration$q$, $q$Share boards with edit, comment, or view-only permissions.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Free plan available with no time limit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Used by well-known companies including Nike, IDEO, Netflix, and Google$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Wide range of industry-specific templates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Flexible collaboration permissions (edit/comment/view)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Available on desktop, web, and mobile (iOS/Android)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Free plan is capped at 100 notes/images/links and 10 file uploads$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Team plan pricing rises for larger groups (up to 50 people at $49/month billed annually)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Monthly billing ($12.50) costs more than annual billing ($9.99/month)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Is Milanote free?$q$, $q$Yes, the Free plan allows up to 100 notes, images, or links and 10 file uploads with no time limit.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$How much is Milanote Pro?$q$, $q$$9.99/month billed annually, or $12.50/month billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Is there a Team plan?$q$, $q$Yes, $49/month billed annually for 10-50 people; larger teams should contact sales.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$What platforms does Milanote support?$q$, $q$Desktop, web, and mobile apps for iOS and Android, plus iPad.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Does Milanote offer templates?$q$, $q$Yes, for filmmaking, writing, design, photography, marketing, and other creative fields.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Creative project planning$q$, $q$Creative teams collect inspiration and organize projects visually on shared boards.$q$, $q$Designers and creative teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Content and marketing planning$q$, $q$Marketers and content teams use templates to plan campaigns and content visually.$q$, $q$Marketing teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Free$q$, $q$Free$q$, NULL, $q$["100 notes, images or links","10 file uploads","Unlimited shared boards"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Pro$q$, $q$$9.99/month billed annually ($12.50/month billed monthly)$q$, $q$monthly$q$, $q$["Unlimited notes, images or links","Unlimited file uploads","Unlimited shared boards"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$Team$q$, $q$$49/month billed annually$q$, $q$annual$q$, $q$["For 10-50 people","Unlimited notes, images or links","Unlimited file uploads","Unlimited shared boards"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$overview$q$, $q$What is Milanote?$q$, 2, ARRAY[$q$Milanote is a visual organization tool for creative projects that lets users combine notes, images, video, and sketches on flexible boards. It includes industry-specific templates for filmmaking, writing, design, photography, and marketing.$q$, $q$The Free plan supports up to 100 notes, images, or links with 10 file uploads and unlimited shared boards. Pro removes those limits starting at $9.99/month billed annually, and a Team plan covers larger groups.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', $q$who-its-for$q$, $q$Who Milanote is for$q$, 2, ARRAY[$q$Milanote is built for creative teams and individuals, such as designers, filmmakers, and marketers, who need a visual way to collect inspiration and plan projects.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05e24cd3-962a-414e-b238-79b5d2f5477f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Scrintal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Scrintal is a visual note-taking and research tool built on an infinite canvas, with an AI assistant, for Mac, Windows, and web.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Stockholm, Sweden$q$,
  languages = '{}',
  seo_meta_description = $q$Scrintal is a visual research tool with an infinite canvas, AI assistant, and templates for organizing notes, PDFs, and connected ideas.$q$,
  og_description = $q$Scrintal is a visual research tool with an infinite canvas, AI assistant, and templates for organizing notes, PDFs, and connected ideas.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '44be1d54-c2e8-47bb-b553-cdc2120d6458';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '44be1d54-c2e8-47bb-b553-cdc2120d6458' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Infinite Canvas$q$, $q$A freeform space for brainstorming and organizing content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Multi-format Content$q$, $q$Add PDFs, images, notes, videos, and documents to boards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Bi-directional Links$q$, $q$Visually connect ideas with arrows and links.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$AI Assistant$q$, $q$Automates repetitive organization tasks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Templates$q$, $q$Templates built for study and research workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Real-time Collaboration$q$, $q$Work together on boards live.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Docs from Blocks$q$, $q$Turn canvas blocks into documents with a click.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Infinite canvas supports flexible visual organization$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Native apps for Mac (Apple Silicon and Intel) and Windows, plus web access$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$AI assistant helps automate repetitive organizational tasks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Stated user base of 10,000+ learners and researchers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Includes study and research templates$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Exact subscription pricing is not displayed as plain text on the official site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$No confirmed free plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Smaller company (Scrintal Labs AB) compared to larger note-taking competitors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$What is Scrintal?$q$, $q$A visual note-taking and research tool built around an infinite canvas.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$What platforms does Scrintal support?$q$, $q$macOS (Apple Silicon and Intel), Windows, and the web.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Does Scrintal include AI features?$q$, $q$Yes, an AI Assistant is built in to help automate repetitive tasks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Is there a paid plan?$q$, $q$Yes, Scrintal Pro offers unlimited docs/boards, unlimited file uploads, real-time collaboration, and priority support, billed monthly or annually.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Where is Scrintal based?$q$, $q$Scrintal Labs AB is headquartered in Stockholm, Sweden.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Visual research organization$q$, $q$Researchers connect PDFs, notes, and ideas on an infinite canvas instead of linear documents.$q$, $q$Researchers and academics$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Study planning$q$, $q$Students use Scrintal's study templates and canvas to organize course material.$q$, $q$Students$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$Scrintal Pro$q$, $q$Not publicly listed (billed monthly or annually)$q$, $q$monthly$q$, $q$["Unlimited docs & boards","Unlimited file uploads","Real-time collaboration","Priority support","Community calls with team"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$overview$q$, $q$What is Scrintal?$q$, 2, ARRAY[$q$Scrintal is a visual note-taking and research platform organized around an infinite canvas, where users add PDFs, images, notes, videos, and documents and connect them with visual links.$q$, $q$An AI Assistant automates repetitive organizational tasks, and study/research templates help structure boards. Scrintal is available on macOS, Windows, and the web, from Scrintal Labs AB in Stockholm, Sweden.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$who-its-for$q$, $q$Who Scrintal is for$q$, 2, ARRAY[$q$Scrintal is aimed at researchers, academics, and students who prefer organizing notes and sources visually on a canvas rather than in linear documents.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44be1d54-c2e8-47bb-b553-cdc2120d6458', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Plane Project Management ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Plane is an AI-native project management platform with cycles, a wiki, and dashboards, with a free cloud tier and self-hosted deployment.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0 (Free tier); Pro from $6/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Plane is an AI-native project management tool with cycles, wikis, and dashboards. Free for up to 12 users; Pro starts at $6/seat/month.$q$,
  og_description = $q$Plane is an AI-native project management tool with cycles, wikis, and dashboards. Free for up to 12 users; Pro starts at $6/seat/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '68399520-7bce-4cbd-8fad-93972635411f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '68399520-7bce-4cbd-8fad-93972635411f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Multiple Views$q$, $q$Board, Spreadsheet, List, and Gantt views for work items.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Cycles$q$, $q$Time-boxed cycles with velocity tracking and burndown charts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Built-in Wiki$q$, $q$Project documentation alongside tasks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Dashboards$q$, $q$Real-time tracking of project metrics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Initiatives & Epics$q$, $q$Rollup tracking across multiple projects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Plane AI$q$, $q$Context-aware AI agents for task automation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Migration Tools$q$, $q$Import from Jira, Linear, ClickUp, Asana, and Monday.com.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Self-hosted Option$q$, $q$Docker or Kubernetes deployment with full data ownership.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Free cloud tier for up to 12 users with 500 AI credits/seat$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Self-hosted deployment available for full data ownership$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Migration tools from major competitors (Jira, Linear, ClickUp, Asana, Monday.com)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Built-in wiki, dashboards, and initiative/epic tracking$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$SOC 2, ISO 27001, GDPR, and CCPA compliance noted$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Advanced features (custom work item types, time tracking) require the paid Pro tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Enterprise Grid requires a custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$AI features are metered by per-seat credit allowances$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Is Plane free?$q$, $q$Yes, the Free plan is $0/seat/month for up to 12 users with core project management features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$How much is Plane Pro?$q$, $q$$6/seat/month, with a discount for annual billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Can Plane be self-hosted?$q$, $q$Yes, commercial and air-gapped self-hosted editions are available alongside the cloud product.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Does Plane include AI features?$q$, $q$Yes, "Plane AI" offers context-aware agents, with AI credits allotted per plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Can I migrate from other tools?$q$, $q$Yes, Plane supports migration from Jira, Linear, ClickUp, Asana, and Monday.com.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Startup project tracking$q$, $q$Small teams use the free tier's boards, cycles, and dashboards to manage projects.$q$, $q$Startups and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Enterprise program management$q$, $q$Larger organizations use Business or Enterprise Grid plans for advanced workflows, approvals, and audit logs.$q$, $q$Enterprise teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Self-hosted deployments$q$, $q$Organizations needing full data ownership deploy Plane via Docker or Kubernetes.$q$, $q$IT and DevOps teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Free$q$, $q$$0/seat/month$q$, $q$monthly$q$, $q$["Core project management","500 AI credits/seat","Up to 12 users"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Pro$q$, $q$$6/seat/month$q$, $q$monthly$q$, $q$["1,000 AI credits/seat","Custom work item types","Workspace wiki","Time tracking","Dashboards","5 guests per paid member"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Business$q$, $q$$13/seat/month$q$, $q$monthly$q$, $q$["2,000 AI credits/seat","Project templates","Recurring work items","Intake email/forms","Nested pages","Advanced dashboards"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$Enterprise Grid$q$, $q$Custom$q$, NULL, $q$["Flexible AI credits","Private/managed deployments","Granular access control","Multiple workflows with approvals","LDAP support","Audit logs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$overview$q$, $q$What is Plane?$q$, 2, ARRAY[$q$Plane is an AI-native project management platform combining task tracking, documentation, and AI-powered workflows in one workspace. It offers Board, Spreadsheet, List, and Gantt views, time-boxed cycles, a built-in wiki, and real-time dashboards.$q$, $q$Plane is available as a free cloud tier for up to 12 users, paid Pro and Business cloud tiers, a custom-quoted Enterprise Grid plan, and self-hosted commercial or air-gapped editions with migration tools from Jira, Linear, ClickUp, Asana, and Monday.com.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', $q$who-its-for$q$, $q$Who Plane is for$q$, 2, ARRAY[$q$Plane fits startups on its free tier, growing teams needing advanced workflow and dashboard features on Pro or Business, and enterprises or security-conscious organizations that need self-hosted or air-gapped deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68399520-7bce-4cbd-8fad-93972635411f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── OpenProject ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenProject is open-source project management software with Gantt charts and agile boards, offering a free Community edition and paid tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€5.95/user/month (Basic, minimum 25 users)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$, $q$Portuguese$q$]::text[],
  seo_meta_description = $q$OpenProject is open-source project management software with Gantt charts and agile boards. Free Community edition; paid plans from €5.95/user/month.$q$,
  og_description = $q$OpenProject is open-source project management software with Gantt charts and agile boards. Free Community edition; paid plans from €5.95/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Gantt Charts$q$, $q$Project planning and scheduling with Gantt charts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Agile Boards$q$, $q$Scrum and Kanban boards for agile teams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Team Planner$q$, $q$Visualize workload across the team.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Time Tracking & Cost Reporting$q$, $q$Track time and costs against projects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Meeting Management$q$, $q$Plan and document team meetings.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Integrations$q$, $q$Connects with Nextcloud, GitHub, GitLab, OneDrive/SharePoint, and XWiki.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$API & Customization$q$, $q$An open API for integration and customization.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Community Edition is free, open source (GPL v3), with no minimum user count$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Available as self-hosted or Enterprise Cloud SaaS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Wide integration support, including GitHub, GitLab, Nextcloud, and OneDrive/SharePoint$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Notable users include Siemens, Deutsche Bahn, and the Linux Foundation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$14-day free trial for cloud and on-premises paid tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Paid tiers require a minimum of 25 users (Basic/Professional) or 100+ (Premium)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Monthly billing carries a €1/user surcharge on Cloud Basic$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Corporate tier requires a custom quote and 250+ users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Is OpenProject free?$q$, $q$Yes, the Community Edition is free and open source under GPL v3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$How much do paid plans cost?$q$, $q$Basic is €5.95/user/month, Professional €10.95, and Premium €15.95 (25+ or 100+ user minimums apply); Corporate is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Can I try a paid plan first?$q$, $q$Yes, a 14-day trial is available for cloud and on-premises versions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$What languages does OpenProject support?$q$, $q$English, German, Spanish, French, and Portuguese, among others.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Can OpenProject integrate with other tools?$q$, $q$Yes, including Nextcloud, GitHub, GitLab, OneDrive/SharePoint, and XWiki.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Open-source self-hosting$q$, $q$Organizations self-host the free Community Edition for full control over their data.$q$, $q$IT teams and public-sector organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Enterprise project portfolios$q$, $q$Larger organizations use paid tiers for professional support, security add-ons, and Enterprise Cloud hosting.$q$, $q$Enterprises$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Community$q$, $q$Free$q$, NULL, $q$["Community features","Community support","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Basic$q$, $q$€5.95/user/month$q$, $q$monthly$q$, $q$["Minimum 25 users","Basic enterprise add-ons","Basic email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Professional$q$, $q$€10.95/user/month$q$, $q$monthly$q$, $q$["Minimum 25 users","Professional enterprise add-ons","Phone support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Premium$q$, $q$€15.95/user/month$q$, $q$monthly$q$, $q$["Minimum 100 users","Premium enterprise add-ons","Remote assistance support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$Corporate$q$, $q$Custom$q$, NULL, $q$["Minimum 250 users","OpenID Connect and openDesk integration","Dedicated support engineer"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$overview$q$, $q$What is OpenProject?$q$, 2, ARRAY[$q$OpenProject is an open-source project management platform offering Gantt charts, agile Scrum and Kanban boards, a Team Planner, time tracking, and cost reporting. It is licensed under GPL v3 and can be self-hosted or used via Enterprise Cloud.$q$, $q$Paid tiers (Basic, Professional, Premium, Corporate) add enterprise features and support levels, with a 14-day free trial available for cloud and on-premises versions. It integrates with tools including Nextcloud, GitHub, GitLab, and OneDrive/SharePoint.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$who-its-for$q$, $q$Who OpenProject is for$q$, 2, ARRAY[$q$OpenProject suits organizations that want an open-source, self-hostable project management tool, as well as enterprises that need professional support and Enterprise Cloud hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Taiga ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Taiga is an open-source agile project management tool with Kanban and Scrum boards, offering a free cloud tier and self-hosted deployment.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€5/month (Enthusiast plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Taiga is open-source agile project management software with Scrum and Kanban boards. Free cloud tier available; paid plans from €5/month.$q$,
  og_description = $q$Taiga is open-source agile project management software with Scrum and Kanban boards. Free cloud tier available; paid plans from €5/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd0bc05e-d67e-4870-a277-70ee9d9c0af0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd0bc05e-d67e-4870-a277-70ee9d9c0af0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Kanban Boards$q$, $q$Customizable boards with swimlanes and WIP limits.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Scrum Module$q$, $q$Sprint planning, backlog management, and burndown charts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Issue Tracking$q$, $q$Customizable issue types and priorities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Dashboards & Reporting$q$, $q$Team performance metrics and audit trails.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Custom Roles & Fields$q$, $q$Configurable roles, permissions, stages, and custom fields.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Zapier Integration$q$, $q$Connect Taiga to other tools via Zapier.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Open source with a free cloud tier (1 public + 1 private project)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Self-hosted and Private Cloud deployment options available$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Both Scrum and Kanban methodologies supported natively$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Translated into more than 20 languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Recognized as a high performer on G2 and Capterra$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Free tier limited to 10MB storage and one public/private project$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Higher tiers (Basic, Premium) needed for meaningful storage and unlimited projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Private Cloud and On-Premise pricing require a custom quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Is Taiga free?$q$, $q$Yes, a free cloud tier exists with 10MB storage and one public and one private project.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$How much does Taiga cost?$q$, $q$Enthusiast is €5/month, Basic €20/month, and Premium €60/month (cheaper billed annually); Private Cloud and On-Premise require a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Can Taiga be self-hosted?$q$, $q$Yes, On-Premise deployment is available with priority support and SLA options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Does Taiga support Scrum and Kanban?$q$, $q$Yes, both methodologies are built in as separate modules/board types.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$How many languages does Taiga support?$q$, $q$It has been translated into more than 20 languages.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Agile software teams$q$, $q$Cross-functional teams run sprints and track backlogs using Taiga's Scrum module.$q$, $q$Software development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Self-hosted deployments$q$, $q$Organizations requiring on-premise control deploy Taiga behind their own firewall or VPN.$q$, $q$IT and security-conscious organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Free$q$, $q$€0$q$, NULL, $q$["10MB storage","1 public project","1 private project","Unlimited users","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Enthusiast$q$, $q$€5/month (or €50/year)$q$, $q$monthly$q$, $q$["100MB storage","5 public projects","5 private projects","Unlimited users"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Basic$q$, $q$€20/month (or €200/year)$q$, $q$monthly$q$, $q$["500MB storage","Unlimited projects","Basic support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Premium$q$, $q$€60/month (or €600/year)$q$, $q$monthly$q$, $q$["3GB storage","Unlimited projects","Premium support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$Taiga Private Cloud$q$, $q$Custom$q$, NULL, $q$["8GB RAM, 2 vCPU, 100GB SSD storage","Unlimited projects and users","Managed hosting"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$On-Premise$q$, $q$Custom$q$, NULL, $q$["Priority support with SLA","Behind firewall/VPN deployment","Unlimited projects and users"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$overview$q$, $q$What is Taiga?$q$, 2, ARRAY[$q$Taiga is a free, open-source agile project management platform offering Kanban boards, a Scrum module with sprint planning and burndown charts, and customizable issue tracking.$q$, $q$It is available as a free cloud tier, paid cloud tiers (Enthusiast, Basic, Premium) with increasing storage and support levels, and custom-quoted Private Cloud or On-Premise deployment for teams that need to self-host.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', $q$who-its-for$q$, $q$Who Taiga is for$q$, 2, ARRAY[$q$Taiga suits agile software teams running Scrum or Kanban workflows, as well as organizations that prefer self-hosted or private-cloud deployment for security or compliance reasons.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd0bc05e-d67e-4870-a277-70ee9d9c0af0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Leantime ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Leantime is an open-source project management tool designed for neurodivergent users, with a free self-hosted edition and paid cloud plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$8/user/month (Pro, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Leantime is open-source project management built for ADHD, dyslexia, and autism. Free self-hosted edition; cloud Pro from $8/user/month.$q$,
  og_description = $q$Leantime is open-source project management built for ADHD, dyslexia, and autism. Free self-hosted edition; cloud Pro from $8/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cc8a6c27-5e21-4987-a514-54dffa799736';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cc8a6c27-5e21-4987-a514-54dffa799736' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$My Work Dashboard$q$, $q$A personal workspace with time blocking and notes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Multiple Project Views$q$, $q$Kanban, Table, and List views alongside Gantt charts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$AI Task Prioritization$q$, $q$AI-powered suggestions to help prioritize tasks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Retrospectives & Idea Management$q$, $q$Built-in team reflection and idea-tracking tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Timesheets & Time Tracking$q$, $q$Track hours against projects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Goal-based Structure$q$, $q$Link tasks to organizational goals.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Whiteboards & Blueprints$q$, $q$Visual planning tools for projects.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Free, self-hosted open-source Community Edition (AGPLv3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Designed specifically for neurodivergent users, including people with ADHD, dyslexia, and autism$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$14-day free trial on the paid cloud plan, no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Same feature set on monthly and annual paid plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$AI-powered task breakdown and status report generation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$No free cloud/SaaS tier — the free option requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$AI features are limited by a monthly credit allowance (500 credits) on Pro$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Enterprise features (SSO, audit logs, data residency) require custom pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Is Leantime free?$q$, $q$Yes, the open-source Community Edition is free to self-host under AGPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$How much is the cloud plan?$q$, $q$$10/user/month billed monthly, or $8/user/month billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Is there a free trial?$q$, $q$Yes, a 14-day free trial with no credit card required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Who is Leantime designed for?$q$, $q$It's designed for neurodivergent users, including people with ADHD, dyslexia, and autism.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Does Leantime include AI features?$q$, $q$Yes, including AI-powered task prioritization and status report generation, with 500 AI credits/month on Pro.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Neurodivergent-friendly project management$q$, $q$Individuals and teams who find traditional PM tools overwhelming use Leantime's simplified, goal-based workflow.$q$, $q$Neurodivergent professionals and teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Self-hosted teams$q$, $q$Organizations needing full control deploy the free open-source Community Edition via Docker.$q$, $q$IT teams and open-source users$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Self-hosted (AGPLv3)","Core functionality","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Leantime Pro (Monthly)$q$, $q$$10/user/month$q$, $q$monthly$q$, $q$["Unlimited to-dos and projects","AI-powered task management","500 AI credits/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$Leantime Pro (Annual)$q$, $q$$8/user/month$q$, $q$annual$q$, $q$["Same features as the monthly plan","17% savings versus monthly billing"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$overview$q$, $q$What is Leantime?$q$, 2, ARRAY[$q$Leantime is an open-source project management platform positioned as "project management for the non-project manager," designed specifically for neurodivergent users such as people with ADHD, dyslexia, and autism.$q$, $q$It offers a personal My Work Dashboard, Kanban/Table/List views, Gantt charts, whiteboards, timesheets, and AI-powered task prioritization. The Community Edition is free and open source (AGPLv3) for self-hosting, while a hosted cloud Pro plan starts at $8/user/month billed annually, with a 14-day free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', $q$who-its-for$q$, $q$Who Leantime is for$q$, 2, ARRAY[$q$Leantime is aimed at individuals and teams, including neurodivergent professionals, who want a simplified, goal-based project management workflow, whether self-hosted for free or via the paid cloud plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc8a6c27-5e21-4987-a514-54dffa799736', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;


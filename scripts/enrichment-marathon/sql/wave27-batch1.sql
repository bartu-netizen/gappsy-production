-- Enrichment marathon batch: Subskribe, Subskribe CPQ, Substack, Sudowrite, SugarCRM, SuiteCRM, Suno, Sunsama

-- ── Subskribe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Subskribe is a cloud platform that unifies CPQ, subscription billing, revenue recognition, and analytics for B2B SaaS companies, now owned by DealHub after a November 2025 acquisition.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$San Ramon, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Subskribe: Adaptive Quote-to-Revenue Platform for SaaS$q$, seo_title),
  seo_meta_description = COALESCE($q$Subskribe combines CPQ, billing, and revenue recognition in one platform for SaaS companies. Now part of DealHub. See features, pricing, and reviews.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Subskribe is a cloud-based quote-to-revenue platform for B2B SaaS companies, combining CPQ (configure, price, quote), subscription billing, revenue recognition, and analytics in a single system built on one data model. Founded in 2020 and headquartered in San Ramon, California, Subskribe raised roughly $18.4 million from investors including 8VC and Slow Ventures before being acquired by DealHub in November 2025 to form an agentic quote-to-revenue platform. It targets fast-growing SaaS and subscription businesses that need to handle complex, usage-based, tiered, and hybrid pricing models, mid-term contract changes, ramp deals, and multi-level approval workflows without stitching together separate CPQ and billing tools. Customers cited publicly include Chainguard, Zip, Beamery, Vivun, and Merge. Subskribe does not publish list pricing; prospects must contact sales for a custom quote based on products used, contract term, and seat count. The platform has been recognized as a G2 High Performer in CPQ, Subscription Billing, and Revenue Management for multiple consecutive quarters and was named a Notable Vendor in Forrester's Billing Solutions Landscape. It integrates natively with Salesforce and HubSpot and supports DocuSign e-signature and multi-currency billing.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0a76343-e065-4813-8f8c-fb490cece33b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0a76343-e065-4813-8f8c-fb490cece33b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Usage-based and hybrid pricing$q$, $q$Supports flat fee, tiered, volume, usage-based, and hybrid pricing models within a single quote.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Multi-level approval workflows$q$, $q$Configurable approval chains based on discount level, deal size, or payment terms, with Slack and email notifications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Mid-term change automation$q$, $q$Automatically prorates upgrades, downgrades, and amendments without manual recalculation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Revenue recognition engine$q$, $q$Automates ASC 606 revenue schedules for ramps, amendments, and complex multi-element deals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Native CRM integration$q$, $q$Two-way sync with Salesforce and HubSpot to keep quotes and opportunity data aligned.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Digital sales room$q$, $q$Collaborative online space for buyers and sellers to review and negotiate quotes together.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$SaaS analytics dashboards$q$, $q$Built-in reporting on ARR classifications, cohorts, and renewal metrics.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$E-signature integration$q$, $q$Native DocuSign support for closing signed contracts inside the platform.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Single data model connects quoting, billing, and revenue recognition, reducing reconciliation work$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Handles complex usage-based and hybrid pricing that many legacy CPQ tools struggle with$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Responsive customer support noted repeatedly in G2 reviews$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Recognized as a G2 High Performer across CPQ, billing, and revenue management categories$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Pricing is not public, making early-stage cost comparison difficult$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Smaller company size historically meant customer attention could be stretched as the client base grew$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$November 2025 acquisition by DealHub introduces uncertainty about long-term product roadmap and branding$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Best suited to mid-market and enterprise SaaS companies, less relevant for very small businesses$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$What is Subskribe used for?$q$, $q$Subskribe is used by B2B SaaS companies to manage quoting (CPQ), subscription billing, and revenue recognition in one connected platform instead of separate disconnected tools.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$How much does Subskribe cost?$q$, $q$Subskribe does not publish public pricing. Cost is based on the modules licensed, contract term, and usage, and requires a custom quote from sales.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Who owns Subskribe now?$q$, $q$Subskribe was acquired by DealHub, a CPQ and deal management company, in November 2025.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$When was Subskribe founded?$q$, $q$Subskribe was founded in 2020 and is headquartered in San Ramon, California.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Does Subskribe integrate with Salesforce?$q$, $q$Yes, Subskribe offers native two-way integration with Salesforce as well as HubSpot.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Is Subskribe only for CPQ, or does it also handle billing?$q$, $q$Subskribe covers the full quote-to-revenue lifecycle, including CPQ, subscription billing, invoicing, and revenue recognition, not just quoting.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$What companies use Subskribe?$q$, $q$Publicly referenced customers include Chainguard, Zip, Beamery, Vivun, and Merge.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Complex usage-based pricing$q$, $q$SaaS companies with consumption-based or hybrid pricing models use Subskribe to generate accurate quotes and invoices without manual spreadsheet calculations.$q$, $q$SaaS revenue operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Quote-to-cash consolidation$q$, $q$Finance teams replace disconnected CPQ and billing tools with one system so contract, invoice, and revenue data never drift out of sync.$q$, $q$Finance and billing operations leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Mid-term contract changes$q$, $q$Sales and finance teams process upgrades, downgrades, and ramp deals with automatic proration and approval routing.$q$, $q$Enterprise SaaS sales operations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Custom$q$, $q$Contact sales$q$, $q$Custom$q$, NULL, $q$["CPQ, billing, revenue recognition, and analytics modules available individually or bundled","Pricing based on modules used, contract term, and transaction volume","Dedicated onboarding and implementation support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'b0a76343-e065-4813-8f8c-fb490cece33b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$overview$q$, $q$What Is Subskribe$q$, 2, ARRAY[$q$Subskribe is a quote-to-revenue platform built specifically for B2B SaaS and subscription companies. Instead of running separate CPQ, billing, and revenue recognition systems that must be reconciled after the fact, Subskribe unifies these functions on a single data model so a quote, an invoice, and a revenue schedule always stay in sync.$q$, $q$The company was founded in 2020 by former Zuora and Oracle engineers who wanted to fix the disconnect between sales quoting tools and finance billing systems. In November 2025, Subskribe was acquired by DealHub, a CPQ and deal management vendor, to combine Subskribe's billing and revenue engine with DealHub's sales workflow and AI deal tools under one roof.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Subskribe's CPQ module lets sales reps build complex quotes with usage-based, tiered, volume-based, flat-fee, and hybrid pricing, plus customizable multi-level approval chains tied to discount thresholds or deal size.$q$, $q$The billing module automates invoicing, proration for mid-term upgrades and downgrades, and renewal management, while the revenue recognition module handles ASC 606-compliant schedules for ramps, amendments, and multi-element contracts.$q$, $q$An analytics layer surfaces SaaS metrics such as ARR movements (new, expansion, contraction, churn) and cohort reporting, and the platform natively integrates with Salesforce, HubSpot, and DocuSign.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Subskribe does not publish list prices publicly. Cost depends on which modules (CPQ, billing, revenue recognition, analytics) a company licenses, contract term, and transaction or seat volume. Prospective customers must request a custom quote through the Subskribe or DealHub sales team.$q$]::text[], 2);


-- ── Subskribe CPQ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Subskribe CPQ is the configure-price-quote module of the Subskribe quote-to-revenue platform, purpose-built for SaaS companies with complex, usage-based, and hybrid pricing.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$San Ramon, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Subskribe CPQ: Configure, Price, Quote for SaaS Sales$q$, seo_title),
  seo_meta_description = COALESCE($q$Subskribe CPQ builds complex SaaS quotes in minutes with usage-based pricing, approval workflows, and native CRM sync. See features and pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Subskribe CPQ is the configure-price-quote module within the broader Subskribe quote-to-revenue platform, built by Subskribe Inc. (founded 2020, headquartered in San Ramon, California, acquired by DealHub in November 2025). Rather than being sold as a fully standalone product, Subskribe CPQ is marketed as one of four connected modules -- CPQ, billing, revenue recognition, and analytics -- that share a single data model, so quotes automatically flow into invoices and revenue schedules without re-entry. It is designed for B2B SaaS sales teams that need to quote usage-based, tiered, volume-based, flat-fee, and hybrid pricing structures, manage ramp deals and contract amendments, and route quotes through configurable multi-level approval chains based on discount size or deal value. It includes a digital sales room for collaborative buyer-seller negotiation, native DocuSign e-signature, and native two-way integration with Salesforce and HubSpot. Subskribe CPQ does not publish list pricing -- prospective customers must request a custom quote, with cost depending on whether CPQ is purchased alone or bundled with billing and revenue recognition. It has been recognized as a G2 High Performer in the CPQ category for multiple consecutive quarters and is aimed at mid-market and enterprise SaaS companies with pricing complexity that generic CPQ tools struggle to handle.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '989b012e-a050-497e-8c08-30d43f45ccd1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '989b012e-a050-497e-8c08-30d43f45ccd1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Fast complex quoting$q$, $q$Builds quotes supporting usage-based, tiered, volume, flat-fee, and hybrid pricing in a fraction of the time of spreadsheet-based quoting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Configurable approval chains$q$, $q$Multi-level approvals based on discount thresholds, deal size, or payment terms, with real-time Slack and email notifications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Ramp deal and amendment support$q$, $q$Handles multi-year ramp schedules and mid-term contract amendments with automatic proration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Digital sales room$q$, $q$A shared online space where buyers and sellers collaborate on and finalize a quote together.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Native e-signature$q$, $q$Built-in DocuSign integration to move from approved quote to signed contract without leaving the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$CRM-native workflow$q$, $q$Two-way sync with Salesforce and HubSpot keeps opportunity and quote data aligned automatically.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Shared data model with billing$q$, $q$Quotes flow directly into Subskribe's billing and revenue recognition modules without re-entry.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Multi-currency support$q$, $q$Generates quotes and documents in multiple currencies for global SaaS sales teams.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Purpose-built for usage-based and hybrid SaaS pricing that many generic CPQ tools handle poorly$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Eliminates the reconciliation gap between quoting and billing since both run on one data model$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Fast quote generation with flexible, rules-based approval routing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Strong G2 recognition specifically in the CPQ category$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Not sold as a fully independent standalone product -- most value comes from pairing it with Subskribe billing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$No public pricing, so buyers cannot self-serve a cost estimate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Post-acquisition by DealHub adds uncertainty about whether CPQ will remain a distinct offering long-term$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Primarily built for subscription/SaaS pricing models, less suited to non-subscription businesses$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Is Subskribe CPQ a separate product from Subskribe?$q$, $q$No. Subskribe CPQ is a module within the single Subskribe quote-to-revenue platform, alongside billing, revenue recognition, and analytics modules, all sharing one data model.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Can I buy Subskribe CPQ without the billing module?$q$, $q$Subskribe CPQ can be licensed on its own, but Subskribe markets the greatest value in pairing CPQ with its billing and revenue recognition modules so quotes flow straight into invoicing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$What pricing models does Subskribe CPQ support?$q$, $q$It supports flat fee, tiered, volume-based, usage-based, and hybrid combinations of these pricing models within a single quote.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Does Subskribe CPQ integrate with Salesforce?$q$, $q$Yes, it offers native two-way integration with Salesforce as well as HubSpot.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$How much does Subskribe CPQ cost?$q$, $q$Pricing is not public. Cost depends on modules licensed, contract term, and usage volume, and requires a custom quote from sales.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Does Subskribe CPQ support e-signatures?$q$, $q$Yes, it has native DocuSign integration for closing signed contracts within the platform.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Who owns Subskribe CPQ today?$q$, $q$Subskribe, including its CPQ module, was acquired by DealHub in November 2025.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Usage-based SaaS quoting$q$, $q$Sales teams selling consumption-priced products use Subskribe CPQ to generate accurate quotes that reflect tiered or usage-based rates.$q$, $q$SaaS account executives and sales operations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Deal approval governance$q$, $q$Sales leadership uses configurable approval chains to enforce discount and deal-size policies before a quote can be sent.$q$, $q$Sales operations and finance leadership$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Ramp and multi-year contract quoting$q$, $q$Enterprise sales teams quote multi-year ramp deals with escalating pricing and automatic proration for mid-term changes.$q$, $q$Enterprise SaaS sales teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Custom$q$, $q$Contact sales$q$, $q$Custom$q$, NULL, $q$["CPQ module available standalone or bundled with billing, revenue recognition, and analytics","Pricing based on contract term and usage volume","Native Salesforce, HubSpot, and DocuSign integration included"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '989b012e-a050-497e-8c08-30d43f45ccd1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$overview$q$, $q$What Is Subskribe CPQ$q$, 2, ARRAY[$q$Subskribe CPQ is the quoting engine inside Subskribe's quote-to-revenue platform. It is not sold as a fully separate product with its own brand identity; instead, Subskribe markets it as one of four modules -- CPQ, billing, revenue recognition, and analytics -- that plug into the same underlying data model.$q$, $q$Because CPQ shares its data model with the billing and revenue modules, quotes created in Subskribe CPQ do not need to be re-entered into a separate billing system. Sales teams can generate and approve a quote, and the resulting contract terms flow directly into invoicing and revenue recognition without manual handoff.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Subskribe CPQ is built to handle pricing structures that trip up traditional CPQ tools: usage-based, tiered, volume-based, flat-fee, and hybrid combinations, generated within a stated target of under 30 seconds per quote.$q$, $q$It supports mid-subscription changes such as upgrades, downgrades, and ramp deals with automatic proration, plus configurable multi-level approval workflows that route quotes based on discount depth, deal size, or payment terms with Slack and email alerts.$q$, $q$Additional capabilities include a digital sales room for collaborative deal review, native DocuSign e-signature, multi-currency and multi-document support, and native two-way sync with Salesforce and HubSpot CRMs.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Subskribe does not publish public pricing for the CPQ module. Cost depends on whether a company licenses CPQ alone or bundles it with billing, revenue recognition, and analytics, as well as contract term and volume. Interested buyers must contact sales for a custom quote.$q$]::text[], 2);


-- ── Substack ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Substack is a publishing platform that lets writers and creators launch paid or free newsletters, podcasts, and video, handling payments, distribution, and analytics for a 10 percent cut of subscription revenue.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$101-250 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Substack: Newsletter and Publishing Platform for Writers$q$, seo_title),
  seo_meta_description = COALESCE($q$Substack lets writers publish paid newsletters, podcasts, and video. Free to start, Substack takes 10 percent of subscription revenue. See features and pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Substack is an online publishing platform founded in 2017 by Chris Best, Hamish McKenzie, and Jairaj Sethi, headquartered in San Francisco. It gives independent writers and creators the tools to publish newsletters, podcasts, and video directly to subscribers' inboxes, combining a content editor, subscriber management, payment processing, and analytics in one product. Substack is free for writers to use for publishing; if a writer charges for subscriptions, Substack takes a 10 percent cut of subscription revenue on top of standard Stripe payment processing fees, with no charge to readers who only follow free publications. As of 2025, the platform reported over 5 million paid subscriptions, more than 50,000 monetizing publications, and over 50 writers earning more than 1 million dollars a year from subscriptions. In June 2025, Substack raised 100 million dollars at a 1.1 billion dollar valuation from investors including Andreessen Horowitz and Bond. It is used by independent journalists, novelists, subject-matter experts, and media companies who want to own their audience and revenue directly rather than depend on ad-supported platforms or third-party algorithms, though it has drawn criticism over content moderation policies for extremist newsletters.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Free and paid subscriptions$q$, $q$Creators can offer free posts to everyone and gate premium content behind a paid subscription tier.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Built-in payments$q$, $q$Stripe-powered billing handles subscriber payments, renewals, and payouts without a separate merchant account.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Podcast and video hosting$q$, $q$Publishers can distribute audio and video content alongside written posts from the same publication.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Substack Notes and discovery$q$, $q$A short-form social feed and recommendation network help new publications get discovered by readers of similar newsletters.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Subscriber analytics$q$, $q$Dashboards show subscriber growth, open rates, and revenue trends over time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Custom publication branding$q$, $q$Writers can customize their publication's name, logo, colors, and domain.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Reader and writer apps$q$, $q$Dedicated mobile apps let readers browse subscriptions and let writers publish and message subscribers on the go.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Referral and gift programs$q$, $q$Built-in tools let readers gift subscriptions or earn rewards for referring new paying subscribers.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Free to start with no upfront cost to launch a publication$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Writers retain ownership of their content and subscriber list, including email addresses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Built-in payments and discovery network remove the need for separate tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Supports multiple formats (newsletter, podcast, video) under one publication$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Large and active reader ecosystem via Notes and cross-publication recommendations$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$10 percent platform fee plus Stripe fees can be significant for high-earning publications$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Limited design customization compared to standalone website builders$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Content moderation controversies have drawn criticism for allowing extremist newsletters$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$No self-serve control over payment processor -- tied to Substack's Stripe integration$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Revenue depends heavily on subscriber willingness to pay, which varies widely by niche$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Is Substack free to use?$q$, $q$Yes, publishing a newsletter on Substack is free. Substack only earns money when a writer charges for paid subscriptions, taking a 10 percent cut of that revenue.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$How much does Substack take from paid subscriptions?$q$, $q$Substack takes a flat 10 percent platform fee on subscription revenue, in addition to standard Stripe payment processing fees of roughly 2.9 percent plus 30 cents per transaction.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$When was Substack founded?$q$, $q$Substack was founded in 2017 by Chris Best, Hamish McKenzie, and Jairaj Sethi, and is headquartered in San Francisco.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Can I publish a podcast on Substack?$q$, $q$Yes, Substack supports podcast hosting and distribution alongside written posts, as well as video since 2022.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Do I own my subscriber list on Substack?$q$, $q$Yes, writers retain ownership of their content and can export their subscriber email list at any time.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$How many paying subscribers does Substack have?$q$, $q$Substack reported over 5 million paid subscriptions across its network as of March 2025.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Who are Substack's competitors?$q$, $q$Common alternatives include Ghost, Beehiiv, ConvertKit, and Medium, though each differs in fee structure and feature set.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Independent journalism$q$, $q$Journalists leaving traditional media use Substack to launch paid newsletters and build a direct reader relationship.$q$, $q$Independent journalists and columnists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Niche expert newsletters$q$, $q$Subject-matter experts in fields like finance, tech, and law publish analysis newsletters monetized through paid subscriptions.$q$, $q$Industry analysts and subject-matter experts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Podcast and video creators$q$, $q$Creators combine written posts with podcast episodes or video under one subscription, diversifying format without leaving the platform.$q$, $q$Independent podcasters and video creators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Free publication$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Unlimited free posts","Subscriber list and email delivery","Access to Substack Notes and discovery network"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Paid subscriptions$q$, $q$10% of subscription revenue plus Stripe fees$q$, $q$Per transaction$q$, NULL, $q$["Writer sets their own subscription price","Built-in Stripe payment processing","Gift subscriptions and referral tools","Podcast and video hosting included"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$overview$q$, $q$What Is Substack$q$, 2, ARRAY[$q$Substack is a subscription publishing platform that lets writers, podcasters, and video creators build a direct relationship with their audience. Rather than posting to a social feed controlled by an algorithm, creators publish to an owned list of email subscribers who can choose to pay for premium content.$q$, $q$Founded in 2017 by Chris Best, Hamish McKenzie, and Jairaj Sethi, Substack was inspired in part by independent tech writer Ben Thompson's subscription newsletter Stratechery. The platform has since expanded from text newsletters into podcasts (2019) and video (2022), positioning itself as a broader creator publishing and monetization network rather than just an email tool.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Writers get a built-in rich-text and multimedia editor, a customizable publication page, and automatic email delivery to subscribers alongside a companion app for readers to browse and discover new publications.$q$, $q$Monetization tools include free and paid subscription tiers, one-time gift subscriptions, group and referral programs, and integrated Stripe payment processing so creators do not need a separate payment provider.$q$, $q$Substack also provides subscriber analytics, a discovery network (Substack Notes and recommendations between publications), audio and video hosting for podcasts, and a Substack app for both writers and readers.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Publishing on Substack is free. Creators only pay when they charge readers for a paid subscription: Substack takes a flat 10 percent platform fee on subscription revenue, in addition to standard Stripe payment processing fees (typically around 2.9 percent plus 30 cents per transaction). There is no charge for running a free, non-monetized newsletter.$q$]::text[], 2);


-- ── Sudowrite ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sudowrite is an AI writing assistant built specifically for fiction authors, offering tools like Story Engine, Describe, and Rewrite to help plan, draft, and revise novels and short stories.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$10/month$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sudowrite: AI Writing Partner for Fiction Authors$q$, seo_title),
  seo_meta_description = COALESCE($q$Sudowrite is an AI tool for fiction writers with Story Engine, Describe, and Rewrite features. Plans start at $10/month. See pricing and features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sudowrite is an AI-powered writing assistant purpose-built for fiction authors, founded in 2020 by James Yu and Amit Gupta and headquartered in San Francisco. Unlike general-purpose AI writers, Sudowrite is designed specifically for novelists, short story writers, and screenwriters, with tools such as Story Engine for guided long-form story development, Describe for expanding sensory prose, Rewrite for generating style variations, Brainstorm for idea generation, and a canvas-based editor for organizing chapters and characters. The company has raised early-stage funding including backing reported around its 2021 fundraising coverage from investors such as Human Ventures and 500 Global. Sudowrite runs on a credit-based subscription model with no permanent free tier, only a one-time free trial of about 10,000 credits. As of 2026, paid plans are Hobby and Student at 10 dollars a month for 225,000 monthly credits, Professional at 22 dollars a month for 450,000 credits, and Max at 44 dollars a month for 2,000,000 credits with 12-month rollover, all billed monthly with annual discounts available; a custom Enterprise plan exists for larger needs. All tiers unlock the same feature set and differ only in credit allowance. Sudowrite is used by self-published authors, screenwriters, and traditionally published novelists seeking help overcoming writer's block, drafting faster, and refining prose style.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Story Engine$q$, $q$Guided tool that develops a full novel outline, chapter beats, and character arcs from an initial story premise.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Describe$q$, $q$Expands a sentence or scene into richer, more sensory prose across multiple senses.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Rewrite$q$, $q$Generates alternate phrasings of a passage in different tones or styles, such as more vivid or more concise.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Brainstorm$q$, $q$Generates plot ideas, character names, twists, and settings on demand to break through writer's block.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Canvas story editor$q$, $q$A visual workspace for organizing chapters, character sheets, and worldbuilding notes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Credit rollover$q$, $q$The Max plan allows unused monthly credits to roll over for up to 12 months.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Feedback tool$q$, $q$Professional and higher tiers include AI-generated feedback on submitted drafts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Free trial$q$, $q$New users get a one-time trial of about 10,000 credits with no credit card required.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Purpose-built for fiction, with tools tailored to plot, character, and prose rather than generic copywriting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Story Engine and Describe features are well-regarded by novelists for overcoming writer's block$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Credit rollover on the Max plan rewards heavier, consistent use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Transparent published pricing with a free trial before committing$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$No permanent free tier -- only a one-time trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Credit-based system can be confusing to estimate cost against actual word output$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Niche focus on fiction means it is less useful for non-narrative writing tasks$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Higher tiers needed for serious full-length novel projects, raising effective monthly cost$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$AI-generated fiction assistance raises ongoing debate among some authors and readers about originality$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$What is Sudowrite used for?$q$, $q$Sudowrite is an AI writing assistant built specifically for fiction, helping authors outline, draft, and revise novels, short stories, and screenplays.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$How much does Sudowrite cost?$q$, $q$Plans start at 10 dollars a month for Hobby and Student (225,000 credits), 22 dollars a month for Professional (450,000 credits), and 44 dollars a month for Max (2,000,000 credits), all with annual discounts available.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Does Sudowrite have a free plan?$q$, $q$There is no permanent free plan, but new users get a one-time free trial with about 10,000 credits and no credit card required.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Who founded Sudowrite?$q$, $q$Sudowrite was founded in 2020 by James Yu and Amit Gupta and is headquartered in San Francisco.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$What is Sudowrite's Story Engine?$q$, $q$Story Engine is a guided feature that helps writers develop a full novel outline, chapter beats, and character arcs starting from a story premise.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Is Sudowrite only for fiction?$q$, $q$Yes, Sudowrite is designed specifically for fiction writing rather than general business or marketing copy.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Do unused Sudowrite credits roll over?$q$, $q$On the Max plan, unused monthly credits roll over for up to 12 months. Lower tiers do not carry this benefit.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Novel drafting$q$, $q$Self-published and traditionally published novelists use Story Engine and Describe to outline and draft full-length books faster.$q$, $q$Independent and traditionally published novelists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Overcoming writer's block$q$, $q$Writers stuck mid-scene use Brainstorm and Rewrite to generate new plot directions or alternate phrasing.$q$, $q$Fiction writers of any experience level$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Prose style revision$q$, $q$Authors use Rewrite and Describe to polish prose style and sensory detail during the editing phase.$q$, $q$Authors revising a manuscript for submission or publication$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Hobby and Student$q$, $q$$10/month$q$, $q$Monthly (annual discount available)$q$, NULL, $q$["225,000 credits per month","Access to Story Engine, Describe, Rewrite, Brainstorm"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Professional$q$, $q$$22/month$q$, $q$Monthly (annual discount available)$q$, NULL, $q$["450,000 credits per month","AI feedback on drafts","Suited for longer works like a novel or screenplay"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Max$q$, $q$$44/month$q$, $q$Monthly (annual discount available)$q$, NULL, $q$["2,000,000 credits per month","12-month credit rollover","Suited for authors publishing multiple times a year"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Custom credit allowances","Team and organization support","Contact sales for pricing"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$overview$q$, $q$What Is Sudowrite$q$, 2, ARRAY[$q$Sudowrite is an AI writing tool designed exclusively for fiction. Where many general AI writing assistants target marketing copy or business documents, Sudowrite's features are built around the specific mechanics of storytelling: plot structure, character consistency, sensory description, and prose style.$q$, $q$Founded in 2020 by James Yu (previously a co-founder of Parse, acquired by Facebook) and Amit Gupta, Sudowrite is headquartered in San Francisco and has grown to roughly 15 to 20 employees as of 2026, serving a global community of self-published and traditionally published authors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Story Engine walks writers through outlining a novel, generating chapter-by-chapter beats and character arcs from a premise. Describe expands a sentence into richer sensory detail across sight, sound, touch, taste, and smell.$q$, $q$Rewrite offers multiple style variations of a passage (such as more tense, more vivid, or more concise), while Brainstorm generates plot twists, character names, settings, and other story elements on demand.$q$, $q$A canvas-based story editor lets authors organize chapters, character sheets, and story bible details in one workspace, and the Professional tier adds AI feedback on drafts.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sudowrite uses a credit-based subscription model with three consumer tiers plus a custom Enterprise plan. Hobby and Student costs 10 dollars a month for 225,000 credits, Professional costs 22 dollars a month for 450,000 credits, and Max costs 44 dollars a month for 2,000,000 credits with a 12-month rollover on unused credits. Annual billing offers a discount versus paying monthly, and a one-time free trial with roughly 10,000 credits is available with no credit card required.$q$]::text[], 2);


-- ── SugarCRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SugarCRM is a customer relationship management platform for sales, marketing, and support teams, now rebranded as SugarAI to emphasize its AI-powered selling features.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$59/user/month$q$, starting_price),
  founded_year = COALESCE(2004, founded_year),
  company_size = COALESCE($q$501-1000 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SugarCRM: CRM Software for Sales, Marketing and Support$q$, seo_title),
  seo_meta_description = COALESCE($q$SugarCRM (now SugarAI) offers CRM tools for sales, marketing, and customer support. Plans start at $59/user/month. See features, pricing, and history.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SugarCRM is a customer relationship management platform founded in 2004 by Clint Oram, John Roberts, and Jacob Taylor, headquartered in San Francisco. It began as an open-source CRM project before shifting to a commercial licensing model and discontinuing its free Community Edition in 2014. The company has raised roughly 86 million dollars in venture funding from investors including Draper Fisher Jurvetson, Walden International, and Goldman Sachs, and in August 2018 private equity firm Accel-KKR became its primary investor. SugarCRM has since rebranded its product as SugarAI to emphasize AI-driven selling capabilities including Sugar Intelligence and Discover, and acquired revenue intelligence provider sales-i in 2024. As of 2026 the company employs roughly 580 people. Pricing is tiered per user per month, billed annually with a 15-user minimum: Standard at 59 dollars covers core CRM functions like accounts, contacts, leads, opportunities, and pipeline management; Advanced at 85 dollars adds case management, bug tracking, Sugar Intelligence, sales-i, and Smart Guides; and Premier at 135 dollars adds geo mapping, Discover, doubled storage, and a LinkedIn connector. SugarCRM targets small to large sales, marketing, and customer service teams that want a customizable, workflow-driven CRM as an alternative to Salesforce or HubSpot.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Accounts and contact management$q$, $q$Central database for tracking companies, contacts, and their interaction history.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Lead and opportunity tracking$q$, $q$Manages the sales pipeline from initial lead through closed deal with configurable stages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Business process management$q$, $q$Lets administrators build custom automated workflows tied to sales or service processes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Case and bug management$q$, $q$Tracks customer support tickets and product bugs within the same platform as sales data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Sugar Intelligence (AI)$q$, $q$AI-driven insights and predictive scoring layered on top of CRM data for sellers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Discover$q$, $q$AI-powered account and prospect research tool available on the Premier tier.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Sales-i revenue intelligence$q$, $q$Acquired revenue intelligence functionality for surfacing cross-sell and upsell opportunities.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Mail and calendar integration$q$, $q$Syncs email and calendar activity from Outlook or Gmail directly into CRM records.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Highly customizable workflows and data model compared to more rigid CRMs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Long operating history (since 2004) with an established enterprise customer base$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Tiered plans let smaller teams start with core CRM and add AI and support features later$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Strong case and bug tracking make it a fit for combined sales and support teams$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Annual-only billing with a 15-user minimum raises the entry cost for very small teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$No free or open-source Community Edition since 2014$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Recent SugarAI rebrand may cause confusion about product continuity for existing customers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Advanced AI features are locked behind higher-priced Advanced and Premier tiers$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Steeper learning curve for configuration compared to simpler CRMs$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Is SugarCRM still called SugarCRM?$q$, $q$The company has rebranded its product as SugarAI to emphasize AI-powered selling features, though the SugarCRM name is still widely used and the website redirects from sugarcrm.com to sugarai.com.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$How much does SugarCRM cost?$q$, $q$Plans are billed annually per user with a 15-user minimum: Standard at 59 dollars per user per month, Advanced at 85 dollars, and Premier at 135 dollars.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$When was SugarCRM founded?$q$, $q$SugarCRM was founded in 2004 by Clint Oram, John Roberts, and Jacob Taylor and is headquartered in San Francisco.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Is SugarCRM open source?$q$, $q$SugarCRM began as an open-source project but discontinued its free Community Edition in 2014 in favor of a fully commercial model.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Is SuiteCRM the same as SugarCRM?$q$, $q$No. SuiteCRM is a separate, independently maintained open-source CRM that originated as a fork of SugarCRM's discontinued Community Edition, but the two are run by different companies today.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Who owns SugarCRM?$q$, $q$Private equity firm Accel-KKR became SugarCRM's primary investor in August 2018.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Does SugarCRM offer a free trial?$q$, $q$SugarCRM offers demos and trials through its sales team; check the current sugarai.com pricing page for trial availability.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Enterprise sales pipeline management$q$, $q$Sales teams use SugarCRM to track leads, opportunities, and quotes through a configurable pipeline.$q$, $q$B2B sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Combined sales and support operations$q$, $q$Companies use case and bug management alongside sales tracking to unify customer-facing teams in one system.$q$, $q$Customer support and sales operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$AI-assisted account research$q$, $q$Sales reps use Sugar Intelligence and Discover to surface account insights and prioritize outreach.$q$, $q$Enterprise account executives$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Standard$q$, $q$$59/user/month$q$, $q$Annual (15-user minimum)$q$, NULL, $q$["Accounts and contact management","Lead and opportunity tracking","Quote management","Pipeline management","Business process management","Reporting and analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Advanced$q$, $q$$85/user/month$q$, $q$Annual (15-user minimum)$q$, NULL, $q$["Everything in Standard","Mail and calendar integration","Case management and bug tracking","Sugar Intelligence","sales-i revenue intelligence","Smart Guides"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$Premier$q$, $q$$135/user/month$q$, $q$Annual (15-user minimum)$q$, NULL, $q$["Everything in Advanced","Geo mapping","Discover account research","Doubled file and data storage","LinkedIn connector","Enhanced support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$overview$q$, $q$What Is SugarCRM$q$, 2, ARRAY[$q$SugarCRM is a customer relationship management platform covering sales, marketing, and customer service workflows. It was founded in 2004 by Clint Oram, John Roberts, and Jacob Taylor as an open-source CRM alternative to Salesforce, quickly gaining traction with thousands of downloads in its first months.$q$, $q$The company later moved away from a fully open-source model, discontinuing its Community Edition in 2014 in favor of commercial licensing. Following a 2018 investment from private equity firm Accel-KKR, SugarCRM has continued to evolve its product, most recently rebranding as SugarAI to highlight AI-powered features across the sales pipeline, and acquiring revenue intelligence company sales-i in 2024.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform covers accounts and contact management, lead and opportunity tracking, quote management, pipeline visualization, and configurable business process automation.$q$, $q$Higher tiers add case management for customer support, bug tracking for product teams, mail and calendar integration, and AI-driven tools including Sugar Intelligence for predictive insights and Discover for account research.$q$, $q$SugarCRM is known for deep customization and workflow configuration, letting administrators tailor modules, fields, and automation rules without heavy custom development.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SugarCRM (SugarAI) pricing is billed annually per user with a 15-user minimum, with no monthly billing option. Standard costs 59 dollars per user per month, Advanced costs 85 dollars per user per month and is the most popular tier, and Premier costs 135 dollars per user per month. A separate marketing product, Sugar Market, is priced at a flat rate starting near 1,000 dollars a month for up to 10,000 contacts.$q$]::text[], 2);


-- ── SuiteCRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SuiteCRM is a free, open-source CRM platform maintained by SalesAgility, originally forked from SugarCRM's discontinued Community Edition in 2013.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Stirling, Scotland, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SuiteCRM: Free Open-Source CRM Software$q$, seo_title),
  seo_meta_description = COALESCE($q$SuiteCRM is a free, open-source CRM for sales, marketing, and support. Self-host for free or use managed hosting from GBP 50/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SuiteCRM is a free, open-source customer relationship management platform released in October 2013 by SalesAgility, a company headquartered in Stirling, Scotland. It was created as a direct fork of SugarCRM's Community Edition 6.5 after SugarCRM announced it would discontinue free open-source development, and it is licensed under the GNU Affero General Public License version 3 (AGPLv3). SuiteCRM covers accounts and contact management, lead and opportunity tracking, sales pipeline visualization, marketing campaigns, and customer support case management, and it can be extensively customized or extended with custom modules since the full source code is available. The core software is free to download, self-host, and modify with no per-user fees or licensing limits. For organizations without in-house IT, SalesAgility also sells managed hosting starting around 50 British pounds a month, implementation packages such as Quick Start from roughly 2,520 pounds one-time, and paid support tiers including Standard Support and SuiteASSURED, a warrantied open-source support offering with legal indemnities. SuiteCRM is aimed at small and mid-sized businesses, public sector organizations, and technically capable teams that want full data ownership and no vendor lock-in as an alternative to Salesforce or paid commercial CRMs like SugarCRM.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Free, self-hosted CRM$q$, $q$Download and run SuiteCRM on your own infrastructure with no per-user licensing fees.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Accounts and opportunity tracking$q$, $q$Manages the full sales pipeline from lead to closed opportunity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Marketing campaign tools$q$, $q$Built-in tools for running and tracking email marketing campaigns.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Case management$q$, $q$Tracks customer support tickets and service requests within the same platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Full source code access$q$, $q$AGPLv3 licensing gives organizations complete access to modify and extend the codebase.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Custom module builder$q$, $q$Administrators can create custom modules and fields to fit unique business processes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Managed hosting option$q$, $q$Suite:OnDemand offers fully managed SaaS hosting for teams that do not want to self-host.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$SuiteASSURED support$q$, $q$An optional warrantied support package that adds legal indemnities and priority support to the free software.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Core CRM software is completely free with no per-user fees or seat limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Full source code access allows deep customization not possible with closed CRMs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$No vendor lock-in -- data and code stay fully under the organization's control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Active development community and over a decade of history since 2013$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Self-hosting requires in-house technical resources to install, secure, and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$User interface and setup experience feel dated compared to modern SaaS CRMs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Managed hosting and support add meaningful cost on top of the 'free' core software$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Smaller ecosystem of pre-built integrations compared to Salesforce or HubSpot$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Is SuiteCRM really free?$q$, $q$Yes, the core SuiteCRM software is free to download, self-host, and modify with no per-user fees. Optional managed hosting and paid support packages are available for an additional cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Is SuiteCRM related to SugarCRM?$q$, $q$SuiteCRM originated in 2013 as a fork of SugarCRM's Community Edition after SugarCRM discontinued its free open-source version, but the two are maintained by separate companies today: SuiteCRM by SalesAgility, and SugarCRM (now SugarAI) as its own commercial company.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Who develops SuiteCRM?$q$, $q$SuiteCRM is developed and maintained by SalesAgility, a company headquartered in Stirling, Scotland.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$What license does SuiteCRM use?$q$, $q$SuiteCRM is released under the GNU Affero General Public License version 3 (AGPLv3), an open-source copyleft license.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Do I need technical skills to run SuiteCRM?$q$, $q$Self-hosting requires server administration knowledge; organizations without in-house IT can instead use SalesAgility's managed hosting or Quick Start implementation packages.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$What is SuiteASSURED?$q$, $q$SuiteASSURED is an optional paid support package from SalesAgility that adds a warranty, legal indemnities, and priority support to the free open-source software.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Can I customize SuiteCRM's data model?$q$, $q$Yes, because the full source code is open, developers can build custom modules and modify the data model to fit specific business needs.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Budget-conscious CRM deployment$q$, $q$Small and mid-sized businesses adopt SuiteCRM to get full CRM functionality without per-user licensing costs.$q$, $q$Small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Highly customized CRM workflows$q$, $q$Organizations with unique processes use SuiteCRM's open source code to build custom modules unavailable in closed CRMs.$q$, $q$Technical teams and software integrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Data sovereignty requirements$q$, $q$Public sector and regulated organizations self-host SuiteCRM to keep customer data fully under their own control.$q$, $q$Public sector and regulated industry organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Community Edition (self-hosted)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full CRM feature set","Self-hosted on your own infrastructure","Access to full source code","Community forum support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$Managed Hosting$q$, $q$From GBP 50/month$q$, $q$Monthly$q$, NULL, $q$["Hosting, security, and updates handled by SalesAgility","Automated backups","No server maintenance required"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$SuiteASSURED$q$, $q$From GBP 3,350/year$q$, $q$Annual$q$, NULL, $q$["Warranty and legal indemnities","Priority support hours","Combines open source freedom with commercial-grade assurance"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'f642cdf4-9d25-4b51-b18d-2ac786b0b375';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$overview$q$, $q$What Is SuiteCRM$q$, 2, ARRAY[$q$SuiteCRM is a free, open-source customer relationship management platform that any organization can download, self-host, and modify without licensing fees. It was created in October 2013 by SalesAgility, a Scotland-based software company, as a fork of SugarCRM's Community Edition after SugarCRM announced it was discontinuing free, open-source development in favor of a commercial-only model.$q$, $q$Because it is licensed under the AGPLv3, SuiteCRM's full source code remains publicly available and any modifications distributed or run as a network service must also be open-sourced. SalesAgility continues to actively maintain and extend SuiteCRM, and the project marked its 10-year anniversary in 2023.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SuiteCRM covers the core CRM workflow: accounts and contact management, lead and opportunity tracking, sales pipeline visualization, and quote generation, alongside marketing campaign tools and customer support case management.$q$, $q$Because the source code is fully accessible, technical teams can build custom modules, adjust the data model, and integrate with other systems without waiting on vendor roadmaps -- a key differentiator from closed commercial CRMs.$q$, $q$SalesAgility also offers Suite:OnDemand, a fully managed SaaS hosting option, plus optional add-ons like SuiteASSURED, a warrantied support package with legal indemnities aimed at businesses that want the guarantees of commercial software with the flexibility of open source.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f642cdf4-9d25-4b51-b18d-2ac786b0b375', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The SuiteCRM Community Edition software itself is completely free to download, self-host, and modify, with no per-user fees or usage caps. For teams without in-house IT resources, SalesAgility sells fully managed hosting starting from roughly 50 British pounds a month, one-time implementation packages such as Quick Start from about 2,520 pounds, and paid support tiers ranging from Standard Support (around 1,200 pounds a year for 10 hours) to SuiteASSURED (from about 3,350 pounds a year), which adds warranty coverage and priority support.$q$]::text[], 2);


-- ── Suno ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Suno is an AI music generator that creates full songs, including vocals and instrumentation, from text prompts, used by hobbyists and creators to produce original tracks in seconds.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE($q$251-500 employees$q$, company_size),
  headquarters = COALESCE($q$Cambridge, Massachusetts, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Suno: AI Music Generator for Songs From Text$q$, seo_title),
  seo_meta_description = COALESCE($q$Suno turns text prompts into full AI-generated songs with vocals and instruments. Free plan available; Pro and Premier plans add more songs and rights.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Suno is an AI music generation platform that creates complete songs, including lyrics, vocals, and instrumentation, from a short text prompt. It was publicly launched in December 2023 by Suno, Inc., founded by former Kensho employees Mikey Shulman, Georg Kucsko, Martin Camacho, and Keenan Freyberg, and is headquartered in Cambridge, Massachusetts. Suno has raised over 775 million dollars from investors including Lightspeed Venture Partners, Menlo Ventures, Nvidia's NVentures, Matrix Partners, and founders Nat Friedman and Daniel Gross, reaching a valuation of roughly 2.45 billion dollars after its Series C round and continuing to raise additional capital into 2026. The free plan allows up to 10 songs a day with no credit card required. The Pro plan offers 500 songs a month with commercial usage rights, priority generation, and stem separation. The Premier plan starts around 24 dollars a month for 2,000 songs a month plus access to Suno Studio, a multitrack editor, MIDI export, and persona voices. Suno faced a copyright lawsuit filed by the Recording Industry Association of America (RIAA) in June 2024 alongside competitor Udio, and reached a landmark 500 million dollar licensing settlement with Warner Music Group in November 2025 that lets Suno train on WMG's catalog under label oversight. Suno is used by musicians, content creators, and hobbyists to prototype songs, generate background music, and experiment with new musical styles.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Text-to-song generation$q$, $q$Creates a full song with vocals, lyrics, and instrumentation from a short text prompt.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Audio-guided generation$q$, $q$Lets users upload an audio clip to influence the style of a new generation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Stem separation$q$, $q$Splits a generated track into individual vocal and instrument stems for remixing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Song Editor$q$, $q$Allows fine-grained editing of specific sections within a generated song.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Suno Studio$q$, $q$A generative audio workstation with a multitrack editor and MIDI export for advanced production.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Persona voices$q$, $q$Lets users apply a consistent, reusable AI vocal persona across multiple songs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Commercial usage rights$q$, $q$Paid plans grant royalty-free commercial rights to generated songs.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Mobile app$q$, $q$A dedicated mobile app, launched in 2024, lets users generate and listen to songs on the go.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Free plan lets anyone generate songs daily with no payment required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Produces full songs with vocals in seconds, far faster than traditional production$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Suno Studio and stem separation appeal to more serious music creators$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Backed by major investors including Nvidia, signaling continued platform investment$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Ongoing copyright litigation from the RIAA creates legal uncertainty around output rights$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Free plan output cannot be used commercially$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Song quality and originality can be inconsistent, requiring multiple generations to get a usable result$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Warner Music Group settlement gives a major label oversight over some AI-generated content involving its artists$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Is Suno free to use?$q$, $q$Yes, Suno's free plan allows up to 10 songs a day with no credit card required, though commercial use requires a paid plan.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$How much does Suno Premier cost?$q$, $q$The Premier plan starts at 24 dollars a month and includes 2,000 songs a month plus access to Suno Studio and MIDI export.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Who founded Suno?$q$, $q$Suno was founded by Mikey Shulman, Georg Kucsko, Martin Camacho, and Keenan Freyberg, former employees of AI startup Kensho, and launched publicly in December 2023.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Can I use Suno songs commercially?$q$, $q$Commercial usage rights are included on the paid Pro and Premier plans; free plan output is for non-commercial use.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Is Suno facing a copyright lawsuit?$q$, $q$Yes, the RIAA sued Suno and competitor Udio in June 2024 for alleged copyright infringement; Suno later reached a licensing settlement with Warner Music Group in November 2025.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Where is Suno headquartered?$q$, $q$Suno, Inc. is headquartered in Cambridge, Massachusetts.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$What is Suno Studio?$q$, $q$Suno Studio is a generative audio workstation available on the Premier plan, with a multitrack editor, MIDI export, and persona voices.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Rapid song prototyping$q$, $q$Musicians and songwriters use Suno to quickly prototype melodies, chord progressions, and arrangement ideas.$q$, $q$Independent musicians and songwriters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Content creator background music$q$, $q$YouTubers, podcasters, and social media creators generate custom royalty-free background tracks for their content.$q$, $q$Content creators and video editors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Hobbyist music experimentation$q$, $q$Hobbyists with no formal music training use text prompts to create and share original songs for fun.$q$, $q$Music hobbyists and casual creators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Free$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Up to 10 songs per day","No credit card required","Non-commercial use only"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Pro$q$, $q$See suno.com for current price$q$, $q$Monthly$q$, NULL, $q$["500 songs per month","Commercial usage rights","Priority generation","Song Editor and stem separation","Audio uploads up to 8 minutes"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$Premier$q$, $q$From $24/month$q$, $q$Monthly$q$, NULL, $q$["2,000 songs per month","Access to Suno Studio","Multitrack editor and MIDI export","Persona voices","Early access to new features"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$overview$q$, $q$What Is Suno$q$, 2, ARRAY[$q$Suno is an AI music generation tool that produces complete songs, including sung vocals, lyrics, and full instrumentation, from a simple text description of the desired style or mood. Users can also upload audio to guide the style of a new generation.$q$, $q$Founded by four former Kensho AI employees -- Mikey Shulman, Georg Kucsko, Martin Camacho, and Keenan Freyberg -- Suno publicly launched its V3 model in March 2024 after earlier releasing an open-source text-to-speech model called Bark in 2023. The company is headquartered in Cambridge, Massachusetts, and has scaled rapidly, raising hundreds of millions of dollars and reaching a multi-billion-dollar valuation within a few years of launch.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Suno generates full songs, including vocals, lyrics, and instrumental arrangement, from a text prompt describing genre, mood, or theme, with support for audio uploads to steer style.$q$, $q$Higher tiers add commercial usage rights, priority generation queues, a Song Editor for fine-tuning sections, stem separation to isolate vocal and instrument tracks, and audio uploads of up to 8 minutes.$q$, $q$Suno Studio, available on the top-tier plan, is a generative audio workstation with a multitrack editor, MIDI export, and persona voices for more advanced music production workflows.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Suno offers a free plan allowing up to 10 songs a day with no credit card required. The Pro plan provides 500 songs a month, royalty-free commercial usage rights, priority generation, the Song Editor, and stem separation. The Premier plan starts at 24 dollars a month and includes 2,000 songs a month plus Suno Studio, a multitrack editor, MIDI export, persona voices, and early access to new features.$q$]::text[], 2);


-- ── Sunsama ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sunsama is a daily planning app that pulls tasks, calendar events, and messages from other tools into one guided daily and weekly planning ritual for individual knowledge workers.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$17/month$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE($q$1-10 employees$q$, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sunsama: Daily Planner for Focused, Balanced Workdays$q$, seo_title),
  seo_meta_description = COALESCE($q$Sunsama is a daily planner that unifies tasks, calendar, and messages for guided daily planning. Plans start at $17/month with a 14-day free trial.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sunsama is a daily planning application built for individual knowledge workers who want to combine tasks, calendar events, and messages from multiple tools into a single guided planning ritual. Founded by Ashutosh Priyadarshy and Travis Meyer, the product went through Y Combinator's Winter 2019 batch after the founders spent several years developing earlier ideas together. Sunsama's core workflow centers on a daily planning session where users drag tasks from integrated tools such as Trello, Asana, Todoist, Slack, Gmail, and Google Calendar or Outlook Calendar into a single time-blocked day, plus a weekly review ritual to reflect on progress and plan ahead. The product deliberately keeps pricing simple with a single Pro plan for individuals: 17 dollars a month billed annually, or 22 dollars a month billed monthly, both including unlimited integrations and AI/Zapier/MCP access. There is no permanent free tier, only a 14-day free trial with no credit card required. A custom Enterprise plan adds SSO, SAML, SCIM, and audit logs for organizations. Sunsama has no team or mid-tier pricing -- it is intentionally built for a single user's daily workflow rather than team task management, differentiating it from tools like Asana or ClickUp.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '366134f6-a5b9-48d8-883a-e54211d7dd34';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '366134f6-a5b9-48d8-883a-e54211d7dd34' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Guided daily planning ritual$q$, $q$A structured daily workflow for choosing and time-blocking tasks pulled from other apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Weekly planning ritual$q$, $q$A recurring review session for reflecting on the past week and setting priorities for the next.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Multi-tool task integration$q$, $q$Pulls tasks from Trello, Asana, Jira, Todoist, ClickUp, and other tools into one unified view.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Calendar time-blocking$q$, $q$Drag tasks directly onto a Google Calendar or Outlook Calendar view to allocate focused time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Email and Slack integration$q$, $q$Converts emails and Slack messages into actionable tasks within the daily plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$AI planning suggestions$q$, $q$AI-assisted recommendations to help realistically plan a day's workload.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Zapier and MCP connectivity$q$, $q$Custom automation support via Zapier and the Model Context Protocol.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Enterprise security controls$q$, $q$SSO, SAML, SCIM, and audit logs available on the custom Enterprise plan.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Unifies tasks and calendar from many existing tools instead of requiring a full switch$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Structured daily and weekly rituals encourage more intentional, realistic planning$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Single, simple pricing tier with no confusing feature gating$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Focus on individual workflow avoids the clutter of team-oriented project management tools$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$No permanent free plan, only a 14-day trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$No team or collaboration tier, so it does not replace shared project management tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Small company size may mean slower feature development compared to larger competitors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Requires connecting several external accounts to get full value, adding setup time$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$What is Sunsama used for?$q$, $q$Sunsama is a daily planning app that combines tasks, calendar events, and messages from other tools into one guided daily and weekly planning workflow for individuals.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$How much does Sunsama cost?$q$, $q$Sunsama's Pro plan costs 17 dollars a month billed annually, or 22 dollars a month billed monthly, with a 14-day free trial and no permanent free tier.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Does Sunsama have a team plan?$q$, $q$No, Sunsama is built specifically for individual knowledge workers and does not offer team or mid-tier pricing; only a custom Enterprise plan exists for organizations needing advanced security controls.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Who founded Sunsama?$q$, $q$Sunsama was founded by Ashutosh Priyadarshy and Travis Meyer, who went through Y Combinator's Winter 2019 batch.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$What tools does Sunsama integrate with?$q$, $q$Sunsama integrates with tools including Trello, Asana, Jira, Todoist, ClickUp, Slack, Gmail, and Google or Outlook Calendar.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Does Sunsama have a free trial?$q$, $q$Yes, Sunsama offers a 14-day free trial with no credit card required, but there is no permanent free plan.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Is Sunsama a task manager or a calendar app?$q$, $q$Sunsama combines both: it pulls in tasks from other apps and lets users schedule them directly onto their calendar as part of a daily planning ritual.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Daily focus planning$q$, $q$Knowledge workers use Sunsama each morning to choose a realistic set of tasks and time-block their day.$q$, $q$Individual knowledge workers and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Cross-tool task consolidation$q$, $q$Users juggling Trello, Asana, Slack, and email pull everything into one daily view instead of checking each app separately.$q$, $q$Professionals using multiple productivity tools$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Weekly reflection and planning$q$, $q$Users run a structured weekly review to assess progress and set intentions for the upcoming week.$q$, $q$Remote workers and independent professionals$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Pro (annual)$q$, $q$$17/month$q$, $q$Annual$q$, NULL, $q$["Unlimited integrations","AI, Zapier, and MCP access","Daily and weekly planning rituals"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Pro (monthly)$q$, $q$$22/month$q$, $q$Monthly$q$, NULL, $q$["Unlimited integrations","AI, Zapier, and MCP access","Daily and weekly planning rituals"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["SSO and SAML authentication","SCIM and audit logs","Custom privacy and data requirements"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$overview$q$, $q$What Is Sunsama$q$, 2, ARRAY[$q$Sunsama is a daily planning tool designed to reduce the chaos of juggling tasks across multiple apps. Rather than replacing existing project management and communication tools, it pulls tasks and events from them into one unified daily planning view, so a user can decide each morning exactly what they will work on and when.$q$, $q$The product was created by Ashutosh Priyadarshy and Travis Meyer, who went through Y Combinator's Winter 2019 batch after several earlier attempts at building a company together starting around 2013. Sunsama has grown as a small, largely bootstrapped team focused on individual productivity rather than team collaboration features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Sunsama's core feature is a guided daily planning ritual: users drag tasks from connected tools into time-blocked windows on their calendar, set a realistic daily workload, and reflect at day's end on what was completed.$q$, $q$A weekly planning ritual helps users step back and set priorities for the coming week, while integrations with tools like Trello, Asana, Jira, Todoist, ClickUp, Slack, Gmail, and Google or Outlook Calendar bring tasks and messages into one place without requiring teams to switch project management tools.$q$, $q$The platform also includes AI-assisted planning suggestions, Zapier and MCP (Model Context Protocol) connectivity for custom automation, and a focus mode intended to support single-tasking during the workday.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sunsama offers one Pro plan for individuals at 17 dollars a month billed annually, or 22 dollars a month billed monthly, with unlimited integrations and AI, Zapier, and MCP access included at every tier. There is no free plan, only a 14-day free trial with no credit card required. A custom Enterprise plan is available for organizations needing SSO, SAML, SCIM, and audit logs.$q$]::text[], 2);



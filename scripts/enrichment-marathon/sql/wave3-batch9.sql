-- Enrichment marathon batch: BambooHR, Bardeen, Baremetrics, Bareos, Basecamp, Baserow, Baseten, Bear

-- ── BambooHR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$BambooHR is an all-in-one HR platform for small and mid-sized businesses, covering hiring, onboarding, payroll, benefits, and performance management.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2008, founded_year),
  company_size = COALESCE($q$1,500+ employees$q$, company_size),
  headquarters = COALESCE($q$Draper, Utah, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$BambooHR: All-in-One HR Software for SMBs$q$, seo_title),
  seo_meta_description = COALESCE($q$BambooHR combines hiring, onboarding, payroll, benefits administration, and performance management in one HR platform built for small and mid-sized businesses.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$BambooHR is an all-in-one human resources software platform founded in 2008 by Ben Peterson and Ryan Sanders, headquartered in Draper, Utah, with more than 1,500 employees. It is built specifically for small and mid-sized businesses that need a single system to manage the employee lifecycle, from applicant tracking and hiring through onboarding, core HR data management, time tracking, payroll, benefits administration, and performance management. Core features include an applicant tracking system (BambooHR Hiring), customizable onboarding workflows, an employee database with self-service access, time-off tracking, e-signature-enabled document management, payroll processing (in supported regions), benefits administration, and performance management tools including goal tracking and 360-degree feedback. BambooHR also offers an AI-powered assistant that surfaces HR insights and automates routine administrative tasks. The platform integrates with more than 125 third-party applications, including payroll providers, benefits carriers, and other business software. BambooHR does not publish flat pricing on its website; pricing is quote-based and depends on company size, modules selected (Core HR vs. Pro plans), and add-ons like payroll or performance management. A free trial is available. BambooHR is best suited for HR teams and business owners at companies typically ranging from roughly 20 to 1,000+ employees who want to replace spreadsheets and point-solution HR tools with one connected system.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'adb39746-99f6-497c-bc76-0bb5b5de259e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'adb39746-99f6-497c-bc76-0bb5b5de259e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Applicant Tracking & Hiring$q$, $q$Manage job postings, candidates, and hiring pipelines in one system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Onboarding Workflows$q$, $q$Customizable new-hire onboarding tasks and document collection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Employee Self-Service Database$q$, $q$Centralized employee records accessible to staff for updates and requests.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Time-Off Tracking$q$, $q$Manage PTO requests, accruals, and approvals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Payroll Processing$q$, $q$Run payroll directly within BambooHR in supported regions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Performance Management$q$, $q$Goal tracking, 360-degree feedback, and performance reviews.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$AI-Powered HR Assistant$q$, $q$Surfaces HR insights and automates routine administrative tasks.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Comprehensive all-in-one HR suite covering hiring through performance management$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Strong integration ecosystem with 125+ third-party apps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Well-regarded, intuitive user interface for HR teams and employees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Free trial available to evaluate before purchasing$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Pricing is not published and requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Payroll functionality is limited to certain supported regions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Advanced performance and payroll features require higher-tier plans or add-ons$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$How much does BambooHR cost?$q$, $q$BambooHR does not publish pricing; costs are quote-based depending on company size, plan tier (Core or Pro), and add-on modules.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Does BambooHR include payroll?$q$, $q$Yes, BambooHR offers payroll processing as part of its platform in supported regions.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Is BambooHR good for small businesses?$q$, $q$Yes, BambooHR is built specifically for small and mid-sized businesses, typically ranging from around 20 to 1,000+ employees.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Does BambooHR offer a free trial?$q$, $q$Yes, BambooHR offers a free trial for prospective customers to evaluate the platform.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Centralizing HR operations$q$, $q$Replacing spreadsheets and disconnected tools with one HR system.$q$, $q$HR teams at small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$Hiring and onboarding$q$, $q$Managing the full hiring pipeline and structured new-hire onboarding.$q$, $q$Talent acquisition and HR teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$BambooHR is an all-in-one human resources platform founded in 2008 and headquartered in Draper, Utah. It is designed specifically for small and mid-sized businesses that need to manage the full employee lifecycle in one system rather than juggling spreadsheets and disconnected point tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$BambooHR covers applicant tracking and hiring, customizable onboarding workflows, an employee database with self-service access, time-off tracking, e-signature document management, payroll processing in supported regions, benefits administration, and performance management with goal tracking and 360-degree feedback.$q$, $q$The platform includes an AI-powered assistant that surfaces HR insights and automates routine administrative tasks, and integrates with more than 125 third-party applications spanning payroll providers, benefits carriers, and other business software.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$BambooHR does not publish flat pricing on its website. Costs are quote-based and depend on company size, whether a business selects the Core or Pro plan tier, and add-ons such as payroll or performance management modules. A free trial is available for prospective customers.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Bardeen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bardeen is an AI-powered browser automation tool that lets users build no-code workflows to automate repetitive web-based tasks and data extraction.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from ~$10/month)$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bardeen: AI Browser Automation & No-Code Workflows$q$, seo_title),
  seo_meta_description = COALESCE($q$Bardeen is an AI-powered browser extension that automates repetitive web tasks and data extraction with no-code workflows and app integrations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bardeen is an AI-powered browser automation platform founded in 2021 by Artem Harutyunyan and Pasha Vorobyev, headquartered in San Francisco, California, and backed by investors including Multiple Capital, XYZ Venture Capital, and Y Combinator. Delivered primarily as a browser extension (for Chrome and other Chromium-based browsers), Bardeen lets users build no-code automation workflows — called 'Playbooks' — that scrape and extract data from web pages, automate repetitive multi-step tasks across websites and SaaS tools, and connect actions between different apps without writing code. Its AI layer, Bardeen AI, can generate automations from natural-language instructions, summarize content, and trigger actions based on context detected on the current web page. The platform includes a library of pre-built templates for common use cases like lead generation, CRM data entry, LinkedIn scraping, and competitive research, and integrates with tools such as Google Sheets, Notion, HubSpot, Salesforce, Slack, and Airtable. Bardeen offers a freemium pricing model: a free plan with limited monthly automation credits, and paid Individual and Team plans (typically priced per user per month) that increase credit limits, unlock premium integrations, and add collaboration features; custom Enterprise pricing is available for larger organizations. Bardeen is aimed at sales, marketing, recruiting, and operations professionals who spend significant time on repetitive browser-based tasks like data entry, prospecting, and lead enrichment.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$No-Code Playbooks$q$, $q$Build browser automation workflows visually without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Web Data Scraping$q$, $q$Extract structured data from web pages automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$AI-Generated Automations$q$, $q$Generate automations from natural-language instructions via Bardeen AI.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Pre-Built Templates$q$, $q$Ready-made playbooks for lead generation, CRM entry, and research tasks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$App Integrations$q$, $q$Connects with Google Sheets, Notion, HubSpot, Salesforce, Slack, and Airtable.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Context-Aware Actions$q$, $q$Triggers automations based on content detected on the current web page.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$No-code workflow builder accessible to non-technical users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$AI-generated automations from natural-language prompts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Free plan available to start automating simple tasks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Wide range of pre-built templates for common sales/marketing workflows$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Free tier is limited by monthly automation credits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Primarily browser-extension based, limiting automation to web-accessible tasks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Complex, multi-step automations may still require some workflow-building learning curve$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Is Bardeen free?$q$, $q$Yes, Bardeen offers a free plan with limited monthly automation credits; paid Individual and Team plans unlock higher limits and premium integrations.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$What is Bardeen used for?$q$, $q$Bardeen automates repetitive browser-based tasks like data extraction, CRM data entry, lead generation, and cross-app workflows.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Does Bardeen require coding?$q$, $q$No, Bardeen uses a no-code workflow builder called Playbooks, with AI able to generate automations from natural-language instructions.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$What browsers does Bardeen support?$q$, $q$Bardeen runs as a browser extension on Chrome and other Chromium-based browsers.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Sales prospecting and lead generation$q$, $q$Automating data extraction and CRM entry for sales pipelines.$q$, $q$Sales and business development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$Recruiting and research automation$q$, $q$Scraping candidate or company data from web sources for research.$q$, $q$Recruiters and operations professionals$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bardeen is an AI-powered browser automation platform founded in 2021 and headquartered in San Francisco, California. Delivered as a browser extension, it lets users build no-code automation workflows called 'Playbooks' to automate repetitive web-based tasks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bardeen automates data scraping and extraction from web pages, multi-step tasks across websites and SaaS tools, and cross-app actions without code. Its Bardeen AI layer can generate automations from natural-language instructions and trigger context-aware actions based on the current page.$q$, $q$A library of pre-built templates covers common use cases like lead generation, CRM data entry, LinkedIn scraping, and competitive research, and the platform integrates with tools including Google Sheets, Notion, HubSpot, Salesforce, Slack, and Airtable.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Bardeen offers a free plan with limited monthly automation credits, paid Individual and Team plans (typically per user per month) with higher credit limits and premium integrations, and custom Enterprise pricing for larger organizations.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Baremetrics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Baremetrics is a subscription analytics and revenue metrics platform that tracks MRR, churn, and financial KPIs for SaaS and subscription businesses.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$108/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Denver, Colorado, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Baremetrics: Subscription Analytics & MRR Tracking$q$, seo_title),
  seo_meta_description = COALESCE($q$Baremetrics tracks MRR, churn, LTV, and other subscription metrics for SaaS businesses, integrating with Stripe, Chargebee, and other billing platforms.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Baremetrics is a subscription analytics and revenue metrics platform founded in 2013 by Josh Pigford, headquartered in Denver, Colorado. It connects directly to billing and payment platforms such as Stripe, Chargebee, Braintree, Recurly, and Paddle to automatically calculate and visualize key SaaS metrics, including monthly recurring revenue (MRR), annual recurring revenue (ARR), churn rate (both customer and revenue churn), customer lifetime value (LTV), average revenue per user, and trial conversion rates. Baremetrics provides pre-built dashboards for these metrics without requiring manual spreadsheet work, along with cohort analysis, forecasting tools, and customer segmentation. It also offers involuntary churn recovery tools (Recover) that automatically retry failed payments, and Cancellation Insights, which surveys churning customers to understand why they left and can present save offers before cancellation completes. Baremetrics is sold via a subscription model with tiers based on monthly tracked revenue, starting around $108/month billed annually (higher if billed monthly), scaling up through higher tiers for larger revenue volumes, plus a free trial to test the platform. It is best suited to SaaS founders, finance teams, and revenue operations professionals who want an out-of-the-box, always-current view of subscription business health without building custom analytics on top of raw billing data.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '28f21e6a-228f-419e-9602-09cb10f941a9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '28f21e6a-228f-419e-9602-09cb10f941a9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$MRR & ARR Tracking$q$, $q$Automatically calculates and visualizes recurring revenue metrics.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Churn Analysis$q$, $q$Tracks both customer and revenue churn rates over time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Cohort Analysis$q$, $q$Analyzes customer behavior and revenue trends by signup cohort.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Recover (Failed Payment Retry)$q$, $q$Automatically retries failed payments to reduce involuntary churn.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Cancellation Insights$q$, $q$Surveys churning customers and can present save offers before cancellation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Billing Platform Integrations$q$, $q$Connects with Stripe, Chargebee, Braintree, Recurly, and Paddle.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Automatic, always-current SaaS metrics without manual spreadsheet work$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Direct integrations with major billing and payment platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Built-in churn recovery tools (Recover, Cancellation Insights) can directly recoup revenue$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Free trial available before committing to a paid plan$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Pricing scales with tracked revenue, which can get costly for larger SaaS businesses$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Primarily useful for subscription/recurring-revenue businesses, less relevant for one-time purchase models$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Advanced features may require higher-tier plans$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$What does Baremetrics track?$q$, $q$Baremetrics tracks MRR, ARR, churn rate, customer lifetime value, average revenue per user, and trial conversion for subscription businesses.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$How much does Baremetrics cost?$q$, $q$Plans start around $108/month billed annually, with pricing tiers based on monthly tracked revenue.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$What billing platforms does Baremetrics integrate with?$q$, $q$Baremetrics integrates with Stripe, Chargebee, Braintree, Recurly, and Paddle.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Does Baremetrics help reduce churn?$q$, $q$Yes, its Recover tool automatically retries failed payments, and Cancellation Insights surveys churning customers and can offer save incentives.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$SaaS revenue metrics tracking$q$, $q$Founders and finance teams monitoring MRR, churn, and LTV without manual reporting.$q$, $q$SaaS founders and finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Reducing involuntary churn$q$, $q$Automatically recovering revenue lost to failed payment retries.$q$, $q$Subscription businesses$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$Starter$q$, $q$$108/month$q$, $q$billed annually$q$, NULL, $q$["Core subscription analytics dashboards","MRR, ARR, and churn tracking","Billing platform integrations"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Baremetrics is a subscription analytics platform founded in 2013 and headquartered in Denver, Colorado. It connects to billing platforms like Stripe, Chargebee, Braintree, Recurly, and Paddle to automatically calculate and visualize key SaaS metrics.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Baremetrics tracks MRR, ARR, churn rate (customer and revenue), customer lifetime value, average revenue per user, and trial conversion, presented through pre-built dashboards, cohort analysis, and forecasting tools.$q$, $q$It also includes Recover, which automatically retries failed payments to reduce involuntary churn, and Cancellation Insights, which surveys churning customers and can present save offers before a cancellation completes.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Baremetrics pricing starts around $108/month when billed annually, with tiers based on monthly tracked revenue and higher pricing for larger revenue volumes. A free trial is available to test the platform before subscribing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Bareos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bareos is a free, open-source network backup and recovery solution forked from Bacula, supporting Linux, Windows, and Mac with an optional paid subscription for support.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) + paid subscription support$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Cologne, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_title = COALESCE($q$Bareos: Open Source Backup & Recovery Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Bareos is a free, open-source network backup and recovery tool forked from Bacula, with cloud storage support and an optional paid support subscription.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bareos (Backup Archiving Recovery Open Sourced) is a free, open-source network backup, archiving, and recovery software project forked from Bacula in 2010 by a group of former Bacula developers. It is maintained by Bareos GmbH & Co. KG, a company headquartered in Cologne, Germany, that develops the open-source project and offers paid subscription support for organizations that want commercial assistance. Bareos supports backing up and restoring data across Linux, Windows, and Mac client systems from a centralized director, and includes features such as data deduplication, TLS-PSK encrypted communications, tape and disk-based storage, cloud storage backend support (including S3-compatible object storage), a plugin architecture for backing up databases like PostgreSQL and MySQL/MariaDB, and a web-based administration interface (Bareos WebUI). The core software is released under the AGPL v3 open-source license and is entirely free to download, install, and use without licensing fees. Bareos GmbH & Co. KG generates revenue through Bareos Subscription, a paid support offering with SLA-backed response times, access to additional enterprise-focused modules, and professional services, while the underlying open-source software remains free. Bareos is best suited to system administrators and IT teams managing mixed-OS network backups who want an actively maintained, community-driven alternative to proprietary backup software, with the option to add paid vendor support if needed.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '75745b38-a453-422a-bd66-d036181d6207';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '75745b38-a453-422a-bd66-d036181d6207' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '75745b38-a453-422a-bd66-d036181d6207';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Cross-platform backup$q$, $q$Backs up and restores data across Linux, Windows, and Mac clients from a central director.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Data deduplication$q$, $q$Reduces storage usage by eliminating redundant backup data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Cloud storage support$q$, $q$Backs up to S3-compatible object storage and other cloud backends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Database backup plugins$q$, $q$Dedicated plugins for backing up PostgreSQL and MySQL/MariaDB.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Bareos WebUI$q$, $q$Web-based administration interface for managing backup jobs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$TLS-PSK Encryption$q$, $q$Encrypts communications between backup clients, director, and storage.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '75745b38-a453-422a-bd66-d036181d6207';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Free and open source under the AGPL v3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Actively maintained fork with regular releases and updates$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Optional paid subscription provides commercial support and SLAs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Supports cloud storage backends alongside traditional tape/disk$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '75745b38-a453-422a-bd66-d036181d6207';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Requires self-hosting and backup infrastructure knowledge to configure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Full enterprise-grade support requires the paid subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Interface complexity is comparable to other traditional enterprise backup tools$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '75745b38-a453-422a-bd66-d036181d6207';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Is Bareos free?$q$, $q$Yes, the core Bareos software is free and open source under the AGPL v3 license; a paid support subscription is optional.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Is Bareos related to Bacula?$q$, $q$Yes, Bareos was forked from Bacula in 2010 by a group of former Bacula developers.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Who maintains Bareos?$q$, $q$Bareos GmbH & Co. KG, a company headquartered in Cologne, Germany, maintains the open-source project and offers paid support.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Does Bareos support cloud storage?$q$, $q$Yes, Bareos supports backing up to cloud and S3-compatible object storage backends.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '75745b38-a453-422a-bd66-d036181d6207';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Mixed-OS network backup$q$, $q$IT teams backing up Linux, Windows, and Mac systems from a central console.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Database and cloud backup$q$, $q$Organizations backing up databases and cloud/object storage alongside traditional file systems.$q$, $q$IT and infrastructure teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '75745b38-a453-422a-bd66-d036181d6207';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bareos is a free, open-source network backup and recovery project forked from Bacula in 2010 by former Bacula developers. It is maintained by Bareos GmbH & Co. KG, headquartered in Cologne, Germany, which also offers paid support subscriptions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bareos backs up and restores data across Linux, Windows, and Mac clients from a centralized director, with data deduplication, TLS-PSK encrypted communications, and support for both tape and disk-based storage, including cloud/S3-compatible backends.$q$, $q$A plugin architecture supports backing up databases like PostgreSQL and MySQL/MariaDB, and Bareos WebUI provides a web-based administration interface.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The core Bareos software is free and open source under the AGPL v3 license. Bareos GmbH & Co. KG offers a paid Bareos Subscription with SLA-backed support, additional enterprise-focused modules, and professional services for organizations that want commercial assistance.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75745b38-a453-422a-bd66-d036181d6207', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75745b38-a453-422a-bd66-d036181d6207', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75745b38-a453-422a-bd66-d036181d6207', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75745b38-a453-422a-bd66-d036181d6207', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Basecamp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Basecamp is a project management and team communication platform from 37signals, offering to-do lists, message boards, schedules, and file storage in one flat-rate product.$q$, short_description),
  pricing_model = COALESCE($q$Flat-rate subscription (with free trial)$q$, pricing_model),
  starting_price = COALESCE($q$$15/user/month (or $299/month flat-rate unlimited users)$q$, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Chicago, Illinois, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Basecamp: Project Management & Team Communication$q$, seo_title),
  seo_meta_description = COALESCE($q$Basecamp combines to-do lists, message boards, schedules, and file storage in one project management tool, with flat-rate unlimited-user pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Basecamp is a project management and team communication platform created by 37signals (formerly Basecamp, formerly 37signals again), a company founded in 1999 by Jason Fried, Carlos Segura, and Ernest Kim, headquartered in Chicago, Illinois, and long led by CEO Jason Fried and CTO David Heinemeier Hansson (creator of Ruby on Rails, which was originally extracted from Basecamp's codebase). Basecamp organizes work around individual projects, each containing to-do lists, message boards for asynchronous discussion, schedules, file and document storage, group chat ('Campfire'), and automatic check-in questions. The current version, Basecamp 4 (also referred to simply as Basecamp), consolidates these tools with the explicit design philosophy of replacing scattered email threads, chat messages, and status meetings with a single, calmer home base for project work. Basecamp is known for its distinctively simple, flat-rate pricing: rather than per-feature tiers, it offers per-user pricing at $15/user/month, or an unlimited-users Pro Unlimited plan at a flat $349/month (billed annually) or similar flat monthly rate, giving larger teams cost predictability regardless of headcount. A 30-day free trial is available. Basecamp is aimed at small and mid-sized businesses, agencies, and remote/distributed teams that want an all-in-one, non-overwhelming alternative to stitching together separate task management, chat, and file-sharing tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e9285583-523b-4e6a-b932-0f19d3c503b8' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$To-Do Lists$q$, $q$Task management organized by project with assignees and due dates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Message Boards$q$, $q$Asynchronous discussion threads to replace scattered email and chat.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Schedules$q$, $q$Shared project calendars and milestone tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$File & Document Storage$q$, $q$Centralized storage for project files and documents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Campfire Group Chat$q$, $q$Real-time group chat within each project.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Automatic Check-Ins$q$, $q$Recurring questions that collect team updates without meetings.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Flat-Rate Unlimited Pricing$q$, $q$Optional flat monthly fee covering unlimited users, avoiding per-seat cost growth.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Simple, predictable flat-rate pricing option for unlimited users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$All-in-one tool reduces need for separate chat, task, and file tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Long track record (since 1999) with a stable, well-known product$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$30-day free trial available$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Feature set is intentionally simpler than more configurable PM tools like Asana or Jira$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Per-user pricing ($15/user/month) can be pricier than competitors for very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Limited customization compared to tools built for complex workflow automation$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$How much does Basecamp cost?$q$, $q$Basecamp costs $15/user/month, or a flat-rate Pro Unlimited plan covering unlimited users for a flat monthly fee.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Who makes Basecamp?$q$, $q$Basecamp is made by 37signals, founded in 1999 and led by Jason Fried and David Heinemeier Hansson.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Does Basecamp offer a free trial?$q$, $q$Yes, Basecamp offers a 30-day free trial.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$What's included in a Basecamp project?$q$, $q$Each project includes to-do lists, a message board, a schedule, file storage, group chat, and automatic check-in questions.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$All-in-one project collaboration$q$, $q$Teams replacing scattered email and chat tools with one project home base.$q$, $q$Small and mid-sized business teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Agency and client project management$q$, $q$Agencies managing multiple client projects with predictable flat-rate pricing.$q$, $q$Agencies and consultancies$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Basecamp$q$, $q$$15/user/month$q$, $q$monthly$q$, NULL, $q$["To-do lists","Message boards","Schedules","File storage","Campfire chat","Automatic check-ins"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Pro Unlimited$q$, $q$Flat monthly/annual fee$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited users","All core Basecamp features","Advanced admin controls","Priority support"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'e9285583-523b-4e6a-b932-0f19d3c503b8';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Basecamp is a project management and team communication platform from 37signals, a company founded in 1999 and headquartered in Chicago, Illinois. It is led by CEO Jason Fried and CTO David Heinemeier Hansson, the creator of Ruby on Rails, which was originally extracted from Basecamp's own codebase.$q$, $q$Basecamp organizes work around individual projects, each containing to-do lists, message boards, schedules, file storage, group chat, and automatic check-in questions, designed to replace scattered email threads and status meetings with a single home base for project work.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Each Basecamp project includes to-do lists, a message board for asynchronous discussion, a shared schedule, document and file storage, group chat (Campfire), and automated check-in questions that collect recurring updates from team members without meetings.$q$, $q$The platform emphasizes a calm, non-overwhelming interface as a deliberate design choice, positioning itself against feature-heavy project management tools that can create notification overload.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Basecamp offers per-user pricing at $15/user/month, or a flat-rate Pro Unlimited plan covering unlimited users for a flat monthly/annual fee, giving larger teams predictable costs regardless of headcount. A 30-day free trial is available.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Baserow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Baserow is an open-source, no-code database and spreadsheet-like platform for building apps and workflows, available self-hosted or as a managed cloud service.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted or Cloud free tier); paid plans from ~$5/user/month$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Amsterdam, Netherlands$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Baserow: Open-Source No-Code Database Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Baserow is an open-source, no-code database and spreadsheet platform for building apps, self-hostable or available as a managed Cloud service.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Baserow is an open-source, no-code database platform founded in 2019 by Bram Wiepjes, headquartered in Amsterdam, Netherlands, and positioned as an open-source alternative to tools like Airtable. It combines a familiar spreadsheet-like interface with a relational database backend, letting users without coding experience build custom applications, track data, and automate workflows. Core features include multiple field types, filtering, sorting, and grouping views (grid, gallery, kanban, calendar, and form views), row-level permissions, an automation builder for triggering actions based on data changes, a REST API and webhooks for integrating with other systems, and an AI field type for generating or analyzing data with AI models. Because Baserow's core is open source (distributed under an MIT-based license for the community edition, with an open-core model for advanced features), it can be self-hosted for free on a company's own infrastructure, giving full control over data. Baserow also offers a managed Baserow Cloud service with a free tier and paid Premium/Advanced plans (roughly $5-$10 per user per month) that add advanced permissions, AI features, and premium views, plus a custom-priced Enterprise tier with SSO and dedicated support. Baserow is best suited to teams building internal tools, project trackers, CRMs, or content databases who want Airtable-like flexibility with the option of full data ownership through self-hosting.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8a277ff8-0957-4069-9f79-4ef1be818b6e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Spreadsheet-like Database$q$, $q$Familiar grid interface backed by a true relational database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Multiple Views$q$, $q$Grid, gallery, kanban, calendar, and form views for the same data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$No-Code Automation Builder$q$, $q$Trigger automated actions based on data changes without coding.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$REST API & Webhooks$q$, $q$Integrate Baserow data with other systems programmatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$AI Field Type$q$, $q$Generate or analyze data using AI models directly within tables.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Self-Hostable Open Source$q$, $q$Free, self-hostable core with full data ownership and control.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Open-source core is free to self-host with full data ownership$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Airtable-like flexibility without vendor lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$REST API and webhooks support deep integration with other tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$AI field type adds AI-powered data generation and analysis$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Advanced permissions and AI features require paid Cloud plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Self-hosting requires infrastructure setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Smaller third-party integration ecosystem than more established no-code platforms$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Is Baserow free?$q$, $q$Yes, Baserow's community edition is free and open source for self-hosting; Baserow Cloud also offers a free tier alongside paid plans.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Can Baserow be self-hosted?$q$, $q$Yes, Baserow can be self-hosted for free using its open-source community edition.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Is Baserow an Airtable alternative?$q$, $q$Yes, Baserow is commonly positioned as an open-source alternative to Airtable with similar spreadsheet-database functionality.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Does Baserow have an API?$q$, $q$Yes, Baserow includes a REST API and webhooks for integrating with other systems.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Internal tools and trackers$q$, $q$Building custom internal databases, trackers, and lightweight apps without code.$q$, $q$Operations and internal tools teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Self-hosted data platform$q$, $q$Organizations wanting full data ownership by self-hosting instead of using a SaaS database tool.$q$, $q$Privacy-conscious or self-hosting teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Community (self-hosted)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full open-source database platform","Self-hosted deployment","REST API and webhooks"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Baserow Cloud Free$q$, $q$$0$q$, $q$monthly$q$, NULL, $q$["Managed hosting","Core database and view features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$Premium/Advanced$q$, $q$~$5-$10/user/month$q$, $q$monthly$q$, NULL, $q$["Advanced permissions","AI field type","Premium views"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Baserow is an open-source, no-code database platform founded in 2019 and headquartered in Amsterdam, Netherlands. It combines a spreadsheet-like interface with a relational database backend, positioned as an open-source alternative to tools like Airtable.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Baserow supports multiple field types and views — grid, gallery, kanban, calendar, and form — along with filtering, sorting, and grouping. An automation builder triggers actions based on data changes, and a REST API with webhooks allows integration with other systems.$q$, $q$An AI field type lets users generate or analyze data using AI models directly within tables, and row-level permissions support controlled collaboration across teams.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Baserow's community edition is free and open source for self-hosting. Baserow Cloud offers a free tier plus paid Premium and Advanced plans (roughly $5-$10 per user per month) adding advanced permissions, AI features, and premium views, with custom Enterprise pricing including SSO and dedicated support.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Baseten ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Baseten is a managed AI model inference platform for deploying, scaling, and serving open-source and custom machine learning models in production.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based (free trial credits + paid plans)$q$, pricing_model),
  starting_price = COALESCE($q$Usage-based; free trial credits for new users$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Baseten: Managed AI Model Inference Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Baseten is a managed inference platform for deploying and scaling open-source and custom AI models in production, with autoscaling GPU infrastructure.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Baseten is a managed AI model inference and deployment platform founded in 2019 by Tuhin Srivastava, Amir Haghighat, and Philip Howes, headquartered in San Francisco, California, and backed by investors including IVP, Spark Capital, and Greylock. It provides infrastructure for deploying, scaling, and serving machine learning models in production, including popular open-source models (such as Llama, Stable Diffusion, and Whisper) as well as custom-trained models, without requiring ML teams to build and manage their own GPU infrastructure. Baseten's platform, built on its open-source model packaging framework Truss, handles autoscaling (including scale-to-zero), multi-cloud/multi-region GPU compute across providers, model versioning, and production monitoring, with a focus on low-latency, high-throughput inference for real-time applications like chatbots, image generation, and voice AI. It offers a model library of ready-to-deploy open-source models alongside support for deploying fully custom models and pipelines. Baseten uses usage-based pricing tied to GPU compute time, with free trial credits available for new users to test the platform, and custom Enterprise pricing for larger deployments requiring dedicated capacity, private cloud deployment, or compliance features (like SOC 2 and HIPAA support). Baseten is best suited to AI/ML engineering teams building production applications on top of generative AI and other machine learning models who want managed inference infrastructure rather than operating their own GPU clusters.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5ad76bbb-468c-4854-b144-baf5844135c5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5ad76bbb-468c-4854-b144-baf5844135c5' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5ad76bbb-468c-4854-b144-baf5844135c5';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Managed GPU Inference$q$, $q$Deploy and serve ML models without managing your own GPU infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Autoscaling & Scale-to-Zero$q$, $q$Automatically scales compute based on demand, including scaling to zero when idle.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Open-Source Model Library$q$, $q$Ready-to-deploy versions of popular models like Llama, Stable Diffusion, and Whisper.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Custom Model Deployment$q$, $q$Deploy custom-trained models and inference pipelines using the Truss framework.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Multi-Cloud GPU Compute$q$, $q$Access GPU compute across multiple cloud providers and regions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Production Monitoring$q$, $q$Monitor model performance, latency, and reliability in production.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '5ad76bbb-468c-4854-b144-baf5844135c5';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Removes the need to build and manage GPU infrastructure in-house$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Scale-to-zero autoscaling avoids paying for idle compute$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Broad library of ready-to-deploy open-source models$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Free trial credits available for new users to evaluate the platform$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5ad76bbb-468c-4854-b144-baf5844135c5';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Usage-based GPU pricing can be harder to predict than flat subscription pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Enterprise compliance features (SOC 2, HIPAA) require custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Best suited for teams with existing ML/AI deployment needs rather than no-code users$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5ad76bbb-468c-4854-b144-baf5844135c5';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$What is Baseten used for?$q$, $q$Baseten is used to deploy, scale, and serve machine learning models in production, including open-source and custom-trained models.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$How is Baseten priced?$q$, $q$Baseten uses usage-based pricing tied to GPU compute time, with free trial credits for new users and custom Enterprise pricing for larger deployments.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$What models can I deploy on Baseten?$q$, $q$Baseten offers a library of ready-to-deploy open-source models like Llama, Stable Diffusion, and Whisper, plus support for custom models via its Truss framework.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Does Baseten support scale-to-zero?$q$, $q$Yes, Baseten's autoscaling includes scale-to-zero to avoid paying for idle GPU compute.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5ad76bbb-468c-4854-b144-baf5844135c5';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Production LLM and generative AI inference$q$, $q$Deploying real-time inference for chatbots, image generation, and voice AI applications.$q$, $q$AI/ML engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Custom model deployment$q$, $q$Serving custom-trained machine learning models in production without managing GPU infrastructure.$q$, $q$ML engineers and data science teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '5ad76bbb-468c-4854-b144-baf5844135c5';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Baseten is a managed AI model inference platform founded in 2019 and headquartered in San Francisco, California. It provides infrastructure for deploying, scaling, and serving machine learning models in production without requiring teams to manage their own GPU infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Built on its open-source model packaging framework Truss, Baseten handles autoscaling including scale-to-zero, multi-cloud/multi-region GPU compute, model versioning, and production monitoring, optimized for low-latency, high-throughput inference.$q$, $q$The platform offers a library of ready-to-deploy open-source models such as Llama, Stable Diffusion, and Whisper, alongside support for deploying fully custom models and inference pipelines.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Baseten uses usage-based pricing tied to GPU compute time, with free trial credits available for new users to test the platform. Custom Enterprise pricing is available for larger deployments requiring dedicated capacity, private cloud deployment, or compliance features like SOC 2 and HIPAA support.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Bear ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bear is a Markdown-based note-taking and writing app for Mac, iPhone, and iPad, known for its clean design, tagging system, and cross-note linking.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Bear Pro from $1.49/month)$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Bologna, Italy$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bear: Markdown Notes App for Mac, iPhone & iPad$q$, seo_title),
  seo_meta_description = COALESCE($q$Bear is a beautifully designed Markdown note-taking app for Apple devices, with tagging, note linking, and cross-device sync via Bear Pro.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bear is a note-taking and writing application developed by Shiny Frog, an Italian software studio headquartered in Bologna, Italy, and first released in 2016 exclusively for Apple platforms (Mac, iPhone, and iPad). It is built around Markdown-style writing with live formatting, a nested hashtag-based tagging system for organizing notes (rather than traditional folders), the ability to link notes to one another for a personal knowledge-base style workflow, and a widely praised, minimalist visual design with a range of custom themes. Bear supports exporting notes to formats including PDF, Word, HTML, and Markdown, and includes features like to-do lists, code syntax highlighting for developers, and a focus mode for distraction-free writing. The free version of Bear allows note creation and basic use on a single device, while Bear Pro, a subscription priced around $1.49/month or $14.99/year (with a lifetime purchase option previously offered), unlocks cross-device iCloud sync, unlimited notes and tags, additional themes and fonts, and advanced export options. Because it is Apple-only, Bear is aimed specifically at Mac, iPhone, and iPad users — writers, developers, and knowledge workers — who want a fast, well-designed, Markdown-native notes app rather than a cross-platform tool like Notion or Evernote.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Live Markdown Editing$q$, $q$Write notes with live Markdown formatting as you type.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Hashtag-Based Tagging$q$, $q$Organize notes with nested hashtags instead of traditional folders.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Note Linking$q$, $q$Link notes to each other for a personal knowledge-base workflow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Cross-Device Sync (Pro)$q$, $q$iCloud sync across Mac, iPhone, and iPad on Bear Pro.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Export Options$q$, $q$Export notes to PDF, Word, HTML, and Markdown formats.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Focus Mode & Code Highlighting$q$, $q$Distraction-free writing mode plus syntax highlighting for code snippets.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Clean, widely praised minimalist design$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Fast, native performance on Apple devices$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Flexible tagging and note-linking system for organizing thoughts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Affordable subscription pricing for Bear Pro$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Available only on Apple platforms (Mac, iPhone, iPad) — no Windows, Android, or web version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Cross-device sync requires the paid Bear Pro subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Less suited to team collaboration compared to multi-platform tools like Notion$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Is Bear free?$q$, $q$Yes, Bear has a free version for single-device use; Bear Pro (around $1.49/month or $14.99/year) unlocks sync and unlimited notes/tags across devices.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$What platforms does Bear support?$q$, $q$Bear is available exclusively on Apple platforms: Mac, iPhone, and iPad.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Does Bear support Markdown?$q$, $q$Yes, Bear uses live Markdown formatting as the core of its writing experience.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Can I link notes together in Bear?$q$, $q$Yes, Bear supports linking notes to one another for a personal knowledge-base style workflow.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Personal note-taking and journaling$q$, $q$Writers and individuals capturing notes, ideas, and journals in Markdown.$q$, $q$Individual writers and note-takers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Developer notes and code snippets$q$, $q$Developers keeping technical notes with syntax-highlighted code snippets.$q$, $q$Developers and technical writers$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Note creation on a single device","Markdown editing","Basic tagging"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$Bear Pro$q$, $q$$1.49/month or $14.99/year$q$, $q$monthly or annual$q$, NULL, $q$["Cross-device iCloud sync","Unlimited notes and tags","Additional themes and fonts","Advanced export options"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '233cbc74-52cc-4f26-9f7e-c27a33f74bfc';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bear is a Markdown-based note-taking app developed by Shiny Frog, an Italian software studio based in Bologna, and first released in 2016. It is built exclusively for Apple platforms — Mac, iPhone, and iPad.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bear uses live Markdown formatting as you type, a nested hashtag-based tagging system in place of traditional folders, and note-to-note linking that lets users build a personal knowledge base. It also includes to-do lists, code syntax highlighting, and a focus mode for distraction-free writing.$q$, $q$Notes can be exported to PDF, Word, HTML, and Markdown formats, and the app is known for its clean, minimalist design and range of custom visual themes.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Bear's free version allows note creation and basic use on a single device without sync. Bear Pro, priced around $1.49/month or $14.99/year, unlocks cross-device iCloud sync, unlimited notes and tags, additional themes and fonts, and advanced export options.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('233cbc74-52cc-4f26-9f7e-c27a33f74bfc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


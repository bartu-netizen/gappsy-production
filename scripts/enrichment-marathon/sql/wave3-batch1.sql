-- Enrichment marathon batch: AppFlowy, Applitools, Appointlet, AppSheet, AppSignal, Appsmith, Apptivo, Appwrite

-- ── AppFlowy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AppFlowy is an open-source, AI-powered workspace for notes, wikis, and project collaboration that lets users self-host their data instead of relying on a vendor's cloud.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Singapore$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AppFlowy: Open-Source, Privacy-First Notion Alternative$q$, seo_title),
  seo_meta_description = COALESCE($q$AppFlowy is a free, open-source AI workspace for notes, wikis, and projects that you can self-host to keep full control of your data.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AppFlowy is an open-source workspace application, positioned as a privacy-first alternative to Notion, that combines notes, wikis, databases, and project management in one tool. Founded in 2021 and headquartered in Singapore, AppFlowy emphasizes user data ownership: the app can run fully offline and be self-hosted, with no vendor lock-in required. It ships as free desktop apps for Windows, macOS, and Linux, mobile apps for iOS and Android, and a browser-based client, with real-time sync across devices. A notable feature is optional AI integration, allowing users to connect models such as Mistral 7B, Llama 3, or hosted models like GPT and Claude for AI-assisted writing, question answering, and table autofill within their workspace. The product supports customizable database views, rich-text blocks, and themes for organizing information. AppFlowy is built and maintained by an active open-source community, citing over 10,000 community members across 215 countries and roughly 400 code contributors, with development happening in the open on GitHub. The core product is free and open source under a permissive license; the company has also introduced a hosted AppFlowy Cloud offering for teams that want managed sync without self-hosting. AppFlowy suits individuals, small teams, and privacy-conscious organizations that want a customizable, self-hostable knowledge and project management tool without recurring SaaS fees.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a124a9a-48f0-4b4c-95da-4dc646598e63' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Self-hosting$q$, $q$Run AppFlowy on your own infrastructure with no vendor lock-in, or use the offline-first desktop app entirely without a server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$AI assistance$q$, $q$Connect local models (e.g. Mistral 7B, Llama 3) or hosted models for AI-assisted writing, answering questions, and autofilling tables.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Customizable databases$q$, $q$Build multiple views, custom properties, and layouts for organizing structured information alongside notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Offline-first sync$q$, $q$Work fully offline and sync data across devices when a connection is available.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Cross-platform apps$q$, $q$Native clients for Windows, macOS, Linux, iOS, and Android, plus a browser-based version.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Open-source codebase$q$, $q$Actively developed on GitHub by a community of contributors, with a public roadmap and issue tracker.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Free and open source with no mandatory subscription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Full self-hosting option for organizations with data-residency or privacy requirements$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Works offline by design, not as an afterthought$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Active open-source community and public development roadmap$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Younger product than established competitors like Notion, so some polish and integrations are still maturing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Self-hosting requires technical setup and maintenance effort$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$AI features depend on connecting external or local models rather than being built-in out of the box$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Is AppFlowy free to use?$q$, $q$Yes. AppFlowy's core app is free and open source, and it can be self-hosted at no licensing cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Can AppFlowy work offline?$q$, $q$Yes, AppFlowy is designed to be offline-first, allowing full local use with sync happening only when a connection is available.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Does AppFlowy support AI features?$q$, $q$Yes, it supports connecting local or hosted AI models for writing assistance, Q&A, and table autofill within your workspace.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$What platforms does AppFlowy run on?$q$, $q$AppFlowy has native apps for Windows, macOS, Linux, iOS, and Android, plus a web client.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Privacy-conscious note-taking$q$, $q$Individuals and teams who want a Notion-style workspace but require full control over where their data lives.$q$, $q$Privacy-focused individuals and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$Self-hosted team wikis$q$, $q$Organizations that need an internal knowledge base and project tracker hosted on their own infrastructure.$q$, $q$IT/ops teams and self-hosting enthusiasts$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '9a124a9a-48f0-4b4c-95da-4dc646598e63';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AppFlowy is an open-source workspace app that bundles notes, wikis, databases, and project management into a single tool, built as a self-hostable alternative to closed, cloud-only productivity apps. It was founded in 2021 and is headquartered in Singapore.$q$, $q$The core promise of AppFlowy is data ownership: users can run the app entirely offline, sync only when they choose to, and self-host their own instance rather than depending on a third-party cloud, while an official AppFlowy Cloud option exists for teams that prefer managed hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AppFlowy offers customizable database views, rich-text blocks, and themes for organizing notes and projects, along with optional AI features that let users connect local or hosted language models for writing assistance, question answering, and table autofill inside their workspace.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$AppFlowy is available as native desktop apps for Windows, macOS, and Linux, mobile apps for iOS and Android, and a web-based client, with real-time sync across devices when connected.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a124a9a-48f0-4b4c-95da-4dc646598e63', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Applitools ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Applitools is an AI-powered testing platform for visual, functional, and cross-browser test automation, used by enterprise QA and engineering teams.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Mateo, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Applitools: AI-Powered Visual & Functional Test Automation$q$, seo_title),
  seo_meta_description = COALESCE($q$Applitools is an AI testing platform for visual, functional, and cross-browser validation, built for QA and engineering teams at scale.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Applitools is an AI-augmented software testing platform focused on visual, functional, and cross-browser/device test automation. Founded in 2013 by Gil Sever, Moshe Milman, and Adam Carmi, the company is headquartered in San Mateo, California, with a significant R&D presence in Tel Aviv, Israel; Applitools received a strategic investment from Thoma Bravo. Its core technology, Visual AI, compares application screenshots to detect meaningful visual regressions while filtering out noise like anti-aliasing or minor rendering differences, aiming to reduce false positives common in traditional pixel-diff testing. Beyond visual testing, Applitools offers autonomous and natural-language test authoring, self-healing tests that adapt to UI changes, cross-browser and cross-device execution, and testing support for web apps, native iOS/Android apps, Storybook components, PDFs, and Figma designs. The platform integrates with popular test frameworks and offers 30+ SDKs, and it can be deployed via public cloud, dedicated cloud, or on-premises for regulated environments. Applitools holds ISO 27001 and SOC 2 Type II certifications. Pricing is subscription-based and centers on "test units" with a free-trial Starter tier and custom-priced Public Cloud and Dedicated Cloud plans for larger organizations; exact list prices are not published and require contacting sales. Applitools is aimed at QA engineers, SDETs, developers, and engineering leaders at mid-size to enterprise organizations across industries like finance, healthcare, retail, and pharmaceuticals who need reliable, scalable UI test automation.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '56030237-fe9d-4c89-85b0-e8fc3b277439';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '56030237-fe9d-4c89-85b0-e8fc3b277439' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Visual AI$q$, $q$AI-based visual comparison that flags meaningful UI regressions while filtering out rendering noise to reduce false positives.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Autonomous test authoring$q$, $q$Create tests using natural language or low-code/no-code workflows in addition to traditional scripted tests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Self-healing tests$q$, $q$Tests automatically adapt to certain UI changes, reducing maintenance overhead.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Cross-browser and device testing$q$, $q$Run and validate tests across many browser and device combinations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Component testing$q$, $q$Integrates with Storybook to validate individual UI components in isolation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Multi-format coverage$q$, $q$Test web apps, native mobile apps, PDF documents, and Figma design files.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Visual AI meaningfully reduces false positives versus raw pixel-diff comparison$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Broad platform coverage spanning web, mobile, components, and documents$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Flexible deployment: public cloud, dedicated cloud, or on-premises$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$ISO 27001 and SOC 2 Type II certified, suited to regulated industries$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Pricing is not transparent and requires contacting sales for most tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Aimed primarily at teams with existing QA/test automation practices, less suited to casual or hobbyist use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Advanced features may require a learning curve for teams new to AI-driven visual testing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$What is Applitools used for?$q$, $q$Applitools is used for automated visual, functional, and cross-browser/device testing of web and mobile applications.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Is there a free trial?$q$, $q$Yes, Applitools offers a Starter tier with a free trial before moving to paid Public Cloud or Dedicated Cloud plans.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Can Applitools be deployed on-premises?$q$, $q$Yes, on-premises deployment for the Eyes visual testing product is available on the Dedicated Cloud plan.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$What platforms can Applitools test?$q$, $q$It supports web applications, native iOS and Android apps, Storybook components, PDFs, and Figma designs.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Visual regression testing$q$, $q$Catch unintended UI changes across releases without manually reviewing every screenshot.$q$, $q$QA engineers and SDETs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Enterprise cross-browser validation$q$, $q$Validate consistent UI behavior across many browser and device combinations at scale.$q$, $q$Enterprise engineering and QA teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Starter$q$, $q$Free trial$q$, $q$N/A$q$, NULL, $q$["50 test units","Unlimited users and test executions","Code, no-code, and autonomous test authoring","Public cloud deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Public Cloud$q$, $q$Custom (contact sales)$q$, $q$Annual contract$q$, NULL, $q$["Everything in Starter","1-year data retention","Dedicated customer success engineer"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Dedicated Cloud$q$, $q$Custom (contact sales)$q$, $q$Annual contract$q$, NULL, $q$["Everything in Public Cloud","SSO support","Enterprise-grade security and compliance","Optional on-premises deployment for Eyes"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '56030237-fe9d-4c89-85b0-e8fc3b277439';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Applitools is a testing platform built around Visual AI, technology that compares screenshots across builds to catch meaningful visual regressions while ignoring rendering noise, reducing the false positives common with pixel-by-pixel comparison tools.$q$, $q$Founded in 2013 and headquartered in San Mateo, California with R&D based in Tel Aviv, Applitools has grown into a broader test automation platform covering visual, functional, cross-browser, and component-level testing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform includes autonomous and natural-language test authoring, self-healing tests that adapt when UI elements change, cross-browser and cross-device execution, and root-cause analysis for failures. It supports testing web apps, native iOS and Android apps, Storybook components, PDFs, and Figma designs.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Applitools uses a subscription model priced around allocated 'test units,' with a free-trial Starter tier and Public Cloud and Dedicated Cloud plans priced individually via contact with sales; published list prices are not available on the website.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Appointlet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Appointlet is an online appointment scheduling tool that lets businesses share booking pages, sync calendars, and automate reminders to reduce no-shows.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Portland, Oregon, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Appointlet: Online Appointment Scheduling Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Appointlet lets businesses build booking pages, sync calendars, and automate reminders to schedule meetings without back-and-forth emails.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Appointlet is an online appointment scheduling platform that helps businesses and individual professionals eliminate manual back-and-forth when booking meetings. Founded in 2012 and headquartered in Portland, Oregon, Appointlet lets users create customizable, branded booking pages that clients use to reserve open time slots directly. The platform syncs with Google Calendar and Outlook to reflect real-time availability, and it automates confirmation emails, reminders, and no-show-reduction messaging. It supports team scheduling so appointments can be distributed across multiple staff members, includes web-conferencing integration for virtual meetings, and offers booking via shareable links or embedded widgets on a company website. Appointlet connects with CRMs, video conferencing tools, marketing platforms, and Zapier for broader workflow automation. It is cloud-based, accessible from any web browser, and offers a Chrome extension. Pricing follows a freemium model: after a 14-day free trial of Premium features, accounts can continue indefinitely on a Free plan (up to 5 members, 25 bookings/month), or upgrade to a Premium plan billed per member per month, with a custom Enterprise plan for larger organizations needing advanced security and reporting. Appointlet reports serving more than 250,000 organizations and facilitating over 15 million meetings, primarily across education, health & wellness, legal & financial services, recruiting/HR, property management, retail, sales, and customer success teams that need reliable, low-friction meeting scheduling.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Branded booking pages$q$, $q$Customize colors, logos, and forms on a shareable scheduling page.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Calendar sync$q$, $q$Two-way sync with Google Calendar and Outlook to reflect real-time availability.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Automated reminders$q$, $q$Send confirmations and reminders automatically to reduce no-shows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Team scheduling$q$, $q$Distribute bookings across multiple team members based on availability or round-robin rules.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Web conferencing integration$q$, $q$Attach video meeting links automatically to booked appointments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Website embedding$q$, $q$Embed the booking widget directly on a company website or share it as a link.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Usable free plan with no time limit (up to 5 members, 25 bookings/month)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Straightforward setup for calendar sync and branded booking pages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Strong integration ecosystem via Zapier and native CRM/conferencing connectors$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Team scheduling support beyond single-user booking$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Free plan is capped at a low monthly booking volume$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Advanced security and reporting require the custom-priced Enterprise plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Limited public detail on company scale/roadmap compared to larger scheduling competitors$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Is Appointlet free to use?$q$, $q$Yes, Appointlet offers a free plan for up to 5 members and 25 bookings per month after an initial 14-day Premium trial.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Does Appointlet integrate with Google Calendar and Outlook?$q$, $q$Yes, it syncs with both to reflect real-time availability automatically.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Can multiple team members share a booking page?$q$, $q$Yes, Appointlet supports team scheduling that distributes bookings across staff members.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Does Appointlet work with Zapier?$q$, $q$Yes, it integrates with Zapier along with native CRM, marketing, and video conferencing connectors.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Client meeting booking$q$, $q$Let clients self-schedule consultations or appointments without email exchanges.$q$, $q$Consultants, coaches, and service professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Team-based scheduling$q$, $q$Distribute inbound meeting requests across a sales or support team automatically.$q$, $q$Sales, recruiting, and customer success teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Up to 5 members","25 bookings per month","Core scheduling features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Premium$q$, $q$$8-10 per member/month$q$, $q$Monthly or annual (annual discounted)$q$, NULL, $q$["Unlimited bookings","Advanced customization","Integrations","14-day free trial included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$Custom$q$, NULL, $q$["Everything in Premium","Advanced security","Advanced reporting","Priority support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Appointlet is a scheduling platform, founded in 2012 and based in Portland, Oregon, that gives businesses a shareable or embeddable booking page so clients can reserve time without email back-and-forth.$q$, $q$It syncs with Google Calendar and Outlook to keep availability accurate and automates confirmations, reminders, and no-show-reduction messaging around each booking.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include customizable booking pages, team scheduling across multiple staff members, web-conferencing integration, calendar sync, automated reminders, and integrations with CRMs, marketing tools, video conferencing platforms, and Zapier.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Appointlet offers a permanently free plan for up to 5 members and 25 bookings per month, a Premium plan billed per member per month with a 14-day free trial, and a custom-priced Enterprise plan with added security and reporting features.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── AppSheet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AppSheet is Google's no-code platform for building mobile and web business apps and automations from spreadsheets, databases, or AI-generated prompts.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$5/month per user$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Seattle, Washington, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AppSheet: Google's No-Code App Builder$q$, seo_title),
  seo_meta_description = COALESCE($q$AppSheet, part of Google Cloud, lets anyone build mobile and web business apps and automations without writing code.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AppSheet is a no-code application development platform that lets users build mobile and web business apps and automated workflows without programming. Originally founded in 2014 in Seattle, Washington by Praveen Seshadri, AppSheet was acquired by Google in January 2020 and now operates as part of Google Cloud/Google Workspace. Users build apps from data sources such as Google Sheets, Excel, Salesforce, Dropbox, SQL databases, and other APIs, and AppSheet auto-generates a functional mobile or desktop app around that data. It includes AI-powered app creation using Gemini to turn a natural-language description into a working app, data capture via forms, barcodes, GPS location, signatures, and photos, and workflow automation with email, SMS, and push-notification triggers. Security features include a Zero Trust approach with encryption and governance controls suited to enterprise IT requirements. AppSheet is priced per user per month: a Starter tier begins around $5/user/month, Core around $10/user/month, and Enterprise Plus around $20/user/month, with a fully custom Enterprise Standard tier priced on request; some AppSheet functionality is also bundled into certain Google Workspace Enterprise plans via AppSheet Core licenses. Notable customers cited include Airbus and Carrefour. AppSheet targets businesses of all sizes, from large enterprises to small teams, that need to rapidly build operational apps for field work, inspections, inventory, HR, or sales without dedicated developer resources.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$AI-powered app creation$q$, $q$Uses Gemini to generate a working app from a natural-language description.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Flexible data capture$q$, $q$Collect data via forms, barcodes, GPS location, signatures, and photos.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Workflow automation$q$, $q$Trigger email, SMS, and push notifications based on data changes or schedules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Broad integrations$q$, $q$Connects to Google Workspace, Office 365, Salesforce, Dropbox, SQL databases, and general APIs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Zero Trust security$q$, $q$Built-in encryption and governance controls for enterprise IT requirements.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Offline mobile apps$q$, $q$Deployed apps work on mobile and desktop, including offline capability.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Backed by Google's infrastructure and Workspace ecosystem$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$AI-assisted app generation lowers the barrier to building a first app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Deep integration with common Google and Microsoft business tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Scales from small team tools to enterprise deployments$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Per-user pricing can add up for larger teams compared to some no-code alternatives$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Enterprise Standard tier pricing is not published and requires a custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Most tightly optimized for organizations already using Google Workspace$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Who owns AppSheet?$q$, $q$AppSheet was acquired by Google in January 2020 and now operates as part of Google Cloud and Google Workspace.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Do I need to code to use AppSheet?$q$, $q$No, AppSheet is a no-code platform; apps can be built from existing data sources or generated with AI from a text description.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$What data sources can AppSheet use?$q$, $q$It can build apps from Google Sheets, Excel, Salesforce, Dropbox, SQL databases, and other APIs.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$How much does AppSheet cost?$q$, $q$Pricing is per user per month, with commonly reported tiers around $5 (Starter), $10 (Core), and $20 (Enterprise Plus), plus a custom Enterprise Standard tier.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Field operations apps$q$, $q$Build mobile apps for inspections, inventory tracking, or field service without a developer.$q$, $q$Operations and field service teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Internal workflow automation$q$, $q$Automate approvals, notifications, and data collection tied to existing spreadsheets or databases.$q$, $q$Business teams inside Google Workspace organizations$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Starter$q$, $q$$5/user/month$q$, $q$Monthly$q$, NULL, $q$["Core no-code app building"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Core$q$, $q$$10/user/month$q$, $q$Monthly$q$, NULL, $q$["Expanded automation and integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Enterprise Plus$q$, $q$$20/user/month$q$, $q$Monthly$q$, NULL, $q$["Advanced security and governance"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$Enterprise Standard$q$, $q$Custom (contact sales)$q$, $q$Custom$q$, NULL, $q$["Tailored enterprise features"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AppSheet is a no-code platform, originally founded in Seattle in 2014 and acquired by Google in 2020, that turns existing data sources into functional mobile and web apps without requiring programming skills.$q$, $q$It now operates as part of Google Cloud and Google Workspace, and includes AI-assisted app generation powered by Gemini alongside traditional no-code app-building tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AppSheet supports data capture through forms, barcodes, GPS location, signatures, and photos; workflow automation via email, SMS, and push notifications; and integrations with Google Workspace, Office 365, Salesforce, Dropbox, databases, and APIs. It uses a Zero Trust security model with built-in encryption and governance.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$AppSheet is priced per user per month across tiers commonly reported as Starter (around $5), Core (around $10), and Enterprise Plus (around $20), with a custom-quoted Enterprise Standard tier; some capability is also included automatically with certain Google Workspace Enterprise editions.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── AppSignal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AppSignal is a unified application performance monitoring platform combining error tracking, performance monitoring, logs, uptime, and host metrics for developers.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Amsterdam, Netherlands$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AppSignal: All-in-One Application Performance Monitoring$q$, seo_title),
  seo_meta_description = COALESCE($q$AppSignal combines error tracking, performance monitoring, logs, and uptime checks in one developer-friendly APM platform, with a free tier.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AppSignal is an application performance monitoring (APM) platform that unifies error tracking, performance monitoring, log management, anomaly detection, host metrics, and uptime/cron job monitoring in a single tool. Founded in 2012 in Amsterdam, the Netherlands by Roy Tomeij, Thijs Cadier, Wes Oudshoorn, and Robert Beekman, AppSignal processes more than 500 billion requests monthly across its customer base. It offers first-party language integrations for Ruby, Elixir, Node.js, JavaScript, and Python, plus broader coverage for Go, Java, PHP, Rust, and others via OpenTelemetry support. Core features include exception tracking with full backtraces and deploy correlation, automatic instrumentation for slow-endpoint detection, full-text searchable logs linked directly to traces, configurable anomaly alerts, host and uptime monitoring, auto-generated custom dashboards, and AI-assisted debugging through MCP server integration with tools like Claude, Cursor, and Zed. Pricing is usage-based by request volume: a free plan includes 50,000 requests per month with no credit card required, and paid plans start at roughly $25/month (or about €18.25/month billed annually) with all monitoring features included on every tier and no feature gating; add-ons exist for long-term log storage, HIPAA compliance, and enterprise SSO. AppSignal emphasizes unlimited users, teams, applications, and dashboards on all plans, and positions itself for mid-sized engineering teams that want comprehensive, developer-friendly monitoring without complex enterprise pricing.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Error tracking$q$, $q$Captures exceptions with full backtraces and correlates them to deploys.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Performance monitoring$q$, $q$Auto-instrumented tracking of response times and slow endpoints.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Log management$q$, $q$Full-text searchable logs linked directly to traces.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Anomaly detection$q$, $q$Configurable alerts for metric deviations from normal baselines.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Host and uptime monitoring$q$, $q$Tracks server metrics and real-time endpoint availability.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$AI-assisted debugging$q$, $q$MCP server integration with Claude, Cursor, and Zed for AI-assisted fixes.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$All monitoring features included on every plan with no feature gating$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Genuinely usable free tier (50,000 requests/month, no credit card)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Unlimited users, teams, applications, and dashboards on all plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Broad language support via first-party integrations plus OpenTelemetry$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Usage-based pricing means costs scale with request volume as traffic grows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Fewer first-party language integrations than some larger APM competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Enterprise features like SSO require contacting sales$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Does AppSignal have a free plan?$q$, $q$Yes, it includes 50,000 requests per month for free with no credit card required.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$What languages does AppSignal support?$q$, $q$First-party integrations exist for Ruby, Elixir, Node.js, JavaScript, and Python, with OpenTelemetry support for Go, Java, PHP, Rust, and others.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$How is AppSignal priced?$q$, $q$It's usage-based by request volume, with paid plans starting around $25/month and all features included on every tier.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Can AppSignal integrate with AI coding tools?$q$, $q$Yes, it offers an MCP server integration for AI-assisted debugging with tools like Claude, Cursor, and Zed.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Full-stack app monitoring$q$, $q$Track errors, performance, and logs for a production Ruby, Elixir, Node.js, or Python application in one dashboard.$q$, $q$Backend and full-stack engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Incident response$q$, $q$Get anomaly alerts and deploy-correlated error tracking to speed up debugging during incidents.$q$, $q$On-call engineers and SREs$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["50,000 requests/month","1GB logging/month","5-day retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Paid$q$, $q$From $25/month$q$, $q$Monthly or annual$q$, NULL, $q$["250,000+ requests/month","All monitoring features","Unlimited users, teams, apps, dashboards"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AppSignal is an all-in-one APM platform, founded in 2012 in Amsterdam, that combines error tracking, performance monitoring, logs, host metrics, and uptime checks into a single product rather than requiring separate tools.$q$, $q$The company reports processing over 500 billion requests per month across its customer base and offers first-party support for Ruby, Elixir, Node.js, JavaScript, and Python, with OpenTelemetry-based coverage for additional languages like Go, Java, PHP, and Rust.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Features include exception tracking with full backtraces and deploy correlation, automatic slow-endpoint detection, full-text searchable logs linked to traces, configurable anomaly alerts, host and uptime monitoring, auto-generated dashboards, and AI-assisted debugging via MCP integration with tools like Claude, Cursor, and Zed.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$AppSignal is usage-based, priced by request volume. A free plan covers 50,000 requests per month with no credit card required, and paid plans start around $25/month with every feature included on every tier and no separate feature gating. Add-ons cover long-term log storage, HIPAA compliance, and enterprise SSO.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Appsmith ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Appsmith is an open-source low-code platform for building internal tools, dashboards, and admin panels by connecting to databases, APIs, and SaaS tools.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Appsmith: Open-Source Low-Code Internal Tool Builder$q$, seo_title),
  seo_meta_description = COALESCE($q$Appsmith is an open-source low-code platform for building internal tools, dashboards, and admin panels, self-hosted or in the cloud.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Appsmith is an open-source low-code platform for rapidly building internal applications such as admin panels, dashboards, and workflow tools. Founded in 2019 and headquartered in San Francisco, California, Appsmith provides a drag-and-drop UI builder with responsive widgets, connects to a wide range of databases, APIs, SaaS tools, and LLMs, and allows developers to drop into JavaScript for full code-level customization when needed. It supports Git-based version control and CI/CD deployment, AI-assisted development through natural-language prompts, and both cloud-hosted and self-hosted deployment, including air-gapped environments for high-security settings. The core Community Edition is fully open source under the Apache 2.0 license and free to self-host. Paid tiers add team-oriented functionality: a Business plan priced at $15 per user per month adds unlimited environments, Git repositories and workspaces, custom roles and access controls, audit logs, and branding removal, while a custom-priced Enterprise plan (cited around $2,500/month) adds SAML/OIDC SSO, SCIM provisioning, CI/CD, private app embedding, and an air-gapped edition add-on. Appsmith is SOC 2 Type II certified and is used by organizations including GSK, Twilio, Dropbox, and ByteDance. It's aimed at engineering and IT teams at startups and enterprises that need to build and maintain custom internal software faster than hand-coding from scratch, while retaining the option to self-host for compliance or cost reasons.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Drag-and-drop UI builder$q$, $q$Assemble responsive app interfaces from pre-built widgets without hand-coding layouts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Multi-source connectivity$q$, $q$Connect to databases, REST/GraphQL APIs, SaaS tools, and LLMs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$JavaScript customization$q$, $q$Drop into JavaScript for logic that goes beyond the visual builder.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Git-based version control$q$, $q$Track changes and deploy through CI/CD pipelines using Git integration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$AI-assisted development$q$, $q$Generate app components or logic from natural-language prompts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Self-hosting, including air-gapped$q$, $q$Deploy on your own infrastructure, including fully air-gapped environments for high-security needs.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Free, open-source Community Edition with no artificial feature caps for self-hosters$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Flexible deployment: cloud, self-hosted, or air-gapped$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Combines low-code speed with full JavaScript escape hatches$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$SOC 2 Type II certified with enterprise-grade access controls on paid tiers$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Business and Enterprise pricing adds up for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Some advanced governance features (SSO, SCIM) are Enterprise-only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Self-hosting requires ops effort to maintain and upgrade$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Is Appsmith open source?$q$, $q$Yes, the Community Edition is open source under the Apache 2.0 license and free to self-host.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$How much does Appsmith cost?$q$, $q$There's a free Community/cloud tier, a Business plan at $15 per user per month, and a custom-priced Enterprise plan.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Can Appsmith be self-hosted?$q$, $q$Yes, including standard self-hosting and air-gapped deployments for high-security environments.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$What data sources does Appsmith support?$q$, $q$It connects to a wide range of databases, REST/GraphQL APIs, SaaS tools, and LLMs.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Internal admin panels$q$, $q$Build CRUD interfaces for managing customer or operational data without a full engineering build.$q$, $q$Internal tools and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Custom dashboards$q$, $q$Combine data from multiple sources into a single operational dashboard for a team.$q$, $q$Operations, support, and data teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Community/Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Up to 5 users (cloud)","5 workspaces","Git version control (3 repos)","Google SSO","Public apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Business$q$, $q$$15/user/month$q$, $q$Monthly$q$, NULL, $q$["Unlimited environments, Git repos, workspaces","Custom roles and access controls","Audit logs","Branding removal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$Enterprise$q$, $q$From $2,500/month$q$, $q$Typically annual$q$, NULL, $q$["SAML/OIDC SSO","SCIM provisioning","CI/CD","Air-gapped edition add-on","Dedicated support with SLAs"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Appsmith is an open-source low-code platform, founded in 2019 and based in San Francisco, purpose-built for creating internal tools like admin panels, dashboards, and workflow apps rather than customer-facing products.$q$, $q$It combines a drag-and-drop UI builder with the ability to write custom JavaScript, giving both non-developers and engineers a fast path to functional internal software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Appsmith connects to databases, APIs, SaaS tools, and LLMs, supports Git-based version control and CI/CD, and offers AI-assisted development from natural-language prompts. Self-hosting options include standard and air-gapped deployments for regulated environments.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The Community Edition is free and open source under Apache 2.0, self-hostable at no license cost. A cloud Free plan covers small teams, a Business plan is priced at $15 per user per month, and a custom-priced Enterprise plan adds SSO, provisioning, and air-gapped deployment.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Apptivo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apptivo is a cloud-based suite of integrated CRM and business management apps covering sales, help desk, field service, and campaigns for SMBs.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2009, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Fremont, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Apptivo: All-in-One CRM & Business Management Suite$q$, seo_title),
  seo_meta_description = COALESCE($q$Apptivo is a cloud-based CRM and business management platform with sales, help desk, and field service apps for small and mid-sized companies.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apptivo is a cloud-based suite of integrated business management applications, functioning as a combined CRM and lightweight ERP for small and mid-sized companies. Founded in 2009 and headquartered in Fremont, California, Apptivo reports being used by more than 200,000 companies across 194 countries. The platform bundles a Sales CRM with lead and opportunity management and automation, a Help Desk ticketing system for customer support, a Field Service module for mobile workforce management, and Campaigns for marketing management, alongside the ability to build custom apps and workflows without coding. Apptivo offers native mobile apps for iOS, Android, and Windows, plus smart APIs and third-party integrations. It is SSAE18 SOC2 Type II certified and provides industry-specific configurations for sectors like travel & hospitality, real estate, retail & wholesale, manufacturing, and utilities/energy. Pricing follows a freemium, per-user-per-month subscription model with a 14-day free trial: publicly reported tiers include a free Starter plan for a single user, then Lite around $15/user/month, Premium around $25/user/month, and Ultimate around $40/user/month (all billed annually, with month-to-month pricing higher), plus a custom Enterprise tier. Apptivo is aimed at small and medium-sized businesses that want a single, customizable, lower-cost alternative to stitching together separate CRM, help desk, and field service tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '943e842e-ea6b-423a-ad07-1657fff38f93';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '943e842e-ea6b-423a-ad07-1657fff38f93' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '943e842e-ea6b-423a-ad07-1657fff38f93';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Sales CRM$q$, $q$Manage leads, opportunities, and sales pipelines with automation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Help Desk$q$, $q$Ticketing system for tracking and resolving customer support requests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Field Service$q$, $q$Tools for managing and dispatching a mobile workforce.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Campaigns$q$, $q$Plan and track marketing campaigns alongside sales data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$No-code customization$q$, $q$Build custom apps and workflows without writing code.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Native mobile apps$q$, $q$Dedicated apps for iOS, Android, and Windows.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '943e842e-ea6b-423a-ad07-1657fff38f93';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Broad, all-in-one suite covering CRM, help desk, field service, and marketing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Free Starter tier and low-cost entry-level paid plans relative to enterprise CRM suites$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$No-code customization for building app-specific workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Industry-specific configurations for several verticals$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '943e842e-ea6b-423a-ad07-1657fff38f93';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Breadth of modules can mean a steeper learning curve than single-purpose CRM tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Higher tiers needed to unlock more advanced automation and reporting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Some reported pricing figures vary slightly across third-party sources, so current plan details should be confirmed on Apptivo's own pricing page$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '943e842e-ea6b-423a-ad07-1657fff38f93';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Is there a free version of Apptivo?$q$, $q$Yes, Apptivo offers a free Starter plan for a single user alongside paid Lite, Premium, and Ultimate tiers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$What modules does Apptivo include?$q$, $q$It includes Sales CRM, Help Desk, Field Service, Campaigns, and no-code custom app building, among other modules.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Does Apptivo have mobile apps?$q$, $q$Yes, native apps are available for iOS, Android, and Windows.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Is Apptivo suited for enterprise companies?$q$, $q$Apptivo primarily targets small and mid-sized businesses, though it offers a custom Enterprise tier for larger organizations.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '943e842e-ea6b-423a-ad07-1657fff38f93';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Unified CRM and support$q$, $q$Manage sales pipelines and customer support tickets in one connected platform.$q$, $q$Small and mid-sized business teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Mobile field service management$q$, $q$Dispatch and track a mobile workforce with native mobile apps.$q$, $q$Field service and operations teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '943e842e-ea6b-423a-ad07-1657fff38f93';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Starter$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["1 user","500 MB storage","Core CRM features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Lite$q$, $q$~$15/user/month$q$, $q$Annual (higher month-to-month)$q$, NULL, $q$["Expanded CRM functionality"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Premium$q$, $q$~$25/user/month$q$, $q$Annual (higher month-to-month)$q$, NULL, $q$["Additional apps and automation"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Ultimate$q$, $q$~$40/user/month$q$, $q$Annual (higher month-to-month)$q$, NULL, $q$["Full feature set across modules"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$Custom$q$, NULL, $q$["Tailored enterprise configuration"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '943e842e-ea6b-423a-ad07-1657fff38f93';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apptivo is a cloud-based business management suite, founded in 2009 and headquartered in Fremont, California, that combines CRM, help desk, field service, and campaign management in one integrated platform rather than as separate point solutions.$q$, $q$The company reports over 200,000 customers across 194 countries and provides industry-specific configurations for sectors such as travel & hospitality, real estate, retail & wholesale, manufacturing, and utilities & energy.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core apps include Sales CRM for lead and opportunity management, a Help Desk ticketing system, Field Service for mobile workforce management, and Campaigns for marketing. Users can also build custom apps and workflows without coding, and connect external systems via smart APIs and integrations.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Apptivo uses per-user-per-month subscription pricing with a 14-day free trial. Publicly reported tiers include a free Starter plan for one user, then Lite (~$15/user/month), Premium (~$25/user/month), and Ultimate (~$40/user/month) billed annually, plus a custom Enterprise plan.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Appwrite ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Appwrite is an open-source backend-as-a-service platform providing auth, databases, storage, functions, and messaging for developers, self-hosted or in the cloud.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Tel Aviv, Israel$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Appwrite: Open-Source Backend-as-a-Service Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Appwrite is an open-source backend platform offering auth, databases, storage, functions, and messaging, self-hostable or on Appwrite Cloud.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Appwrite is an open-source backend-as-a-service (BaaS) platform that gives developers a ready-made set of backend building blocks so they can build applications faster without writing custom server infrastructure. Founded by Eldad Fux around 2019 and headquartered in Tel Aviv, Israel, Appwrite provides Authentication (including multi-factor auth), Databases, Storage (with compression and encryption), serverless Functions, Messaging, Realtime event subscriptions, and Hosting, which it markets as an open-source alternative to platforms like Vercel and Firebase. It integrates with a wide range of frontend and mobile frameworks, including React, Next.js, Vue, Angular, Svelte, Astro, Flutter, and React Native, and offers integrations with AI tools such as Claude, OpenAI, and Cursor. The project is fully open source, with over 56,000 GitHub stars, and can be self-hosted or run on the managed Appwrite Cloud. Pricing follows a freemium model: the Free plan includes 5GB bandwidth, 2GB storage, 750K executions per month, and 75K monthly active users across up to 2 projects; the Pro plan starts from $25/month and adds 2TB bandwidth, 150GB storage, unlimited databases/buckets/functions, and daily backups; and a custom-priced Enterprise plan adds uptime SLAs, a dedicated success manager, SOC 2/HIPAA compliance, and SSO. Appwrite is used by companies including IBM, American Airlines, and Bosch, and is aimed at developer teams — from solo builders to enterprises — who want a self-hostable, open-source backend rather than being locked into a single proprietary cloud vendor.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Authentication$q$, $q$Built-in auth with multi-factor authentication support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Databases$q$, $q$Scalable database service for application data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Storage$q$, $q$File storage with compression and encryption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Serverless Functions$q$, $q$Deploy and auto-scale backend functions without managing servers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Messaging and Realtime$q$, $q$Send messages and subscribe to realtime events across your app.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Self-hosting$q$, $q$Run Appwrite on your own infrastructure instead of the managed cloud.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Fully open source with a large, active GitHub community$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Flexible deployment: self-hosted or managed Appwrite Cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Broad framework and AI tool integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Usable free tier for small projects before needing to pay$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Self-hosting requires ops know-how to run and maintain reliably$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Enterprise-grade compliance (SOC 2, HIPAA, SSO) requires the custom-priced Enterprise plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$As a newer BaaS platform, its ecosystem and third-party tooling are still smaller than more established providers like Firebase$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Is Appwrite open source?$q$, $q$Yes, Appwrite is fully open source and can be self-hosted or run on the managed Appwrite Cloud.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$What backend services does Appwrite provide?$q$, $q$Authentication, databases, storage, serverless functions, messaging, realtime events, and hosting.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$How much does Appwrite cost?$q$, $q$There's a free plan with limited usage, a Pro plan starting from $25/month, and a custom-priced Enterprise plan.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Can Appwrite be self-hosted?$q$, $q$Yes, Appwrite can be deployed on your own infrastructure instead of using Appwrite Cloud.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Mobile and web app backends$q$, $q$Add authentication, a database, and file storage to an app without building custom backend infrastructure.$q$, $q$Frontend and mobile developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Self-hosted backend for compliance$q$, $q$Run a full backend stack on owned infrastructure for data residency or compliance needs.$q$, $q$Enterprise engineering and platform teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["5GB bandwidth","2GB storage","750K executions/month","75K monthly active users","Up to 2 projects"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Pro$q$, $q$From $25/month$q$, $q$Monthly$q$, NULL, $q$["2TB bandwidth","150GB storage","3.5M executions/month","200K monthly active users","Unlimited databases, buckets, functions","Daily backups"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$Custom$q$, NULL, $q$["Uptime SLAs","Dedicated success manager","SOC 2, HIPAA, BAA","SSO","Custom backup policies"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Appwrite is an open-source backend-as-a-service platform, founded around 2019 by Eldad Fux and headquartered in Tel Aviv, Israel, that packages authentication, databases, storage, serverless functions, and messaging into a single backend so developers can skip building that infrastructure themselves.$q$, $q$The project is fully open source (56,000+ GitHub stars) and can run self-hosted or on the managed Appwrite Cloud, giving teams flexibility over where their data and infrastructure live.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Appwrite's core services include Auth with multi-factor authentication, scalable Databases, Storage with compression and encryption, serverless Functions, a full-featured Messaging service, Realtime event subscriptions, and Hosting positioned as an open-source alternative to Vercel. It integrates with frameworks like React, Next.js, Vue, Angular, Svelte, Astro, Flutter, and React Native, plus AI tools like Claude, OpenAI, and Cursor.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Appwrite uses a freemium model. The Free plan includes 5GB bandwidth, 2GB storage, 750K executions/month, and 75K monthly active users across up to 2 projects. The Pro plan starts from $25/month with higher limits and unlimited databases, buckets, and functions. Enterprise pricing is custom and adds SLAs, compliance certifications, and SSO.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


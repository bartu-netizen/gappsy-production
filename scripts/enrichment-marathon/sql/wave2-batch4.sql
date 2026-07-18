-- Enrichment marathon batch: Ahrefs, Aikido Security, Aimeos, Airbrake, Airbyte, Aircall, Apache Airflow, airfocus

-- ── Ahrefs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ahrefs is an all-in-one SEO and marketing platform offering keyword research, backlink analysis, site audits, rank tracking, and AI-driven brand visibility monitoring.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from ~€27/month)$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE($q$~150 employees$q$, company_size),
  headquarters = COALESCE($q$Singapore$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Ahrefs: SEO & Marketing Data Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Ahrefs offers keyword research, backlink analysis, site audits, rank tracking, and AI brand visibility tools built on its own web index.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ahrefs is an SEO and marketing data platform founded in 2011 and headquartered in Singapore. It maintains its own web crawler and index, reportedly covering roughly 170 trillion pages and tracking tens of billions of keywords, which powers its core tools: Site Explorer (backlink and competitor analysis), Keywords Explorer (keyword research), Site Audit (technical SEO auditing), Rank Tracker (SERP position monitoring), Content Explorer, and Web Analytics. Ahrefs has also expanded into AI-era marketing with 'Brand Radar,' which tracks how brands are mentioned in AI chatbot answers, and an AI marketing agent called 'Agent A' that can query Ahrefs data on a user's behalf. The product is aimed at SEO specialists, content marketers, PPC professionals, agencies, and enterprise marketing teams; the company states a large share of Fortune 500 companies use it. Ahrefs uses a freemium and subscription pricing model: it offers limited free tools plus paid plans that scale from an entry-level Starter tier up through Lite, Standard, Advanced, and a custom Enterprise tier with SSO and uncapped API access. Add-on packages exist for AI brand tracking, content generation, and custom reporting. Ahrefs is a browser-based SaaS product with no desktop or mobile app required for core use.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Site Explorer$q$, $q$Analyze any website's or competitor's backlink profile, organic keywords, and traffic estimates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Keywords Explorer$q$, $q$Research keyword search volume, difficulty, and related terms across billions of tracked keywords.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Site Audit$q$, $q$Crawl a website to surface technical and on-page SEO issues.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Rank Tracker$q$, $q$Monitor keyword ranking positions over time across search engines and locations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Brand Radar$q$, $q$Track how a brand is mentioned and represented in AI chatbot and AI search answers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Content Explorer$q$, $q$Discover top-performing content in any niche for content research and link-building outreach.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Large proprietary web index gives extensive backlink and keyword coverage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Broad toolset spanning SEO, content, and AI-search brand monitoring in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Frequently updated data and active product development$q$, 2);

DELETE FROM tool_cons WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Paid plans are relatively expensive for individuals and small businesses$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Free tier is limited compared to paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Learning curve for users new to SEO tools given the breadth of features$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Does Ahrefs have a free plan?$q$, $q$Yes, Ahrefs offers a limited free version with basic site data and optimization suggestions, alongside paid subscription plans.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$What is Ahrefs used for?$q$, $q$Ahrefs is used for keyword research, backlink analysis, competitor research, technical site audits, rank tracking, and monitoring brand visibility in AI search results.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Where is Ahrefs based?$q$, $q$Ahrefs is headquartered in Singapore.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Does Ahrefs offer an API?$q$, $q$Yes, API access is included starting on the Lite plan, with uncapped access on Enterprise.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Competitor backlink research$q$, $q$Analyze competitors' backlink profiles to find link-building opportunities.$q$, $q$SEO specialists and link-building teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Content and keyword strategy$q$, $q$Research keyword opportunities and content gaps to plan a content calendar.$q$, $q$Content marketers and agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$AI search brand monitoring$q$, $q$Track how a brand is described or cited by AI chatbots and AI-generated search answers.$q$, $q$Brand and marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Basic site data","Limited optimization suggestions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Starter$q$, $q$€27/month$q$, $q$monthly$q$, NULL, $q$["Entry-level access for competitor and keyword research"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Lite$q$, $q$€119/month$q$, $q$monthly$q$, NULL, $q$["5 projects","6 months historical data","750 tracked keywords","100,000 crawl credits","API access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Standard$q$, $q$€229/month$q$, $q$monthly$q$, NULL, $q$["20 projects","2 years historical data","2,000 tracked keywords","Content Explorer","Batch Analysis"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Advanced$q$, $q$€419/month$q$, $q$monthly$q$, NULL, $q$["50 projects","5 years historical data","5,000 tracked keywords","Looker Studio integration","Segmentation"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$Enterprise$q$, $q$€1,394/month$q$, $q$annual commitment$q$, NULL, $q$["Uncapped API access","SSO","Unlimited historical data","Forecasting tools"]$q$::jsonb, 5);

DELETE FROM tool_content_blocks WHERE tool_id = '8b5dba74-01a8-4dc3-bb43-d474f4a18943';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ahrefs is a Singapore-based SEO and marketing data platform built around a proprietary web crawler and index. Founded in 2011, it has grown into one of the most widely used toolsets for keyword research, backlink analysis, and search visibility tracking.$q$, $q$Beyond traditional SEO, Ahrefs has added tools aimed at the shift toward AI-driven search, including Brand Radar, which monitors how a brand is mentioned in AI chatbot and AI Overview responses, alongside an AI assistant ('Agent A') that can query Ahrefs' data directly.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core modules include Site Explorer for backlink and competitor research, Keywords Explorer for keyword discovery and difficulty scoring, Site Audit for technical SEO issue detection, Rank Tracker for SERP position monitoring, Content Explorer for content research, and Web Analytics for site traffic reporting. Reporting dashboards and an API are available on higher plans.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Ahrefs offers a limited free version alongside paid subscription tiers (Starter, Lite, Standard, Advanced) that scale by number of projects, tracked keywords, historical data range, and crawl credits. An Enterprise tier adds SSO, uncapped API access, and unlimited historical data under an annual commitment. Additional add-ons cover AI brand tracking, AI content tools, and custom reporting.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Aikido Security ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Aikido Security is a unified application security platform combining SAST, SCA, cloud security, secrets detection, and AI-powered pentesting in one dashboard.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $300/month)$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Ghent, Belgium$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Aikido Security: All-in-One AppSec Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Aikido Security unifies code, cloud, and runtime security scanning with AI-powered triage and autofix for development teams.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Aikido Security is an application security (AppSec) platform founded in 2022 and headquartered in Ghent, Belgium, with additional offices including San Francisco. It consolidates multiple security scanning categories into a single product, organized into four modules: /Code (static analysis/SAST, software composition analysis/SCA, secrets detection, and AI-assisted code auditing), /Cloud (cloud security posture management and container/Kubernetes image scanning), /Attack (AI-assisted penetration testing and continuous validation), and /Protect (runtime application protection and bot/injection blocking). A key differentiator is alert deduplication and prioritization ('AutoTriage') intended to reduce false-positive noise, plus 'AutoFix,' which generates automated pull requests to remediate vulnerabilities in code, dependencies, infrastructure, and containers. Aikido integrates with 20+ developer tools including GitHub, GitLab, Jira, and Azure Pipelines, and holds SOC 2 Type II and ISO 27001:2022 certifications. The platform is aimed at software development and security teams at startups through enterprises that want to consolidate multiple point security tools into one system. Pricing follows a freemium model: a free-forever 'Developer' tier covers 2 users and basic scanning, while paid tiers (Basic, Pro, Advanced, and custom Enterprise) add features like PR security review, on-prem scanning, and dedicated support, generally billed per user per month with an annual discount. Aikido also separately sells manual penetration testing services.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '500f337a-c890-4561-b62d-d9dfd247fbc6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '500f337a-c890-4561-b62d-d9dfd247fbc6' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Static & AI-powered code analysis (SAST)$q$, $q$Scans source code for vulnerabilities, including an AI-assisted auditing layer.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Open-source dependency scanning (SCA)$q$, $q$Identifies vulnerable and outdated open-source dependencies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Cloud security posture management$q$, $q$Scans cloud accounts, VMs, and container images for misconfigurations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Secrets and malware detection$q$, $q$Detects exposed secrets and malicious code in repositories.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$AutoFix$q$, $q$Automatically generates pull requests to remediate vulnerabilities in code, dependencies, and infrastructure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$AI-powered penetration testing$q$, $q$Runs autonomous agents for continuous security validation, alongside manual pentest services.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Consolidates multiple security tool categories (SAST, SCA, CSPM, secrets, runtime) into one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Free tier available with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$SOC 2 Type II and ISO 27001:2022 certified$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$AutoFix and AutoTriage aim to reduce manual remediation and alert fatigue$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Paid tiers require contacting sales for exact per-user pricing at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Broad feature set may be more than smaller teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Newer company (founded 2022) with a shorter track record than legacy AppSec vendors$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Is Aikido Security free?$q$, $q$Aikido offers a free-forever Developer plan for up to 2 users with basic scanning limits; paid plans start at $300/month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$What does Aikido Security scan?$q$, $q$It scans source code (SAST), open-source dependencies (SCA), cloud infrastructure, containers, and secrets, and offers runtime protection.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Where is Aikido Security headquartered?$q$, $q$Aikido Security is headquartered in Ghent, Belgium, and was founded in 2022.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Does Aikido offer penetration testing?$q$, $q$Yes, Aikido offers both AI-assisted continuous testing and manual penetration testing services, priced separately from the platform subscription.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Consolidating AppSec tooling$q$, $q$Replace multiple separate SAST, SCA, and cloud security tools with one platform.$q$, $q$Development and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Automated vulnerability remediation$q$, $q$Use AutoFix to generate pull requests that patch known vulnerabilities without manual triage.$q$, $q$Engineering teams with limited security staff$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Compliance readiness$q$, $q$Use scanning and reporting to support SOC 2 or ISO 27001 compliance efforts.$q$, $q$Startups and scale-ups pursuing security certifications$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Developer$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["2 users","10 repos","SCA, SAST, secrets detection","Cloud scanning","10 AI AutoFixes/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Basic$q$, $q$$300/month$q$, $q$monthly (10% off annual)$q$, NULL, $q$["PR security review","Jira/Linear sync","Compliance integrations","Unlimited AI AutoFixes"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Pro$q$, $q$$600/month$q$, $q$monthly (10% off annual)$q$, NULL, $q$["On-prem scanning","API fuzzing","VM scanning","Attack surface monitoring"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Advanced$q$, $q$$600/month$q$, $q$monthly (10% off annual)$q$, NULL, $q$["Broker for internal apps","Private registry proxy","Higher API rate limits","FIPS base images"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Custom SLA","Multi-tenant portal","Local deployment options","Enterprise support"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aikido Security is a Belgium-founded application security platform that combines code scanning, cloud security, and runtime protection into a single product, aiming to replace a stack of separate point-solution security tools.$q$, $q$The company was founded in 2022 in Ghent, Belgium and has since expanded internationally, with an additional office in San Francisco.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Aikido covers static code analysis (SAST), open-source dependency scanning (SCA), secrets and malware detection, cloud security posture management (CSPM), container and Kubernetes image scanning, AI-assisted penetration testing, and runtime application protection. Its AutoTriage feature deduplicates and contextualizes alerts to cut down false positives, and AutoFix can open automated remediation pull requests.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$A free-forever Developer plan covers small teams with basic scanning limits. Paid plans (Basic at $300/month, Pro and Advanced at $600/month, and custom Enterprise) add features such as PR security review, on-premises scanning, API fuzzing, and dedicated support, with pricing that scales by number of users, repos, and cloud accounts. A separate manual pentest service is priced per engagement, starting around €3,500 for a standard pentest.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Aimeos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Aimeos is a free, open-source PHP e-commerce framework for building high-performance online stores, marketplaces, and B2B platforms, available for Laravel and TYPO3.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Aimeos: Open-Source PHP E-Commerce Framework$q$, seo_title),
  seo_meta_description = COALESCE($q$Aimeos is a free, open-source e-commerce framework for PHP, Laravel, and TYPO3, built for high-performance stores and marketplaces.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Aimeos is an open-source, API-first e-commerce framework written in PHP, developed by a worldwide community since 2015, with commercial support available through Aimeos GmbH. It is distributed as a free, self-hosted package and is available as an extension for both Laravel and TYPO3, in addition to standalone use. Aimeos is designed for building online stores, multi-vendor marketplaces, and B2B/B2C applications that need to scale from small shops to catalogs of over a billion products, and it exposes JSON REST and GraphQL APIs for headless and custom frontend integrations. Feature coverage includes multi-vendor, multi-channel, and multi-warehouse support, subscription and recurring billing, multiple product types (bundles, vouchers, virtual and configurable products), multi-tenant SaaS capability with custom domains, and integration with 100+ payment gateways via the Omnipay library. The project reports fast page rendering (around 20ms) and strong Google Lighthouse scores. Aimeos has over 400,000 downloads and more than 45,000 GitHub stars, and is aimed at PHP developers and agencies building custom or large-scale e-commerce sites who want an open-source alternative to hosted SaaS platforms, with the option to purchase commercial support.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$JSON REST & GraphQL APIs$q$, $q$Headless-ready APIs for building custom storefronts and integrations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Multi-vendor marketplace support$q$, $q$Supports multiple vendors, sales channels, and warehouses in one installation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$100+ payment gateways$q$, $q$Integrates with over 100 payment providers through the Omnipay library.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Subscription billing$q$, $q$Built-in support for subscription and recurring payment products.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Laravel and TYPO3 integration$q$, $q$Available as a native extension for both Laravel and TYPO3 in addition to standalone use.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Free and open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Designed to scale to very large product catalogs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Flexible integration options via Laravel, TYPO3, or standalone PHP$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Large community with 45,000+ GitHub stars$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Requires PHP development expertise to set up and customize$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Self-hosted, so infrastructure and maintenance are the user's responsibility$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Commercial support is a separate paid offering, not included by default$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Is Aimeos free to use?$q$, $q$Yes, Aimeos is a free, open-source e-commerce framework. Commercial support is available separately through Aimeos GmbH.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$What platforms does Aimeos support?$q$, $q$Aimeos is available as an extension for Laravel and TYPO3, as well as a standalone PHP framework.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Can Aimeos handle marketplaces?$q$, $q$Yes, Aimeos supports multi-vendor, multi-channel, and multi-warehouse configurations suitable for marketplaces.$q$, 2, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Custom online stores$q$, $q$Build a self-hosted online store with full control over code and infrastructure.$q$, $q$PHP developers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Multi-vendor marketplaces$q$, $q$Run a marketplace with multiple sellers, warehouses, and sales channels.$q$, $q$Marketplace operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Headless commerce$q$, $q$Use the REST/GraphQL APIs to power a custom or decoupled storefront.$q$, $q$Development teams building headless architectures$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aimeos is an open-source, API-first e-commerce framework for PHP, developed by a global community since 2015. It is designed to scale from small online shops to large multi-vendor marketplaces and B2B platforms, and is distributed for free under an open-source license, with optional commercial support from Aimeos GmbH.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The framework provides JSON REST and GraphQL APIs, multi-vendor and multi-warehouse support, subscription and recurring payment handling, and support for over 100 payment gateways via Omnipay. It supports multiple product types including bundles, vouchers, and configurable products, and offers multi-tenant SaaS functionality with custom domain support.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$Aimeos is available as an extension for Laravel and TYPO3, as well as a standalone framework, giving developers flexibility in how they integrate it into an existing PHP application.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Airbrake ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Airbrake is an error and performance monitoring platform, now part of LogicMonitor, that helps developer teams catch, group, and fix application bugs in real time.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$19/month$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Austin, TX, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Airbrake: Error & Performance Monitoring$q$, seo_title),
  seo_meta_description = COALESCE($q$Airbrake monitors applications for errors and performance issues, grouping bugs and tracking deploys for developer teams. Now part of LogicMonitor.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Airbrake is an application error and performance monitoring tool that helps development teams detect, group, and diagnose bugs in production. It offers real-time error monitoring that intelligently groups related errors and points to the specific line of code responsible, alongside a lightweight application performance monitoring (APM) layer that tracks HTTP request response times, error rates, and user satisfaction scores. It also correlates errors with specific code deployments to help teams identify which release introduced a regression. Airbrake provides SDKs for JavaScript, Python, Ruby, Java, Go, PHP, .NET, and over 20 other languages and frameworks, and integrates with common collaboration and alerting tools. The company is headquartered in Austin, Texas, and was acquired by LogicMonitor, a unified observability platform, in February 2021; Airbrake continues to operate as part of LogicMonitor's product portfolio. Airbrake is aimed at developers, DevOps teams, and full-stack engineering teams who need lightweight, SDK-based error tracking without heavy agent overhead. Pricing is subscription-based with tiers differentiated by user count, team count, and monthly error volume, starting around $19/month for a single-user plan, with volume-based tiers scaling up to $799/month for higher error volumes; a free trial is available before committing to a paid plan.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Real-time error monitoring$q$, $q$Catches application errors and groups related occurrences automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Deployment tracking$q$, $q$Correlates errors with specific code deployments to identify problematic releases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Lightweight APM$q$, $q$Tracks HTTP request response times and user satisfaction metrics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Broad SDK support$q$, $q$Provides SDKs for JavaScript, Python, Ruby, Java, Go, PHP, .NET, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Collaboration integrations$q$, $q$Sends real-time alerts to messaging and collaboration tools.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Broad language and framework SDK coverage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Agentless, lightweight installation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Deployment tracking helps pinpoint which release caused a regression$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Backed by LogicMonitor's observability platform since 2021$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Pricing tiers can get complex with separate error-volume and user-based plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Performance monitoring is billed separately from error monitoring$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Less full-featured than dedicated APM/observability suites for infrastructure-level monitoring$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Is Airbrake still independently operated?$q$, $q$No, Airbrake was acquired by LogicMonitor in February 2021 and now operates as part of LogicMonitor's product portfolio.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$How much does Airbrake cost?$q$, $q$Plans start around $19/month for a single-user tier, with volume-based error tracking tiers scaling up to $799/month.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$What languages does Airbrake support?$q$, $q$Airbrake provides SDKs for JavaScript, Python, Ruby, Java, Go, PHP, .NET, and over 20 other languages and frameworks.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Does Airbrake offer a free trial?$q$, $q$Yes, Airbrake offers a free trial before requiring a paid subscription.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Production error tracking$q$, $q$Catch and triage application errors in real time across web and mobile apps.$q$, $q$Developers and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Release quality monitoring$q$, $q$Correlate error spikes with specific deployments to catch bad releases quickly.$q$, $q$Engineering teams practicing continuous deployment$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Dev + errors$q$, $q$$19/month$q$, $q$monthly ($17/mo annual)$q$, NULL, $q$["1 user","1 team","Unlimited projects","Deploy tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Basic + errors$q$, $q$$38/month$q$, $q$monthly ($34/mo annual)$q$, NULL, $q$["Unlimited users","3 teams","Unlimited projects"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Pro + errors$q$, $q$$76/month$q$, $q$monthly ($68/mo annual)$q$, NULL, $q$["Unlimited users and teams","Audit logs","Spike forgiveness"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Airbrake is an error and performance monitoring platform for software teams, providing real-time bug detection, error grouping, and deployment tracking. The company is headquartered in Austin, Texas, and was acquired by observability company LogicMonitor in February 2021, continuing to operate as part of LogicMonitor's product lineup.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core capabilities include intelligent error grouping that pinpoints the exact line of code causing an issue, a lightweight APM layer for tracking HTTP performance and user satisfaction, and deployment tracking that correlates errors with specific releases. Airbrake ships SDKs for over 20 languages and frameworks and uses an agentless, SDK-based architecture.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Airbrake's published plans include Dev, Basic, and Pro tiers priced monthly (with a 10% discount for annual billing), differentiated by user and team counts. Separately, error monitoring is also sold in volume-based tiers ranging from 25,000 to 5 million errors per month. Performance monitoring is billed separately from error monitoring.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Airbyte ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Airbyte is an open-source data integration platform with 600+ connectors for moving data into warehouses, lakes, and now AI agent context stores.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, CA, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Airbyte: Open-Source Data Integration Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Airbyte moves data from 600+ sources into warehouses, lakes, and AI agent context stores, with a free open-source core and managed cloud plans.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Airbyte is a data integration (ELT) platform founded in 2020 and headquartered in San Francisco, California, by Michel Tricot and John Lafleur. Its foundation is an open-source connector framework with a catalog of 600+ pre-built connectors for replicating data from sources like databases, SaaS apps, and files into destinations such as data warehouses and lakes. Airbyte can be self-hosted for free ('Core') or run as a managed cloud service. The company has more recently positioned its platform around AI agents, offering an 'Agents' product line that turns connected data sources into a queryable 'Context Store' that AI agents can access via API or MCP (Model Context Protocol), rather than requiring real-time API integrations. Pricing is usage-based: the open-source Core is always free for self-hosted use; the managed Data Replication cloud service starts around $10/month on a volume basis with plans up to enterprise-level capacity pricing; and the newer Agents product has its own free tier (1,000 AI operations/month) plus paid Individual, Team, and custom Enterprise tiers priced by usage volume. Airbyte is aimed at data engineers and, increasingly, teams building production AI agents that need integrated access to organizational data.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$600+ pre-built connectors$q$, $q$Connects to a large catalog of databases, SaaS applications, and file sources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Self-hosted open source Core$q$, $q$Free, self-managed deployment option with full control over infrastructure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Managed Cloud$q$, $q$Fully hosted data replication service with configurable sync frequency.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$AI Context Store$q$, $q$Turns integrated data sources into a queryable store accessible by AI agents via API or MCP.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Custom mappings & transformations$q$, $q$Supports custom field mappings on higher-tier replication plans.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Free, open-source self-hosted option with no connector limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Large connector catalog covering many common data sources$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Flexible pricing that scales from free to enterprise usage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Expanding into AI agent data access via MCP$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Self-hosting requires managing your own infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Usage-based cloud pricing can be harder to predict than flat-rate tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Newer AI-focused product line is less established than the core data replication product$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Is Airbyte free?$q$, $q$Airbyte's self-hosted Core is always free and open source. The managed cloud and AI agent products have free tiers plus paid usage-based plans.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$How many connectors does Airbyte support?$q$, $q$Airbyte's catalog includes 600+ connectors for databases, SaaS tools, and files.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Where is Airbyte headquartered?$q$, $q$Airbyte is headquartered in San Francisco, California, and was founded in 2020.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$What is Airbyte's Context Store?$q$, $q$It's a product that turns data connected via Airbyte into a queryable store that AI agents can access through an API or the Model Context Protocol (MCP).$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Data warehouse ingestion$q$, $q$Replicate data from SaaS tools and databases into a warehouse or lake for analytics.$q$, $q$Data engineers and analytics teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Self-hosted ELT$q$, $q$Run Airbyte Core on your own infrastructure for full control and no per-connector fees.$q$, $q$Engineering teams with data infrastructure in place$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$AI agent data access$q$, $q$Give production AI agents queryable access to integrated organizational data.$q$, $q$Teams building AI agents and applications$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Core$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open source","Self-managed infrastructure","Full connector catalog"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Data Replication - Standard$q$, $q$From $10/month$q$, $q$volume-based$q$, NULL, $q$["600+ connectors","1-hour max sync frequency","Fully managed hosting"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Data Replication - Plus$q$, $q$$500/month$q$, $q$annual$q$, NULL, $q$["15-minute syncs","Custom mappings","50 credits included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Agents - Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["1,000 AI operations/month","API and MCP access","Daily Context Store refresh"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Agents - Individual$q$, $q$$29/month$q$, $q$monthly$q$, NULL, $q$["5,000 AI operations/month","Hourly Context Store refresh"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Agents - Team$q$, $q$$299/month$q$, $q$monthly$q$, NULL, $q$["10,000 AI operations/month","Multiple users and workspaces"]$q$::jsonb, 5);

DELETE FROM tool_content_blocks WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Airbyte is an open-source data integration platform founded in 2020 and based in San Francisco. It started as a connector framework for moving data from hundreds of sources into data warehouses and lakes, and can be run self-hosted for free or via a managed cloud service.$q$, $q$More recently, Airbyte has expanded its positioning toward AI use cases, offering a 'Context Store' product that lets AI agents query integrated organizational data via API or the Model Context Protocol (MCP), in addition to its traditional data replication offering.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Airbyte offers a catalog of 600+ connectors for data replication, a self-hosted open-source Core, a managed Cloud option, and an Agents product with API and MCP access for AI context retrieval. Sync frequency ranges from hourly (Standard cloud plan) to 15-minute intervals (Plus plan).$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Airbyte Core (self-hosted, open source) is always free. The managed Data Replication cloud service is volume-based, starting around $10/month. The Agents/Context Store product has a free tier (1,000 AI operations/month) plus paid Individual ($29/month), Team ($299/month), and custom Enterprise tiers.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Aircall ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Aircall is a cloud-based business phone system with AI voice agents, call coaching, and CRM integrations for sales and support teams.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$30/user/month (billed annually, 3-license minimum)$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$New York, NY, USA (founded in Paris, France)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Aircall: Cloud Business Phone System$q$, seo_title),
  seo_meta_description = COALESCE($q$Aircall is a cloud phone system with AI voice agents, call coaching, and 250+ CRM and help desk integrations for sales and support teams.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Aircall is a cloud-based business phone and customer communications platform founded in 2014 in Paris, France, and now dual-headquartered with a primary office in New York. It provides a virtual phone system for sales and support teams, including features like IVR, call recording, click-to-dial, SMS/MMS, and softphone apps, alongside newer AI capabilities: live call coaching with suggested responses, automatic call transcription and sentiment analysis, automated CRM updates, and autonomous 'AI-led' voice agents that can resolve routine inquiries around the clock and escalate complex ones with full context. Aircall integrates with 250+ business tools including Salesforce, HubSpot, Zendesk, Shopify, and Microsoft Teams, and is SOC2 Type II, GDPR, and HIPAA compliant. It is used by 23,000+ companies. Pricing is subscription-based per user per month, with an Essentials plan starting around $30/user/month billed annually (higher for month-to-month billing) and a 3-license minimum, a Professional plan adding advanced analytics and Salesforce CTI around $50/user/month, and a Custom/Enterprise plan with SSO and SLA support for larger deployments requiring at least 25 licenses. Aircall targets sales, support, and operations teams of small to large businesses that need a modern, integrable phone system rather than legacy on-premises telephony.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Cloud phone system$q$, $q$Virtual phone numbers with IVR, call recording, and click-to-dial.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$AI voice agents$q$, $q$Autonomous AI agents that can resolve routine customer inquiries around the clock.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Live call coaching$q$, $q$Real-time suggested responses and sentiment analysis during calls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$CRM & help desk integrations$q$, $q$250+ integrations including Salesforce, HubSpot, and Zendesk.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Automatic transcription$q$, $q$Transcribes calls and can trigger automated CRM updates and follow-up tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Shared inbox$q$, $q$Collaborative workspace for calls, SMS, and messaging across a team.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Wide range of native CRM and help desk integrations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Combines traditional telephony with modern AI coaching and automation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$SOC2 Type II, GDPR, and HIPAA compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Softphone apps across multiple platforms$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$3-license minimum raises the effective entry price above the advertised per-user rate$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Advanced AI and analytics features are gated to higher-priced plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Custom/Enterprise plan requires a 25-license minimum$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$How much does Aircall cost?$q$, $q$Aircall's Essentials plan starts around $30/user/month billed annually, with a 3-license minimum; the Professional plan is around $50/user/month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Does Aircall offer AI features?$q$, $q$Yes, Aircall includes AI-assisted live coaching, call transcription and sentiment analysis, and autonomous AI voice agents for routine inquiries.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$What integrations does Aircall support?$q$, $q$Aircall integrates with 250+ tools, including Salesforce, HubSpot, Zendesk, Shopify, Pipedrive, and Microsoft Teams.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Where is Aircall based?$q$, $q$Aircall was founded in Paris, France in 2014 and is now dual-headquartered with a primary office in New York.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Sales team calling$q$, $q$Equip sales reps with a cloud phone system, power dialer, and CRM logging.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Customer support$q$, $q$Run a support call center with IVR, coaching, and AI-assisted or AI-led inquiry resolution.$q$, $q$Support and service teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Essentials$q$, $q$$30/user/month (annual) / $40/user/month (monthly)$q$, $q$monthly or annual, 3-license minimum$q$, NULL, $q$["Unlimited outbound calls","Call recording","IVR","250+ integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Professional$q$, $q$$50/user/month (annual) / $70/user/month (monthly)$q$, $q$monthly or annual, 3-license minimum$q$, NULL, $q$["All AI Assist features","Salesforce CTI","Power Dialer","Advanced analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Custom$q$, $q$Custom$q$, $q$custom, 25-license minimum$q$, NULL, $q$["Custom onboarding","SLA","Single sign-on","Unlimited analytics data"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aircall is a cloud-based business phone system founded in 2014 in Paris, France, which has since grown into a global company with its primary headquarters now in New York and additional offices across Europe and Asia-Pacific.$q$, $q$The platform combines traditional cloud telephony features with AI-assisted and AI-led capabilities, positioning itself as a customer communications platform rather than a plain phone system.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core telephony features include IVR, call recording, click-to-dial, SMS/MMS, and softphone apps across platforms. AI features include live coaching with suggested responses, automatic transcription and sentiment analysis, automated CRM logging, and autonomous AI voice agents for 24/7 routine inquiry handling.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Aircall connects with 250+ tools, including CRM and help desk platforms such as Salesforce, HubSpot, Zendesk, Shopify, Pipedrive, and Microsoft Teams.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Aircall is priced per user per month with a 3-license minimum. The Essentials plan starts around $30/user/month (billed annually), the Professional plan is around $50/user/month and adds advanced analytics and Salesforce integration, and a Custom/Enterprise plan (25+ licenses) adds SSO and SLA support.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Apache Airflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apache Airflow is a free, open-source platform for programmatically authoring, scheduling, and monitoring data and ML workflows as Python-defined DAGs.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Apache Airflow: Open-Source Workflow Orchestration$q$, seo_title),
  seo_meta_description = COALESCE($q$Apache Airflow is a free, open-source platform for authoring, scheduling, and monitoring data pipelines and workflows as Python code.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apache Airflow is an open-source workflow orchestration platform that lets users define data pipelines and automated workflows as Python code, structured as Directed Acyclic Graphs (DAGs). It originated at Airbnb in October 2014, was open-sourced from its first commit, became an Apache Incubator project in March 2016, and graduated to a top-level Apache Software Foundation project in January 2019. Airflow provides a web-based UI for monitoring and managing pipeline runs, supports dynamic pipeline generation in Python (avoiding XML or drag-and-drop configuration), and is extensible through custom operators and integrations with major cloud providers including AWS, Google Cloud, and Azure. It is free and open source with no licensing fees, governed by the Apache Software Foundation under the Apache License, and maintained by an active community of contributors. Airflow is aimed at data engineers and developers with Python knowledge who need to orchestrate ETL/ELT pipelines, train and manage ML workflows, coordinate infrastructure automation, or run other complex, scheduled multi-step processes. Because it is self-hosted open-source software, users are responsible for their own deployment infrastructure, though managed hosting options are offered by third-party vendors.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Python-defined DAGs$q$, $q$Author workflows as Python code structured as Directed Acyclic Graphs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Web-based monitoring UI$q$, $q$Visualize, trigger, and monitor pipeline runs through a browser dashboard.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Cloud provider integrations$q$, $q$Built-in integrations with AWS, Google Cloud, and Azure services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Custom operators$q$, $q$Extend Airflow with custom task types for any environment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Dynamic pipeline generation$q$, $q$Programmatically generate pipelines rather than hand-writing static configuration.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Mature, widely adopted project with a large community and ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Highly extensible via Python and custom operators$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Strong cloud provider integration support$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Requires Python knowledge and DevOps effort to self-host and operate$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$No official managed hosting from the Apache project itself (third-party vendors fill this gap)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Can have a learning curve for teams new to DAG-based orchestration$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Is Apache Airflow free?$q$, $q$Yes, Airflow is free, open-source software governed by the Apache Software Foundation under the Apache License.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Who created Apache Airflow?$q$, $q$Airflow was created at Airbnb in October 2014 and became a top-level Apache Software Foundation project in January 2019.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$What language are Airflow workflows written in?$q$, $q$Workflows are written in Python and structured as Directed Acyclic Graphs (DAGs).$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Does Airflow offer managed hosting?$q$, $q$The Apache project itself does not offer managed hosting, but third-party vendors provide managed Airflow services.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$ETL/ELT pipeline orchestration$q$, $q$Schedule and monitor data extraction, transformation, and loading jobs.$q$, $q$Data engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$ML workflow orchestration$q$, $q$Coordinate model training and data preparation steps as part of an ML pipeline.$q$, $q$ML engineers and data scientists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Infrastructure automation$q$, $q$Orchestrate multi-step infrastructure or operations workflows.$q$, $q$DevOps and platform teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apache Airflow is an open-source platform for programmatically authoring, scheduling, and monitoring workflows. It originated at Airbnb in October 2014, was open source from its first commit, and became a top-level Apache Software Foundation project in January 2019.$q$, $q$Workflows in Airflow are defined as Python code structured into Directed Acyclic Graphs (DAGs), which lets teams version-control, test, and dynamically generate pipelines rather than configuring them through XML or a drag-and-drop UI.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Airflow includes a web-based UI for monitoring and managing DAG runs, native integrations with major cloud providers (AWS, Google Cloud, Azure), an extensible operator framework for custom tasks, and Jinja-based templating for dynamic pipeline configuration.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$development-history$q$, $q$Development History$q$, 2, ARRAY[$q$Airflow was created at Airbnb in 2014, publicly announced as open source in 2015, entered the Apache Incubator in March 2016, and became a top-level Apache Software Foundation project in January 2019. It continues to be actively developed by a large open-source community.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── airfocus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$airfocus, now part of Lucid Software, is an AI-powered product management platform for roadmapping, prioritization, OKRs, and customer feedback management.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Hamburg, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$airfocus: AI Product Management Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$airfocus is a product management platform for roadmapping, prioritization, OKRs, and feedback management, now part of Lucid Software.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$airfocus is a product management platform founded in 2017 in Hamburg, Germany, by Malte Scholz, Christian Hoffmeister, and Valentin Firak. It was acquired by Lucid Software in April 2025 and now operates as 'airfocus by Lucid.' The platform combines roadmapping, prioritization frameworks, OKR/goal tracking, and customer feedback management into a connected system intended to help product teams make data-informed decisions. It offers multiple roadmap views (board, timeline, table, chart, list, Gantt, document, inbox), a branded feedback portal for collecting and triaging customer input, portfolio-level dependency tracking, and AI agents that assist with tasks like feedback triage, PRD co-authoring, and stakeholder communication. airfocus targets product managers and product teams at mid-market and enterprise organizations managing multiple products or a complex portfolio, including customers who require EU data hosting. Pricing is not publicly listed; airfocus offers two named tiers — Professional and Enterprise — both requiring contact with the sales team for pricing, with Enterprise adding portfolio dashboards, capacity planning, SAML SSO, SCIM provisioning, and a dedicated success manager. Discounted pricing is available for startups, nonprofits, and educational institutions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1630ac29-62d1-433c-a8cb-b173926de875';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1630ac29-62d1-433c-a8cb-b173926de875' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Multi-view roadmaps$q$, $q$Build roadmaps in board, timeline, table, chart, Gantt, or document views.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Prioritization frameworks$q$, $q$Data-driven prioritization tools to rank features and initiatives.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$OKRs & goal tracking$q$, $q$Built-in objectives and key results tracking tied to roadmap items.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Customer feedback portal$q$, $q$Branded portal to collect and analyze customer feedback and requests.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$AI agents$q$, $q$AI-assisted feedback triage, PRD co-authoring, and stakeholder communication.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Portfolio dependency tracking$q$, $q$Track dependencies and flag portfolio drift across multiple teams and products.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Combines roadmapping, prioritization, OKRs, and feedback in one connected system$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Multiple roadmap view types for different stakeholder needs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Backed by Lucid Software's resources following the 2025 acquisition$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$EU hosting option for data residency requirements$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Enterprise features like SSO and portfolio dashboards are gated to the higher tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Transition following the Lucid acquisition may bring product changes over time$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Is airfocus still an independent company?$q$, $q$No, airfocus was acquired by Lucid Software in April 2025 and now operates as 'airfocus by Lucid.'$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$How much does airfocus cost?$q$, $q$airfocus does not publish pricing; both the Professional and Enterprise plans require contacting sales.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Where was airfocus founded?$q$, $q$airfocus was founded in 2017 in Hamburg, Germany.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Does airfocus offer AI features?$q$, $q$Yes, it offers AI agents for tasks like feedback triage, PRD co-authoring, and stakeholder communication.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Product roadmapping$q$, $q$Build and share roadmaps across multiple view types for different audiences.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Portfolio management$q$, $q$Track dependencies and progress across multiple products and teams.$q$, $q$Enterprise product organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Customer feedback triage$q$, $q$Collect, organize, and act on customer feedback through a branded portal.$q$, $q$Product and customer success teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Professional$q$, $q$Contact sales$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited free contributors & workspaces","Multi-view roadmaps","Feedback & Insights portal","Core integrations (Jira Cloud, Azure DevOps Cloud)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Enterprise$q$, $q$Contact sales$q$, $q$monthly or annual$q$, NULL, $q$["Objectives & OKRs included","Portfolio management & dashboards","SAML SSO","SCIM provisioning","Dedicated success manager"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '1630ac29-62d1-433c-a8cb-b173926de875';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$airfocus is a product management platform founded in 2017 in Hamburg, Germany. It was acquired by Lucid Software in April 2025 and now operates under the name 'airfocus by Lucid,' continuing to serve product teams with roadmapping, prioritization, and feedback management tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform offers roadmaps in multiple views (board, timeline, table, chart, Gantt, and more), prioritization frameworks, OKR and goal tracking, a branded customer feedback portal, portfolio dependency tracking across teams, and AI agents for tasks such as feedback triage and PRD co-authoring.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$airfocus offers two plans, Professional and Enterprise, both requiring contact with sales for pricing. Enterprise adds portfolio management, capacity planning, unlimited custom product hierarchy, and enterprise-level onboarding and SSO options. Discounted pricing is available for startups, nonprofits, and educational institutions.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


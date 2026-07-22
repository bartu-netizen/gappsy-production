-- Enrichment marathon batch: AccuRanker, Ackee, Acronis Cyber Protect, Actionstep, ActiveCampaign

-- ── AccuRanker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AccuRanker is a fast, accurate rank tracking platform for SEO professionals, offering daily keyword tracking, competitor analysis, and AI search visibility monitoring.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$224/month$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Aarhus, Denmark$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AccuRanker Review: Features, Pricing & Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$See what AccuRanker offers: daily rank tracking, AI search tracking, keyword research, and pricing plans starting at $224/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AccuRanker is a cloud-based SEO rank tracking platform founded in 2013 and headquartered in Aarhus, Denmark. It tracks keyword rankings across search engines with daily updates and has expanded into tracking brand visibility across AI models and answer engines (ChatGPT, Perplexity, AI Overviews) through a feature called AccuLLM. The platform is aimed at SEO agencies, in-house SEO teams, and independent consultants who need fast, granular ranking data. Core capabilities include real-time rank updates, keyword research and discovery, search intent analysis, competitor tracking at group/URL/product level, tagging and 50+ filters for segmenting large keyword sets, customizable reporting and forecasting, and API access. AccuRanker uses subscription pricing based on the number of tracked keywords, with three public tiers: Professional (starting at $224/month for 2,000 keywords with daily updates, keyword research, tagging, and GSC/GA integration), Expert (starting at $764/month for 10,000+ keywords, adding dynamic tagging, AI CTR, AI Search Volume, and unlimited read API), and a custom-priced Enterprise tier for 25,000+ keywords with BigQuery export, unlimited write API, raw SERP HTML access, and a dedicated customer success manager. All plans include unlimited users and domains. Annual billing gives a 10% discount.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '324f0aed-4d17-4a2b-951a-1b9488398905';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '324f0aed-4d17-4a2b-951a-1b9488398905' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Daily rank tracking$q$, $q$Keyword positions are updated daily across supported search engines for up-to-date visibility.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$AccuLLM (AI search tracking)$q$, $q$Tracks brand and page visibility inside AI answer engines like ChatGPT, Perplexity, and AI Overviews.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Keyword research & search intent$q$, $q$Built-in keyword discovery tools with search intent analysis to prioritize target terms.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Competitor tracking$q$, $q$Monitor competitor rankings at the group, URL, and product level.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Advanced filtering & tagging$q$, $q$50+ filters plus dynamic tagging for organizing and segmenting large keyword sets.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Reporting & API access$q$, $q$Custom reports, Google Data Studio integration, and a read/write API for pulling data into other tools.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Daily rank updates across all plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Unlimited users and domains on every tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Strong filtering/tagging for managing large keyword volumes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Early mover into AI search visibility tracking (AccuLLM)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Priced per keyword volume, which can get expensive for large keyword sets$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Enterprise-level features (BigQuery, write API) are gated behind higher tiers or custom pricing$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$How much does AccuRanker cost?$q$, $q$Plans start at $224/month for the Professional tier (2,000 keywords), with Expert starting at $764/month (10,000 keywords). Enterprise pricing for 25,000+ keywords is custom.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Does AccuRanker track AI search visibility?$q$, $q$Yes, its AccuLLM feature tracks how brands and pages appear in AI answer engines such as ChatGPT, Perplexity, and Google AI Overviews.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Does AccuRanker limit users or domains?$q$, $q$No, all plans include unlimited users and unlimited domains regardless of tier.$q$, 2, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Agency client reporting$q$, $q$Agencies track rankings across many client domains and generate branded reports.$q$, $q$SEO agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Enterprise keyword monitoring$q$, $q$Large in-house SEO teams track tens of thousands of keywords with daily precision.$q$, $q$Enterprise SEO teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$AI search visibility tracking$q$, $q$Brands monitor how they appear in AI-generated answers alongside traditional rankings.$q$, $q$SEO consultants and brand teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Professional$q$, $q$$224/month$q$, $q$per month (10% off annually)$q$, NULL, $q$["2,000-5,000 keywords","Daily updates","Keyword research","Search intent analysis","Tagging & advanced filtering","GSC and GA integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Expert$q$, $q$$764/month$q$, $q$per month (10% off annually)$q$, NULL, $q$["10,000-25,000 keywords","Dynamic tagging & Tag Cloud","AI CTR & AI Search Volume","Google Data Studio integration","Unlimited read API"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["25,000+ keywords","Google BigQuery export","Unlimited write API","Raw SERP HTML access","Dedicated customer success manager"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AccuRanker is a rank tracking and SEO analytics platform built to give SEO professionals fast, accurate visibility into keyword performance across search engines. Founded in 2013 and based in Aarhus, Denmark, the company has grown into one of the more widely used dedicated rank trackers among SEO agencies and enterprise in-house teams.$q$, $q$The platform's core pitch is speed and data freshness: rankings update daily, and the interface is built around large-scale keyword management, with 50+ filters, tagging, and grouping tools designed for accounts tracking thousands of keywords at once.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Beyond core rank tracking, AccuRanker includes keyword research and discovery tools, search intent classification, competitor tracking at the group, URL, and product level, and forecasting/reporting tools for client or executive reporting.$q$, $q$AccuLLM extends the platform into tracking brand and page visibility inside AI answer engines such as ChatGPT, Perplexity, and Google AI Overviews, reflecting the shift in search behavior toward AI-generated answers.$q$, $q$Integrations include Google Search Console, Google Analytics, Google Data Studio (Expert tier and above), and a read/write API for pulling ranking data into other systems.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$AccuRanker prices by the number of keywords tracked rather than by user seats — all plans include unlimited users and domains. The Professional plan starts at $224/month for 2,000 keywords and scales up through 3,000 and 5,000-keyword tiers. The Expert plan starts at $764/month for 10,000 keywords and scales to 25,000. Above that, Enterprise pricing is custom and adds BigQuery export, unlimited write API access, and a dedicated customer success manager. Paying annually gives a 10% discount on any plan.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AccuRanker is built for SEO agencies managing multiple client accounts, enterprise SEO teams tracking large keyword portfolios, and independent consultants who need reliable daily rank data without the noise of a full all-in-one SEO suite.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Ackee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ackee is a self-hosted, open-source website analytics tool built on Node.js and MongoDB that tracks traffic without cookies or personal data.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Ackee: Open-Source, Self-Hosted Privacy Analytics$q$, seo_title),
  seo_meta_description = COALESCE($q$Ackee is a free, self-hosted analytics tool that tracks website traffic without cookies. See features, setup options, and how it compares.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ackee is a free, open-source, self-hosted web analytics tool built with Node.js and MongoDB, created by developer studio Electerious. It is designed as a privacy-respecting alternative to services like Google Analytics: it does not use cookies and anonymizes tracked data so individual visitors cannot be identified, which means sites using it typically don't need a cookie-consent banner. Ackee provides a minimalist dashboard for monitoring multiple websites at once, showing metrics like page views, referrers, session duration, and visitor device/location metadata, plus custom event tracking (e.g., button clicks, newsletter signups). It exposes a fully documented GraphQL API for building custom integrations or dashboards. Because it is self-hosted, there is no subscription cost — users deploy it themselves via Docker, Docker Compose, Helm, Heroku, Netlify, Vercel, Render, Railway, Koyeb, or Zeabur, and pay only for their own hosting. It's best suited for developers and privacy-conscious site owners who want full control over their analytics data rather than a managed SaaS analytics product.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Cookie-free tracking$q$, $q$Tracks site usage without setting cookies or storing unique visitor identifiers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Multi-site dashboard$q$, $q$Monitor page views, referrers, and session data across multiple domains from one interface.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Custom event tracking$q$, $q$Track specific interactions like button clicks or form submissions alongside pageviews.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$GraphQL API$q$, $q$Fully documented API for building custom integrations or dashboards on top of collected data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Flexible self-hosted deployment$q$, $q$Deployable via Docker, Helm, Heroku, Netlify, Vercel, Render, Railway, Koyeb, or Zeabur.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$No cookies required, simplifying consent/compliance concerns$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Full data ownership since it's self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Multiple deployment options to fit different infrastructure$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Requires self-hosting and ongoing maintenance (no managed cloud version)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Requires running and maintaining a MongoDB database$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Minimal feature set compared to full-featured commercial analytics suites$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Is Ackee free?$q$, $q$Yes. Ackee is free, open-source software. Since it's self-hosted, there's no license fee — you only pay for the server or platform you host it on.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Does Ackee use cookies?$q$, $q$No. Ackee tracks visits without cookies or unique visitor identifiers, and anonymizes the data it collects.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$What do I need to run Ackee?$q$, $q$A Node.js runtime and a MongoDB database, plus a hosting environment such as Docker, Heroku, Netlify, Vercel, or similar.$q$, 2, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Privacy-first site analytics$q$, $q$Site owners who want visitor insights without cookie banners or third-party data sharing.$q$, $q$Privacy-conscious developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Self-hosted analytics for multiple projects$q$, $q$Developers running several sites who want one dashboard without per-site SaaS fees.$q$, $q$Indie developers and small teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ackee is a self-hosted, open-source analytics tool built on Node.js and MongoDB. Rather than running as a hosted SaaS product, it's deployed on infrastructure the user controls, which means there's no recurring subscription fee — only the cost of hosting it yourself.$q$, $q$The project is fully open source, with its code, issues, and releases hosted publicly on GitHub, and has built a sizeable community following among developers looking for a lightweight, privacy-first alternative to commercial analytics platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$privacy-approach$q$, $q$Privacy Approach$q$, 2, ARRAY[$q$Ackee's defining feature is its privacy model: it doesn't use cookies or unique visitor identifiers, and it anonymizes collected data so individual users can't be re-identified. Because no cookies are set for tracking, sites relying solely on Ackee for analytics typically don't need to show a cookie-consent banner for that purpose.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The dashboard supports monitoring multiple domains from one place, showing page views, referrers, session duration, and visitor metadata. It also supports custom event tracking — for example, logging button clicks or newsletter signups alongside standard pageview data.$q$, $q$A fully documented GraphQL API is available for pulling data into custom tools or building alternative front ends, and the tracking script is designed to be a simple drop-in snippet similar to other analytics tools.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$deployment$q$, $q$Deployment$q$, 2, ARRAY[$q$Ackee supports several self-hosting paths, including Docker, Docker Compose, Helm charts, and one-click-style deploys to Heroku, Netlify, Vercel, Render, Railway, Koyeb, and Zeabur. It requires a Node.js runtime and a MongoDB database.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Acronis Cyber Protect ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Acronis Cyber Protect combines backup and disaster recovery with AI-based anti-malware, ransomware protection, and endpoint management in a single console.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2003, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Schaffhausen, Switzerland$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Acronis Cyber Protect: Backup + Cybersecurity in One$q$, seo_title),
  seo_meta_description = COALESCE($q$Acronis Cyber Protect unifies backup, AI-based anti-malware, ransomware protection, and endpoint management into one integrated platform.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Acronis Cyber Protect is a cyber protection platform from Acronis, a Swiss data-protection and cybersecurity company founded in 2003 and headquartered in Schaffhausen, Switzerland. The product's central idea is unifying two functions that are typically separate products: backup/disaster recovery and cybersecurity (anti-malware, anti-ransomware, endpoint protection management) delivered through a single agent and management console. It uses an AI-based behavioral detection engine that monitors system activity for malicious behavior to stop malware, ransomware, and zero-day attacks, and includes an Active Protection engine that can block file encryption in real time and automatically restore affected files from a clean backup snapshot. On the backup side, it supports full-image and file-level backup and recovery across more than 30 platforms and 20+ workload types, with near-zero recovery point/time objectives. Endpoint management features include asset discovery, vulnerability/patch management, remote monitoring, and scripted automation from one console. Acronis offers multiple editions (Standard and Advanced tiers, plus an Enterprise-focused version) with pricing scaled to workload count and feature set; exact self-serve pricing is not publicly listed and typically requires a quote through Acronis or its partners. The product targets IT teams and managed service providers who want to consolidate backup and security tooling rather than running separate point solutions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e09c036b-bf39-4a03-9832-b843bd6525c7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e09c036b-bf39-4a03-9832-b843bd6525c7' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e09c036b-bf39-4a03-9832-b843bd6525c7';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Unified backup + security agent$q$, $q$One agent and console handle both backup/recovery and cybersecurity, instead of separate tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$AI-based threat detection$q$, $q$Behavioral detection engine identifies malware, ransomware, and zero-day attacks based on monitored system activity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Active Protection (anti-ransomware)$q$, $q$Blocks file-encryption attempts in real time and auto-restores affected files from a clean backup.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Full-image and file-level backup$q$, $q$Backup and recovery across 30+ platforms and 20+ workload types with hybrid storage options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Endpoint management$q$, $q$Asset discovery, vulnerability/patch management, and remote monitoring/automation from one console.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'e09c036b-bf39-4a03-9832-b843bd6525c7';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Combines backup and cybersecurity in a single agent/console, reducing tool sprawl$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$AI-based detection is tied directly into automatic backup-based recovery$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Broad platform/workload coverage across physical, virtual, and cloud environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Multiple editions let organizations scale from SMB to enterprise needs$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e09c036b-bf39-4a03-9832-b843bd6525c7';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Self-serve pricing isn't published; buyers generally need to request a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Feature set differs meaningfully between Standard and Advanced editions, requiring careful plan comparison$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Broad, all-in-one scope may be more than smaller teams need if they only require basic backup$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e09c036b-bf39-4a03-9832-b843bd6525c7';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$What is Acronis Cyber Protect?$q$, $q$It's a cyber protection platform that combines backup/disaster recovery with AI-based anti-malware, ransomware protection, and endpoint management in a single agent and console.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Does Acronis Cyber Protect stop ransomware?$q$, $q$Yes. Its Active Protection engine uses behavior-based detection to block ransomware encryption in real time and can automatically restore any files that were affected from a recent backup.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$What editions does Acronis Cyber Protect offer?$q$, $q$Acronis offers a Standard edition for core backup plus cybersecurity, and an Advanced edition with additional workload support, malware-scanning of backups, and security posture assessment for larger environments.$q$, 2, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e09c036b-bf39-4a03-9832-b843bd6525c7';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Consolidating backup and endpoint security$q$, $q$IT teams replace separate backup and antivirus/EDR tools with one integrated agent.$q$, $q$IT teams and system administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$MSP service delivery$q$, $q$Managed service providers deliver backup and cybersecurity as a bundled managed service to clients.$q$, $q$Managed service providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$Ransomware resilience$q$, $q$Organizations add behavior-based ransomware detection tied directly to automatic recovery from backups.$q$, $q$Enterprise IT and security teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'e09c036b-bf39-4a03-9832-b843bd6525c7';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Acronis Cyber Protect is built around a single premise: backup and cybersecurity work better as one integrated system than as two separate tools bolted together. It combines backup and disaster recovery with AI-based anti-malware, anti-ransomware, and endpoint protection management under one agent and one console.$q$, $q$Acronis, the company behind the product, was founded in 2003 and is headquartered in Schaffhausen, Switzerland. It has grown from a disk-imaging and backup vendor into a broader cyber protection company, launching the unified Cyber Protect platform in 2020.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$An AI-based behavioral detection engine monitors system activity across a large set of behavioral indicators to catch malware, ransomware, and zero-day attacks before they cause damage. Its Active Protection engine can block file encryption attempts in real time and automatically restore any affected files from a clean backup snapshot — tying detection directly into recovery.$q$, $q$On the backup side, the platform supports full-image and file-level backup and recovery across 30+ platforms and more than 20 workload types, with hybrid storage options and incremental/differential backup strategies aimed at near-zero recovery point and recovery time objectives.$q$, $q$Endpoint management tools round out the platform: asset discovery, vulnerability assessment and patch management, remote monitoring, and script-based task automation, all from the same console used for backup and security.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$editions-pricing$q$, $q$Editions & Pricing$q$, 2, ARRAY[$q$Acronis offers Cyber Protect in multiple editions. The Standard edition targets SMBs that need reliable backup plus core cybersecurity capabilities such as URL filtering and continuous data protection. The Advanced edition adds capabilities aimed at larger, more complex environments, including support for additional workload types, backup notarization, malware scanning of backups, and security posture assessment.$q$, $q$Acronis does not publish flat self-serve pricing for Cyber Protect on its site; pricing depends on deployment model, workload count, and edition, and is generally obtained via a partner or sales quote.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Cyber Protect is aimed at IT teams and managed service providers who want to reduce the number of agents and vendors involved in protecting endpoints and servers, consolidating backup, malware protection, and patch management into a single workflow.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Actionstep ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Actionstep is cloud-based legal practice management software that unifies matter management, billing, trust accounting, and client intake for midsize law firms.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2004, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Denver, CO$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Actionstep: Legal Practice Management Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Actionstep is cloud-based practice management software for law firms, covering matters, billing, trust accounting, and client intake.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Actionstep is cloud-based legal practice management software originally created in New Zealand in 2004, now serving midsize law firms globally with operations across New Zealand, Australia, the UK, and the US (its North American hub is in Denver, Colorado). The platform is built to run most of a law firm's back office from one system: matter/case management, document management and automation, calendaring, client intake, a client portal, and CRM/marketing on the practice-management side, plus billing, time tracking, trust accounting, payment processing, and financial reporting on the accounting side. It also includes AI-assisted features for time capture, document filing, and administrative tasks, and a document-assembly module called Builder for generating legal documents from templates. Actionstep reports serving 5,000+ law firms and supports 13+ practice specialties, with 50+ third-party integrations available. Pricing is not published on the website; Actionstep prices Practice Management, Legal Accounting (North America only), and add-on modules per user plus implementation fees, requiring a custom quote through their sales team.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '83af1af4-6221-4015-833c-810c8bd8d57f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '83af1af4-6221-4015-833c-810c8bd8d57f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Matter and case management$q$, $q$Central system for tracking legal matters, tasks, deadlines, and case documents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Trust accounting$q$, $q$Built-in trust accounting alongside general billing and financial reporting, a common compliance requirement for law firms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Document automation (Builder)$q$, $q$Assembles legal documents from templates with conditional logic and Word integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Client portal and intake$q$, $q$Client-facing portal plus intake forms for onboarding new clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Workflow automation$q$, $q$Automates repetitive firm processes across matter management and client communication.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Combines practice management and accounting (including trust accounting) in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Supports a wide range of practice specialties (13+)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$50+ integrations for connecting to other firm tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Document automation module reduces manual drafting work$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$No public pricing — requires a sales conversation to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Legal Accounting module is limited to North America$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Per-user plus implementation fee pricing can be less predictable than flat-tier SaaS pricing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$How much does Actionstep cost?$q$, $q$Actionstep doesn't publish pricing. Practice Management, Legal Accounting, and add-on modules are each priced per user plus implementation fees, available by requesting a quote.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Does Actionstep handle trust accounting?$q$, $q$Yes, trust accounting is included as part of its financial operations features alongside billing, time tracking, and invoicing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Is Actionstep available outside North America?$q$, $q$Yes. Actionstep operates in New Zealand, Australia, the UK, and the US, though its Legal Accounting module is North America only.$q$, 2, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Unifying matter management and billing$q$, $q$Firms replace separate case-management and accounting tools with one connected system.$q$, $q$Midsize law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Client intake and onboarding$q$, $q$Firms use the client portal and intake forms to streamline bringing on new clients.$q$, $q$Law firm administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Document assembly at scale$q$, $q$Firms generate standard legal documents automatically from templates via Builder.$q$, $q$Legal document specialists$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Practice Management$q$, $q$Custom (per user + implementation fee)$q$, $q$per user$q$, NULL, $q$["Matter & case management","Client intake","Document management","CRM","Client portal","Billing & trust accounting","Workflow automation","Integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Legal Accounting (North America only)$q$, $q$Custom (per user + implementation fee)$q$, $q$per user$q$, NULL, $q$["General ledger","Bank reconciliation","Accounts payable/receivable","P&L statements","Revenue recognition","Financial forecasting"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Actionstep is a cloud-based practice management platform for law firms, built to connect matter management, client communication, and firm accounting into one system rather than requiring firms to stitch together separate tools. It was created in 2004 in New Zealand and has since expanded internationally, with its North American operations based in Denver, Colorado, alongside offices in Australia, the UK, and New Zealand.$q$, $q$The company reports serving over 5,000 law firms worldwide, spanning more than a dozen practice specialties including family law, immigration, personal injury, real estate, and intellectual property.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$On the practice management side, Actionstep covers matter and case management, workflow automation, document management, calendaring, email management, a client portal, client intake, and a mobile app. On the financial side, it handles billing, time tracking, trust accounting, payment processing, invoice management, and financial reporting — trust accounting in particular is a common requirement for law firms that Actionstep builds in natively.$q$, $q$A separate Builder module handles document automation, assembling legal documents from templates with conditional logic and Microsoft Word integration, cutting down manual drafting work. Actionstep also markets AI-assisted capabilities for time capture, document filing, and client intake.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Actionstep does not publish flat pricing. Its core Practice Management and Legal Accounting (North America only) products, plus add-on modules like Builder (document automation) and Capture (web forms/intake), are each priced per user plus implementation fees, and firms need to request a quote or book a demo to get exact numbers.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Actionstep is aimed at midsize law firms — from small teams to larger practices — that want a single system covering both case/matter management and firm accounting, including trust accounting, rather than running separate practice-management and accounting software.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── ActiveCampaign ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$ActiveCampaign is an AI-powered marketing automation platform for email, SMS, and WhatsApp campaigns, with CRM and audience segmentation built in.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2003, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Chicago, IL$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$ActiveCampaign: AI Marketing Automation Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$ActiveCampaign combines email, SMS, and WhatsApp marketing automation with AI campaign tools, CRM, and 1,000+ integrations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ActiveCampaign is a marketing automation and CRM platform founded in 2003 by Jason VandeBoom and headquartered in Chicago, Illinois. It serves businesses of a wide range of sizes and reports serving over 180,000 customers. The platform centers on automating multi-channel marketing — email, SMS, and WhatsApp — through visual automation workflows, and has layered in AI features (branded 'Active Intelligence') for building campaigns, suggesting segmentation and lead scoring, and generating predictive content based on brand and performance data. It includes CRM and sales-pipeline tools, landing pages, and integrates with 1,000+ third-party apps. Pricing is tiered by contact volume and is organized into separate Email Marketing plans (Starter, Plus, Pro, Enterprise) and WhatsApp Messaging plans (Core, Advanced, Premium), plus combined plans; ActiveCampaign does not display exact prices publicly and requires visitors to get a quote based on contact count and features needed. It offers a 14-day free trial with no credit card required and a 30-day money-back guarantee.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Multi-channel automation$q$, $q$Build automated campaigns across email, SMS, and WhatsApp from one workflow builder.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$AI campaign builder (Active Intelligence)$q$, $q$AI tools assist with building campaigns, suggesting segments, and generating predictive content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Built-in CRM$q$, $q$Track deals, contacts, and sales pipeline alongside marketing automation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Lead scoring & segmentation$q$, $q$Score and segment contacts based on behavior and engagement to target campaigns.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$1,000+ integrations$q$, $q$Connects to a large ecosystem of third-party apps for extending marketing workflows.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Deep automation capabilities beyond basic email marketing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Multi-channel support (email, SMS, WhatsApp) in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Large integration ecosystem (1,000+ apps)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$14-day free trial with no credit card and a 30-day money-back guarantee$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$No public pricing — requires providing contact volume to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$WhatsApp messaging is priced/packaged separately from core email plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Automation depth can mean a steeper learning curve than simpler email tools$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Does ActiveCampaign have a free trial?$q$, $q$Yes, a 14-day free trial is available with no credit card required, plus a 30-day money-back guarantee on paid plans.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Does ActiveCampaign support SMS and WhatsApp?$q$, $q$Yes, beyond email it supports SMS and WhatsApp messaging, with WhatsApp offered as its own set of plans or bundled with email plans.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Is pricing based on contacts?$q$, $q$Yes, ActiveCampaign's plans scale based on contact-list size, with each tier supporting a different contact-list multiplier along with feature differences.$q$, 2, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Automated email marketing$q$, $q$Small and midsize teams build automated email sequences tied to customer behavior.$q$, $q$Small to midsize marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Multi-channel campaigns$q$, $q$Marketers coordinate email, SMS, and WhatsApp messaging within unified automations.$q$, $q$E-commerce and DTC brands$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Sales and marketing alignment$q$, $q$Teams use the built-in CRM alongside marketing automation to manage the full funnel.$q$, $q$Small business sales teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Starter$q$, $q$Contact for pricing$q$, $q$annual$q$, NULL, $q$["Basic email marketing","Limited segmentation","5 actions per automation","1 user"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Plus$q$, $q$Contact for pricing$q$, $q$annual$q$, NULL, $q$["Standard segmentation","Unlimited automation actions","1 user","Landing pages"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Pro$q$, $q$Contact for pricing$q$, $q$annual$q$, NULL, $q$["Advanced segmentation","Unlimited actions","3 users","Predictive content"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Enterprise$q$, $q$Contact for pricing$q$, $q$annual$q$, NULL, $q$["Premium segmentation","Unlimited actions","5 users","Dedicated account team","SSO"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ActiveCampaign is a marketing automation platform built around multi-channel campaign automation — email, SMS, and WhatsApp — combined with a built-in CRM. Founded in 2003 by Jason VandeBoom and headquartered in Chicago, the company has grown to serve over 180,000 customers ranging from small businesses to large enterprises.$q$, $q$The platform's current positioning leans heavily on AI: its 'Active Intelligence' engine is pitched as learning from a brand's content and campaign performance to help build and optimize automations, aiming to cut manual marketing work.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core capabilities include visual automation workflows across email, SMS, and WhatsApp; an AI campaign builder; lead scoring and AI-suggested audience segmentation; landing pages; and a built-in CRM for tracking deals and contacts. The platform connects to 1,000+ third-party apps for extending automations into other parts of a marketing or sales stack.$q$, $q$Plans scale by both features and contact-list size, with higher tiers unlocking more users, larger contact-list multipliers, advanced segmentation, predictive content, and enterprise features like SSO and a dedicated account team.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$ActiveCampaign doesn't display exact prices on its site — plans are quoted based on contact volume. Email Marketing plans run Starter, Plus, Pro, and Enterprise, each adding more users, automation complexity, and higher contact-list multipliers as you go up. WhatsApp Messaging is sold as a separate plan track based on number of WhatsApp lines and users, and combined email + WhatsApp plans are also available. All plans include a 30-day money-back guarantee, and a 14-day free trial is available with no credit card required.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;


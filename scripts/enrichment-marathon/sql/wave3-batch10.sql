-- Enrichment marathon batch: Bear Blog, Beeceptor, Beehiiv, Beets, Benchmark Email, Benepass, BentoML, BentoPDF

-- ── Bear Blog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bear Blog is a minimalist, privacy-first blogging platform with no trackers, ads, or JavaScript, built for fast, no-nonsense writing and publishing.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Premium from $5/month)$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bear Blog: Minimalist, Privacy-First Blogging$q$, seo_title),
  seo_meta_description = COALESCE($q$Bear Blog is a fast, ad-free, tracker-free blogging platform. Free to start, with premium features like custom domains and analytics from $5/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bear Blog (bearblog.dev) is a minimalist blogging platform created by South African developer Herman Martinus in 2020, originally built as a weekend project. It emphasizes simplicity, speed, and privacy: pages contain no trackers, ads, or JavaScript by default and typically weigh only a few kilobytes, making them extremely fast to load. The free tier gives every user a subdomain (e.g. yourname.bearblog.dev), a selection of built-in themes, Markdown-based writing, and RSS/Atom feeds. A paid Premium tier (around $5/month, $49/year, or a one-time lifetime option) unlocks custom domains, image uploads, in-depth analytics, email subscriber lists, and the ability to run multiple blogs (up to 10) on one account. The platform's source code is publicly available on GitHub, reflecting its open, community-oriented development. Bear Blog is aimed at writers, developers, and indie hackers who want a distraction-free, no-bloat alternative to heavier blogging platforms like WordPress or Medium, prioritizing substance over design complexity or marketing tooling. It has become popular in indie web and developer communities for its speed, simplicity, and lack of surveillance-based monetization.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3bc33713-c005-4ff3-a44a-039f94585dff';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3bc33713-c005-4ff3-a44a-039f94585dff' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$No trackers or ads$q$, $q$Pages ship with no analytics scripts, ad code, or third-party trackers by default.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Extremely lightweight pages$q$, $q$Typical pages are only a few kilobytes, loading near-instantly on any connection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Markdown writing$q$, $q$Posts are written and edited in Markdown through a simple text-first editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Built-in themes$q$, $q$A curated set of free themes is available out of the box with no setup required.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$RSS and Atom feeds$q$, $q$Every blog automatically generates standard RSS/Atom feeds for subscribers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Custom domains (Premium)$q$, $q$Paid accounts can map a blog to a custom domain instead of the bearblog.dev subdomain.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Analytics and subscriber lists (Premium)$q$, $q$Premium unlocks basic privacy-respecting analytics and email subscriber list management.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Free tier is fully usable with no time limit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Very fast, lightweight pages with no bloat$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$No tracking or ads on free or paid tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Simple Markdown-based writing workflow$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Open-source codebase available on GitHub$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Design customization is limited compared to full CMS platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Custom domains and analytics require the paid Premium tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Not suited for complex, multi-author publications$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Is Bear Blog free?$q$, $q$Yes. The core platform, including a bearblog.dev subdomain and built-in themes, is free indefinitely. A paid Premium tier (~$5/month) adds custom domains, analytics, image uploads, and subscriber lists.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Is Bear Blog open source?$q$, $q$Yes, its source code is publicly available on GitHub.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Who created Bear Blog?$q$, $q$Bear Blog was created by developer Herman Martinus, who started it in 2020 as a weekend project and continues to maintain it.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Can I use a custom domain on Bear Blog?$q$, $q$Custom domain support is part of the paid Premium plan; free accounts use a bearblog.dev subdomain.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Personal blogging$q$, $q$Writers who want a fast, distraction-free place to publish personal essays or notes.$q$, $q$Individual writers and hobbyist bloggers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Developer and indie hacker blogs$q$, $q$Technical writers who value speed, simplicity, and no-JS pages for changelogs or build-in-public updates.$q$, $q$Developers and indie makers$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["bearblog.dev subdomain","Built-in themes","Markdown editor","RSS/Atom feeds"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Premium$q$, $q$$5/month or $49/year$q$, $q$monthly or annual$q$, NULL, $q$["Custom domain support","Image uploads","In-depth analytics","Email subscriber lists","Run up to 10 blogs"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$Lifetime$q$, $q$$189 one-time$q$, $q$one-time$q$, NULL, $q$["All Premium features, permanently"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bear Blog is a stripped-down blogging platform built around the idea that most blogging tools are needlessly bloated. Created by Herman Martinus in 2020, it serves pages with no JavaScript, ads, or trackers by default, resulting in pages that often load in a fraction of a second.$q$, $q$The platform is free to start: every account gets a subdomain on bearblog.dev, a set of built-in themes, and support for writing posts in Markdown.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Beyond its speed and minimalism, Bear Blog includes RSS/Atom feeds out of the box, a handful of free themes, and a simple publishing workflow with no plugins or page builders to configure.$q$, $q$Paid Premium accounts add custom domain support, image uploads, subscriber email lists, and analytics — features that are opt-in rather than bundled by default, keeping the free tier genuinely lightweight.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Bear Blog's core platform is free indefinitely. Premium access — which adds custom domains, image hosting, analytics, and email subscribers — costs around $5/month, $49/year, or a one-time lifetime fee of $189.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Bear Blog suits writers, developers, and indie hackers who want to publish quickly without dealing with themes, plugins, or tracking scripts, and who value page speed and simplicity over design flexibility.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Beeceptor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Beeceptor is a cloud-based mock API platform for creating REST, GraphQL, SOAP, and gRPC test servers without writing backend code.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $10/month)$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Hyderabad, India$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Beeceptor: Instant Mock API & Webhook Testing$q$, seo_title),
  seo_meta_description = COALESCE($q$Beeceptor lets developers mock REST, GraphQL, and SOAP APIs in seconds, inspect webhooks, and simulate latency or errors. Free tier available.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Beeceptor is a cloud-based API mocking and testing platform founded in India (Hyderabad) by Ankit Jain and Arti Bandi, first launched around 2017. It lets developers, QA engineers, and API architects spin up mock REST, GraphQL, SOAP, and gRPC endpoints in seconds without deploying any backend infrastructure, using either a no-code UI or by importing OpenAPI, WSDL, or GraphQL specifications. Core capabilities include AI-assisted mock creation, CRUD-style REST APIs backed by a schema-less database, real-time request/response inspection, dynamic responses that reference incoming request data, proxying and recording of live traffic, a local tunnel for routing webhooks to a developer's machine, and simulation of latency and error conditions for resilience testing. Beeceptor operates on a freemium model: a free plan offers a public endpoint with limited daily requests and mock rules, while paid Individual ($10/month), Team ($25/month), and Scale ($99/month) plans add private endpoints, higher request quotas, CI/CD integration, custom domains, audit logs, and team collaboration features; an Enterprise tier offers custom pricing with SSO and on-prem/private cloud options. The platform is used by development and QA teams — including at large companies — for local development, automated testing, CI/CD pipelines, and client demos where a real backend isn't yet available.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$No-code mock server builder$q$, $q$Create REST, GraphQL, SOAP, and gRPC mocks through a visual UI with matching rules and custom responses.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$AI-assisted mock generation$q$, $q$Generate mocks automatically from uploaded OpenAPI, WSDL, or GraphQL specifications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$CRUD REST APIs$q$, $q$Spin up stateful CRUD endpoints backed by a schema-less database without writing code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Request inspection$q$, $q$View real-time incoming request payloads and headers for debugging.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Proxy and record$q$, $q$Capture and replay live API traffic through a proxying mode.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Local tunnel$q$, $q$Route webhook traffic from the internet to a local development machine.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Latency and error simulation$q$, $q$Inject artificial delays or error responses to test application resilience.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Fast setup with no backend infrastructure required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Free tier available for individual experimentation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Supports multiple API protocols (REST, GraphQL, SOAP, gRPC)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$AI-assisted mock creation from existing specs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Useful for CI/CD and automated testing pipelines$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Free plan is limited to low daily request volumes and public endpoints$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Higher usage tiers require paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Enterprise features like SSO require contacting sales$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Is Beeceptor free to use?$q$, $q$Yes, Beeceptor offers a free plan with a public endpoint, a limited number of mock rules, and 50 requests/day. Paid plans start at $10/month for higher limits and private endpoints.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$What protocols does Beeceptor support?$q$, $q$Beeceptor supports mocking REST, GraphQL, SOAP, and gRPC APIs.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Can Beeceptor generate mocks from an existing API spec?$q$, $q$Yes, it can generate mock endpoints from OpenAPI, WSDL, or GraphQL specifications, with AI assistance on paid plans.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Does Beeceptor support webhook testing?$q$, $q$Yes, it includes a local tunnel feature that routes webhook traffic to a developer's local machine.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$API development and testing$q$, $q$Developers mock third-party or in-progress APIs so frontend and integration work isn't blocked.$q$, $q$Software developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$QA and CI/CD testing$q$, $q$QA teams simulate error conditions, latency, and edge cases in automated test pipelines.$q$, $q$QA engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Client and stakeholder demos$q$, $q$Teams demo application flows using realistic mock data before a real backend exists.$q$, $q$Product and engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Free$q$, $q$$0$q$, $q$monthly$q$, NULL, $q$["50 requests/day per endpoint","3 mock rules","Public endpoint","Live traffic inspector","Limited AI assistance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Individual$q$, $q$$10/month$q$, $q$monthly or annual (20% off annual)$q$, NULL, $q$["15,000 requests/month per endpoint","Up to 50 mock rules","Private endpoint","AI-assisted mock creation","Persistent local tunnel","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Team$q$, $q$$25/month$q$, $q$monthly or annual (20% off annual)$q$, NULL, $q$["100,000 requests/month per endpoint","Up to 250 mock rules","Custom domain","CI/CD integration","Unlimited team members"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Scale$q$, $q$$99/month$q$, $q$monthly or annual (20% off annual)$q$, NULL, $q$["1M+ requests/month per endpoint","Up to 500 mock rules","Audit logs","Forward proxy","API contract drift detection"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["SSO","Private cloud/on-prem options","Dedicated support"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Beeceptor is a mock API platform that lets developers and QA teams simulate REST, GraphQL, SOAP, and gRPC services without building or deploying real backend infrastructure. Users can create mocks visually through a no-code interface or by uploading an OpenAPI, WSDL, or GraphQL spec.$q$, $q$Founded in Hyderabad, India, Beeceptor is built for scenarios where a live third-party API isn't available yet, is unreliable, or needs to be tested under failure conditions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Beeceptor supports dynamic, stateful mock responses, CRUD-style REST endpoints backed by a schema-less database, and real-time inspection of incoming requests and headers.$q$, $q$It also offers proxy-and-record functionality to capture live API traffic, a local tunnel to route webhooks to a developer's machine, and configurable latency or error injection for testing how applications handle failures.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Beeceptor's Free plan allows a limited number of daily requests and mock rules on a public endpoint. Paid plans start at $10/month (Individual) and scale up through Team ($25/month) and Scale ($99/month) tiers based on monthly request volume, private endpoints, and collaboration features, with a custom-priced Enterprise tier for SSO and private-cloud deployment.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Beeceptor is aimed at developers, QA engineers, and API-first teams who need to mock dependencies during local development, automated testing, CI/CD pipelines, or client demos before a real backend is ready.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Beehiiv ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$beehiiv is an all-in-one newsletter platform for creators to build, grow, and monetize newsletters, podcasts, and digital communities.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $43/month)$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$New York, NY$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$beehiiv: All-in-One Newsletter & Publishing Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$beehiiv helps creators build, grow, and monetize newsletters and podcasts with a free plan and paid tiers starting at $43/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$beehiiv is a newsletter and publishing platform founded in 2021 by former Morning Brew engineering lead Tyler Denk and co-founders, headquartered in New York City and operating as a remote-first company. It provides an all-in-one toolkit for independent writers, publishers, and media companies to create, grow, and monetize email newsletters, podcasts, and digital communities. Core features include a drag-and-drop newsletter editor and templates, a website builder, podcast hosting, AI-assisted writing and workflow automations, audience segmentation and surveys, A/B testing, and advanced analytics. Monetization tools include a native ad network with a 0% take rate on paid subscriptions (on paid plans), digital product sales, and a sponsorship storefront on higher tiers. beehiiv offers a free 'Launch' plan supporting up to 2,500 subscribers with unlimited sends and core publishing tools; paid 'Scale' ($43/month) and 'Max' ($96/month) plans raise subscriber limits to 100,000 and add automations, webhooks, community features, branding removal, and multiple publications; a custom-priced Enterprise tier adds SSO, dedicated IPs, and a dedicated account manager. beehiiv is used by independent journalists, newsletter writers, founders, and larger publishers — including outlets like Morning Brew and TechCrunch — who want a unified platform instead of stitching together separate email, analytics, and monetization tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff227d86-ddbd-4dae-a781-076d3958c64f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Drag-and-drop editor & templates$q$, $q$Build newsletter issues visually with pre-built templates and a customizable editor.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Website builder$q$, $q$Generate a companion website for the newsletter, including an AI-assisted builder.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Podcast hosting$q$, $q$Host podcasts and convert listeners into email subscribers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Native ad network$q$, $q$Access beehiiv's ad network to monetize newsletter placements, with 0% take rate on paid subscriptions on paid plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Automations and segmentation$q$, $q$Build automated email workflows and segment audiences based on behavior and surveys.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Advanced analytics & A/B testing$q$, $q$Track campaign performance and test subject lines/content variations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Digital products & community$q$, $q$Sell digital products (guides, courses) and host a community space on paid plans.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Generous free plan supporting up to 2,500 subscribers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Combines email, website, podcast, and monetization tools in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Native ad network helps creators monetize without separate sponsorship deals$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Advanced analytics and A/B testing built in$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Higher subscriber limits and automation features require paid plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$beehiiv branding remains until the Max plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Enterprise-level features (SSO, dedicated IP) require custom/contact pricing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Is beehiiv free to use?$q$, $q$Yes, beehiiv has a free Launch plan supporting up to 2,500 subscribers with unlimited email sends and core publishing tools.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$How much does beehiiv cost?$q$, $q$Paid plans start at $43/month (Scale) for up to 100,000 subscribers, rising to $96/month (Max) for additional features; Enterprise pricing is custom.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Does beehiiv support podcasts?$q$, $q$Yes, beehiiv offers podcast hosting and tools to convert podcast listeners into email subscribers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Can I monetize a newsletter on beehiiv?$q$, $q$Yes, through beehiiv's native ad network, paid subscriptions, and digital product sales, with a 0% platform take rate on paid subscriptions on paid plans.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Launching a new newsletter$q$, $q$Independent writers starting a newsletter from scratch using the free plan's tools.$q$, $q$Independent writers and creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Growing and monetizing an audience$q$, $q$Established newsletter operators using automations, the ad network, and digital products to generate revenue.$q$, $q$Growth-stage newsletter businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Media and publisher operations$q$, $q$Larger publishers managing multiple publications, teams, and advanced analytics.$q$, $q$Media companies and newsrooms$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Launch$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Up to 2,500 subscribers","Unlimited email sends","Website builder","Podcast hosting","Custom domains","Limited API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Scale$q$, $q$$43/month$q$, $q$monthly ($517/year annual)$q$, NULL, $q$["Up to 100,000 subscribers","Ad network","Digital products","Email automations","Surveys & polls","3 team seats"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Max$q$, $q$$96/month$q$, $q$monthly ($1,151/year annual)$q$, NULL, $q$["Everything in Scale","No beehiiv branding","Sponsorship storefront","Audio newsletters","Up to 10 publications","Unlimited team seats"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Dedicated account manager","Dedicated IP addresses","Send API","SSO"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'ff227d86-ddbd-4dae-a781-076d3958c64f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$beehiiv is a newsletter and publishing platform founded in 2021 by Tyler Denk (formerly of Morning Brew) and co-founders, based in New York City. It positions itself as an all-in-one platform bringing together newsletter creation, growth, and monetization tools that would otherwise require several separate services.$q$, $q$The platform serves creators ranging from individual writers just starting a newsletter to established media companies and newsrooms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$beehiiv includes a drag-and-drop email editor with templates, a built-in website builder, podcast hosting, and AI-assisted writing tools and automations.$q$, $q$On monetization, it offers a native ad network with 0% take rate on paid subscriptions (paid plans), digital product sales, community features, and audience segmentation with surveys and polls. Advanced analytics and A/B testing are available for optimizing send performance.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$beehiiv's free Launch plan supports up to 2,500 subscribers with unlimited email sends. The Scale plan ($43/month, or $517/year) raises the limit to 100,000 subscribers and adds the ad network, automations, and webhooks. The Max plan ($96/month, or $1,151/year) adds branding removal, audio newsletters, and support for up to 10 publications. Enterprise pricing is custom and adds SSO, dedicated IPs, and a dedicated account manager.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$beehiiv suits independent writers and creators launching a newsletter, growth-focused publishers monetizing an existing audience, and media companies that need advanced analytics, automation, and team collaboration in one platform.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Beets ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Beets is a free, open-source command-line tool for organizing music libraries and automatically correcting metadata using the MusicBrainz database.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Beets: Open-Source Music Library Manager & Tagger$q$, seo_title),
  seo_meta_description = COALESCE($q$Beets is a free, open-source command-line tool that organizes music libraries and fixes metadata using MusicBrainz, with a plugin system for extra features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Beets is a free and open-source command-line music library management and tagging tool created by developer Adrian Sampson and maintained by an open-source community on GitHub (beetbox/beets). It automatically identifies tracks and corrects or enriches metadata (artist, album, track titles, artwork, and more) by matching audio files against the MusicBrainz database, with additional plugin support for Discogs and Beatport lookups. Beets is designed for users who want precise, scriptable control over large music collections rather than a simple drag-and-drop media player. Its core functionality is delivered through a command-line interface, but an extensible plugin architecture adds capabilities such as album art fetching, lyrics retrieval, genre tagging, duplicate detection, missing-track identification, audio format conversion/transcoding, and an optional web interface for browsing and playing the library in a browser. Installation is via Python's pip package manager (pip install beets), and the tool runs cross-platform on Linux, macOS, and Windows anywhere Python is available. Beets has no pricing tiers or commercial offering — it is entirely free, self-hosted software aimed at 'obsessive music geeks,' audiophiles, archivists, and developers who want fine-grained, automatable control over metadata correctness and file organization in personal music collections.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Automatic metadata correction$q$, $q$Matches tracks against MusicBrainz to fix artist, album, and track metadata automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Plugin architecture$q$, $q$Extend functionality with plugins for album art, lyrics, genre tagging, and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Duplicate & missing-track detection$q$, $q$Identify duplicate files and gaps in albums within a library.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Format conversion/transcoding$q$, $q$Convert audio files between formats using dedicated plugins.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Optional web interface$q$, $q$Browse and play music through a browser-based interface via a plugin.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Cross-platform CLI$q$, $q$Runs on Linux, macOS, and Windows via Python's pip installer.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Highly accurate metadata correction via MusicBrainz$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Extensible plugin ecosystem for added functionality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Cross-platform (Linux, macOS, Windows)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Command-line interface has a learning curve for non-technical users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$No official graphical application (web UI requires a separate plugin)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Requires Python and manual setup rather than a one-click installer$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Is Beets free?$q$, $q$Yes, Beets is completely free and open-source software with no paid tiers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$How do I install Beets?$q$, $q$Beets is installed via Python's pip package manager using the command `pip install beets`.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Does Beets have a graphical interface?$q$, $q$Beets is primarily a command-line tool, but an optional plugin provides a web-based interface for browsing and playing music.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$What metadata sources does Beets use?$q$, $q$Beets primarily uses the MusicBrainz database, with plugin support for additional sources like Discogs and Beatport.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Cleaning up a large music library$q$, $q$Music collectors use Beets to batch-correct metadata and file organization across thousands of tracks.$q$, $q$Music collectors and archivists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Automated library maintenance$q$, $q$Developers script Beets to automatically tag and file new music as it's added to a library.$q$, $q$Technical users and self-hosters$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Beets is a free, open-source command-line application for organizing and cleaning up digital music libraries. It matches tracks against the MusicBrainz database to automatically correct metadata like artist, album, and track titles, and can rename and reorganize files accordingly.$q$, $q$The project describes itself as built for 'obsessive music geeks' who want precise, scriptable control over their music collection rather than a simple media player.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Beets' core function is automatic metadata correction using MusicBrainz (with plugin support for Discogs and Beatport), plus duplicate and missing-track detection.$q$, $q$An extensible plugin system adds features such as album art fetching, lyrics retrieval, genre tagging, audio format conversion, and an optional web interface for browsing and playing music in a browser.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Beets is entirely free and open source, distributed via Python's pip package manager. There are no paid tiers, subscriptions, or commercial editions.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Benchmark Email ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Benchmark Email is an email marketing platform offering drag-and-drop campaign creation, automation, and contact management for small and mid-sized businesses.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $19/month)$q$, starting_price),
  founded_year = COALESCE(2004, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$St. Louis, Missouri, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Benchmark Email: Simple Email Marketing Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Benchmark Email offers drag-and-drop email campaigns, automation, and contact management. Free plan for up to 500 contacts; paid plans from $19/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Benchmark Email is an email marketing platform founded in 2004 by Curt and Denise Keller, headquartered in St. Louis, Missouri, and now operated under parent company Polaris Software. It is designed for straightforward, low-complexity email marketing, offering a drag-and-drop email builder, pre-built templates, contact management and segmentation, sign-up forms, an image library, and real-time reporting/activity feeds. The platform targets small businesses, nonprofits, and teams across sectors like retail, hospitality, manufacturing, and financial services that want to send campaigns without needing design or technical expertise; it lists larger organizations such as FedEx, Panasonic, Merck, and Samsung among its customers. Benchmark Email uses a freemium pricing structure: a free plan covers up to 500 contacts and 2,500 monthly email sends, a Pro plan starts at $19/month for 1,000+ contacts with additional-user pricing, and a custom-priced Enterprise tier serves organizations with 100,000+ contacts. The company also maintains a 'Classic' legacy version of the product for existing users alongside its newer platform. In 2019 Benchmark Email merged with marketing automation company Hatchbuck, transferring day-to-day leadership to Jonathan Herrick, and in 2020 it acquired the contact management app Contacts+.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Drag-and-drop email builder$q$, $q$Design campaigns visually without coding, using a drag-and-drop editor.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Pre-built templates$q$, $q$Choose from a library of ready-made email templates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Contact management & segmentation$q$, $q$Organize and segment subscriber lists for targeted sends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Sign-up forms$q$, $q$Create forms to capture new subscribers directly on websites.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Image library$q$, $q$Access a built-in library of images for use in campaigns.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Real-time reporting$q$, $q$Track campaign performance through activity feeds and reports.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Free plan available for smaller contact lists$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Simple drag-and-drop interface requires minimal design skill$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Long-established company (founded 2004) with enterprise customers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Real-time campaign reporting included$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Higher contact volumes and additional users add to monthly cost$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Feature set is more basic than some marketing-automation-focused competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Legacy 'Classic' version alongside newer platform can create some fragmentation$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Is Benchmark Email free?$q$, $q$Yes, Benchmark Email offers a free plan for up to 500 contacts and 2,500 monthly email sends. Paid plans start at $19/month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Who owns Benchmark Email?$q$, $q$Benchmark Email was founded in 2004 by Curt and Denise Keller and is operated by parent company Polaris Software, LLC.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Does Benchmark Email support automation?$q$, $q$The platform's homepage highlights core campaign creation, contact management, and reporting; detailed automation capabilities are described further on its feature pages.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$What happened with Hatchbuck?$q$, $q$Benchmark Email merged with marketing automation company Hatchbuck in 2019, after which Hatchbuck's former CEO Jonathan Herrick took over day-to-day leadership.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Small business email campaigns$q$, $q$Small businesses sending newsletters and promotions without design or technical expertise.$q$, $q$Small business owners and marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Nonprofit outreach$q$, $q$Nonprofits managing donor and supporter communications on a budget.$q$, $q$Nonprofit organizations$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["Up to 500 contacts","2,500 monthly sends"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Pro$q$, $q$From $19/month$q$, $q$monthly$q$, NULL, $q$["1,000+ contacts","Additional users at $15/mo each"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["100,000+ contacts","Custom onboarding and support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Benchmark Email is an email marketing platform founded in 2004 by Curt and Denise Keller and headquartered in St. Louis, Missouri. It positions itself around simplicity — helping users upload contacts, design campaigns, and send emails without needing design or technical skills.$q$, $q$The company has grown from a bootstrapped startup into an internationally used email service, and in 2019 merged with marketing automation company Hatchbuck.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Benchmark Email provides a drag-and-drop email builder with pre-built templates, contact list management and segmentation, subscriber sign-up forms, an image library, personalization tools, and real-time campaign reporting and activity feeds.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Benchmark Email offers a free plan for up to 500 contacts and 2,500 monthly sends. The Pro plan starts at $19/month for 1,000+ contacts, with additional users priced separately, and an Enterprise tier offers custom pricing for organizations with 100,000+ contacts.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$The platform is aimed at small businesses, nonprofits, and marketing teams that want an easy-to-use email tool without a steep learning curve, though it also serves larger organizations for straightforward campaign sends.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Benepass ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Benepass is a fintech platform that lets companies design, distribute, and manage flexible employee benefits and lifestyle spending accounts via a single card.$q$, short_description),
  pricing_model = COALESCE(NULL, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$New York, NY$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Benepass: Flexible Employee Benefits Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Benepass is a fintech platform for managing pre-tax benefits and lifestyle spending accounts through one card, used by companies in 90+ countries.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Benepass is a fintech platform founded in 2019 by Jaclyn Chen, Mark Fischer, and Kabir Soorya, headquartered in New York City, that helps employers design and administer flexible employee benefits. It combines pre-tax benefit programs — HSA, FSA, HRA, and commuter benefits — with customizable Lifestyle Spending Accounts (LSAs) covering categories like wellness, professional development, family care, food, and work-from-home stipends, all delivered through a single Benepass card with tap-to-pay support and a companion mobile app (available on iOS and Android) for employees to view balances and manage spending. The platform integrates with HRIS and payroll systems to automate enrollment and includes an AI-powered compliance tool for benefits administration. Benepass reports high instant-approval rates on card transactions, over $1B in global benefits funded, and support for benefits programs across 90+ countries, serving clients such as global and distributed workforces at the mid-market to enterprise level. The company raised a $12M Series A led by Threshold Ventures and, as of March 2026, a $40M Series B to expand its platform. Pricing is not publicly listed; prospective customers are directed to book a demo for a custom quote. Benepass is best suited for HR and benefits teams at growing or globally distributed companies seeking a unified, modern alternative to fragmented, single-purpose benefits administration tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Pre-tax benefits administration$q$, $q$Manage HSA, FSA, HRA, and commuter benefit programs through one platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Lifestyle Spending Accounts (LSAs)$q$, $q$Configure custom spending categories like wellness, professional development, and family care.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Single benefits card$q$, $q$Employees use one tap-to-pay card across all enrolled benefit categories.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Mobile app$q$, $q$iOS and Android apps let employees view balances, transactions, and manage their card.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$HRIS and payroll integrations$q$, $q$Automate enrollment and eligibility syncing with existing HR systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$AI-powered compliance support$q$, $q$A compliance tool helps employers navigate benefits regulations.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Consolidates multiple benefit types into a single card and app$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Supports global/distributed teams across 90+ countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$High reported instant-approval rate on transactions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$HRIS/payroll integrations reduce manual admin work$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Pricing is not publicly available and requires a sales demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Best suited to mid-market/enterprise companies rather than very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$As a newer fintech entrant, long-term platform stability depends on continued funding and growth$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$What is Benepass?$q$, $q$Benepass is a fintech platform that lets employers manage pre-tax benefits (HSA, FSA, HRA, commuter) and custom Lifestyle Spending Accounts through a single card and app.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$How much does Benepass cost?$q$, $q$Benepass does not publish pricing; companies must book a demo to get a custom quote.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Does Benepass have a mobile app?$q$, $q$Yes, Benepass offers iOS and Android apps for employees to manage their benefits card and view balances.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Who founded Benepass?$q$, $q$Benepass was founded in 2019 by Jaclyn Chen, Mark Fischer, and Kabir Soorya.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Global distributed team benefits$q$, $q$Companies with employees across many countries standardize benefits delivery through one card.$q$, $q$HR and People teams at distributed companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$Lifestyle spending programs$q$, $q$Employers offer flexible stipends for wellness, learning, or family care alongside traditional pre-tax benefits.$q$, $q$Mid-market to enterprise HR teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Benepass is a fintech company founded in 2019 by Jaclyn Chen, Mark Fischer, and Kabir Soorya, headquartered in New York City. It provides a unified card and platform for employers to distribute both tax-advantaged benefits (HSA, FSA, HRA, commuter) and flexible Lifestyle Spending Accounts (LSAs) covering categories like wellness, family care, and remote-work stipends.$q$, $q$Benefits are delivered through a single Benepass card with tap-to-pay support, along with a mobile app for employees to track balances and transactions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform supports pre-tax benefit programs alongside customizable LSAs, integrates with HRIS and payroll systems for automated enrollment, and includes an AI-powered compliance tool to help employers navigate benefits regulations.$q$, $q$Benepass reports high instant-approval rates on card transactions and supports benefits programs for distributed teams across more than 90 countries.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Benepass does not publish pricing publicly. The company directs prospective customers to book a demo for a custom quote based on company size and benefits program design.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Benepass targets mid-market to enterprise employers, particularly those with distributed or global workforces, who want to consolidate pre-tax benefits and flexible lifestyle spending into a single card and platform.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── BentoML ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$BentoML (now Bento) is an open-source AI model serving framework and managed cloud platform for deploying and scaling machine learning inference in production.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) + usage-based cloud$q$, pricing_model),
  starting_price = COALESCE($q$Free (open source); Bento Cloud usage-based with free starter credits$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$BentoML: Open-Source AI Model Serving & Inference$q$, seo_title),
  seo_meta_description = COALESCE($q$BentoML (Bento) is an open-source framework and managed cloud platform for deploying and scaling AI/ML model inference in production.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$BentoML is an open-source AI model serving framework founded in 2019 by Chaoyu Yang and headquartered in San Francisco, California. It lets data science and ML engineering teams package, deploy, and scale machine learning models — including popular open models like Llama, DeepSeek, Flux, and Qwen, as well as custom models across various frameworks — as production inference APIs, job queues, and multi-model pipelines. The open-source project is free and self-hostable on-premises, on Kubernetes, or across multiple clouds, and is used by more than 10,000 organizations. Alongside the open-source framework, the company offers Bento Cloud, a managed inference platform with GPU access (Nvidia T4, L4, A100, and others) that handles auto-scaling, cold-start acceleration, scale-to-zero, canary/shadow/A/B deployment testing, version rollbacks, and LLM-specific observability; Bento Cloud is billed on a usage basis (metered by the second of active compute) and new users receive an initial free credit allotment to test deployments. In February 2026, BentoML was acquired by Modular and the product is now marketed as 'Bento' under Modular, continuing to build on the original open-source BentoML project. BentoML/Bento is aimed at ML engineers and enterprises that need production-grade, framework-agnostic infrastructure for serving real-time, batch, and asynchronous AI inference workloads, with customers including Yext, TomTom, and Neurolabs.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a4996b9-281e-4443-a143-16669b9aebee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a4996b9-281e-4443-a143-16669b9aebee' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '9a4996b9-281e-4443-a143-16669b9aebee';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Framework-agnostic model deployment$q$, $q$Package and deploy models built with different ML frameworks as unified inference APIs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Multiple serving patterns$q$, $q$Support for real-time, async task, batch, and multi-step workflow inference.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Intelligent auto-scaling$q$, $q$Scale-to-zero and cold-start acceleration tuned for inference workloads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Deployment testing and rollbacks$q$, $q$Canary, shadow, and A/B testing with version control and rollback support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Observability and LLM monitoring$q$, $q$Track performance and behavior with LLM-specific monitoring tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Flexible hosting$q$, $q$Self-host on-premises, on Kubernetes, or multi-cloud, or use managed Bento Cloud with GPU access.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '9a4996b9-281e-4443-a143-16669b9aebee';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Core framework is free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Framework-agnostic — supports many popular open and custom models$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Flexible deployment: self-hosted or managed cloud$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Usage-based cloud billing avoids paying for idle compute (scale-to-zero)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '9a4996b9-281e-4443-a143-16669b9aebee';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Bento Cloud GPU pricing is usage-based and can be harder to predict than flat subscription pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Recent acquisition by Modular (Feb 2026) means the product and roadmap are in transition$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Self-hosting requires Kubernetes/infrastructure expertise to get full value$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '9a4996b9-281e-4443-a143-16669b9aebee';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Is BentoML free?$q$, $q$The core BentoML framework is free and open source. The managed Bento Cloud platform is billed on a usage basis for GPU compute, with free starter credits for new accounts.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Who owns BentoML now?$q$, $q$BentoML was acquired by Modular in February 2026 and now operates under the 'Bento' brand as part of Modular.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Can BentoML be self-hosted?$q$, $q$Yes, the open-source framework can be self-hosted on-premises, on Kubernetes, or across multiple cloud providers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$What models does BentoML support?$q$, $q$It supports popular open models like Llama, DeepSeek, Flux, and Qwen, as well as custom models across various ML frameworks.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '9a4996b9-281e-4443-a143-16669b9aebee';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Production LLM and AI inference$q$, $q$ML teams deploy and scale real-time inference APIs for LLMs and other AI models.$q$, $q$ML engineers and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Batch and async ML workloads$q$, $q$Teams run large-scale batch inference or asynchronous processing pipelines.$q$, $q$Data science and ML engineering teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '9a4996b9-281e-4443-a143-16669b9aebee';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Open Source (BentoML)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Self-hosted deployment","On-premises, Kubernetes, or multi-cloud","Full framework access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Bento Cloud$q$, $q$Usage-based (per-second GPU compute)$q$, $q$usage-based$q$, NULL, $q$["Managed GPU access (T4, L4, A100, and more)","Auto-scaling and scale-to-zero","Free starter credits for new accounts","Deployment observability"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '9a4996b9-281e-4443-a143-16669b9aebee';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$BentoML is an open-source model serving framework founded in 2019 by Chaoyu Yang, headquartered in San Francisco. It helps ML teams package and deploy models as production-ready inference APIs, supporting popular open models (Llama, DeepSeek, Flux, Qwen) as well as custom models across different ML frameworks.$q$, $q$In February 2026, BentoML was acquired by Modular; the product now operates under the 'Bento' brand while continuing to build on the original open-source BentoML project, which remains available on GitHub and is used by more than 10,000 organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bento supports multiple serving patterns — real-time interactive inference, asynchronous tasks, batch inference, and multi-step workflow orchestration — with performance tuning for latency, throughput, and cost.$q$, $q$Operational features include intelligent auto-scaling with cold-start acceleration and scale-to-zero, version control with rollbacks, canary/shadow/A/B testing for deployments, and observability with LLM-specific monitoring.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The core BentoML framework is free and open source, and can be self-hosted on-premises, on Kubernetes, or across multiple clouds. The managed Bento Cloud offering is billed on a usage basis, metered by the second of active GPU compute (deployments scaled to zero incur no charge), with new accounts receiving an initial free credit allotment to test deployments.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Bento is built for ML engineers, data science teams, and enterprises that need production-grade infrastructure to deploy and scale AI inference workloads, whether self-hosted for full control or managed via Bento Cloud for GPU access without infrastructure overhead.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── BentoPDF ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$BentoPDF is a free, open-source, privacy-first PDF toolkit that runs entirely in the browser, offering around 80 tools for editing, converting, and securing PDFs.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$BentoPDF: Free, Open-Source, Privacy-First PDF Tools$q$, seo_title),
  seo_meta_description = COALESCE($q$BentoPDF offers around 80 free PDF tools that run entirely in your browser, with no uploads, sign-ups, watermarks, or file limits. Open source.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$BentoPDF is a free and open-source PDF toolkit (Apache 2.0 licensed) built with Vite, TypeScript, and Tailwind CSS, available at bentopdf.com and on GitHub. It provides roughly 80 individual PDF tools organized into categories: organization (merging, splitting, extracting, reordering, rotating, N-up consolidation), editing (a full PDF editor, page numbering, watermarking, headers/footers, cropping, color inversion, form filling, annotation removal), conversion to PDF (from images, Markdown, and text files), conversion from PDF (to images, grayscale, and OCR text extraction), and security/optimization (compression, repair, encryption/decryption, permission management, digital signatures, redaction, and metadata editing). Its defining feature is that all processing happens client-side in the browser — files are never uploaded to a server — making it a privacy-first alternative to cloud-based PDF services. There are no file-size limits, no watermarks, and no sign-up requirements, and the toolkit works on any device with a modern browser, including Windows, macOS, Linux, iOS, and Android. It also supports self-hosting via Docker for organizations that want to run their own instance. BentoPDF relies on open-source libraries such as PDF.js, PDFLib.js, and PDFKit under the hood. It is aimed at individuals, businesses, and privacy-conscious users who need common PDF operations (merging, compressing, signing, converting, redacting) without sending sensitive documents to a third-party cloud service.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Client-side processing$q$, $q$All PDF operations run locally in the browser; files are never uploaded to a server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$~80 PDF tools$q$, $q$Covers organization, editing, conversion, and security/optimization operations in one toolkit.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$No file limits or watermarks$q$, $q$Use any tool without file-size caps, sign-ups, or output watermarks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$PDF editing and annotation$q$, $q$Edit page content, add page numbers, watermarks, headers/footers, and remove annotations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Conversion to/from PDF$q$, $q$Convert images, Markdown, and text to PDF, or export PDFs to images and OCR text.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Security tools$q$, $q$Encrypt, decrypt, manage permissions, add digital signatures, and redact content.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Self-hosting via Docker$q$, $q$Run a private instance of BentoPDF using an official Docker image.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Completely free with no file limits or watermarks$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Privacy-first: files never leave the user's device$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Open source (Apache 2.0) and self-hostable$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Wide tool coverage (~80 tools) in a single toolkit$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Works cross-platform in any modern browser, no installation needed$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Client-side processing may be slower on very large files or low-powered devices$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$No official native mobile or desktop apps beyond the browser experience$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$As a community open-source project, support relies on GitHub rather than dedicated customer service$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Is BentoPDF free?$q$, $q$Yes, BentoPDF is completely free and open source with no file limits, watermarks, or sign-up requirements.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Does BentoPDF upload my files to a server?$q$, $q$No, all processing happens client-side in your browser; files never leave your device.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Is BentoPDF open source?$q$, $q$Yes, it is released under the Apache 2.0 license with source code available on GitHub.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Can I self-host BentoPDF?$q$, $q$Yes, BentoPDF can be self-hosted, typically via a Docker image, for organizations that want to run their own instance.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Privacy-sensitive document handling$q$, $q$Users who need to edit, convert, or sign PDFs containing sensitive information without uploading them to a cloud service.$q$, $q$Privacy-conscious individuals and businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$General everyday PDF tasks$q$, $q$Merging, splitting, compressing, and converting PDFs for common personal or work needs.$q$, $q$General users and office workers$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$BentoPDF is a free, open-source PDF toolkit (Apache 2.0 licensed) that runs entirely in the browser. Instead of uploading files to a server, all processing — merging, converting, compressing, signing, and more — happens locally on the user's device, making it a privacy-first alternative to typical cloud PDF tools.$q$, $q$The project is built with Vite, TypeScript, and Tailwind CSS, and its source code is publicly available on GitHub for self-hosting or contribution.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$BentoPDF offers roughly 80 tools spanning organization (merge, split, extract, reorder, rotate, N-up), editing (a full PDF editor, page numbering, watermarking, headers/footers, cropping, form filling, annotation removal), conversion to and from PDF (images, Markdown, text, OCR), and security/optimization (compression, encryption/decryption, permission management, digital signatures, redaction, and metadata editing).$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$platforms$q$, $q$Platforms & Self-Hosting$q$, 2, ARRAY[$q$Because all functionality runs client-side in the browser, BentoPDF works on any device with a modern browser — Windows, macOS, Linux, iOS, and Android — with no installation required. Organizations can also self-host their own instance, typically via a Docker image.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


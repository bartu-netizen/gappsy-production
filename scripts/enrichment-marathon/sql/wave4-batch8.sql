-- Enrichment marathon batch: Buffer, Bugsink, Bugsnag, Buildbot, Builder.io, Buildertrend, Buildkite, Bullhorn

-- ── Buffer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Buffer is a social media management platform for scheduling, publishing, and analyzing content across Instagram, Facebook, LinkedIn, TikTok, X, and other channels.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $6/channel/month)$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE($q$~80 employees, fully remote$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Buffer: Social Media Scheduling & Management Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Buffer helps you schedule posts, manage every social channel, and track analytics from one dashboard. Free plan available; paid plans start at $6/channel/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Buffer is a social media management platform founded in October 2010 by Joel Gascoigne, originally built in Birmingham, UK, and launched publicly under the name bfffr.com before becoming Buffer. The company has been fully remote since 2013 and is now headquartered in San Francisco, California, with a distributed team spread across multiple continents. Buffer's core product lets individuals, creators, small businesses, and agencies schedule and publish posts to Instagram, Facebook, LinkedIn, TikTok, X (formerly Twitter), Threads, Bluesky, YouTube Shorts, Pinterest, Google Business Profile, and Mastodon from a single dashboard. Beyond scheduling, Buffer offers Analyze, an analytics product that reports on audience engagement, top-performing content types, and optimal posting times, and Engage, a unified inbox for replying to comments and messages across channels. Buffer also ships a built-in AI Assistant, available free on every plan including the free tier, that can generate post ideas, rewrite and repurpose content for different platforms, and adjust tone; Buffer has also added integrations that let external AI assistants such as Claude, ChatGPT, Cursor, and Raycast query a user's Buffer data. A separate product, Start Page, is a free customizable link-in-bio landing page builder with drag-and-drop blocks for links, images, video, and forms.

Buffer's pricing is billed per connected social channel rather than per user. The Free plan supports up to 3 connected channels (8 lifetime channel connections) and 10 scheduled posts per channel. The Essentials plan costs $6 per channel per month billed monthly, or $5 per channel per month billed annually, and is designed for individual users. The Team plan costs $12 per channel per month monthly, or $10 per channel per month annually, and adds unlimited team member seats, custom permissions, and approval workflows. Volume discounts apply once an account connects more than 10 channels, and Buffer offers a 50% discount for verified nonprofits and charities. Annual billing carries roughly a 20% discount versus monthly billing.

Buffer integrates with Canva, Google Analytics, and, via Zapier, roughly 400 additional third-party apps and workflows. It is available as a web app and via native iOS and Android mobile apps, making it possible to schedule and manage content on the go.

Buffer competes primarily with Hootsuite, Later, Sprout Social, and SocialPilot in the social media management category. Its main differentiators are a simpler, less cluttered interface than enterprise competitors, transparent per-channel pricing without seat limits on paid plans, and a long-standing reputation for radical transparency, having historically published employee salaries and company revenue publicly. It is best suited to solo creators, small marketing teams, and agencies that want straightforward multi-platform scheduling without the cost or complexity of enterprise social suites; larger organizations with complex approval chains, social listening, or paid social ad management needs may find Buffer's feature set comparatively light.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a6203d78-992e-46dd-84e0-13212a7b5a75' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Multi-platform post scheduling$q$, $q$Plan and publish content across Instagram, Facebook, LinkedIn, TikTok, X, Threads, Bluesky, and more from one calendar.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$AI Assistant$q$, $q$Free on every plan; generates post ideas, rewrites content, and adapts tone for different platforms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Analyze$q$, $q$Reports on audience engagement, top-performing content types, and optimal posting times.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Engage$q$, $q$A unified inbox for replying to comments and messages across connected social channels.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Start Page$q$, $q$A free, customizable link-in-bio landing page builder with drag-and-drop content blocks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Team collaboration$q$, $q$Custom permissions and approval workflows for teams and agencies on the Team plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Zapier & Canva integrations$q$, $q$Connects Buffer to roughly 400 additional apps via Zapier, plus native Canva and Google Analytics integrations.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Transparent per-channel pricing with no per-seat limits on paid plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Free AI Assistant included on every plan, including Free$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Clean, simple interface compared to enterprise social suites$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Generous free plan and a free link-in-bio tool (Start Page)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Per-channel pricing can get expensive for accounts managing many channels$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Fewer advanced social listening and paid social ad management tools than enterprise suites like Sprout Social or Hootsuite$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Limited bulk scheduling and CSV import on lower tiers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$No live chat support on the free plan$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Is Buffer free?$q$, $q$Yes, Buffer's Free plan supports up to 3 connected channels with 10 scheduled posts per channel; paid plans start at $6/channel/month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$What social platforms does Buffer support?$q$, $q$Buffer supports Instagram, Facebook, LinkedIn, TikTok, X, Threads, Bluesky, YouTube Shorts, Pinterest, Google Business Profile, and Mastodon.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$How does Buffer's pricing work?$q$, $q$Buffer bills per connected social channel rather than per user, with volume discounts once an account connects more than 10 channels.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Does Buffer include AI tools?$q$, $q$Yes, Buffer includes a free AI Assistant on every plan for generating, rewriting, and repurposing content.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Can teams collaborate in Buffer?$q$, $q$Yes, the Team plan adds unlimited team members, custom permissions, and approval workflows.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Does Buffer have a mobile app?$q$, $q$Yes, Buffer offers native iOS and Android apps in addition to its web app.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Solo creator content scheduling$q$, $q$Plan and publish posts across multiple platforms without a dedicated social media team.$q$, $q$Individual creators and small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Agency client management$q$, $q$Manage multiple clients' social channels with per-channel billing and team permissions.$q$, $q$Social media agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Marketing team collaboration$q$, $q$Coordinate content approval workflows and track performance across a brand's social channels.$q$, $q$In-house marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Up to 3 channels","10 scheduled posts per channel","AI Assistant included","Start Page link-in-bio"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Essentials$q$, $q$$6/channel/month ($5/channel annual)$q$, $q$monthly or annual$q$, NULL, $q$["1 user","Unlimited scheduled posts","Analyze reporting","AI Assistant"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Team$q$, $q$$12/channel/month ($10/channel annual)$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited team members","Custom permissions","Approval workflows"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Buffer is a social media management platform founded in 2010 by Joel Gascoigne. It has been a fully remote company since 2013 and is now headquartered in San Francisco, with a team distributed across multiple continents.$q$, $q$The platform is built for scheduling, publishing, and analyzing content across Instagram, Facebook, LinkedIn, TikTok, X, Threads, Bluesky, YouTube Shorts, Pinterest, Google Business Profile, and Mastodon from a single dashboard.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Buffer's core scheduling product is complemented by Analyze (performance analytics), Engage (a unified inbox for comments and messages), a free AI Assistant for generating and repurposing content, and Start Page, a free link-in-bio landing page builder with drag-and-drop blocks.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Buffer bills per connected social channel rather than per user. The Free plan covers up to 3 channels with 10 scheduled posts each. Essentials costs $6/channel/month ($5 annually) for a single user, and Team costs $12/channel/month ($10 annually) with unlimited team seats. Volume discounts apply above 10 channels, and nonprofits receive a 50% discount.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Bugsink ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bugsink is a self-hosted, Sentry-SDK-compatible error tracker built by a solo Dutch developer to run on minimal hardware without per-event pricing.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted); hosted plans from €16/month$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE($q$Solo founder / small team$q$, company_size),
  headquarters = COALESCE($q$Utrecht, Netherlands$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bugsink: Self-Hosted Sentry-Compatible Error Tracking$q$, seo_title),
  seo_meta_description = COALESCE($q$Bugsink is a self-hosted error tracker compatible with Sentry SDKs. Run it on a small VPS or use EU-hosted plans from €16/month, with no per-event fees.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bugsink is a self-hosted error tracking and crash reporting tool created by Klaas van Schelven, a Python and Django developer based in Utrecht, Netherlands, operating as Bugsink B.V. The project originated after van Schelven attempted to self-host Sentry, the dominant open-source error tracking platform, for a client and found the operational overhead of background workers, message queues, and heavy resource requirements impractical for small and mid-sized teams. Bugsink was built as a lighter-weight, drop-in alternative that is fully compatible with Sentry's open-source SDKs across all major languages and frameworks: teams that already use Sentry's client libraries can switch to Bugsink by changing only the DSN endpoint, with no code rewrite required.

Bugsink is distributed under the Polyform Shield 1.0.0 license, a source-available license rather than an OSI-approved open-source license. The source is publicly visible and self-hosting is free and unrestricted, but the license restricts competing commercial use of the code itself. The software is designed to run efficiently on modest infrastructure; the vendor demonstrates it handling millions of events per month on a €5/month VPS with 2 vCPUs and 4GB of RAM, without requiring an external queue, Redis, or a separate ingestion pipeline, which lowers the operational cost compared to self-hosting Sentry.

For teams that prefer not to self-host, Bugsink also offers a managed hosted version that runs entirely within the EU on infrastructure set up for GDPR compliance, positioned explicitly as a European, data-residency-friendly alternative to US-based error tracking vendors. The hosted free tier includes 15,000 events per month, with 5,000 events retained for 30 days. Paid hosted tiers start at €16 per month for 75,000 events, scaling up with volume. Unlike Sentry's per-event pricing curve, Bugsink markets itself as remaining materially cheaper at scale, citing comparisons where roughly 50 million events per month costs approximately €1,288 on Bugsink versus roughly $6,441 per month on Sentry's own hosted plans.

Bugsink's core capabilities center on the essentials of crash reporting: automatic capture of unhandled exceptions and errors, full stack traces, environment and request context, issue grouping, and a web dashboard for triaging and resolving issues, mirroring the workflow Sentry users are already familiar with. It intentionally does not attempt to replicate Sentry's broader observability suite, such as performance monitoring or session replay, instead focusing narrowly on being a dependable, low-overhead error tracker.

Bugsink is best suited to engineering teams who already rely on Sentry's SDKs but want to avoid Sentry's event-based billing at scale, who need to keep error data within the EU for compliance reasons, or who want a self-hosted tool simple enough to run on a single small server without a dedicated platform team. It is less suited to organizations that need Sentry's full application-performance-monitoring feature set or that require a fully OSI-licensed open-source tool for compliance reasons.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b5e89d16-61c3-4ade-882a-138e2a553e12' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Sentry SDK compatibility$q$, $q$Drop-in replacement for Sentry; switch by changing only the DSN endpoint.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Lightweight self-hosted deployment$q$, $q$Runs on minimal hardware, such as a small VPS, without needing Redis or a queue.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$EU-hosted managed plan$q$, $q$A GDPR-friendly hosted option running entirely within the EU.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Predictable pricing at scale$q$, $q$Avoids Sentry's steep per-event pricing curve at high event volumes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Issue grouping & triage dashboard$q$, $q$Groups related errors and provides full stack traces and context for debugging.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Dramatically cheaper than Sentry at high event volumes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Simple to self-host on a small VPS with minimal infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Drop-in Sentry SDK compatibility with no code changes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$EU data residency available on the hosted plan$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Source-available Polyform Shield license, not OSI-approved open source$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Narrower feature set than full Sentry (no APM, no session replay)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Small, solo-founder-led company, which carries support and roadmap risk$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted plan is newer and less proven at massive enterprise scale than incumbents$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Is Bugsink open source?$q$, $q$Bugsink's source is publicly available under the Polyform Shield 1.0.0 license, which is source-available but not an OSI-approved open-source license. Self-hosting is free.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Can I use my existing Sentry SDK with Bugsink?$q$, $q$Yes, Bugsink is compatible with Sentry's open-source SDKs; you only need to change the DSN endpoint.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$How much does Bugsink cost?$q$, $q$Self-hosting is free. The managed hosted plan has a free tier (15,000 events/month) and paid tiers starting at €16/month.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Who built Bugsink?$q$, $q$Bugsink was built by Klaas van Schelven, a solo developer based in Utrecht, Netherlands, operating as Bugsink B.V.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Does Bugsink support performance monitoring or session replay?$q$, $q$No, Bugsink focuses specifically on error tracking rather than full observability features like APM or session replay.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Is Bugsink GDPR compliant?$q$, $q$The hosted version runs entirely within the EU on infrastructure set up for GDPR compliance.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Cutting error-tracking costs at scale$q$, $q$Replace Sentry's per-event billing with a cheaper self-hosted or hosted alternative as event volume grows.$q$, $q$Engineering teams outgrowing Sentry's pricing$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$EU data residency$q$, $q$Keep error and crash data within the EU for GDPR compliance.$q$, $q$European companies with data residency requirements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Lightweight self-hosting$q$, $q$Run a Sentry-compatible error tracker on a single small server without a dedicated platform team.$q$, $q$Small engineering teams and self-hosters$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Unlimited events","Runs on your own infrastructure","Polyform Shield license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted Free$q$, $q$€0/month$q$, $q$monthly$q$, NULL, $q$["15,000 events/month","5,000 events retained for 30 days"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted Starter$q$, $q$From €16/month$q$, $q$monthly$q$, NULL, $q$["75,000 events/month","EU-hosted infrastructure"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bugsink is a self-hosted error tracking tool created by Klaas van Schelven, a solo Dutch developer, after he found self-hosting Sentry too resource-intensive for a client project.$q$, $q$It is fully compatible with Sentry's open-source SDKs, so teams can switch to Bugsink by changing only their DSN endpoint, with no application code changes required.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bugsink focuses narrowly on crash reporting: automatic error and exception capture, full stack traces, issue grouping, and a triage dashboard. It runs efficiently on minimal hardware, handling millions of events per month on a small VPS without requiring Redis or a separate message queue.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Self-hosting Bugsink is always free under its Polyform Shield source-available license. For teams that don't want to self-host, a managed EU-hosted plan offers a free tier (15,000 events/month) and paid tiers starting at €16/month for 75,000 events, scaling with volume at a fraction of Sentry's per-event pricing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Bugsnag ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bugsnag, now part of SmartBear as Insight Hub, is an application stability monitoring platform that detects, prioritizes, and helps fix errors across web, mobile, and backend apps.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $20/month)$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$Part of SmartBear (1,000+ employees)$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bugsnag: Application Stability & Error Monitoring$q$, seo_title),
  seo_meta_description = COALESCE($q$Bugsnag tracks errors and crashes across 50+ platforms with a stability score and release health dashboards. Free plan available; paid plans from $20/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bugsnag is an application stability monitoring and error tracking platform founded in 2012 in San Francisco by Simon Maynard and James Smith. The company built its product around a central idea that goes beyond simple error logging: a 'stability score,' a single metric representing the percentage of user sessions that complete without a crash or fatal error, which teams can use to set release-quality thresholds, for example blocking a mobile release from wider rollout if stability drops below a set target. Bugsnag was acquired by SmartBear Software, a broader software quality and testing tools vendor, in April 2021. In January 2025, SmartBear rebranded the product from Bugsnag to SmartBear Insight Hub, extending it into full-stack observability with real user monitoring, backend performance monitoring, and OpenTelemetry-native distributed tracing, though the Bugsnag name remains widely used and recognized in the market.

The platform automatically detects and reports unhandled exceptions and crashes in real time across web, mobile, desktop, and server-side applications, capturing full stack traces, environment and device context, user data, breadcrumbs, and custom metadata to speed up root-cause diagnosis. Its releases dashboard compares the stability score and error volume across app releases, platforms, or environments, such as staging versus production, helping teams spot regressions introduced by a specific deploy. Bugsnag ships SDKs for more than 20 languages and frameworks, including JavaScript, Node.js, Ruby, Python, PHP, Java, Android, iOS, .NET, Go, and React Native, and supports more than 50 platforms in total. It integrates with common engineering workflow tools such as Jira, GitHub Issues, GitLab, Slack, and PagerDuty, plus more than 30 third-party integrations overall, and supports webhooks and OpenTelemetry for custom pipelines.

Pricing is usage-based, split between monthly error-monitoring events and, for performance monitoring, monthly spans. The Free plan includes one user, both error and performance monitoring, 7,500 events per month, 1 million spans per month, access to 50-plus platform SDKs, and 30-plus integrations, a relatively generous free tier for evaluating the product. The paid Select plan starts at $20 per month and covers 50,000 to 3 million monthly events and 1 million to 150 million monthly spans, with unlimited users, end-to-end diagnostics, and basic notification routing. Higher Preferred and Enterprise tiers add the stability score feature, more advanced release health tooling, and enterprise controls such as SSO and higher event volumes; exact Enterprise pricing is quote-based.

Bugsnag, now marketed as Insight Hub, is best suited to engineering teams, particularly mobile and web teams, that want a stability-focused view of releases rather than just a raw error feed, and that value integration with SmartBear's broader quality and testing ecosystem. Teams already standardized on Sentry, Rollbar, or Datadog error tracking should weigh Bugsnag's stability-score model against those alternatives' own strengths.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Stability score$q$, $q$A single crash-free-session metric used to gate release quality.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Release health dashboard$q$, $q$Compares stability and error volume across releases, platforms, and environments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Real-time crash & error detection$q$, $q$Captures full stack traces, context, and metadata for unhandled exceptions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$50+ platform SDKs$q$, $q$Covers 20+ languages including JavaScript, Ruby, Python, Java, Android, iOS, and .NET.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$30+ integrations$q$, $q$Connects with Jira, GitHub Issues, GitLab, Slack, and PagerDuty.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$OpenTelemetry-native tracing$q$, $q$Supports distributed tracing for backend performance monitoring.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Generous free tier (7,500 events, 1M spans per month)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Strong mobile SDK coverage across 50+ platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Stability score approach helps teams gate risky releases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Backed by SmartBear's broader QA and testing ecosystem$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Rebranded to SmartBear Insight Hub in 2025, causing some naming confusion$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Stability score feature is gated to higher-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Usage-based pricing on events and spans can scale up quickly$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Less standalone brand recognition post-rebrand versus Sentry or Datadog$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Is Bugsnag still called Bugsnag?$q$, $q$SmartBear rebranded the product to SmartBear Insight Hub in January 2025, though the Bugsnag name is still widely used and referenced.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Who owns Bugsnag?$q$, $q$SmartBear Software has owned Bugsnag since acquiring it in April 2021.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Is there a free plan?$q$, $q$Yes, the Free plan includes 7,500 events and 1 million spans per month for one user.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$What platforms does Bugsnag support?$q$, $q$Bugsnag supports 50+ platforms and provides SDKs for 20+ languages and frameworks.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$What is the stability score?$q$, $q$It is a single metric showing the percentage of sessions without a crash or fatal error, used to gauge release quality.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Does Bugsnag do performance monitoring?$q$, $q$Yes, it offers span-based performance monitoring alongside its core error tracking.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Mobile release quality gating$q$, $q$Use the stability score to decide whether to expand a release rollout.$q$, $q$Mobile app engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Web and backend error tracking$q$, $q$Detect and diagnose unhandled exceptions across web and server-side applications.$q$, $q$Web and backend engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Enterprise QA consolidation$q$, $q$Combine error monitoring with SmartBear's broader testing and quality tools.$q$, $q$Enterprises standardized on SmartBear$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["1 user","7,500 events/month","1M spans/month","50+ platforms","30+ integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Select$q$, $q$From $20/month$q$, $q$monthly$q$, NULL, $q$["50K-3M events/month","1M-150M spans/month","Unlimited users","End-to-end diagnostics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Preferred$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Stability score","Advanced release health"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["SSO","Highest event volumes","Dedicated support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bugsnag is an application stability monitoring platform founded in 2012 in San Francisco by Simon Maynard and James Smith. It was acquired by SmartBear in April 2021 and rebranded to SmartBear Insight Hub in January 2025, though the Bugsnag name remains widely recognized.$q$, $q$The platform's signature concept is the stability score, a single crash-free-session metric teams can use to gate mobile and web releases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bugsnag automatically detects unhandled exceptions and crashes across web, mobile, and server-side apps, capturing full stack traces and context. It offers a release health dashboard, SDKs for 20+ languages across 50+ platforms, and 30+ integrations with tools like Jira, Slack, and PagerDuty.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The Free plan includes 7,500 events and 1 million spans per month for one user. The Select plan starts at $20/month for 50,000 to 3 million events and unlimited users. Preferred and Enterprise tiers add the stability score and enterprise controls at custom pricing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Buildbot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Buildbot is a free, open-source Python framework for automating build, test, and release pipelines, configured entirely in Python code rather than YAML.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2003, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Buildbot: Open-Source Python CI/CD Framework$q$, seo_title),
  seo_meta_description = COALESCE($q$Buildbot is a free, open-source continuous integration framework written in Python and Twisted. Configure builds as code and self-host masters and workers.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Buildbot is a free, open-source continuous integration and build-automation framework, first released in April 2003 by Brian Warner, then a software engineer working on the Twisted networking library. It began as a lightweight alternative to Mozilla's Tinderbox system and was originally built to automate build and test cycles for the Twisted Python library itself; Twisted was Buildbot's first real-world user before other open-source projects, and eventually Mozilla, adopted it. The project is licensed under the GNU General Public License v2.0 and is now maintained by Dustin J. Mitchell and a community of contributors, with source hosted on GitHub at buildbot/buildbot.

Unlike most CI/CD systems, which are configured through a YAML file, Buildbot's entire configuration is written in Python code. This makes it closer to a software framework than a turnkey SaaS product; in the same way Django or Rails give developers building blocks for web apps, Buildbot gives developers a job-scheduling system, change-source integrations, and result-reporting primitives to assemble a custom build, test, and release pipeline. This flexibility is Buildbot's core value proposition: teams with unusual build topologies, custom hardware, or highly specific workflow requirements can implement logic that would be difficult or impossible to express in a declarative YAML-based CI tool.

Architecturally, a Buildbot installation consists of one or more masters, which schedule and coordinate work, and a pool of workers, which execute the actual build and test jobs; masters and workers can run on different machines and operating systems, and the system is compatible with all major OS platforms. Buildbot supports distributed, parallel execution of jobs across many machines, integrates with version-control systems including Git and Subversion, which it can poll or receive webhook notifications from to detect changes automatically, and provides extensive status reporting through a web UI as well as notifications to external systems.

Because it is self-hosted, free, and infrastructure-agnostic, Buildbot has been adopted by a number of large, high-profile open-source projects with unusual build requirements, including Chromium, WebKit, Mozilla, and the Python language's own CPython project, among others. It has no managed cloud offering, no vendor, and no licensing fees; teams run their own masters and workers on their own infrastructure and are responsible for their own uptime, scaling, and security.

Buildbot is best suited to engineering teams that need a fully customizable, code-first CI/CD system and are comfortable writing Python to define build logic and maintaining the underlying infrastructure themselves. It is a poor fit for teams that want a zero-maintenance, hosted CI product with a simple YAML-based configuration file; services like GitHub Actions, GitLab CI, CircleCI, or Buildkite are typically a faster starting point for those use cases.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c7c25a31-e4a6-4f92-befe-498598b09f32' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Python-based configuration$q$, $q$Build logic is defined as Python code rather than a YAML file, enabling full programmatic control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Master/worker architecture$q$, $q$Distributed masters coordinate work while workers execute build and test jobs across machines.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Version control integrations$q$, $q$Polls or receives webhooks from Git and Subversion to trigger builds on code changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Parallel, cross-platform execution$q$, $q$Runs jobs in parallel across machines and operating systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Extensive status reporting$q$, $q$Web UI and external notification support for build results.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Fully self-hosted$q$, $q$No vendor lock-in; runs entirely on infrastructure you control.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Completely free and open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Maximum configuration flexibility via Python code$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Proven at scale by projects like Chromium, Mozilla, and CPython$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Works across all major operating systems$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Requires Python coding knowledge to configure, a steeper learning curve than YAML-based tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$No managed or hosted offering; infrastructure must be self-managed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Teams are responsible for their own scaling and uptime$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$More dated UI compared to modern CI SaaS platforms$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Is Buildbot free?$q$, $q$Yes, Buildbot is free, open-source software licensed under GPLv2.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Do I need to know Python to use Buildbot?$q$, $q$Yes, Buildbot's entire configuration is written as Python code rather than a YAML file.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Does Buildbot offer a hosted or cloud version?$q$, $q$No, Buildbot is self-hosted only; there is no official managed cloud offering.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$What is Buildbot's master/worker architecture?$q$, $q$Masters schedule and coordinate build jobs, while workers execute the actual build and test tasks, potentially across many machines.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Which major projects use Buildbot?$q$, $q$Buildbot has been used by Chromium, WebKit, Mozilla, and the Python language's own CPython project, among others.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$How does Buildbot compare to Jenkins?$q$, $q$Both are free and self-hosted, but Buildbot configures pipelines as Python code, while Jenkins typically uses a UI or Groovy-based pipeline scripts.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Custom, flexible build automation$q$, $q$Implement highly specific build logic that declarative YAML-based CI tools can't easily express.$q$, $q$Open-source projects and engineering teams with unusual build requirements$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Fully self-hosted CI/CD$q$, $q$Run continuous integration entirely on owned infrastructure with no external vendor.$q$, $q$Teams with strict infrastructure or compliance requirements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Large-scale distributed builds$q$, $q$Coordinate parallel builds and tests across many worker machines and platforms.$q$, $q$Large open-source and enterprise projects$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open source (GPLv2)","Unlimited masters and workers","Full source code access"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Buildbot is a free, open-source continuous integration framework first released in April 2003 by Brian Warner as a lightweight alternative to Mozilla's Tinderbox. It is licensed under GPLv2 and maintained today by Dustin J. Mitchell and a community of contributors.$q$, $q$Buildbot was originally built to automate builds and tests for the Twisted Python library, and later grew into a general-purpose CI framework adopted by projects including Chromium, WebKit, Mozilla, and CPython.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Unlike YAML-based CI tools, Buildbot's entire configuration is written in Python code, giving teams full programmatic control over build logic. It uses a master/worker architecture for distributed, parallel job execution, integrates with Git and Subversion, and provides a web UI for status reporting.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Buildbot is entirely free and open source under the GNU General Public License v2.0, with no managed hosting or paid tiers. Teams run and maintain their own masters and workers on their own infrastructure.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Builder.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Builder.io is a visual development and headless CMS platform that converts Figma designs into production React, Vue, Angular, or Svelte code using AI agents.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from ~$24/user/month)$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Builder.io: Visual CMS & AI Design-to-Code Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Builder.io is a visual headless CMS and AI-powered design-to-code platform that turns Figma designs into React, Vue, or Angular code. Free plan available.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Builder.io is a San Francisco-based visual development platform founded in 2018. It began as a visual, drag-and-drop headless CMS aimed at letting non-technical marketing and content teams build and publish web pages without engaging developers for every change, while still integrating cleanly into existing codebases via APIs and SDKs for popular frameworks. Over time the product has expanded significantly beyond CMS positioning: Builder.io now markets itself as a collaborative platform to build with AI agents, centered on converting design files into production-ready front-end code and pairing human developers with AI coding agents inside a shared visual workspace.

The platform's most distinctive capability is Figma-to-code conversion: using the Builder Figma plugin, a designer can select one or more frames in Figma, export them into a Builder project, and have Builder generate clean, editable framework code, including React, Vue, Angular, and Svelte, rather than raw, unmaintainable HTML and CSS, a common complaint about earlier-generation design-to-code tools. Builder also supports exporting designs back into Figma to keep design and code in sync. Alongside this, Builder retains its original headless CMS, which lets teams model structured content and deliver it to any frontend via API, and a visual page-building editor for marketers to assemble and edit pages without code. The platform also includes native A/B testing and, more recently, Design System Intelligence features aimed at enterprise teams that need generated code to conform to an existing component library rather than generic markup.

Builder.io's pricing is a freemium, credit-based, per-seat model. The Free plan supports up to 5 users and includes a limited allotment of AI agent credits (reported as roughly 25 daily / 75 monthly), a Git connection, and public previews, enough for evaluation and small projects. The Pro plan is priced at roughly $24 per user per month billed annually, or around $30 month-to-month, supports up to 5 users, and includes about 500 monthly credits that roll over, with additional credit packs purchasable at around $25 per 500 credits. The Team plan runs about $40 per user per month annually, or around $50 monthly, and extends the user cap to 20. Enterprise pricing is custom and adds SSO, role-based access control, Design System Intelligence, and SLAs. Because credits are consumed by AI-agent design-to-code operations, actual cost for heavy users scales with how much design-to-code generation a team runs, not just seat count.

Builder.io is best suited to product and marketing teams that want designers to ship real, framework-native code changes without waiting on a developer queue, and to engineering teams evaluating AI-assisted front-end development tools. It competes with a mix of headless CMS platforms, such as Contentful and Sanity, and newer AI design-to-code tools, and its differentiation is strongest for teams that need both a CMS and a design-to-code pipeline in one product rather than two separate tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f8a615cc-2733-4282-bb83-ea78b3682118';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f8a615cc-2733-4282-bb83-ea78b3682118' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Figma-to-code conversion$q$, $q$AI-powered conversion of Figma designs into clean React, Vue, Angular, or Svelte code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Headless CMS$q$, $q$Structured content modeling delivered to any frontend via API.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Visual drag-and-drop editor$q$, $q$Lets non-technical teams build and publish pages without writing code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$AI coding agents$q$, $q$A collaborative workspace pairing human developers with AI agents for code generation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Design System Intelligence$q$, $q$Generates code that conforms to an existing component library and design system.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Native A/B testing$q$, $q$Built-in experimentation tools for testing page and content variations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Figma round-tripping$q$, $q$Export Builder projects back into Figma to keep design and code in sync.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Generates real, maintainable framework code instead of raw HTML$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Lets non-developers ship page changes without a developer queue$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Combines a CMS and a design-to-code pipeline in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Generous free tier for small teams and evaluation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Direct Figma plugin integration$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Credit-based pricing can be unpredictable for heavy AI usage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Per-seat costs add up for larger teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Added AI and agent features increase the learning curve versus a pure CMS$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$SSO and Design System Intelligence are reserved for the Enterprise tier$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$What does Builder.io do?$q$, $q$Builder.io is a visual headless CMS and AI-powered design-to-code platform that converts Figma designs into production framework code.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Is Builder.io free?$q$, $q$Yes, the Free plan supports up to 5 users with a limited allotment of AI agent credits.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Does Builder.io work with Figma?$q$, $q$Yes, the Builder Figma plugin lets you export designs directly into a Builder project for code generation.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$What frameworks does Builder.io output?$q$, $q$Builder.io generates code for React, Vue, Angular, and Svelte, among others.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Is Builder.io still a headless CMS?$q$, $q$Yes, it retains its original headless CMS capability alongside its newer AI design-to-code features.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$How is Builder.io priced?$q$, $q$Builder.io uses a per-seat, credit-based freemium model, with credits consumed by AI design-to-code operations.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Marketing page publishing$q$, $q$Let marketing teams ship landing pages and content changes without a developer bottleneck.$q$, $q$Marketing and content teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Design-to-code conversion$q$, $q$Convert Figma designs directly into production-ready framework code.$q$, $q$Product and engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Enterprise design system compliance$q$, $q$Generate AI-assisted code that conforms to an existing component library.$q$, $q$Enterprise engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Up to 5 users","~75 monthly / 25 daily AI credits","Git connection","Public previews"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Pro$q$, $q$~$24/user/month (annual) or ~$30/user/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Up to 5 users","~500 monthly credits with rollover","Additional credits at $25/500"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Team$q$, $q$~$40/user/month (annual) or ~$50/user/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Up to 20 users","Higher credit allotments"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["SSO","Role-based access control","Design System Intelligence","SLAs"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'f8a615cc-2733-4282-bb83-ea78b3682118';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Builder.io is a San Francisco-based visual development platform founded in 2018. It began as a visual, drag-and-drop headless CMS and has since expanded into an AI-powered design-to-code platform, positioning itself as a collaborative workspace for humans and AI coding agents.$q$, $q$Its most distinctive capability is converting Figma designs into clean, editable framework code rather than raw HTML, using the Builder Figma plugin.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Builder.io combines a headless CMS with API-based content delivery, a visual drag-and-drop page editor, AI coding agents, Figma-to-code conversion into React, Vue, Angular, or Svelte, native A/B testing, and Design System Intelligence for component-aware code generation.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Builder.io uses a freemium, credit-based, per-seat model. The Free plan supports up to 5 users with limited AI credits. Pro is roughly $24/user/month annually with 500 monthly credits, Team is roughly $40/user/month annually for up to 20 users, and Enterprise is custom with SSO and Design System Intelligence.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Buildertrend ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Buildertrend is a cloud construction management platform for homebuilders and contractors, covering scheduling, estimating, RFIs, and client communication.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$339/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Omaha, Nebraska, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Buildertrend: Construction Project Management Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Buildertrend is cloud-based construction management software for scheduling, estimating, RFIs, and client communication. Plans start at $339/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Buildertrend is a cloud-based construction project management platform founded in 2006 in Omaha, Nebraska, by Dan Houghton, Jeff Dugger, and Steve Dugger, who built the product after working in residential construction and concluding that the industry needed better software for coordinating jobs. The company remains privately held and headquartered in Omaha. Buildertrend is built specifically for the construction industry, including residential homebuilders, remodelers, and specialty and commercial contractors, rather than as a general-purpose project management tool adapted for construction.

The platform centers on a handful of core workflows common to construction businesses: project scheduling and Gantt-style timelines, daily logs and photo documentation, RFIs (requests for information), change orders, selections, which let homeowners choose finishes and options within a project, and a client portal that gives homeowners visibility into schedules, documents, and communication without needing full platform access. On the financial side, Buildertrend supports estimating, bid requests, job costing, budgeting, purchase orders, and invoicing, with integrations to accounting systems such as QuickBooks and Xero to avoid duplicate data entry. The platform is available as a web application and through native iOS and Android mobile apps, which matters for construction teams that are frequently on job sites rather than at a desk.

Buildertrend's pricing is presented in three tiers, each billed monthly at a flat company-wide rate rather than per user. The Essential plan is listed at $339 per month when paid annually and is aimed at teams primarily needing project management and communication tools. The Advanced plan is listed at $699 per month annually and adds estimating and financial management tools on top of Essential. The Complete plan is listed at $999 per month annually and adds tools for managing more complex processes such as selections and RFIs at scale. Because pricing can vary by contract terms and company size, Buildertrend also directs prospective customers to speak with a sales representative to confirm current pricing and the best-fit plan; a free trial or demo is typically available before purchase.

Buildertrend is best suited to construction companies, from small remodeling outfits to larger homebuilders and specialty or commercial contractors, that need a single system to manage scheduling, client communication, and job financials in one place, replacing a patchwork of spreadsheets, email, and paper-based site logs. It competes with other construction-focused project management tools such as Procore and CoConstruct. Because pricing is a flat company-wide subscription rather than per-seat, it tends to be most cost-effective for firms running multiple simultaneous projects that can spread the platform cost across many jobs, and comparatively expensive for a solo contractor running one project at a time.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Project scheduling & Gantt timelines$q$, $q$Plan and track construction project timelines with Gantt-style views.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Client portal$q$, $q$Gives homeowners visibility into schedules, documents, and communication.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Daily logs & photo documentation$q$, $q$Capture job-site progress with daily logs and photos.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Estimating & job costing$q$, $q$Build estimates, track budgets, and manage job costs and purchase orders.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$RFIs & change orders$q$, $q$Manage requests for information and change orders within the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Selections management$q$, $q$Let homeowners choose finishes and options for their project.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Accounting integrations$q$, $q$Integrates with QuickBooks and Xero to avoid duplicate financial data entry.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Mobile apps$q$, $q$Native iOS and Android apps for managing projects from the job site.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Purpose-built for construction-specific workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Strong client portal improves homeowner communication$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Integrates with major accounting software (QuickBooks, Xero)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Mobile apps suited for job-site use$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Tiered plans scale from smaller teams to larger builders$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Flat, company-wide pricing is expensive for solo or very small contractors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Full estimating and financial tools require the higher-priced Advanced or Complete tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Pricing is not fully self-serve and may require a sales conversation$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Learning curve for teams new to dedicated construction management software$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$What is Buildertrend used for?$q$, $q$Buildertrend is construction project management software used for scheduling, estimating, RFIs, selections, and client communication.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$How much does Buildertrend cost?$q$, $q$Buildertrend's published plans start at $339/month (Essential) and go up to $999/month (Complete), all billed annually.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Who founded Buildertrend?$q$, $q$Buildertrend was founded in 2006 by Dan Houghton, Jeff Dugger, and Steve Dugger in Omaha, Nebraska.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Does Buildertrend have a mobile app?$q$, $q$Yes, Buildertrend offers native iOS and Android apps.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Does Buildertrend integrate with QuickBooks?$q$, $q$Yes, Buildertrend integrates with QuickBooks and Xero for accounting.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Is there a free trial?$q$, $q$Buildertrend typically offers a demo or trial period; contact their sales team to confirm current trial availability.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Residential homebuilding$q$, $q$Manage scheduling, budgets, and client communication across multiple concurrent home builds.$q$, $q$Residential homebuilders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Remodeling projects$q$, $q$Coordinate client selections, change orders, and daily job-site updates.$q$, $q$Remodeling and renovation contractors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Specialty & commercial contracting$q$, $q$Track job costing, RFIs, and financials across complex commercial projects.$q$, $q$Specialty and commercial contractors$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Essential$q$, $q$$339/month$q$, $q$annual$q$, NULL, $q$["Project management","Scheduling","Client communication"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Advanced$q$, $q$$699/month$q$, $q$annual$q$, NULL, $q$["Everything in Essential","Estimating","Financial management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Complete$q$, $q$$999/month$q$, $q$annual$q$, NULL, $q$["Everything in Advanced","Selections management at scale","Advanced RFI tools"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Buildertrend is a cloud-based construction project management platform founded in 2006 in Omaha, Nebraska, by Dan Houghton, Jeff Dugger, and Steve Dugger. The company remains privately held and headquartered in Omaha.$q$, $q$The platform is purpose-built for the construction industry, serving residential homebuilders, remodelers, and specialty and commercial contractors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core workflows include project scheduling and Gantt timelines, daily logs and job-site photo documentation, RFIs and change orders, selections management, a client portal for homeowner communication, and financial tools like estimating, job costing, and QuickBooks/Xero integration.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Buildertrend offers three flat, company-wide monthly plans: Essential at $339/month, Advanced at $699/month, and Complete at $999/month, all billed annually. Pricing can vary by contract terms, and Buildertrend recommends contacting sales to confirm current rates.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Buildkite ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Buildkite is a hybrid CI/CD platform that pairs a managed control plane with self-hosted build agents, letting teams run pipelines on their own infrastructure.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from ~$15/user/month)$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Fully remote (originally founded in Australia)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Buildkite: Hybrid CI/CD Pipeline Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Buildkite runs CI/CD pipelines with a managed control plane and self-hosted agents, keeping code and secrets in your infrastructure. Free tier available.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Buildkite is a continuous integration and continuous delivery platform founded in 2013 by Keith Pitt, who built the original version of the product and led the company as founder and CEO. The company began as a bootstrapped Australian startup and has since grown into a fully distributed, remote-first company with team members working from more than 60 cities worldwide, serving customers that include large engineering organizations running high-scale build and test workloads.

Buildkite's defining architectural choice is its hybrid model: Buildkite hosts and operates the control plane, meaning the web dashboard, pipeline orchestration, scheduling, and API, as a SaaS product, while the actual build agents that check out code and execute jobs run inside the customer's own infrastructure, such as their cloud account, on-premises servers, or specialized hardware. Because job execution happens on infrastructure the customer controls, Buildkite states it never needs direct access to source code, secrets, or internal systems, a meaningful differentiator versus fully hosted CI platforms for security- and compliance-sensitive organizations. For teams that don't want to manage their own agent infrastructure, Buildkite also offers Buildkite Hosted Agents, a managed compute option introduced in 2024 with optimized macOS and Linux runners billed per vCPU-minute, metered to the second with no minimums.

Beyond core pipeline execution, Buildkite includes Test Analytics and Test Engine, which track test suite performance over time, identify and help isolate flaky tests, and correlate test runs with specific builds and deployments to speed up debugging of CI failures. Following its 2023 acquisition of PackageCloud, Buildkite also offers package registry hosting, letting teams store and distribute build artifacts and software packages to internal or external consumers. Pipelines are defined as configuration, either YAML or dynamically via Buildkite's pipeline upload API, and integrate with GitHub, GitLab, Bitbucket, and Slack, among other tools.

Buildkite's pricing follows a per-user subscription model layered on top of the hybrid agent architecture. A free Developer tier supports a small number of users, commonly cited as up to 5, with a limited number of concurrent agents or jobs, around 3, and roughly 90-day build log retention, enough for individual developers or small side projects. The Pro plan is priced from roughly $15 per user per month on annual billing, includes unlimited agents and unlimited build minutes for self-hosted agents, and targets growing engineering teams. Enterprise pricing is custom and adds SAML SSO, audit logs, and dedicated support, typically priced higher depending on scale and contract terms. Buildkite Hosted Agents compute is billed separately, per vCPU-minute.

Buildkite is best suited to engineering organizations that want the operational convenience of a managed CI dashboard without giving up control of where code executes, particularly regulated industries, security-conscious companies, and teams running large or unusual build and test workloads, such as GPU jobs, mobile device farms, or on-prem hardware, that fully hosted CI platforms handle poorly.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e080ec1f-f731-4575-b1da-0167d0092eb9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Hybrid architecture$q$, $q$Managed control plane paired with self-hosted build agents inside customer infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Buildkite Hosted Agents$q$, $q$Managed macOS and Linux compute billed per vCPU-minute for teams that don't want to self-host agents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Test Analytics & Test Engine$q$, $q$Tracks test suite performance and identifies and isolates flaky tests.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Package registries$q$, $q$Store and distribute build artifacts and software packages, via the PackageCloud acquisition.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Pipelines as code$q$, $q$Define pipelines in YAML or dynamically upload them via API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Unlimited build minutes$q$, $q$Pro and Enterprise plans include unlimited build minutes on self-hosted agents.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Third-party integrations$q$, $q$Connects with GitHub, GitLab, Bitbucket, and Slack.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Keeps source code and secrets inside customer infrastructure$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Unlimited build minutes on paid self-hosted agent plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Flexible enough for unusual hardware or build environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Built-in flaky test detection tooling$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Generous free tier for individual developers$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Requires managing your own agent infrastructure unless using Hosted Agents$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Hosted compute is billed separately per vCPU-minute, which can be harder to predict$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Per-user pricing scales with team size$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Initial agent setup carries more operational overhead than fully hosted CI$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$What makes Buildkite different from GitHub Actions or CircleCI?$q$, $q$Buildkite uses a hybrid model where the control plane is hosted by Buildkite but build agents run on your own infrastructure, so code and secrets never leave your environment.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Is Buildkite free?$q$, $q$Yes, a free Developer tier supports a small number of users with limited concurrent agents.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Do I need to run my own build servers?$q$, $q$By default yes, but Buildkite Hosted Agents offers managed compute billed per vCPU-minute for teams that prefer not to self-host agents.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$What is Buildkite Hosted Agents?$q$, $q$A managed compute option, introduced in 2024, offering optimized macOS and Linux runners billed per vCPU-minute.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Does Buildkite support flaky test detection?$q$, $q$Yes, via Test Analytics and Test Engine, which track and help isolate flaky tests.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Who founded Buildkite?$q$, $q$Buildkite was founded in 2013 by Keith Pitt, originally as a bootstrapped Australian startup.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Security-conscious CI/CD$q$, $q$Run pipelines without giving a third-party vendor access to source code or secrets.$q$, $q$Security-conscious and regulated engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Unusual build environments$q$, $q$Run builds on specialized hardware such as mobile device farms, GPUs, or on-prem servers.$q$, $q$Teams with non-standard infrastructure needs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Test reliability improvement$q$, $q$Track and eliminate flaky tests slowing down CI pipelines.$q$, $q$Growing engineering organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Developer (Free)$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["Up to 5 users","~3 concurrent agents","~90-day build log retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Pro$q$, $q$From ~$15/user/month$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited agents","Unlimited build minutes"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["SAML SSO","Audit logs","Dedicated support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Buildkite is a hybrid CI/CD platform founded in 2013 by Keith Pitt as a bootstrapped Australian startup. The company is now fully remote, with team members across more than 60 cities worldwide.$q$, $q$Its defining feature is a hybrid architecture: Buildkite hosts the control plane and dashboard as SaaS, while build agents run inside the customer's own infrastructure, keeping code and secrets under customer control.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Buildkite includes Test Analytics and Test Engine for tracking and isolating flaky tests, package registry hosting following its 2023 PackageCloud acquisition, pipelines-as-code configuration, and Buildkite Hosted Agents, a managed compute option billed per vCPU-minute for teams that don't want to run their own agents.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$A free Developer tier covers small teams with limited concurrent agents. Pro starts around $15/user/month (annual) with unlimited agents and build minutes. Enterprise pricing is custom and adds SSO and audit logs. Hosted Agents compute is billed separately per vCPU-minute.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Bullhorn ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bullhorn is a combined applicant tracking system and CRM built specifically for staffing and recruiting agencies to manage candidates, clients, and placements.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (custom quote)$q$, pricing_model),
  starting_price = COALESCE($q$Custom pricing (quote-based)$q$, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Boston, Massachusetts, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bullhorn: ATS & CRM Software for Staffing Agencies$q$, seo_title),
  seo_meta_description = COALESCE($q$Bullhorn is an ATS and CRM built for staffing and recruiting agencies, used by 10,000+ firms in 60+ countries. Custom pricing based on firm size and needs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bullhorn, Inc. is a cloud-based applicant tracking system (ATS) and customer relationship management (CRM) platform built specifically for the staffing and recruiting industry. The company was founded in 1999 by Art Papas, Barry Hinckley, and Roger Colvin; Papas continues to serve as CEO. Bullhorn is headquartered in Boston, Massachusetts, with additional offices in St. Louis, London, Brighton, Sydney, and Rotterdam, reflecting its international staffing-industry customer base. The company states it is used by more than 10,000 staffing and recruiting firms across more than 60 countries, ranging from small independent agencies to large multinational staffing organizations.

Unlike general-purpose CRM or HR software, Bullhorn is purpose-built around the staffing business model, combining two workflows in one system: an ATS for sourcing, tracking, and placing candidates against open job orders, and a CRM for managing client companies, sales pipeline, and business development activity. Core capabilities include resume parsing, Boolean and AI-assisted candidate search and matching, job posting distribution, activity and note tracking against contacts, automation for repetitive recruiting tasks such as follow-ups and status changes, reporting and analytics on pipeline and placement metrics, and email integration with Microsoft Outlook and Gmail, including calendar sync. Bullhorn also emphasizes mobile access, with a mobile-first version of the ATS and CRM intended to let recruiters and account managers work from the field without switching to a desktop.

A significant part of Bullhorn's value proposition is its open marketplace of more than 300 pre-built integrations with third-party staffing-industry tools, spanning job boards, background-check providers, onboarding and compliance systems, vendor management systems, and sourcing tools such as LinkedIn Recruiter, LinkedIn Jobs, Dice, Checkr, and Daxtra/Broadbean. An open API is also available for firms that need custom integrations beyond the marketplace catalog. This integration depth is a key differentiator versus more generic CRM and ATS tools, since staffing agencies typically rely on a wide stack of specialized point solutions around the core ATS and CRM.

Bullhorn does not publish self-serve pricing; pricing is quote-based and tailored to firm size, user count, and which modules, such as ATS/CRM, VMS, onboarding, or analytics, a customer needs. Third-party review sites have reported approximate street pricing around $99 per user per month for a basic subscription tier and around $199 per user per month for a more advanced tier, but these figures are not confirmed by Bullhorn directly and should be treated as indicative rather than official.

Bullhorn is best suited to staffing and recruiting agencies, including contract, permanent placement, and executive search firms, that need a combined ATS and CRM built around staffing-specific workflows like job orders, placements, and client relationship management, rather than a generic HR or sales CRM adapted for recruiting. It competes with staffing-focused platforms and broader ATS players that are less staffing-agency-specific.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Combined ATS + CRM$q$, $q$Manages candidate sourcing and placement alongside client relationship and sales pipeline tracking in one system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$AI-assisted candidate matching$q$, $q$Uses AI and Boolean search to match candidates to open job orders.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Resume parsing$q$, $q$Automatically extracts structured candidate data from resumes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$300+ marketplace integrations$q$, $q$Connects with LinkedIn, Dice, Checkr, VMS platforms, and other staffing-industry tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Workflow automation$q$, $q$Automates repetitive recruiting tasks like follow-ups and status changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Mobile-first app$q$, $q$Lets recruiters and account managers work from the field.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Email & calendar integration$q$, $q$Syncs with Microsoft Outlook and Gmail.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Reporting & analytics$q$, $q$Tracks pipeline, placement, and business development metrics.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Purpose-built specifically for staffing-industry workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Deep integration marketplace with 300+ partners$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Used by 10,000+ firms globally, proven at scale$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Combines sales CRM and recruiting ATS in one system$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Strong mobile access for field recruiters$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Pricing is not public or self-serve, requiring a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Reported per-user costs are relatively high versus generic ATS tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Can be complex to configure for very small agencies$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Feature set may be more than solo recruiters or micro-agencies need$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$What is Bullhorn used for?$q$, $q$Bullhorn is used by staffing and recruiting agencies as a combined applicant tracking system (ATS) and CRM for managing candidates, clients, and placements.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$How much does Bullhorn cost?$q$, $q$Bullhorn does not publish official pricing; costs are quote-based depending on firm size, user count, and modules needed.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Who founded Bullhorn?$q$, $q$Bullhorn was founded in 1999 by Art Papas, Barry Hinckley, and Roger Colvin, and is headquartered in Boston, Massachusetts.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Does Bullhorn integrate with LinkedIn?$q$, $q$Yes, Bullhorn integrates with LinkedIn Recruiter and LinkedIn Jobs, among 300+ other marketplace partners.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Is there a mobile app?$q$, $q$Yes, Bullhorn offers a mobile-first ATS and CRM experience for recruiters working in the field.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$How many companies use Bullhorn?$q$, $q$Bullhorn states it is used by more than 10,000 staffing and recruiting firms across more than 60 countries.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Staffing agency operations$q$, $q$Manage candidates, job orders, placements, and client relationships in one system.$q$, $q$Staffing and recruiting agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Executive search$q$, $q$Track business development and client relationships alongside candidate pipelines.$q$, $q$Executive search firms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Multinational staffing organizations$q$, $q$Use marketplace integrations for VMS, onboarding, and background checks across regions.$q$, $q$Large, multi-country staffing organizations$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bullhorn is a cloud-based ATS and CRM platform founded in 1999 by Art Papas, Barry Hinckley, and Roger Colvin, headquartered in Boston, Massachusetts. Papas continues to serve as CEO.$q$, $q$The company reports over 10,000 staffing and recruiting firms across 60+ countries use Bullhorn, with additional offices in St. Louis, London, Brighton, Sydney, and Rotterdam.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bullhorn combines an applicant tracking system with a CRM built specifically for staffing workflows: resume parsing, AI-assisted candidate matching, job order and placement tracking, automation for recruiting tasks, and a marketplace of 300+ integrations with job boards, VMS, and background-check tools.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Bullhorn does not publish self-serve pricing; all plans require a custom quote based on firm size, user count, and which modules are needed. Third-party sources report approximate street pricing in the $99-$199 per user per month range, though these figures are not officially confirmed by Bullhorn.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;


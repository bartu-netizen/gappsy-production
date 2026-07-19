-- Enrichment marathon batch: Swetrix, SwingMusic, Sylius, Sympa, Synapse, Sync-in, SyncMarks, Syncthing

-- ── Swetrix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Swetrix is an open-source, privacy-first web analytics and product analytics platform that offers a cookieless alternative to Google Analytics, with error tracking, session replays, and A/B testing.$q$, short_description),
  pricing_model = COALESCE($q$freemium (free open-source self-hosted edition plus paid cloud subscriptions)$q$, pricing_model),
  starting_price = COALESCE($q$€17/month$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Edinburgh, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Swetrix Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Swetrix is an open-source, cookieless web analytics platform. See pricing, features, pros and cons, and how it compares to Google Analytics.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Swetrix is an open-source, privacy-first web analytics platform positioned as a cookieless alternative to Google Analytics. Founded in 2021 by Andrii Romasiun and now operating as Swetrix Ltd out of Edinburgh, United Kingdom, with roots in Ukraine, Swetrix serves teams that want actionable traffic and product insight without collecting personal data or requiring cookie consent banners. The product combines core web analytics (pageviews, referrers, countries, devices) with product analytics features such as session analysis, error tracking, conversion funnels, session replays, A and B testing, and feature flags, plus Core Web Vitals performance monitoring, all delivered through a lightweight tracking script under 5KB. Swetrix ships an AGPLv3-licensed Community Edition that organizations can self-host for free, and a hosted cloud version with paid plans starting at 17 euros per month (Standard, billed yearly) for 10 websites and up to 50 million monthly events, scaling to a Plus plan at 35 euros per month with session replays and A and B testing, and a custom-priced Enterprise plan with on-premise installation and SSO. It integrates with more than 30 frameworks including React, Next.js, Angular, WordPress, and Shopify. Swetrix is best suited for privacy-conscious startups, agencies, and developers who want GDPR-friendly analytics with the option to self-host or use the managed cloud service.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Cookieless tracking$q$, $q$Collects analytics data without cookies or personal identifiers, avoiding the need for cookie consent banners in most jurisdictions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Real-time dashboard$q$, $q$Shows live traffic, pageviews, referrers, countries, and device breakdowns as visitors interact with a site.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Session replays$q$, $q$Records and plays back real user sessions with a timeline, available on the Plus and Enterprise plans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Error tracking$q$, $q$Captures JavaScript errors and exceptions in production so teams can spot and triage issues quickly.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$A and B testing and feature flags$q$, $q$Built-in experimentation tooling to test variants and roll out features without adding a separate service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Conversion funnels$q$, $q$Visualizes multi-step user journeys to identify where visitors drop off before converting.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Performance monitoring$q$, $q$Tracks Core Web Vitals from real users to measure actual page load experience.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Self-hosting option$q$, $q$The AGPLv3 Community Edition can be deployed on a customer's own infrastructure for full data ownership.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Open-source with a genuinely free self-hosted Community Edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Combines web analytics, error tracking, and A and B testing in one product$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Cookieless design simplifies GDPR and privacy compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Lightweight tracking script with minimal performance impact$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Transparent, usage-based cloud pricing with a free trial$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Cloud plan pricing scales with event volume, which can add up for high-traffic sites$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Self-hosting requires ongoing server maintenance and updates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Smaller ecosystem and community than Google Analytics or Plausible$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Session replays and A and B testing are gated behind the higher-priced Plus tier$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Enterprise features like SSO require custom-quoted pricing$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Is Swetrix free to use$q$, $q$The self-hosted Community Edition is free and open-source under AGPLv3. The hosted cloud version is a paid subscription starting at 17 euros per month, with a 14-day free trial.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Is Swetrix GDPR-compliant$q$, $q$Swetrix is designed to be cookieless and avoids collecting personally identifiable information, which helps teams meet GDPR requirements without displaying a cookie consent banner.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Can I self-host Swetrix$q$, $q$Yes. Swetrix publishes an open-source Community Edition under the AGPLv3 license that can be self-hosted on your own servers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Does Swetrix replace Google Analytics$q$, $q$Swetrix is marketed as a privacy-focused alternative to Google Analytics, covering core traffic reporting plus additional product-analytics features like funnels and session replays.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$What frameworks does Swetrix integrate with$q$, $q$Swetrix offers more than 30 integrations, including React, Next.js, Angular, WordPress, and Shopify.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Does Swetrix offer error tracking$q$, $q$Yes, error and exception tracking is included on all paid cloud plans and in the self-hosted edition.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Who founded Swetrix$q$, $q$Swetrix was founded by Andrii Romasiun in 2021 and now operates as Swetrix Ltd, based in Edinburgh, United Kingdom.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Does Swetrix support A and B testing$q$, $q$Yes, A and B testing and feature flags are built into the Plus and Enterprise plans.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Privacy-first website analytics$q$, $q$Replacing Google Analytics with a cookieless tool that avoids consent banners while still reporting traffic and conversion data.$q$, $q$Marketing teams and site owners in GDPR-regulated markets$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Product and error monitoring for web apps$q$, $q$Combining session replays, funnels, and error tracking to debug and improve a SaaS product in one dashboard.$q$, $q$Product teams and developers at startups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Self-hosted analytics for data sovereignty$q$, $q$Running the open-source Community Edition on internal infrastructure to keep all visitor data in-house.$q$, $q$Government, healthcare, and privacy-sensitive organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Standard$q$, $q$€17/month$q$, $q$monthly (billed yearly for the discount)$q$, NULL, $q$["10 websites","Up to 50 million monthly events","Events and goals","Error tracking","Conversion funnels","Performance monitoring"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Plus$q$, $q$€35/month$q$, $q$monthly (billed yearly for the discount)$q$, NULL, $q$["100 websites","Up to 50 million monthly events","Session replays","A and B testing","Feature flags","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Custom event and website limits","On-premise installation","SAML-based single sign-on","Dedicated account manager","Enterprise SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Community Edition (self-hosted)$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full core analytics engine","AGPLv3 open-source license","Self-hosted on your own infrastructure","No event volume fees"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$overview$q$, $q$What Is Swetrix$q$, 2, ARRAY[$q$Swetrix is an open-source web and product analytics platform built as a cookieless alternative to Google Analytics. It tracks website traffic, user behavior, and application performance without relying on cookies or collecting personally identifiable information, which lets teams stay GDPR-compliant by default.$q$, $q$The project is dual-licensed: a free, self-hostable Community Edition released under AGPLv3, and a managed cloud service run by Swetrix that handles hosting, scaling, and support. Both versions share the same core dashboard and event-tracking engine.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Swetrix bundles standard web analytics (pageviews, sessions, referrers, geography, device and browser breakdowns) with product-analytics capabilities normally found in separate tools. These include custom events and goals, conversion funnels, session replays with timelines, error and exception tracking, and built-in A and B testing with feature flags.$q$, $q$On the performance side, Swetrix captures real user Core Web Vitals so teams can see actual page load experience rather than lab data. Its tracking script is intentionally lightweight, under 5KB, and includes basic and strict bot-filtering modes to keep reported numbers accurate.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Swetrix cloud pricing is usage-based, tied to monthly event volume, with a 14-day free trial. The Standard plan is 17 euros per month (billed yearly) for up to 10 websites and 50 million monthly events. The Plus plan is 35 euros per month for up to 100 websites plus session replays, A and B testing, and priority support. An Enterprise tier offers custom limits, on-premise installation, SAML SSO, and a dedicated account manager.$q$, $q$Organizations that prefer full data control can self-host the AGPLv3 Community Edition for free, at the cost of running and maintaining their own infrastructure.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SwingMusic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Swing Music is a free, open-source, self-hosted music streaming server that turns your personal audio library into a Spotify-like experience in the browser.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SwingMusic: Self-Hosted Music Streaming Server Overview$q$, seo_title),
  seo_meta_description = COALESCE($q$SwingMusic is an open-source, self-hosted music server for your own audio files. Explore features, setup options, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Swing Music (SwingMusic) is a free, open-source, self-hosted music streaming server maintained by the swingmx organization on GitHub. Described by its creators as a beautiful, fast alternative to Spotify that runs entirely on a user's own audio files, it provides a browser-based interface with daily curated mixes generated from listening activity, metadata normalization for a clean library, album versioning for editions like remasters or deluxe releases, folder-based browsing, silence detection with crossfade, listening statistics, Last.fm scrobbling, and multi-user support. The project is licensed under AGPLv3 and built primarily in Python. It runs on Windows, Linux, and ARM64 or x86 hardware, is distributed as pre-compiled binaries and Docker images, and typically listens on port 1970; a separate Android client is also available. There is no company behind Swing Music, no paid tiers, and no disclosed founding date or headquarters, since it is a community open-source project rather than a commercial venture. It is best suited for self-hosters, homelab enthusiasts, and audiophiles who want full control over their music library without subscribing to a streaming service or depending on third-party servers, and who are comfortable installing and maintaining their own server software.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Daily mixes$q$, $q$Automatically curated playlists generated from a user's own listening activity.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Metadata normalization$q$, $q$Cleans up inconsistent tags across a music library for a more consistent browsing experience.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Album versioning$q$, $q$Tracks and labels different album editions, such as deluxe or remastered versions, without duplicating entries incorrectly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Folder-based browsing$q$, $q$Lets users navigate their library by the underlying file and folder structure, not just by tags.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Silence detection and crossfade$q$, $q$Detects silence in tracks and combines it with crossfade for smoother transitions between songs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Listening statistics$q$, $q$Provides insight into listening habits and activity over time.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Last.fm scrobbling$q$, $q$Integrates with Last.fm to log listening activity to an external scrobbling service.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Multi-user support$q$, $q$Allows multiple accounts to use the same server instance with separate libraries or preferences.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Completely free and open-source with an active GitHub community$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Modern, Spotify-like interface for personal music libraries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Runs on Windows, Linux, and ARM devices, with Docker support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$No subscription fees or reliance on a third-party streaming catalog$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Useful extras like daily mixes and listening statistics not found in simple file servers$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Requires self-hosting and basic server administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$No official cloud-hosted version, so users manage their own uptime and backups$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Library quality depends on the user's own file tagging and organization$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$No verified information on company, funding, or long-term commercial backing$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Remote access outside the local network requires additional configuration$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Is SwingMusic free$q$, $q$Yes, Swing Music is free and open-source software released under the AGPLv3 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Do I need my own music files to use SwingMusic$q$, $q$Yes, Swing Music streams your own local audio files rather than offering a licensed streaming catalog like Spotify.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$What platforms does SwingMusic support$q$, $q$Swing Music runs on Windows and Linux, including ARM64 and x86 architectures, and can be deployed with Docker. A separate Android client is also available.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Does SwingMusic have a mobile app$q$, $q$There is an Android client available separately; the core server is accessed through a browser-based web interface.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Can multiple people use the same SwingMusic server$q$, $q$Yes, Swing Music supports multiple user accounts on a single server instance.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Does SwingMusic support Last.fm scrobbling$q$, $q$Yes, Swing Music integrates with Last.fm for scrobbling listening activity.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$What port does SwingMusic run on by default$q$, $q$By default, Swing Music starts on port 1970, accessed at localhost:1970 in a browser.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Is SwingMusic actively maintained$q$, $q$Yes, the project is maintained on GitHub by the swingmx organization with ongoing releases and contributions.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Home music server for a personal collection$q$, $q$Streaming a personal library of purchased or ripped music across devices on a home network.$q$, $q$Music collectors and audiophiles$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Homelab and NAS media stack addition$q$, $q$Adding a dedicated music streaming service alongside other self-hosted apps on a home server or NAS.$q$, $q$Homelab enthusiasts and self-hosters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Privacy-conscious alternative to commercial streaming$q$, $q$Avoiding subscription fees and third-party data collection by hosting and streaming one's own music files.$q$, $q$Privacy-focused users who own their music$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Self-hosted (only option)$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full server functionality","Docker, Windows, and Linux installation options","Multi-user support","No feature restrictions"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$overview$q$, $q$What Is SwingMusic$q$, 2, ARRAY[$q$Swing Music is an open-source, self-hosted music streaming server designed for people who own their music files and want a modern, Spotify-style listening experience without a subscription or third-party server. It runs as a lightweight server application that you install on your own hardware, whether a home computer, NAS, or a small server, and stream to any browser on your network or, with additional setup, remotely.$q$, $q$The project is maintained by the swingmx organization on GitHub and is free to use, modify, and redistribute under the AGPLv3 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Swing Music focuses on making a personal music collection feel like a polished streaming service. It generates daily curated mixes from listening history, normalizes inconsistent metadata across a library, and tracks album versions such as deluxe or remastered editions separately while still associating them correctly.$q$, $q$Additional features include folder-based library browsing, silence detection combined with crossfade for seamless playback, grouping albums and artists into custom collections, detailed listening statistics, Last.fm scrobbling integration, and support for multiple user accounts on the same server.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Swing Music is completely free and open-source. There are no paid tiers, subscriptions, or premium feature gates. Users only bear the cost of the hardware and, optionally, the network setup needed to run and access the server.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Sylius ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sylius is an open-source, headless e-commerce platform built on Symfony and API Platform, used by developers and agencies to build custom B2B and B2C online stores.$q$, short_description),
  pricing_model = COALESCE($q$open-source (free Community Edition) with a paid commercial edition, Sylius Plus$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Opole, Poland$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sylius Review: Features, Pricing and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Sylius is an open-source headless e-commerce platform on Symfony. Compare its features, Sylius Plus pricing, pros, cons, and use cases.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sylius is an open-source, headless e-commerce platform built on the PHP Symfony framework and API Platform, aimed at mid-market and enterprise brands that need custom-built online stores rather than off-the-shelf storefronts. Started by Polish developer Pawel Jedrzejewski around 2010 to 2011, Sylius is now developed by a self-organized company headquartered in Opole, Poland, with roughly 38 people involved according to third-party employee data, and a community of over 7,400 developers on its public Slack and more than 700 contributors on GitHub. The free, MIT-licensed Community Edition is a complete e-commerce framework with REST APIs, Behavior Driven Development testing built in, and deployment options for VPS, Docker, and Kubernetes; it powers more than 10,000 online stores. Sylius Plus is the commercial edition, offering roughly a dozen enterprise modules for complex B2B, B2C, and marketplace commerce, sold under a custom-quoted annual license through Sylius and its certified agency partners rather than a fixed public price. Sylius targets CTOs, solution architects, and development teams, particularly agencies, who need a flexible, code-quality-focused foundation for bespoke commerce projects rather than a plug-and-play SaaS store builder like Shopify.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Headless architecture$q$, $q$Exposes commerce functionality through REST APIs built with API Platform so any frontend can be connected.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Built on Symfony$q$, $q$Uses the mature, widely adopted Symfony PHP framework as its foundation, giving developers familiar tooling and conventions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Modular, customizable design$q$, $q$Components can be extended or swapped independently, supporting bespoke commerce logic without core forks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Behavior Driven Development testing$q$, $q$Ships with BDD and automated testing practices built into the development workflow for higher code quality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Flexible deployment$q$, $q$Runs on standard VPS hosting, Docker, or Kubernetes for teams that need cloud-native scaling.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$B2B and B2C support$q$, $q$Handles both consumer storefronts and complex business-to-business commerce requirements.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Sylius Plus enterprise modules$q$, $q$Commercial add-on modules extend the open-source core for large-scale or marketplace commerce projects.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Large developer community$q$, $q$Backed by thousands of Slack members and hundreds of GitHub contributors, plus a network of certified agency partners.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Fully open-source core under the permissive MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Strong code quality culture with BDD testing built in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Headless, API-first design gives complete frontend freedom$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Backed by an active community and certified agency partner network$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Scales from small stores to complex, modular enterprise commerce$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Requires PHP and Symfony expertise, not beginner-friendly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Not a hosted SaaS option, so infrastructure must be managed separately$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Sylius Plus pricing is not publicly listed and requires a custom quote$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Building a production store demands significant developer time compared to turnkey platforms$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Smaller ecosystem of pre-built themes and plugins than platforms like Shopify or WooCommerce$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Is Sylius free to use$q$, $q$Yes, the core Sylius Community Edition is open-source under the MIT license and free to use and self-host.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$What is Sylius Plus$q$, $q$Sylius Plus is the commercial edition of Sylius, adding enterprise modules for complex B2B, B2C, and marketplace commerce, sold through a custom-quoted license.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$What framework is Sylius built on$q$, $q$Sylius is built on the Symfony PHP framework and uses API Platform for its REST APIs.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Is Sylius headless$q$, $q$Yes, Sylius exposes its commerce functionality through APIs, making it possible to build any frontend, including custom apps and progressive web apps.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Who created Sylius$q$, $q$Sylius was created by Polish developer Pawel Jedrzejewski, starting around 2010 to 2011.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Where is Sylius based$q$, $q$Sylius is headquartered in Opole, Poland.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Is Sylius suitable for beginners$q$, $q$No, Sylius targets experienced PHP and Symfony developers building custom commerce solutions, not non-technical store owners.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Can Sylius handle B2B commerce$q$, $q$Yes, Sylius supports both B2C and B2B commerce models, and Sylius Plus adds further B2B-focused modules.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Custom headless storefronts$q$, $q$Agencies and in-house teams building a fully custom frontend on React, Vue, or a native app connected to Sylius via API.$q$, $q$Development agencies and enterprise engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Complex B2B and marketplace commerce$q$, $q$Using Sylius Plus modules to run multi-vendor marketplaces or business-to-business ordering workflows.$q$, $q$Mid-market and enterprise B2B brands$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Code-quality-focused e-commerce projects$q$, $q$Teams that require rigorous testing and a modular codebase rather than a closed, plugin-based platform.$q$, $q$CTOs and solution architects$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Community Edition$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full open-source e-commerce framework","MIT license","Self-hosted on your own infrastructure","REST APIs via API Platform"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$Sylius Plus$q$, $q$Custom quote$q$, $q$annual license$q$, NULL, $q$["Enterprise commerce modules","B2B and marketplace functionality","Certified partner implementation support","Priority vendor support"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$overview$q$, $q$What Is Sylius$q$, 2, ARRAY[$q$Sylius is an open-source, headless e-commerce platform built on top of the Symfony PHP framework and API Platform. It is designed for developers and agencies building custom B2B and B2C storefronts rather than store owners looking for a plug-and-play solution.$q$, $q$The project began as a personal e-commerce experiment by Polish developer Pawel Jedrzejewski around 2010 to 2011 and has grown into a widely used framework with a large open-source community and a commercial arm, Sylius Plus, for enterprise needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Sylius exposes its functionality through REST APIs built with API Platform, making it a true headless platform that can power any frontend, from a custom React storefront to a progressive web app or mobile client. Its architecture is deliberately modular, letting teams customize or replace individual components without forking the whole codebase.$q$, $q$The framework has a strong emphasis on code quality, with Behavior Driven Development and automated testing built into its workflow from the start. It can be deployed on a standard VPS, in Docker containers, or on Kubernetes for cloud-scale operations, and it supports both B2C and B2B commerce models.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The core Sylius framework, the Community Edition, is open-source under the MIT license and free to use, self-host, and modify. Businesses pay only for their own hosting and development resources.$q$, $q$Sylius Plus is the commercial edition aimed at enterprise and complex marketplace projects, offering additional modules on top of the open-source core. Pricing for Sylius Plus is not publicly fixed on the official site and is quoted per project based on the number of modules and scope; third-party partner estimates have cited licenses starting in the range of several hundred euros per year, though buyers should confirm current pricing directly with Sylius or a certified partner.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Sympa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sympa is a free, open-source mailing list management software written in Perl, used by universities and large institutions to run large-scale email lists with web administration and archiving.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(1997, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_title = COALESCE($q$Sympa: Open-Source Mailing List Manager Overview$q$, seo_title),
  seo_meta_description = COALESCE($q$Sympa is a free, open-source mailing list management tool for large institutions. See features, pricing, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sympa, whose name is an acronym for the French phrase Systeme de Multi-Postage Automatique, is a free, open-source mailing list management application written in Perl and released under the GNU General Public License. Development began in 1995 by original author Christophe Wolfhugel with contributions from Serge Aumont, Olivier Salaun, David Verdin, and Etienne Meleard, with the first release arriving in 1997. From 2011 the French research and education network RENATER managed its development, and since 2017 the project has been stewarded collaboratively by The Sympa Community on GitHub, with maintainers including Soji Ikeda and Guillaume Rousse. Sympa is built to handle very large-scale mailing list environments, supporting configurations with up to 20,000 lists and 700,000 subscribers, and storing subscriber data in a relational database such as MySQL, PostgreSQL, or Oracle for performance at scale. Its feature set includes a web-based administration interface (WWSympa), searchable message archives, DKIM and ARC signing, bounce handling, moderation tools, a SOAP API for integration, RFC 8058 one-click unsubscribe support, and multi-language interfaces. It is widely used by universities, including Edinburgh and Glasgow, and research institutions that need robust, self-hosted email list infrastructure at no licensing cost.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Web administration interface$q$, $q$WWSympa provides a browser-based dashboard for managing lists, subscribers, and moderation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Searchable archives$q$, $q$Stores and indexes list message history so subscribers and administrators can search past discussions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$DKIM and ARC signing$q$, $q$Supports modern email authentication standards to improve deliverability of list messages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Large-scale capacity$q$, $q$Built to handle deployments with tens of thousands of lists and hundreds of thousands of subscribers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Database-backed subscriber storage$q$, $q$Uses relational databases like MySQL, PostgreSQL, or Oracle for subscriber and list data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$SOAP API$q$, $q$Enables integration with external institutional systems for automated list and subscriber management.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$One-click unsubscribe$q$, $q$Implements RFC 8058 for standardized, spam-filter-friendly unsubscribe handling.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Multi-language support$q$, $q$Ships with interface translations for use across international institutions.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Completely free and open-source under the GPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Proven at very large scale with hundreds of thousands of subscribers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Strong email authentication support (DKIM, ARC, one-click unsubscribe)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Long track record of use at major universities and research networks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Flexible database backend options for enterprise deployments$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Requires self-hosting and Perl/Linux system administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Interface can feel dated compared to modern SaaS email tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$No official managed cloud hosting offered by the core project$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Steeper learning curve than simple mailing list tools for small teams$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Best documentation and community support skew toward academic and research use cases$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Is Sympa free$q$, $q$Yes, Sympa is free and open-source software released under the GNU General Public License.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$What does Sympa stand for$q$, $q$Sympa is an acronym for the French phrase Systeme de Multi-Postage Automatique, meaning automatic mailing system.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$How large can a Sympa deployment scale$q$, $q$Sympa is designed to handle large environments, including configurations with up to 20,000 lists and around 700,000 subscribers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$What language is Sympa written in$q$, $q$Sympa is written in Perl.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Who maintains Sympa today$q$, $q$Since 2017, Sympa has been maintained collaboratively by The Sympa Community on GitHub.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Does Sympa support DKIM signing$q$, $q$Yes, Sympa supports DKIM and ARC signing to help authenticate outgoing list messages.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Can Sympa integrate with other systems$q$, $q$Yes, Sympa provides a SOAP API for integrating with external institutional systems.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Who uses Sympa$q$, $q$Sympa is widely used by universities and research institutions, including the Universities of Edinburgh and Glasgow, for large-scale mailing list management.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$University and research mailing lists$q$, $q$Running large departmental, alumni, or research-network email lists with web-based moderation and archiving.$q$, $q$Universities and research institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Large-scale organizational communication$q$, $q$Managing thousands of internal or member mailing lists with database-backed subscriber storage.$q$, $q$Large enterprises and membership organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Self-hosted list infrastructure$q$, $q$Replacing a commercial email list SaaS with a self-hosted, GPL-licensed alternative for full data control.$q$, $q$IT teams that require on-premise email infrastructure$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Self-hosted (only option)$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full mailing list management functionality","GPL open-source license","Self-hosted on your own servers","No per-subscriber or per-list fees"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$overview$q$, $q$What Is Sympa$q$, 2, ARRAY[$q$Sympa is a free, open-source mailing list management application used to automate the subscription, moderation, and archiving of large email lists. Its name stands for the French phrase Systeme de Multi-Postage Automatique, meaning automatic mailing system.$q$, $q$Development began in 1995 with the first public release in 1997. The project has been maintained since 2017 by The Sympa Community, following an earlier period of stewardship by the French research network RENATER starting in 2011.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Sympa provides a web-based administration interface known as WWSympa for managing lists, subscribers, and moderation without needing to edit configuration files directly. It supports searchable, archived list histories and stores subscriber data in a relational database such as MySQL, PostgreSQL, or Oracle for reliability at scale.$q$, $q$On the deliverability and security side, Sympa supports DKIM and ARC signing, RFC 8058 one-click unsubscribe, bounce handling, and an external antivirus plugin. A SOAP API allows integration with other institutional systems, and the interface is available in multiple languages.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sympa is completely free and open-source, distributed under the GNU General Public License. There is no vendor charging for licenses; organizations only incur the cost of hosting and administering their own Sympa server.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Synapse ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Synapse is the original, open-source reference homeserver implementation for the Matrix decentralized communication protocol, developed by Element and used to run self-hosted or federated chat servers.$q$, short_description),
  pricing_model = COALESCE($q$open-source (free) with optional commercial license and support from Element$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$London, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Synapse: Matrix Protocol Homeserver Explained$q$, seo_title),
  seo_meta_description = COALESCE($q$Synapse is the open-source reference homeserver for the Matrix chat protocol. See features, licensing, pricing, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Synapse is the original, reference-implementation homeserver for Matrix, the open standard for secure, decentralized, real-time communication. Matrix originated in 2014 as a project inside Amdocs, created by Matthew Hodgson and Amandine Le Pape, before spinning out first into Vector Creations and later New Vector Limited, and ultimately into the independent, nonprofit Matrix.org Foundation, headquartered in London, United Kingdom. Synapse itself, written in Python with Twisted (and increasingly Rust components), is developed and maintained by Element, the UK-based company behind the Element chat client, and is the most feature-complete and widely deployed Matrix server. As of version 1.99, Synapse code is dual-licensed, available under the AGPL open-source license or an alternative commercial license from Element for organizations that need different terms. It is free to self-host, supports single sign-on, an admin API, pluggable extension modules, horizontally scalable worker processes, and structured logging and metrics for operating at scale. Synapse underpins federated Matrix networks used for team chat, community messaging, and interoperable communication across organizations. Element also offers Element Server Suite as an officially supported, packaged way to deploy Synapse and related Matrix services for enterprises and public sector bodies that want vendor-backed installation and support.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Reference Matrix implementation$q$, $q$Serves as the original, most feature-complete server implementation of the open Matrix communication protocol.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Federation support$q$, $q$Allows a self-hosted Synapse server to communicate with other Matrix homeservers across the decentralized network.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Single sign-on$q$, $q$Supports SSO authentication so organizations can integrate Synapse with existing identity providers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Admin API$q$, $q$Provides a comprehensive API for managing users, rooms, and server configuration programmatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Pluggable modules$q$, $q$Lets operators extend or customize server behavior through a module system without patching core code.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Worker-based horizontal scaling$q$, $q$Supports splitting server load across multiple worker processes for large or high-traffic deployments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Structured logging and metrics$q$, $q$Exposes operational data for monitoring server health and performance in production environments.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Dual licensing$q$, $q$Available under AGPL for open-source use or a commercial license from Element for organizations with different requirements.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Free, open-source, and the most mature Matrix homeserver available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Federates with the broader decentralized Matrix network$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Backed by Element, an established company actively developing the protocol$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Supports enterprise features like SSO and horizontal scaling$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Strong ecosystem of Matrix clients, including Element, work with Synapse out of the box$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Resource-intensive to self-host and scale compared to lightweight Matrix server alternatives$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$AGPL licensing may require a commercial license for some closed-source deployments$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Requires ongoing server administration and update management$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Federation and worker scaling add operational complexity for large deployments$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Newer, lighter Matrix server implementations exist for smaller or simpler use cases$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Is Synapse free to use$q$, $q$Yes, Synapse is free and open-source, available under the AGPL license, with an alternative commercial license option from Element.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$What protocol does Synapse implement$q$, $q$Synapse implements the Matrix protocol, an open standard for secure, decentralized, real-time communication.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Who develops Synapse$q$, $q$Synapse is developed and maintained by Element, the company behind the Element chat client, in coordination with the Matrix.org Foundation.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Can Synapse federate with other Matrix servers$q$, $q$Yes, Synapse supports federation, allowing a self-hosted server to communicate with other Matrix homeservers across the network.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$What language is Synapse written in$q$, $q$Synapse is written primarily in Python using the Twisted framework, with growing use of Rust for performance-critical parts.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Does Synapse support single sign-on$q$, $q$Yes, Synapse supports SSO authentication for integration with existing identity providers.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Is there a managed version of Synapse$q$, $q$Element offers Element Server Suite as a packaged, vendor-supported way to deploy Synapse and related Matrix services.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$How is Synapse different from Element$q$, $q$Synapse is the server (homeserver) that stores and routes Matrix messages, while Element is a chat client application that connects to a Synapse or other Matrix homeserver.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Self-hosted, federated team chat$q$, $q$Running a private Synapse homeserver that can still communicate with other organizations on the Matrix network.$q$, $q$IT teams and organizations wanting sovereign, federated communication$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Public sector and regulated communication$q$, $q$Deploying Synapse, often via Element Server Suite, for government or regulated industries needing data control and compliance.$q$, $q$Government agencies and regulated enterprises$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Community and open-source project chat$q$, $q$Hosting a Matrix room network for an open-source project or online community using Synapse as the backend.$q$, $q$Open-source communities and developer groups$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Self-hosted (AGPL)$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full Matrix homeserver functionality","AGPL open-source license","Federation with the Matrix network","Self-hosted on your own infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Commercial license (Element)$q$, $q$Custom quote$q$, $q$custom$q$, NULL, $q$["Alternative licensing terms to AGPL","Available directly from Element","Suited for closed-source or restricted deployments"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$overview$q$, $q$What Is Synapse$q$, 2, ARRAY[$q$Synapse is the reference server implementation, known as a homeserver, for the Matrix protocol, an open standard for secure and interoperable real-time communication. Matrix originated in 2014, created by Matthew Hodgson and Amandine Le Pape inside Amdocs, and later became independent under the nonprofit Matrix.org Foundation.$q$, $q$Synapse is developed and maintained by Element, the company behind the Element chat client, and is the most widely deployed and feature-complete Matrix homeserver available. It is written primarily in Python using the Twisted networking framework, with increasing use of Rust for performance-critical components.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Synapse supports single sign-on authentication, a comprehensive admin API for managing users and rooms, and a pluggable module system that lets operators extend or customize server behavior without modifying the core code.$q$, $q$For larger deployments, Synapse can run as horizontally scaled worker processes to distribute load across multiple machines, and it exposes structured logging and metrics so operators can monitor server health in production.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Synapse is free and open-source. As of version 1.99, its source code is available under the AGPL license, or alternatively under a commercial license offered directly by Element for organizations that need terms incompatible with AGPL.$q$, $q$There is no cost to download, self-host, and run Synapse. Element separately offers paid products, such as Element Server Suite, for organizations that want a packaged, vendor-supported deployment rather than managing Synapse from source themselves.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Sync-in ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sync-in is an open-source, self-hosted file storage, sync, and collaboration platform built with TypeScript, offering secure sharing, real-time document editing, and desktop sync as an alternative to Dropbox, Google Drive, or Nextcloud.$q$, short_description),
  pricing_model = COALESCE($q$open-source/free (self-hosted) with optional enterprise support$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2025, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sync-in: Self-Hosted File Sync and Collaboration Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Sync-in is an open-source, self-hosted alternative to Dropbox and Nextcloud. Explore features, pricing, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sync-in is an open-source, self-hosted platform for file storage, synchronization, sharing, and team collaboration, positioned as a sovereign, privacy-first alternative to commercial cloud storage services such as Dropbox, Google Drive, and Nextcloud. The server is built primarily in TypeScript with a minimal dependency footprint and is licensed under AGPL-3.0. Third-party reporting places its public emergence around July 2025, though it is described as built on more than ten years of prior underlying development before being open-sourced. Sync-in offers secure file sharing with granular link permissions, access limits, expiration dates, and password protection; desktop synchronization clients for Windows, macOS, and Linux; real-time collaborative document editing through Collabora Online, OnlyOffice, or Euro-Office; full-text search across common document formats; WebDAV support for mounting as a network drive; and collaborative spaces with fine-grained access controls plus support for local accounts, OIDC, LDAP, and multi-factor authentication. As of recent counts, the project has around 1,600 GitHub stars and tens of thousands of Docker pulls. It targets public sector bodies, engineering and legal firms, NGOs, and distributed organizations that need to keep full control of their data. No specific founder, headquarters, or company size has been publicly disclosed by the project.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Secure file sharing links$q$, $q$Share files and folders with granular permissions, access limits, expiration dates, and password protection.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Desktop sync clients$q$, $q$Native synchronization applications for Windows, macOS, and Linux keep local folders in sync with the server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Real-time collaborative editing$q$, $q$Edit documents together in real time through Collabora Online, OnlyOffice, or Euro-Office integrations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Full-text search$q$, $q$Indexes and searches content inside Microsoft Office files, PDFs, HTML, and plain text documents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$WebDAV support$q$, $q$Mount Sync-in storage as a network drive or connect it to third-party WebDAV-compatible applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Collaborative spaces$q$, $q$Team-based folder structures with fine-grained access controls for organized group collaboration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Flexible authentication$q$, $q$Supports local accounts, OIDC, LDAP, and multi-factor authentication for enterprise identity integration.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Activity tracking$q$, $q$Provides real-time change notifications, comments, and activity logs across shared content.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Fully open-source and self-hosted for complete data sovereignty$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Built-in real-time document collaboration via Collabora or OnlyOffice$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Minimal dependency TypeScript codebase reduces security surface area$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Flexible enterprise authentication (OIDC, LDAP, MFA) out of the box$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Free to deploy with no per-user licensing fees$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Requires self-hosting expertise and infrastructure management$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Newer public project with a smaller community than Nextcloud or ownCloud$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$No verified information on the company, founders, or funding behind the project$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$No official managed cloud offering for teams that prefer not to self-host$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Collaborative editing depends on integrating separate services like Collabora or OnlyOffice$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Is Sync-in free$q$, $q$Yes, Sync-in is free and open-source under the AGPL-3.0 license, self-hosted on your own infrastructure.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$What is Sync-in an alternative to$q$, $q$Sync-in positions itself as a self-hosted alternative to Dropbox, Google Drive, and Nextcloud.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$What is Sync-in built with$q$, $q$The Sync-in server is built primarily in TypeScript with a minimal set of runtime dependencies.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Does Sync-in support real-time document editing$q$, $q$Yes, through integrations with Collabora Online, OnlyOffice, or Euro-Office.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Does Sync-in have desktop sync clients$q$, $q$Yes, native desktop applications are available for Windows, macOS, and Linux.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Can Sync-in integrate with enterprise identity systems$q$, $q$Yes, it supports local accounts, OIDC, LDAP, and multi-factor authentication.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$When did Sync-in launch$q$, $q$Third-party sources report Sync-in publicly emerged around mid-2025, though it is described as built on much longer prior development.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Does Sync-in support WebDAV$q$, $q$Yes, Sync-in supports WebDAV for mounting storage as a network drive or connecting third-party clients.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Sovereign document collaboration for regulated organizations$q$, $q$Replacing commercial cloud storage with a self-hosted platform to keep sensitive files under organizational control.$q$, $q$Public sector bodies, legal firms, and NGOs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Distributed team file sharing and sync$q$, $q$Keeping files synchronized across desktop clients and shared workspaces for geographically distributed teams.$q$, $q$Multi-site organizations and remote teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Self-hosted alternative to Dropbox or Nextcloud$q$, $q$Deploying an independent file sync and collaboration stack without depending on a third-party cloud vendor.$q$, $q$Homelab users, developers, and privacy-focused organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Self-hosted (only option)$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full file storage, sync, and sharing functionality","AGPL-3.0 open-source license","Desktop clients for Windows, macOS, and Linux","Optional enterprise support available separately"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$overview$q$, $q$What Is Sync-in$q$, 2, ARRAY[$q$Sync-in is an open-source platform for storing, syncing, and sharing files while keeping full control over the underlying data. It is designed as a sovereign, self-hosted alternative to commercial cloud storage and collaboration tools such as Dropbox, Google Drive, and Nextcloud.$q$, $q$The server component is written in TypeScript with a deliberately minimal dependency footprint to reduce attack surface and simplify deployment. It is released under the AGPL-3.0 license, and public reporting indicates the project publicly emerged around mid-2025, building on years of prior underlying development.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Sync-in combines secure file sharing with granular permissions, access limits, expiration dates, and password protection, alongside desktop synchronization clients for Windows, macOS, and Linux. Real-time collaborative document editing is available through Collabora Online, OnlyOffice, or Euro-Office integrations.$q$, $q$The platform also provides full-text search across common document formats including Microsoft Office files, PDFs, HTML, and plain text; WebDAV support for mounting storage as a network drive; and collaborative spaces with fine-grained access controls for teams, along with authentication options spanning local accounts, OIDC, LDAP, and multi-factor authentication.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sync-in is free and open-source, and the project describes itself as independent. There is no disclosed public pricing page for a paid hosted tier; organizations self-host the platform on their own infrastructure. Separate enterprise support services are mentioned by the project for organizations that want vendor assistance.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SyncMarks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SyncMarks is a free, open-source, self-hosted bookmark synchronization tool combining a web app and browser extensions to sync bookmarks across Firefox, Edge, and Chrome without a third-party cloud service.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SyncMarks: Self-Hosted Bookmark Sync Overview$q$, seo_title),
  seo_meta_description = COALESCE($q$SyncMarks is an open-source, self-hosted bookmark sync tool for Firefox, Edge, and Chrome. See features, setup, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SyncMarks is a free, open-source bookmark synchronization system maintained by the developer Offerel on Codeberg and GitHub. It consists of two main components: SyncMarks-Webapp, a self-hosted PHP and JavaScript backend that acts as a central hub for bookmarks and can be used independently in any browser, and SyncMarks-Extension, a browser extension for Firefox, Microsoft Edge, and Chromium-based browsers that syncs bookmarks and tabs with that self-hosted backend via a REST API. The project is released under the AGPL-3.0 license and is aimed at privacy-conscious users who want cross-browser bookmark syncing without relying on a vendor cloud account such as a Google or Microsoft sign-in. Users can add, edit, delete, and move bookmarks directly in the web app, with changes syncing back out to connected browsers either manually or automatically. The extension is distributed through the Mozilla Add-ons store and the Microsoft Edge Store. There is no company behind SyncMarks, no paid tier, and no disclosed founding date, team size, or headquarters, as it is a community-maintained open-source project rather than a commercial product. It suits self-hosters and homelab users who already run their own infrastructure and want one more piece of their browsing data kept off third-party servers.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Cross-browser bookmark sync$q$, $q$Synchronizes bookmarks across Firefox, Microsoft Edge, Chrome, and other Chromium-based browsers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Self-hosted backend$q$, $q$SyncMarks-Webapp runs on your own server, keeping bookmark data off third-party cloud services.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Standalone web app usage$q$, $q$The webapp can be used independently of the browser extension to manage bookmarks from any browser.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$REST API sync$q$, $q$The browser extension communicates with the self-hosted backend through a REST API.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Tab sync$q$, $q$In addition to bookmarks, the extension can sync open browser tabs across devices.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Manual or automatic sync$q$, $q$Users can choose to sync bookmarks on demand or have the extension sync automatically.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Bookmark editing in the web app$q$, $q$Add, edit, delete, and reorganize bookmarks directly through the webapp interface.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Store-distributed extensions$q$, $q$Official browser extensions are published on Mozilla Add-ons and the Microsoft Edge Store.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Completely free and open-source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Keeps bookmark data on infrastructure you control rather than a vendor cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Works across Firefox, Edge, and Chromium-based browsers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Web app can be used independently of the browser extension$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Includes tab sync in addition to bookmark sync$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Requires self-hosting a PHP backend, which needs basic server skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Smaller community and less mature ecosystem than built-in browser sync$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$No official mobile app beyond browser extensions on supported platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$No verified company, funding, or long-term maintenance guarantees$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Setup involves more steps than simply signing into a built-in browser sync account$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Is SyncMarks free$q$, $q$Yes, SyncMarks is free and open-source under the AGPL-3.0 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Which browsers does SyncMarks support$q$, $q$SyncMarks supports Firefox, Microsoft Edge, and other Chromium-based browsers.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Do I need the browser extension to use SyncMarks$q$, $q$No, the SyncMarks-Webapp can be used independently in any browser without installing the extension, though the extension enables automatic syncing with your installed browsers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$What does SyncMarks run on$q$, $q$The SyncMarks-Webapp backend is built with PHP, JavaScript, and CSS and must be self-hosted on your own server.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Does SyncMarks sync open tabs$q$, $q$Yes, in addition to bookmarks, the extension can sync open tabs across connected browsers.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Who maintains SyncMarks$q$, $q$SyncMarks is maintained by the developer Offerel, with the project hosted on Codeberg and mirrored on GitHub.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Where can I download the SyncMarks extension$q$, $q$The extension is available through Mozilla Add-ons for Firefox and the Microsoft Edge Add-ons store.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Is SyncMarks suitable for non-technical users$q$, $q$It is best suited for users comfortable self-hosting a PHP backend, as there is no managed cloud version.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Self-hosted bookmark sync across browsers$q$, $q$Keeping bookmarks in sync between Firefox, Edge, and Chromium browsers without a vendor cloud account.$q$, $q$Privacy-conscious individuals and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Cross-device bookmark access via web app$q$, $q$Accessing and editing a shared bookmark collection from any browser using the standalone web app.$q$, $q$Users who switch between multiple devices and browsers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Homelab addition for personal data sovereignty$q$, $q$Adding bookmark sync to an existing self-hosted infrastructure alongside other privacy-focused tools.$q$, $q$Homelab enthusiasts$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Self-hosted (only option)$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full bookmark sync functionality","AGPL-3.0 open-source license","Browser extensions for Firefox and Edge","Standalone web app usage"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$overview$q$, $q$What Is SyncMarks$q$, 2, ARRAY[$q$SyncMarks is an open-source system for synchronizing browser bookmarks across Firefox, Microsoft Edge, and Chromium-based browsers using a self-hosted backend instead of a vendor's cloud account. It is maintained by the developer known as Offerel and hosted on Codeberg, with mirrors on GitHub.$q$, $q$The project has two parts: SyncMarks-Webapp, a PHP and JavaScript backend that stores and manages bookmarks and can be used on its own through a browser, and SyncMarks-Extension, a lightweight browser add-on that connects installed browsers to that backend over a REST API, including tab sync.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The SyncMarks-Webapp lets users add, edit, delete, and move bookmarks directly through a web interface, with changes syncing back to any connected browser. Because it runs independently of the extension, it can also serve as a standalone bookmark manager accessible from any device with a browser.$q$, $q$The SyncMarks-Extension synchronizes bookmarks, and optionally open tabs, between installed browsers and the self-hosted server, supporting manual or automatic sync. It is available for Firefox through Mozilla Add-ons and for Microsoft Edge through the Edge Add-ons store, and works with other Chromium-based browsers.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SyncMarks is completely free and open-source under the AGPL-3.0 license. There is no commercial pricing model; users only need their own server or hosting to run the SyncMarks-Webapp backend.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Syncthing ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Syncthing is a free, open-source, peer-to-peer continuous file synchronization tool that syncs files directly between devices without a central server, maintained by the nonprofit Syncthing Foundation.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Syncthing: Open-Source Peer-to-Peer File Sync Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Syncthing is a free, open-source, peer-to-peer file synchronization tool. See features, platforms, pricing, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Syncthing is a free, open-source, continuous file synchronization program that transfers files directly between two or more devices over its own Block Exchange Protocol, without routing data through a central server or third-party cloud. Its inception dates to December 15, 2013, and version 1.0 shipped in 2019 after roughly five years in beta. The project is developed and maintained under the Syncthing Foundation, a Swedish nonprofit, with commercial support and development sponsorship provided by Kastelo Inc. and additional sponsors including Mobius Sync and REEF Solutions. Written in Go, Syncthing runs on Windows, macOS, Linux, FreeBSD, Solaris, OpenBSD, Android, and iOS, and all data transfers are encrypted using TLS with cryptographic certificates authenticating trusted devices. Because there is no central server, users retain full control and privacy over synced data, configuring peer relationships and folder sharing through a browser-based local web interface. Syncthing has no paid tiers, subscriptions, or company behind it in the traditional commercial sense; it is entirely free to download, use, and modify, and is popular among self-hosters, homelab users, and anyone wanting Dropbox-style continuous sync without a cloud intermediary.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Peer-to-peer synchronization$q$, $q$Transfers files directly between devices without routing data through a central server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$No central server required$q$, $q$Files stay under user control on the participating devices rather than in a third-party cloud.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$TLS-encrypted transfers$q$, $q$Secures all data in transit with TLS encryption and perfect forward secrecy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Certificate-based device authentication$q$, $q$Uses cryptographic certificates to control which devices are trusted to sync.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Open protocol and source$q$, $q$The Block Exchange Protocol and full source code are publicly documented and available on GitHub.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Broad platform support$q$, $q$Runs on Windows, macOS, Linux, FreeBSD, Solaris, OpenBSD, Android, and iOS.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Browser-based web interface$q$, $q$Managed through a local web UI designed to work with minimal setup.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Continuous sync$q$, $q$Monitors folders and syncs changes automatically as files are added or modified.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Completely free and open-source with no paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$True peer-to-peer design with no central server storing data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Strong encryption and certificate-based device authentication$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Wide platform support across desktop and mobile operating systems$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Backed by a nonprofit foundation with commercial sponsor support$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$No built-in cloud backup, since it syncs between devices rather than to a remote server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Initial setup of device pairing can be less intuitive than consumer cloud sync tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Relies on devices being online simultaneously for real-time sync between them$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$No official enterprise-managed dashboard beyond community and Kastelo support offerings$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Conflict resolution for simultaneous edits requires manual review$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Is Syncthing free$q$, $q$Yes, Syncthing is completely free and open-source software with no paid tiers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Does Syncthing use a central server$q$, $q$No, Syncthing synchronizes files directly between devices using a peer-to-peer protocol, with no central server storing data.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$What platforms does Syncthing support$q$, $q$Syncthing runs on Windows, macOS, Linux, FreeBSD, Solaris, OpenBSD, Android, and iOS.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Who maintains Syncthing$q$, $q$Syncthing is maintained by the Syncthing Foundation, a Swedish nonprofit, with commercial support from Kastelo Inc. and other sponsors.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$When was Syncthing created$q$, $q$Syncthing's inception dates to December 15, 2013, with its 1.0 release arriving in 2019.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Is Syncthing secure$q$, $q$Yes, all data transfers are encrypted using TLS with perfect forward secrecy, and devices authenticate using cryptographic certificates.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$What language is Syncthing written in$q$, $q$Syncthing is written in Go.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Can Syncthing sync files over the internet, not just a local network$q$, $q$Yes, Syncthing can sync files between devices on a local network or remotely over the internet.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Cross-device file sync without the cloud$q$, $q$Keeping folders synchronized between a laptop, desktop, and phone without storing data on a third-party server.$q$, $q$Privacy-conscious individuals and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Homelab and NAS backup workflows$q$, $q$Using Syncthing as part of a self-hosted backup or replication setup between home servers and devices.$q$, $q$Homelab enthusiasts and system administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Team file sharing without cloud storage fees$q$, $q$Syncing shared project folders between team members' machines without paying for cloud storage subscriptions.$q$, $q$Small teams and independent professionals$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Open source (only option)$q$, $q$Free$q$, $q$one-time setup, self-managed$q$, NULL, $q$["Full peer-to-peer sync functionality","No account or subscription required","Cross-platform desktop and mobile support","Optional commercial support available from Kastelo Inc."]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$overview$q$, $q$What Is Syncthing$q$, 2, ARRAY[$q$Syncthing is an open-source, continuous file synchronization program that keeps folders in sync across two or more devices in real time. Unlike cloud storage services, it transfers files directly between devices peer-to-peer, with no central server storing user data.$q$, $q$Syncthing's inception dates to December 15, 2013, and it reached its 1.0 release in 2019 after about five years of beta development. It is maintained by the Syncthing Foundation, a Swedish nonprofit organization, with Kastelo Inc. providing commercial support and additional funding from sponsors such as Mobius Sync and REEF Solutions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Syncthing is built around privacy and security: all data transfers are encrypted with TLS and include perfect forward secrecy, and devices authenticate one another using cryptographic certificates rather than relying on a shared password or central account.$q$, $q$The protocol and source code are fully open and documented on GitHub, and the tool is managed through a browser-based, local web interface designed to require minimal configuration. It runs across a wide range of operating systems, including Windows, macOS, Linux, FreeBSD, Solaris, OpenBSD, Android, and iOS.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Syncthing is completely free and open-source software with no licensing fees or commercial tiers for the core product. Kastelo Inc. offers separate commercial support services for organizations that want professional assistance, but running Syncthing itself costs nothing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;


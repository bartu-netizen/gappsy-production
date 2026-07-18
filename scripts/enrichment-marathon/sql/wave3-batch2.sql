-- Enrichment marathon batch: Aptabase, Apty, Arc, Archbee, archivebox, archivesspace, Ardour, Arize Phoenix

-- ── Aptabase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Aptabase is an open-source, privacy-first analytics platform for mobile, desktop, and web apps that tracks events without cookies or personal identifiers.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (up to 20,000 events/month)$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Aptabase: Privacy-First Analytics for Apps$q$, seo_title),
  seo_meta_description = COALESCE($q$Open-source, privacy-first analytics for mobile, desktop, and web apps. Track events anonymously with real-time dashboards. Free tier available.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Aptabase is an open-source analytics platform built as a privacy-focused alternative to tools like Google Firebase Analytics and Google Analytics. Founded by developer Guilherme Oenning and launched in January 2023, Aptabase lets developers of mobile, desktop, and web applications track events and usage patterns without collecting personal identifiers, device fingerprints, or cookies, positioning it as compliant-by-design with regulations like GDPR and CCPA. The platform provides more than 10 lightweight SDKs covering platforms such as Swift/iOS, Kotlin/Android, Flutter, .NET MAUI, Electron, Tauri, Unity, Unreal Engine, React Native, NativeScript, Python, and standard web/Next.js/Angular apps. Its dashboard offers real-time event tracking, a live session view, and CSV export, and the full codebase is available on GitHub, meaning teams can self-host it entirely for free. For teams that prefer a managed service, Aptabase offers hosted plans in EU or US data centers with a free tier (up to 20,000 events per month) and usage-based paid tiers billed by monthly event volume, with no overage charges — instead, tracking pauses until the next billing cycle if a limit is hit. Aptabase is aimed at indie developers and small-to-midsize product teams who want basic, anonymous product analytics (button clicks, feature usage, custom events) without the complexity, cost, or privacy tradeoffs of larger analytics suites. Because users retain full data ownership and Aptabase states it never sells or otherwise uses customer data, it appeals particularly to privacy-conscious developers building consumer apps.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '21d33c94-55de-4a2a-a6a5-45f0099564e0' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Anonymous session tracking$q$, $q$No device identifiers, cookies, or fingerprinting are used to track users.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Real-time dashboard$q$, $q$Live event view and session timeline update instantly as users interact with your app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$10+ platform SDKs$q$, $q$Lightweight SDKs for iOS, Android, Flutter, Electron, Tauri, Unity, Unreal Engine, React Native, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Self-hosted or managed hosting$q$, $q$Run Aptabase on your own infrastructure or use its managed EU/US-hosted service.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$CSV export and data ownership$q$, $q$Export raw event data and retain full ownership; Aptabase states it does not sell or reuse customer data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Custom event tracking$q$, $q$Track button clicks, feature usage, and other custom app behaviors.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Fully open source and self-hostable at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Privacy-first design with no cookies or device fingerprinting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Broad SDK coverage across mobile, desktop, and web platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Generous free tier (20,000 events/month) with no overage fees$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Smaller and newer than established analytics platforms, so advanced behavioral analytics (deep funnels, cohorts) are more limited$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Anonymity-by-design means less granular per-user tracking than identity-based analytics tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Exact paid-tier pricing requires configuring event volume on the site rather than being listed upfront$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Is Aptabase free?$q$, $q$Yes. Aptabase offers a free hosted tier for up to 20,000 events per month, and since it's fully open source, it can also be self-hosted at no cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Is Aptabase really anonymous?$q$, $q$Aptabase states it does not use device identifiers, cookies, or fingerprinting techniques to track users, keeping sessions anonymous.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$What platforms does Aptabase support?$q$, $q$Aptabase provides SDKs for over 10 platforms, including iOS, Android, Flutter, Electron, Tauri, Unity, Unreal Engine, and standard web apps.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Can I self-host Aptabase?$q$, $q$Yes. Since Aptabase is 100% open source, teams can deploy and run it on their own infrastructure.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Mobile app analytics$q$, $q$Track feature usage and events in native iOS and Android apps without collecting personal data.$q$, $q$Mobile app developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Desktop app telemetry$q$, $q$Monitor usage in Electron or Tauri desktop applications.$q$, $q$Desktop app teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Privacy-compliant web analytics$q$, $q$Add anonymous event tracking to web apps while staying aligned with GDPR/CCPA.$q$, $q$Privacy-conscious SaaS teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Free$q$, $q$Free$q$, $q$monthly$q$, NULL, $q$["Up to 20,000 events/month","Unlimited apps","EU or US data residency","Built-in dashboard","Live view & session timeline","CSV export"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Paid$q$, $q$Usage-based (varies by monthly event volume)$q$, $q$monthly$q$, NULL, $q$["Higher event volume limits","No overage fees (pauses until next cycle if exceeded)","All free tier features"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '21d33c94-55de-4a2a-a6a5-45f0099564e0';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aptabase is a 100% open-source analytics platform designed as a privacy-first alternative to Firebase Analytics and similar mobile/desktop analytics SDKs. It was launched in January 2023 by developer Guilherme Oenning.$q$, $q$Rather than relying on device identifiers, cookies, or fingerprinting, Aptabase anonymizes sessions by design, which the project positions as a natural fit for GDPR and CCPA compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Aptabase ships more than 10 lightweight SDKs spanning iOS (Swift), Android (Kotlin), Flutter, .NET MAUI, Electron, Tauri, Unity, Unreal Engine, React Native, NativeScript, Python, and standard web frameworks like Next.js and Angular.$q$, $q$Its dashboard provides real-time event tracking, a live session timeline, and CSV export, and users can choose EU or US-hosted data residency, or self-host the entire stack since the source code is fully public.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Aptabase offers a free hosted tier covering up to 20,000 events per month, alongside usage-based paid tiers priced by monthly event volume. There are no overage fees; if a plan's limit is exceeded, tracking simply pauses until the next billing cycle. Because the project is open source, it can also be self-hosted at no cost.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Apty ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apty is an AI-powered Digital Adoption Platform that delivers in-app guidance and workflow analytics to boost user adoption of enterprise apps like Salesforce and Workday.$q$, short_description),
  pricing_model = COALESCE(NULL, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Hyderabad, India$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Apty: AI Digital Adoption Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$AI-powered digital adoption platform delivering in-app guidance and analytics to boost enterprise software adoption.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apty is an AI-powered Digital Adoption Platform (DAP) that helps enterprises increase the usage and effectiveness of the business software their employees rely on, such as Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, and Infor, as well as custom-built internal applications. The company was originally founded in 2018 in Hyderabad, India as letzNav before rebranding to Apty in 2019. It builds contextual, in-app guidance — tooltips, walkthroughs, and step-by-step workflows — designed to reduce training time and prevent workflow errors before they happen. Its core products include Apty AI, which uses AI to help create in-app guidance content, walkthroughs, and adoption analytics, and Apty PULSE, which monitors real-time application usage, tracks engagement, and flags adoption risks early. The platform also includes workflow validation, compliance monitoring, and ROI/adoption analytics dashboards. Apty reports supporting more than 7 million users across enterprise applications for customers including Hitachi, Mary Kay, Mattel, Wyndham, Philips, and Lockheed Martin, and is referenced in analyst reports such as Everest Group's PEAK Matrix for Digital Adoption Platforms. Apty is built for enterprise IT operations, training and learning teams, digital transformation leaders, and department managers who need employees to adopt complex software correctly and consistently. Pricing is not publicly listed on Apty's website and is provided through a custom quote after a demo or consultation.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e097cf49-379b-418c-9290-d13e3cc829ec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e097cf49-379b-418c-9290-d13e3cc829ec' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Apty AI$q$, $q$AI-assisted content creation for in-app guidance, tooltips, and walkthroughs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Apty PULSE$q$, $q$Real-time workflow monitoring, engagement tracking, and early adoption-risk alerts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Contextual in-app guidance$q$, $q$Step-by-step tooltips and walkthroughs embedded directly inside enterprise applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Workflow validation & compliance monitoring$q$, $q$Ensures users follow required business processes correctly.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Adoption analytics & ROI measurement$q$, $q$Dashboards to track usage, engagement, and the business impact of software rollouts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$100+ enterprise app integrations$q$, $q$Works with Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, Infor, and custom applications.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Broad library of 100+ enterprise application integrations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$AI-assisted authoring for in-app guidance content$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Real-time adoption analytics and risk alerting via Apty PULSE$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Proven enterprise customer base including Fortune 500 companies$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Pricing is not publicly available and requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Primarily built for large enterprises, which may be overkill for small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$As with most enterprise DAPs, implementation likely requires dedicated onboarding effort$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$What is Apty?$q$, $q$Apty is an AI-powered Digital Adoption Platform that provides in-app guidance and analytics to help enterprises drive adoption of software like Salesforce and Workday.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Which applications does Apty support?$q$, $q$Apty integrates with 100+ enterprise applications, including Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, and Infor, plus custom-built applications.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$How much does Apty cost?$q$, $q$Apty does not publish pricing; you need to request a demo or quote through its website.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Who uses Apty?$q$, $q$IT operations, training/L&D teams, and digital transformation leaders at large enterprises such as Hitachi, Mary Kay, and Lockheed Martin.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Enterprise software rollout guidance$q$, $q$Guide employees through new or complex enterprise software with in-app walkthroughs.$q$, $q$IT and digital transformation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Employee training and onboarding$q$, $q$Reduce training time by embedding contextual help directly in workflows.$q$, $q$Training and L&D leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Adoption analytics and ROI tracking$q$, $q$Measure how well employees are using purchased software licenses.$q$, $q$Department managers and software owners$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apty is an AI-powered Digital Adoption Platform originally founded in 2018 (as letzNav, rebranded to Apty in 2019) and headquartered in Hyderabad, India.$q$, $q$It focuses on helping large organizations get more value out of the enterprise software they already own by guiding employees through workflows inside applications like Salesforce, Workday, and ServiceNow.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Apty AI uses AI to help teams author in-app guidance, tooltips, and walkthroughs, while Apty PULSE monitors application usage in real time and flags adoption risks before they become support tickets.$q$, $q$The platform also includes workflow validation and compliance monitoring, plus adoption analytics and ROI dashboards, and integrates with 100+ enterprise applications including Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, and Infor.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Apty targets large enterprises rather than small teams — its customer base includes Hitachi, Mary Kay, Mattel, Wyndham, Philips, and Lockheed Martin — and is typically used by IT operations, training/L&D, and digital transformation teams.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Arc ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Arc is a financial platform for technology and growth companies offering cash management, yield-bearing accounts, debt capital raising, and AI-powered treasury tools.$q$, short_description),
  pricing_model = COALESCE($q$Free plan + paid membership tiers$q$, pricing_model),
  starting_price = COALESCE($q$Free (Essentials plan, no membership fee)$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Arc: Cash Management & Treasury for Tech Cos$q$, seo_title),
  seo_meta_description = COALESCE($q$Arc offers cash management, competitive yield, debt capital, and AI-powered treasury tools for technology and growth companies.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Arc (Arc Technologies, accessed via joinarc.com) is a financial technology platform built for technology and growth-stage companies to manage corporate cash, earn yield, raise debt capital, and access AI-powered treasury and finance tools from a single dashboard. Founded in 2021 by Don Muir and Nick Lombardo and headquartered in San Francisco with an additional office in New York City, Arc has raised roughly $180 million from investors including Y Combinator, Bain Capital Ventures, and NFX. In July 2026, Axos Financial announced a definitive agreement to acquire Arc Technologies, extending Axos's small-business and fintech banking capabilities. Arc's product spans cash management and treasury (with yield on idle cash and brokerage services), a corporate card with cashback rewards, a Debt Marketplace for raising venture debt and other capital, and 'Archie,' an AI CFO agent that assists with financial analysis. Arc offers three membership tiers: Essentials (no membership fee, net yield up to roughly 4.12% and 1% card cashback), Premium (paid annual membership, higher yield up to about 4.52%, a dedicated relationship manager, and unlimited access to Archie), and Enterprise (custom pricing, dedicated support, and tailored feature builds). Arc is designed for founders, finance teams, and CFOs at venture-backed startups and growth companies who need to manage treasury operations, optimize idle cash, and access growth capital without juggling multiple financial vendors.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5b1475af-f4bc-459d-ac77-e29162361ec3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5b1475af-f4bc-459d-ac77-e29162361ec3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Cash management & treasury$q$, $q$Earn yield on idle cash balances alongside integrated brokerage services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Corporate card with cashback$q$, $q$Card spend earns cashback rewards that scale with membership tier.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Debt Marketplace$q$, $q$Access venture debt and other capital-raising options directly through the platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Archie (AI CFO agent)$q$, $q$AI-powered assistant for financial analysis and treasury decisions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Tiered membership plans$q$, $q$Essentials, Premium, and Enterprise tiers scale yield, support, and features.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Free-to-join Essentials tier with no membership fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Yield-bearing cash management built specifically for startups$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Integrated debt-raising marketplace alongside banking tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$AI CFO agent (Archie) included for financial analysis$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Higher yield and premium features are gated behind paid annual membership tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Enterprise pricing requires contacting sales rather than being published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$The company is in the process of being acquired by Axos Financial, which could affect the product roadmap$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$What is Arc?$q$, $q$Arc is a financial platform for technology and growth companies offering cash management, yield, debt capital access, and AI-powered treasury tools.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Is there a free plan?$q$, $q$Yes, the Essentials tier carries no membership fee and includes core cash management, treasury, spend, and support features.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Is Arc being acquired?$q$, $q$Yes. In July 2026, Axos Financial announced a definitive agreement to acquire Arc Technologies.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Who is Arc for?$q$, $q$Founders, finance teams, and CFOs at venture-backed startups and growth companies.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Startup treasury management$q$, $q$Manage idle cash, earn yield, and centralize banking operations.$q$, $q$Startup finance teams and CFOs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Raising venture debt$q$, $q$Access debt capital through Arc's Debt Marketplace.$q$, $q$Growth-stage companies seeking capital$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$AI-assisted financial analysis$q$, $q$Use Archie to analyze cash flow and financial data without a large finance team.$q$, $q$Founders without dedicated finance staff$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Essentials$q$, $q$No membership fee$q$, $q$n/a$q$, NULL, $q$["Net yield up to ~4.12%","1.0% cashback on card spend","Core cash management, treasury, spend, security, and support features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Premium$q$, $q$Paid annual membership$q$, $q$annual$q$, NULL, $q$["Net yield up to ~4.52%","1.5% cashback on card spend","Dedicated relationship manager","Unlimited access to Archie AI agent","Reduced Debt Marketplace fees"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$annual$q$, NULL, $q$["Net yield up to ~4.57%","2.0% cashback on card spend","Custom fixed pricing","Dedicated support team","Custom feature builds, onboarding, and analytics"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Arc is a financial platform built specifically for technology and growth-stage companies, combining cash management, yield, debt capital access, and AI-powered finance tools in one dashboard.$q$, $q$Founded in 2021 by Don Muir and Nick Lombardo and headquartered in San Francisco, Arc has raised roughly $180 million from investors including Y Combinator and Bain Capital Ventures. In July 2026, Axos Financial announced a definitive agreement to acquire Arc Technologies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Arc provides cash management and treasury tools with yield on idle balances, a corporate card with cashback rewards, and a Debt Marketplace for raising venture debt and other growth capital.$q$, $q$The platform also includes Archie, an AI CFO agent that assists with financial analysis, and brokerage services are included across all membership tiers.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Arc offers three tiers: Essentials, which carries no membership fee and provides core cash management, treasury, spend, and support features; Premium, a paid annual membership with higher yield, a dedicated relationship manager, and unlimited access to Archie; and Enterprise, with custom pricing, dedicated support, and tailored feature builds available through sales.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Archbee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Archbee is a documentation platform that turns technical docs into searchable, AI-powered knowledge portals for developer, product, and support teams.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (with free trial)$q$, pricing_model),
  starting_price = COALESCE($q$$80/month (Growing plan)$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE($q$~12 employees (per Y Combinator listing)$q$, company_size),
  headquarters = COALESCE($q$Bucharest, Romania$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Archbee: AI-Powered Docs & Knowledge Portals$q$, seo_title),
  seo_meta_description = COALESCE($q$Archbee turns technical documentation into searchable, AI-powered knowledge portals with Git-like versioning, custom domains, and 1800+ integrations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Archbee is a documentation and knowledge portal platform that helps technical teams turn static docs into searchable, AI-assisted resources for developers, customers, and internal staff. Founded in 2019 by Dragos Bulugean and based in Bucharest, Romania, Archbee went through Y Combinator's Summer 2021 batch and has raised roughly $4 million from investors including Credo Ventures, Global Founders Capital, and Inovo VC. The platform provides Git-like content branches, drafts, and collaborative editing; dynamic content features such as variables, reusable snippets, and display rules; AI-powered translations and an AI assistant that can answer reader questions directly from the documentation; and publishing tools including custom-domain hosting, SEO optimization, user authentication, and in-app embedding. Archbee reports more than 1,800 integrations (including GitHub, GitLab, Slack, Zendesk, Intercom, Jira, and Figma) and says it is used by 3,000+ companies, including Adobe, Honeywell, Cisco, Disney, and Accenture. It is SOC 2 certified, GDPR compliant, and Data Privacy Framework certified. Pricing starts at $80/month for the Growing plan (unlimited readers, custom domain, GitHub integration, 10GB storage), scales to $350/month for the Scaling plan (adds versioning, localization, and search analytics), and a custom-priced Enterprise plan (SSO, multiple organizations, AI translations at scale). A free trial is available, along with discounts for startups, open-source projects, and nonprofits. Archbee is aimed at engineering, product, and support teams that need a single documentation hub for both internal and customer-facing knowledge.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0eab6628-ac5f-4215-9f5b-92be748bae51';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0eab6628-ac5f-4215-9f5b-92be748bae51' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Git-like content branches$q$, $q$Version-controlled drafts and collaborative editing for documentation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Dynamic content$q$, $q$Variables, reusable snippets, and display rules for maintainable docs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$AI-powered translations and Q&A$q$, $q$AI assistant answers reader questions directly from your documentation content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Custom domain hosting$q$, $q$Publish docs on your own domain with built-in SEO optimization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$1800+ integrations$q$, $q$Connects with GitHub, GitLab, Slack, Zendesk, Intercom, Jira, Figma, and more.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Compliance certifications$q$, $q$SOC 2 certified, GDPR compliant, and Data Privacy Framework certified.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Extensive integration library (1,800+)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$AI-assisted translation and reader Q&A$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Git-like versioning built for technical documentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Strong compliance credentials (SOC 2, GDPR, DPF)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Starting price ($80/month) is higher than some lightweight docs tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Advanced features like versioning, localization, and SSO are reserved for higher-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$No free-forever plan for commercial use — only open-source projects qualify for a free Growing plan$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$How much does Archbee cost?$q$, $q$Plans start at $80/month for Growing, $350/month for Scaling, with custom pricing for Enterprise.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Is there a free plan?$q$, $q$Open-source projects get a free Growing plan; other users can access a full-featured free trial.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$What integrations does Archbee support?$q$, $q$Archbee reports 1,800+ integrations, including GitHub, GitLab, Slack, Zendesk, Jira, and Figma.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Is Archbee good for customer-facing docs?$q$, $q$Yes, it's designed to serve both internal knowledge management and customer-facing documentation portals.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Developer and API documentation$q$, $q$Build searchable, versioned technical documentation for developers.$q$, $q$Engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Customer-facing knowledge base$q$, $q$Publish a branded help center that answers customer questions.$q$, $q$Support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Internal knowledge management$q$, $q$Centralize internal process and product documentation.$q$, $q$Product and operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Growing$q$, $q$$80/month$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited readers and project spaces","Public/private portals","Custom domain & branding","GitHub integration","API documentation","10GB file storage + 2GB per member","1-year document revision history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Scaling$q$, $q$$350/month$q$, $q$monthly or annual$q$, NULL, $q$["Everything in Growing","Complete branding control","Review system","Reusable content & variables","Versioning & localization","Search analytics","20GB file storage + 10GB per member","2-year document revision history"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Everything in Scaling","SAML & OIDC SSO","Multiple teams/organizations","AI-assisted translations at scale","Priority support","100GB file storage + 10GB per member","5-year document revision history"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Archbee is a documentation and knowledge portal platform founded in 2019 by Dragos Bulugean, based in Bucharest, Romania, and a graduate of Y Combinator's Summer 2021 batch.$q$, $q$It helps technical teams turn static documentation into searchable, interactive knowledge portals that serve both internal staff and customers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Archbee offers Git-like content branches, drafts, and collaborative editing, plus dynamic content tools like variables, reusable snippets, and display rules.$q$, $q$It includes AI-powered translations and an AI assistant that answers reader questions directly from the documentation, along with publishing features like custom-domain hosting, SEO optimization, user authentication, and in-app embedding.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Archbee's Growing plan starts at $80/month with unlimited readers, custom domain, and GitHub integration. The Scaling plan is $350/month and adds versioning, localization, and search analytics. Enterprise is custom-priced and adds SSO and multi-organization support. A free trial is available, plus discounts for startups, open-source projects, and nonprofits.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Archbee reports more than 1,800 integrations, including GitHub, GitLab, Slack, Zendesk, Intercom, Jira, and Figma, and is used by 3,000+ companies including Adobe, Honeywell, Cisco, Disney, and Accenture.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── archivebox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$ArchiveBox is a free, open-source, self-hosted tool that archives websites, bookmarks, and social media posts as durable local files (HTML, PDF, WARC, screenshots).$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$ArchiveBox: Self-Hosted Web Archiving Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Free, open-source, self-hosted tool for archiving websites and bookmarks as HTML, PDF, WARC, and screenshots you control.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ArchiveBox is a free, open-source web archiving tool maintained by Nick Sweeting and the ArchiveBox community (previously named Pocket Archive Stream and Bookmark Archiver). It preserves websites, bookmarks, RSS feed items, and social media posts by saving them as ordinary files and folders on disk, indexed with SQLite metadata, so archives remain independently readable without relying on ArchiveBox itself. For each URL, ArchiveBox can capture multiple redundant formats, including full-page HTML, PDF, PNG screenshots, WARC files, JSON, plain text, and MP4 video/media. Content can be added via single URLs, browser bookmarks, RSS feeds, CSV/JSON imports, or scheduled pulls, and accessed through a web UI, command-line interface, REST API, webhooks, or a browser extension. ArchiveBox is released under the MIT license, is entirely free with no subscription cost, and is designed to be self-hosted, most commonly via Docker or Docker Compose, though bare-metal, pip, and package-manager installs are also supported on Linux and macOS. It also supports static exports (HTML, JSON, or CSV indexes) that can be viewed without running the ArchiveBox server, and integrates with bookmarking services like Pocket, Pinboard, Instapaper, and Wallabag, as well as storage backends such as NFS, SMB, S3, B2, and Google Drive. ArchiveBox is aimed at personal archivists, self-hosters, journalists and lawyers documenting sources, researchers, and OSINT practitioners who want durable, independently readable, offline-first archives of web content they don't want to lose to link rot.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3dd438a5-8354-47f1-89d7-033079a89cc5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3dd438a5-8354-47f1-89d7-033079a89cc5' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Multi-format capture$q$, $q$Saves each page as HTML, PDF, PNG screenshot, WARC, JSON, plain text, and MP4.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Flexible import options$q$, $q$Add content via URLs, browser bookmarks, RSS feeds, CSV/JSON imports, or scheduled pulls.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Multiple access methods$q$, $q$Web UI, CLI, REST API, webhooks, and a browser extension.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Self-contained file storage$q$, $q$All archived data lives in inspectable files and folders with SQLite metadata.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Static exports$q$, $q$Generate standalone HTML, JSON, or CSV indexes viewable without running the server.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Bookmark service integrations$q$, $q$Import from Pocket, Pinboard, Instapaper, and Wallabag.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Archives stored as plain, inspectable files rather than a proprietary format$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Multiple capture formats provide redundancy against link rot$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Flexible import sources and access methods (web, CLI, API, browser extension)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Requires self-hosting and basic server/Docker knowledge — there's no managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Archiving JavaScript-heavy or paywalled sites can be inconsistent, as with most web archiving tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$No official company or paid support tier; relies on community maintenance$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Is ArchiveBox free?$q$, $q$Yes, ArchiveBox is completely free and open source under the MIT license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Do I need to self-host ArchiveBox?$q$, $q$Yes, ArchiveBox is designed to run on your own infrastructure, most commonly via Docker or Docker Compose.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$What formats does ArchiveBox save?$q$, $q$It can capture HTML, PDF, PNG screenshots, WARC, JSON, plain text, and MP4 for each archived URL.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Can I import my existing bookmarks?$q$, $q$Yes, ArchiveBox supports imports from services like Pocket, Pinboard, Instapaper, and Wallabag, as well as CSV/JSON and RSS feeds.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Personal link archiving$q$, $q$Preserve bookmarks and articles so they remain accessible even if the original page disappears.$q$, $q$Self-hosters and personal archivists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Source documentation for journalism and law$q$, $q$Capture durable, verifiable snapshots of web sources cited in reporting or legal work.$q$, $q$Journalists and lawyers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Research and OSINT collection$q$, $q$Build offline-first archives of web content for research or investigative work.$q$, $q$Researchers and OSINT practitioners$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3dd438a5-8354-47f1-89d7-033079a89cc5';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ArchiveBox is a free, open-source, self-hosted web archiving tool maintained by Nick Sweeting and the ArchiveBox community. It preserves websites, bookmarks, RSS items, and social posts as durable local files rather than relying on a third-party archive service.$q$, $q$Archives are stored as ordinary files and folders indexed with SQLite metadata, so the data remains readable independently of ArchiveBox itself.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$For each URL, ArchiveBox can capture multiple redundant formats — HTML, PDF, PNG screenshots, WARC, JSON, plain text, and MP4 — and can ingest content via single URLs, browser bookmarks, RSS feeds, CSV/JSON imports, or scheduled pulls.$q$, $q$It's accessible through a web UI, CLI, REST API, webhooks, and a browser extension, and can also generate static HTML/JSON/CSV exports that work without the server running.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ArchiveBox is built for personal archivists, self-hosters, journalists and lawyers documenting sources, researchers, institutions, and OSINT practitioners who need durable, offline-first archives immune to link rot.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── archivesspace ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$ArchivesSpace is a free, open-source archives management system used by libraries, museums, and institutions to describe, manage, and provide access to collections.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Atlanta, Georgia (Lyrasis, organizational home)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$ArchivesSpace: Open-Source Archives Manager$q$, seo_title),
  seo_meta_description = COALESCE($q$Open-source archives management system for accessioning, description, and access to collections, used by libraries and museums worldwide.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ArchivesSpace is an open-source archives management system used to accession, arrange, describe, provide access to, and preserve archival collections, manuscripts, and digital objects. The project originated in 2009 as a partnership between New York University, the University of California San Diego, and the University of Illinois Urbana-Champaign, supported by the Andrew W. Mellon Foundation, to merge the earlier Archivists' Toolkit and Archon systems into a single next-generation application. Following a development phase, ArchivesSpace 1.0 was released on September 30, 2013. In 2012, the nonprofit Lyrasis (headquartered in Atlanta, Georgia) was selected as ArchivesSpace's organizational home, and it continues to host the project's governance, membership program, and technical support. ArchivesSpace is free to download and use under an open-source license, with the latest releases published on GitHub. It offers a single integrated platform for archival metadata management, intellectual and physical collection control, and web-based access and discovery, alongside support for digital objects. It can be deployed via a standard distribution or Docker. While free to use, ArchivesSpace also offers optional paid membership at five tiers, which provides technical support, access to user manuals, and voting rights on future development priorities. ArchivesSpace is used by archives, libraries, museums, academic institutions, public libraries, corporate archives, and government repositories of all sizes worldwide.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9fff7050-4742-4d9d-90c3-b117262e1fcf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9fff7050-4742-4d9d-90c3-b117262e1fcf' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Accessioning and description$q$, $q$Manage the full archival workflow from accessioning through arrangement and description.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Digital object support$q$, $q$Manage digital objects alongside traditional physical archival materials.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Web-based access and discovery$q$, $q$Public-facing search and discovery interface for collections.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Customizable staff interface$q$, $q$Configurable backend UI for archivists' day-to-day workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Open-source and self-hostable$q$, $q$Free to download, with standard and Docker distributions available.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Purpose-built for archival standards and workflows (accessioning, arrangement, description)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Backed by an established nonprofit (Lyrasis) with a formal governance structure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Optional paid membership provides support and a voice in the project's roadmap$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Requires self-hosting and IT resources to deploy and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Full technical support requires a paid membership tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Built specifically for archival/GLAM workflows, so it isn't a general-purpose DAM or CMS$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Is ArchivesSpace free?$q$, $q$Yes, it's free to download and use, though optional paid membership tiers offer technical support and other benefits.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Who maintains ArchivesSpace?$q$, $q$The nonprofit Lyrasis, based in Atlanta, Georgia, serves as the project's organizational home, supported by a community governance board.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$When was ArchivesSpace released?$q$, $q$ArchivesSpace 1.0 was released on September 30, 2013, following a project that began in 2009.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Who uses ArchivesSpace?$q$, $q$Archives, libraries, museums, academic institutions, and government repositories of all sizes.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Archival collection management$q$, $q$Accession, arrange, and describe manuscripts and archival collections.$q$, $q$Archivists at libraries and institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Digital object preservation$q$, $q$Manage born-digital and digitized materials alongside physical collections.$q$, $q$Digital archivists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Public collection discovery$q$, $q$Provide a searchable public interface to archival holdings.$q$, $q$Researchers and the public$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ArchivesSpace is an open-source archives management system that originated in 2009 as a collaboration between NYU, UC San Diego, and the University of Illinois Urbana-Champaign, supported by the Andrew W. Mellon Foundation, to merge the Archivists' Toolkit and Archon into a single next-generation system.$q$, $q$ArchivesSpace 1.0 was released on September 30, 2013, and the nonprofit Lyrasis (headquartered in Atlanta, Georgia) has served as the project's organizational home since 2012.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform provides a single integrated system for accessioning, arrangement, description, and preservation of archival collections, along with intellectual and physical collection control.$q$, $q$It supports digital objects alongside traditional physical materials, offers a customizable staff interface, and includes web-based access and discovery tools for the public.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$ArchivesSpace is free to download and use. Optional paid membership, offered at five tiers through Lyrasis, provides technical support, access to user manuals, and voting rights on future development.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ardour ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ardour is a free, open-source digital audio workstation for recording, editing, and mixing audio and MIDI on Linux, macOS, and Windows.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) + pay-what-you-want subscription for binaries$q$, pricing_model),
  starting_price = COALESCE($q$Free (source code); prebuilt binaries via subscription from $1/month$q$, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Ardour: Free Open-Source DAW for Linux/Mac/Win$q$, seo_title),
  seo_meta_description = COALESCE($q$Ardour is an open-source digital audio workstation for recording, editing, and mixing on Linux, macOS, and Windows. Free source, paid binaries from $1/mo.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ardour is a free and open-source digital audio workstation (DAW) that supports multi-track audio and MIDI recording, editing, and mixing. It was started by developer Paul Davis in late 1999 as a Linux-focused alternative to commercial DAWs like Pro Tools, with its first public release in 2001; today it runs on Linux, macOS, and Windows. Ardour supports plugin formats including AudioUnit, LV2, VST2, VST3, and LADSPA, offers flexible any-to-any signal routing, unlimited undo/redo, video timeline integration for scoring, sample-accurate sync to MIDI timecode and LTC, and support for external control surfaces such as Mackie Control and OSC/MIDI Learn devices. It can also import sounds directly from the Freesound database. Ardour is licensed under the GNU General Public License v2, and its full source code is always free to download and compile. For users who prefer not to compile from source, Ardour offers ready-to-run binaries funded through a pay-what-you-want model: users can subscribe for $1, $4, or $10 per month to receive prebuilt binaries and updates, download a feature-limited free demo binary that periodically interrupts playback, or use community-maintained free packages available through some Linux distributions. Ardour is aimed at musicians, audio engineers, podcasters, radio producers, and composers who want a professional-grade, cross-platform recording and mixing tool without the cost of proprietary DAWs, and who are comfortable with (or want to support) an open-source, community-driven development model.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '31cd7295-1d81-4b31-927e-f153490c69dc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '31cd7295-1d81-4b31-927e-f153490c69dc' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '31cd7295-1d81-4b31-927e-f153490c69dc';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Multi-track audio & MIDI recording$q$, $q$Record and edit audio and MIDI with unlimited undo/redo.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Broad plugin format support$q$, $q$Compatible with AudioUnit, LV2, VST2, VST3, and LADSPA plugins.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Anywhere-to-anywhere signal routing$q$, $q$Flexible routing for complex mixing and bus configurations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Video timeline integration$q$, $q$Sync audio work to a video timeline for scoring and soundtrack production.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Professional sync support$q$, $q$Sample-accurate sync to MIDI timecode and LTC.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Control surface support$q$, $q$Works with Mackie Control, OSC, and MIDI Learn-enabled hardware.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Freesound import$q$, $q$Import sounds directly from the Freesound database.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '31cd7295-1d81-4b31-927e-f153490c69dc';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Fully open-source with free access to the complete source code$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Runs natively on Linux, macOS, and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Professional-grade routing, plugin support, and sync capabilities$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Low-cost, pay-what-you-want pricing for prebuilt binaries$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '31cd7295-1d81-4b31-927e-f153490c69dc';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Free demo binaries periodically interrupt playback until purchased or subscribed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Steeper learning curve typical of professional-grade DAWs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Linux-first heritage means some workflows may feel less polished than DAWs built natively for macOS/Windows$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '31cd7295-1d81-4b31-927e-f153490c69dc';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Is Ardour free?$q$, $q$The source code is always free to compile yourself. Ready-to-run binaries are funded via pay-what-you-want subscriptions starting at $1/month, or a free time-limited demo binary.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$What platforms does Ardour run on?$q$, $q$Linux, macOS, and Windows.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$What plugin formats does Ardour support?$q$, $q$AudioUnit, LV2, VST2, VST3, and LADSPA.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Who created Ardour?$q$, $q$Developer Paul Davis started Ardour in 1999, with its first public release in 2001.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '31cd7295-1d81-4b31-927e-f153490c69dc';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Music production and mixing$q$, $q$Record, edit, and mix multi-track music projects.$q$, $q$Musicians and producers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Podcast and radio production$q$, $q$Edit and mix spoken-word audio for shows and broadcasts.$q$, $q$Podcasters and radio producers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Film and video scoring$q$, $q$Sync audio work to a video timeline for soundtrack production.$q$, $q$Composers and sound editors$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '31cd7295-1d81-4b31-927e-f153490c69dc';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Source Code$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full source code","Self-compile on Linux, macOS, or Windows","GPLv2 licensed"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Demo Binary$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Prebuilt ready-to-run binary","Playback periodically interrupted until purchased or subscribed"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Subscription$q$, $q$$1–$10/month (pay what you want)$q$, $q$monthly$q$, NULL, $q$["Prebuilt binaries for Linux, macOS, and Windows","Access to updates during the subscription period"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '31cd7295-1d81-4b31-927e-f153490c69dc';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ardour is a free, open-source digital audio workstation started by Paul Davis in late 1999, with its first public release in 2001. It's licensed under the GNU General Public License v2 and runs on Linux, macOS, and Windows.$q$, $q$It was built as a professional-grade alternative to commercial DAWs like Pro Tools, and its source code has always been free to download and compile.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Ardour supports AudioUnit, LV2, VST2, VST3, and LADSPA plugin formats, offers anywhere-to-anywhere signal routing, unlimited undo/redo, and video timeline integration for soundtrack work.$q$, $q$It includes sample-accurate sync to MIDI timecode and LTC, support for external control surfaces (Mackie Control, OSC, MIDI Learn), and the ability to import sounds directly from the Freesound database.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Ardour's source code is always free to download and compile. For those who don't want to compile it themselves, Ardour offers a pay-what-you-want subscription ($1, $4, or $10 per month) for prebuilt binaries and updates, or a free demo binary that periodically interrupts playback until purchased or subscribed. Some Linux distributions also ship free, unrestricted prebuilt packages.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Arize Phoenix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Arize Phoenix is a free, open-source AI observability and evaluation platform for tracing, evaluating, and debugging LLM applications and AI agents.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) + paid managed cloud tier$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Berkeley, California$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Arize Phoenix: Open-Source AI Observability$q$, seo_title),
  seo_meta_description = COALESCE($q$Arize Phoenix is an open-source platform for tracing, evaluating, and debugging LLM apps and AI agents, built on OpenTelemetry. Free to self-host.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Arize Phoenix is an open-source AI observability and evaluation platform built by Arize AI, a company founded in 2020 by Aparna Dhinakaran and Jason Lopatecki with offices in Berkeley, California and New York City. Phoenix, which launched publicly in April 2023, helps engineers trace, evaluate, and debug LLM applications and AI agents by capturing distributed traces of every model call, retrieval step, and tool invocation. It is built on OpenTelemetry (OTLP) and Arize's own OpenInference instrumentation standard, with out-of-the-box auto-instrumentation for popular frameworks and SDKs including LangChain, LlamaIndex, DSPy, Mastra, the Vercel AI SDK, CrewAI, LangGraph, the OpenAI Agents SDK, and the Claude Agent SDK, plus LLM providers such as OpenAI, Anthropic, Google, and AWS Bedrock. Beyond tracing, Phoenix supports running LLM-based, code-based, or human-label evaluations to score outputs, building experiment datasets from real traces, and iterating on prompts using production examples. Phoenix's open-source core is free under an ELv2 license and can run locally, in a Jupyter notebook, in Docker or Kubernetes, or self-hosted, with roughly 9,000+ GitHub stars. Arize also offers Arize AX, a paid managed cloud version of Phoenix that includes two free Phoenix Cloud instances to start, with paid tiers for production-scale deployments and an added 'PXI Agent' that can investigate issues and run experiments automatically. Phoenix is aimed at ML/AI engineers and teams building and shipping production LLM applications and agents who need visibility into model behavior, quality regressions, and failure causes.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '43a21783-24ae-4f92-b263-4021ecd34f16';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '43a21783-24ae-4f92-b263-4021ecd34f16' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '43a21783-24ae-4f92-b263-4021ecd34f16';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Distributed tracing$q$, $q$Captures every LLM call, retrieval, and agent tool step for full visibility into execution.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Evaluations$q$, $q$Score traces and outputs with LLM-based evaluators, code-based checks, or human labels.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Experimentation$q$, $q$Build datasets from real traces and run experiments to test and compare changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Native OpenTelemetry support$q$, $q$Vendor- and language-agnostic tracing built on OTLP and OpenInference.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Broad framework auto-instrumentation$q$, $q$Out-of-the-box support for LangChain, LlamaIndex, DSPy, CrewAI, LangGraph, and more.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Flexible deployment$q$, $q$Run locally, in a notebook, via Docker/Kubernetes, or through managed Arize AX cloud.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '43a21783-24ae-4f92-b263-4021ecd34f16';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Fully open source and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Framework- and vendor-agnostic via OpenTelemetry$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Active open-source community with 9,000+ GitHub stars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Free managed cloud tier available to start (Arize AX)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '43a21783-24ae-4f92-b263-4021ecd34f16';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Pricing for production-scale Arize AX deployments isn't publicly listed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Self-hosting and scaling requires infrastructure setup and familiarity with OpenTelemetry$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = '43a21783-24ae-4f92-b263-4021ecd34f16';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Is Arize Phoenix free?$q$, $q$Yes, the open-source core is free under the ELv2 license and can be self-hosted at no cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$What's the difference between Phoenix and Arize AX?$q$, $q$Phoenix OSS is self-hosted and free; Arize AX is Arize's managed cloud version, offering free starter instances and paid tiers for production-scale use.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$What frameworks does Phoenix integrate with?$q$, $q$LangChain, LlamaIndex, DSPy, CrewAI, LangGraph, the Vercel AI SDK, the OpenAI Agents SDK, the Claude Agent SDK, and more.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Who makes Arize Phoenix?$q$, $q$Arize AI, an AI observability company founded in 2020, headquartered in Berkeley, California.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '43a21783-24ae-4f92-b263-4021ecd34f16';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$LLM application debugging$q$, $q$Trace and inspect exactly what happened during an LLM app's execution.$q$, $q$AI/ML engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Agent evaluation and regression testing$q$, $q$Score agent outputs and catch quality regressions before deployment.$q$, $q$Teams building AI agents$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Production LLM monitoring$q$, $q$Monitor live LLM applications for failures and quality issues.$q$, $q$MLOps and platform teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '43a21783-24ae-4f92-b263-4021ecd34f16';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Phoenix (Open Source)$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Self-hosted or local tracing and evaluation","Native OpenTelemetry support","ELv2-licensed, unlimited self-hosted usage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Arize AX (Phoenix Cloud)$q$, $q$Free to start (2 Phoenix Cloud instances)$q$, $q$monthly$q$, NULL, $q$["Managed Phoenix Cloud hosting","Paid tiers for production-scale deployments","PXI Agent for AI-assisted investigation and experiments"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '43a21783-24ae-4f92-b263-4021ecd34f16';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Arize Phoenix is an open-source AI observability and evaluation platform built by Arize AI, an AI observability company founded in 2020 with offices in Berkeley, California and New York City. Phoenix launched publicly in April 2023.$q$, $q$It helps engineers trace, evaluate, and debug LLM applications and AI agents by capturing distributed traces of every model call, retrieval step, and tool invocation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Phoenix is built on OpenTelemetry (OTLP) and Arize's OpenInference instrumentation standard, with auto-instrumentation for frameworks like LangChain, LlamaIndex, DSPy, CrewAI, and LangGraph, plus providers like OpenAI, Anthropic, Google, and AWS Bedrock.$q$, $q$Beyond tracing, it supports LLM-based, code-based, and human-label evaluations, and lets teams build experiment datasets from real production traces to iterate on prompts and catch regressions.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Phoenix's open-source core is free under an ELv2 license and can be self-hosted locally, in Docker, or in Kubernetes. Arize also offers Arize AX, a paid managed cloud version that includes two free Phoenix Cloud instances to start, with paid tiers for production-scale deployments.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Phoenix is vendor- and language-agnostic, with native support for Python, TypeScript, and Java, and out-of-the-box instrumentation for major agent frameworks and LLM providers.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


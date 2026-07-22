-- Enrichment marathon batch: Bravo Studio, Braze, Breakcold, BreatheHR, Breezy HR, Brella, Brevo, Brex

-- ── Bravo Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bravo Studio turns Figma designs into real native iOS and Android apps without code, using Firebase, Stripe, and an AI-native builder called Bravo MCP.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $22/month)$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE($q$~30 employees$q$, company_size),
  headquarters = COALESCE($q$Barcelona, Spain$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bravo Studio: No-Code Figma-to-App Builder Review$q$, seo_title),
  seo_meta_description = COALESCE($q$Bravo Studio turns Figma designs into native iOS/Android apps with no code. See pricing, features, integrations, and AI app-building via Bravo MCP.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bravo Studio is a no-code mobile app development platform founded in 2019 and headquartered in Barcelona, Spain, with a team of roughly 30 people. The platform's core function is converting Figma design files into fully native mobile applications for iOS and Android without requiring the user to write code. Designers create screens in Figma using Bravo's plugin and component library, bind those elements to live data sources, and Bravo compiles the design into a working native app that can be published to the Apple App Store and Google Play Store. Under the hood, Bravo Studio's newer builds output React Native applications with a Convex backend and support live sync back to the originating Figma file, meaning design updates can propagate to the app without a full rebuild.

Bravo Studio supports several backend and data integrations, including Airtable, Firebase, Supabase, Xano, and generic REST APIs, allowing an app to be wired to structured data without custom backend code. Authentication is handled through Firebase, supporting email/password and social logins. For monetization, Bravo integrates with Stripe for one-time payments and RevenueCat for subscription billing inside apps. The platform also includes native UI elements such as maps, charts, and conditional/dynamic UI logic driven by bound data, plus deep-linking support.

A newer capability, Bravo MCP (still in beta as of 2026, part of what the company calls "Bravo 4.0"), lets users build native apps conversationally from inside AI chat tools such as Claude, ChatGPT, or Cursor via the Model Context Protocol. A user describes the desired app inside their existing AI subscription, and Bravo handles the underlying build pipeline, producing a real React Native app rather than a mockup. This positions Bravo Studio at the intersection of no-code and AI-native app generation, differentiating it from most no-code mobile builders that still require manual screen assembly.

Pricing is structured around two public tiers. The free "Starter" plan allows unlimited app projects but caps each app at 15 screens, includes the Bravo Vision previewer, and offers community support only — it does not include app store publishing. The paid "Solo" plan costs $22 per month and raises the screen limit to 30 per app, adds Stripe, OAuth, Firebase, and deep-link support, unlimited builds for app store submission, native charts and maps, conditional UI, and access to the Bravo MCP AI-native builder. A free trial of the Solo plan is available with no credit card required.

Bravo Studio is best suited for solo founders, freelance designers, agencies, and small product teams that already have a Figma design and want to ship a real native app without hiring mobile developers. It is less suited to large enterprise apps with complex custom backend logic, since its integrations are limited to a defined set of data sources and its screen-count-based pricing caps complexity on lower tiers. Common use cases include MVP validation for startups, internal tools, membership apps, and marketplace or booking apps modeled on Airtable or Supabase. Competitors include Adalo, Glide, Thunkable, and FlutterFlow, with Bravo Studio's differentiator being its Figma-first workflow and MCP-based AI app generation.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2a22cd72-a223-425f-872a-827407f67bb9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2a22cd72-a223-425f-872a-827407f67bb9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Figma-to-App Conversion$q$, $q$Converts Figma designs directly into functioning native mobile app screens without manual coding.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Native iOS & Android Output$q$, $q$Compiles apps for submission to the Apple App Store and Google Play Store.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Backend & Data Integrations$q$, $q$Connects to Airtable, Firebase, Supabase, Xano, and REST APIs to power app content and logic.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Firebase Authentication$q$, $q$Built-in email/password and social login handled through Firebase.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Stripe & RevenueCat Payments$q$, $q$Native support for one-time payments (Stripe) and in-app subscriptions (RevenueCat).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Bravo MCP AI App Builder$q$, $q$Beta feature letting users build native apps conversationally from inside Claude, ChatGPT, or Cursor.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$App Store Publishing Pipeline$q$, $q$Unlimited builds and submission workflow for iOS and Android app stores on paid plans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Native UI Components$q$, $q$Includes maps, charts, and conditional UI logic driven by connected data.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$No coding required to ship a real native app starting from a Figma design$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Direct integration with popular backend/data tools (Airtable, Firebase, Supabase, Xano)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Built-in monetization via Stripe and RevenueCat$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Bravo MCP lets teams build apps conversationally inside existing AI subscriptions$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Free tier available to prototype before paying$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Free plan caps apps at 15 screens and doesn't support app store publishing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Requires a Figma design as a starting point, so non-designers face a learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Complex custom backend logic beyond the supported integrations isn't well supported$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Bravo MCP / Bravo 4.0 workflow is still in beta as of 2026$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$What is Bravo Studio?$q$, $q$Bravo Studio is a no-code platform that converts Figma designs into real native iOS and Android apps, connecting them to backends like Firebase, Supabase, and Airtable.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Does Bravo Studio require coding?$q$, $q$No. Apps are built by designing screens in Figma and binding them to data and logic inside Bravo Studio's visual builder.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Can I publish a Bravo Studio app to the App Store and Google Play?$q$, $q$Yes, on the paid Solo plan, which includes unlimited app builds for app store submission; the free Starter plan does not include publishing.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$What is Bravo MCP?$q$, $q$Bravo MCP is a beta feature that lets users build native apps conversationally from inside AI tools like Claude, ChatGPT, or Cursor using the Model Context Protocol.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$How much does Bravo Studio cost?$q$, $q$Bravo Studio has a free Starter plan and a paid Solo plan at $22/month, with a free trial of Solo available.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$What data sources can Bravo Studio connect to?$q$, $q$Airtable, Firebase, Supabase, Xano, and any generic REST API endpoint.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Startup MVP Validation$q$, $q$Solo founders and small teams turn a Figma prototype into a real, installable app to test with early users.$q$, $q$Startup founders and product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Agency Client App Delivery$q$, $q$Design agencies use Bravo Studio to deliver working native apps directly from client Figma files.$q$, $q$Design and digital agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Internal & Membership Apps$q$, $q$Small businesses build internal tools or membership apps wired to Airtable or Supabase without hiring developers.$q$, $q$SMB operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Starter$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Unlimited app projects","Up to 15 screens per app","Bravo Vision previewer","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$Solo$q$, $q$$22/month$q$, $q$monthly$q$, NULL, $q$["Up to 30 screens per app","Stripe, OAuth, Firebase, deep links","Unlimited app builds for app store publishing","Native maps, charts, conditional UI","Bravo MCP AI-native app builder (beta)"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bravo Studio is a no-code platform, founded in 2019 and based in Barcelona, that converts Figma designs into native mobile apps for iOS and Android without writing code. Designers build screens in Figma with Bravo's plugin, bind them to live data sources, and Bravo compiles a real native app that can be submitted to the App Store and Google Play.$q$, $q$Newer versions of the platform output React Native apps with a Convex backend and live sync back to the source Figma file, and add Bravo MCP, a beta feature that lets users build apps conversationally from inside Claude, ChatGPT, or Cursor rather than assembling screens manually.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bravo Studio connects to Airtable, Firebase, Supabase, Xano, and generic REST APIs for data, uses Firebase for authentication (email/password and social logins), and integrates Stripe and RevenueCat for one-time payments and subscriptions inside the app.$q$, $q$The builder includes native UI components such as maps and charts, conditional UI driven by bound data, and deep linking, plus a full pipeline for compiling and submitting builds to app stores.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Bravo Studio offers a free Starter plan (unlimited projects, up to 15 screens per app, no app store publishing) and a paid Solo plan at $22/month (up to 30 screens, full integrations, unlimited app store builds, and Bravo MCP access). A free trial of Solo is available with no credit card required.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Braze ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Braze is a publicly traded (Nasdaq: BRZE) enterprise customer engagement platform for cross-channel messaging, journey orchestration, and AI-driven personalization.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based (custom enterprise pricing)$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE($q$~2,000 employees$q$, company_size),
  headquarters = COALESCE($q$New York, NY, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Braze: Customer Engagement Platform Review & Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Braze is an enterprise customer engagement platform for email, push, SMS, in-app, and web messaging. See features, pricing model, and who it's for.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Braze is a customer engagement platform founded in 2011 and headquartered in New York City, with additional offices in Chicago, San Francisco, London, and Singapore. The company went public on the Nasdaq under the ticker BRZE in November 2021 and employs roughly 2,000 people as of 2026. Braze is built for marketing and growth teams at mid-market and enterprise companies that need to orchestrate personalized, cross-channel customer communication at scale.

The core of the platform is a real-time customer data layer combined with a visual journey-orchestration tool called Canvas, which lets marketers design multi-step, multi-channel customer journeys triggered by behavioral, transactional, or attribute-based data. Messages can be sent across email, mobile push notifications, SMS/MMS, in-app messages, web push, and content cards, with all channels managed from a single interface so a customer's experience stays consistent regardless of which channel they engage on. Braze also offers AI-powered capabilities under its "Braze AI" umbrella, including predictive audience segmentation, send-time optimization, content generation assistance, and Sage AI decisioning for suggesting next-best-actions within a journey.

Braze differentiates itself from adjacent categories, such as email service providers and marketing automation suites, by focusing on real-time, event-triggered engagement rather than batch email sends, and by positioning itself as a system of engagement that sits alongside a company's existing customer data platform rather than replacing it. It integrates with data warehouses like Snowflake and BigQuery, CDPs like Segment, and analytics tools, and offers "Currents," a feature for streaming engagement data out to a company's own data infrastructure for further analysis.

Braze does not publish self-serve or list pricing; all plans require a custom quote from sales. Pricing is usage-based, driven primarily by monthly active users (MAUs) or contacts, message volume, and which advanced modules (for example Canvas Flow, Sage AI, or additional channels) are included. Industry pricing trackers report that Braze's entry-level "Core" tier for smaller MAU volumes (roughly 50,000 to 250,000 MAUs) typically starts in the $30,000 to $60,000 per year range, with per-MAU costs decreasing at higher volumes; large enterprise contracts with advanced add-ons can exceed $500,000 annually. This pricing structure and lack of a self-serve free tier makes Braze best suited to venture-backed or established companies with dedicated marketing and growth engineering resources, rather than small businesses or solo marketers.

Typical Braze customers include consumer mobile apps, e-commerce, media and streaming, fintech, and on-demand or delivery companies that need to run always-on lifecycle marketing (onboarding, retention, re-engagement, transactional alerts) across many channels simultaneously. Common competitors include Iterable, Klaviyo, Airship, MoEngage, and Salesforce Marketing Cloud. Because Braze requires SDK integration into mobile apps and websites plus data pipeline setup, implementation is typically handled by a mix of marketing and engineering teams rather than marketers alone, and larger customers often work with Braze's professional services or partner agencies during onboarding.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '38f31757-caed-4a00-b556-ce49f176b713';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '38f31757-caed-4a00-b556-ce49f176b713' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '38f31757-caed-4a00-b556-ce49f176b713';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Canvas Journey Orchestration$q$, $q$Visual builder for multi-step, multi-channel customer journeys triggered by real-time data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Cross-Channel Messaging$q$, $q$Sends personalized messages across email, push, SMS, in-app, and web from one platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Braze AI / Sage AI Decisioning$q$, $q$AI-powered segmentation, content assistance, and next-best-action decisioning within journeys.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Real-Time Customer Data Layer$q$, $q$Ingests behavioral and transactional data in real time to trigger event-based messaging.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Currents Data Streaming$q$, $q$Streams engagement data out to a company's data warehouse or CDP for further analysis.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Predictive Segmentation & Send-Time Optimization$q$, $q$Uses AI to build audience segments and optimize message delivery timing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Native SDKs$q$, $q$SDKs for iOS, Android, and web enable in-app and push messaging integration.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '38f31757-caed-4a00-b556-ce49f176b713';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Real-time, event-triggered messaging across many channels from one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Strong journey-orchestration tooling (Canvas) for complex lifecycle campaigns$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Public company with mature enterprise support and integration ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$AI-driven personalization and decisioning features$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '38f31757-caed-4a00-b556-ce49f176b713';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$No public pricing; enterprise contracts often run into six figures annually$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$No self-serve free plan, so it's inaccessible to small businesses or solo marketers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Requires SDK integration and data engineering resources to implement well$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Steeper learning curve than simpler email-marketing tools$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '38f31757-caed-4a00-b556-ce49f176b713';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$What is Braze used for?$q$, $q$Braze is used by marketing and growth teams to orchestrate personalized customer messaging campaigns across email, push, SMS, in-app, and web channels.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$How much does Braze cost?$q$, $q$Braze doesn't publish pricing; it's usage-based on monthly active users and message volume, with entry contracts commonly starting around $30,000 to $60,000 per year.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Is Braze a CDP?$q$, $q$No, Braze is a customer engagement platform focused on messaging and journey orchestration; it integrates with CDPs like Segment rather than replacing them.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$What channels does Braze support?$q$, $q$Email, mobile push, SMS/MMS, in-app messages, web push, and content cards.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Who owns Braze / is it a public company?$q$, $q$Braze has traded on the Nasdaq under the ticker BRZE since its November 2021 IPO.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '38f31757-caed-4a00-b556-ce49f176b713';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Lifecycle Marketing for Consumer Apps$q$, $q$Automating onboarding, retention, and re-engagement messaging across push, email, and in-app channels.$q$, $q$Consumer mobile app growth teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Cross-Channel Retention Campaigns$q$, $q$E-commerce and subscription businesses trigger personalized offers based on purchase and browsing behavior.$q$, $q$E-commerce and subscription marketing teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '38f31757-caed-4a00-b556-ce49f176b713';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Braze is an enterprise customer engagement platform founded in 2011 and headquartered in New York City. It went public on the Nasdaq (BRZE) in 2021 and employs roughly 2,000 people. The platform helps marketing and growth teams orchestrate personalized, cross-channel messaging driven by real-time customer data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Canvas, Braze's visual journey builder, lets teams design multi-step campaigns across email, push, SMS, in-app messaging, and web push from a single interface, triggered by behavioral or attribute-based data.$q$, $q$Braze AI adds predictive segmentation, send-time optimization, content generation assistance, and Sage AI decisioning, while Currents streams engagement data out to a company's own warehouse or CDP for further analysis.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Braze does not publish pricing; costs are usage-based, driven by monthly active users, message volume, and selected modules. Entry-level contracts for smaller MAU volumes are commonly reported in the $30,000 to $60,000 per year range, with large enterprise deals exceeding $500,000 annually.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38f31757-caed-4a00-b556-ce49f176b713', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Breakcold ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Breakcold is an AI-native sales CRM for social selling, unifying LinkedIn, email, WhatsApp, and Telegram outreach into one pipeline.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (per user)$q$, pricing_model),
  starting_price = COALESCE($q$$29/user/month$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE($q$Small, bootstrapped team$q$, company_size),
  headquarters = COALESCE($q$Paris, France$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Breakcold: AI-Native Social Selling CRM Pricing & Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Breakcold is an AI-native sales CRM for social selling on LinkedIn, with a unified inbox, auto lead scoring, and pipelines. See pricing and features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Breakcold is a sales CRM founded in 2021 by Arnaud Belinga and a co-founder, bootstrapped rather than venture-funded, and headquartered in Paris, France, with a small team. The product is built around "social selling" — engaging prospects through their LinkedIn and Twitter/X activity — combined with a traditional sales CRM and an AI layer that automates parts of the follow-up process.

The core workflow centers on a unified inbox that consolidates messages from email, LinkedIn, WhatsApp, and Telegram into a single sorted view, so a salesperson doesn't need to switch between apps to manage conversations across channels. Breakcold's engagement feed surfaces LinkedIn and Twitter posts from prospects and target accounts directly inside the CRM, letting reps like, comment, and react to build familiarity before or during outreach. Users can message prospects on LinkedIn, Twitter/X, and email from the same interface, and the CRM supports unlimited, customizable sales pipelines for tracking deal stages.

An AI layer sits on top of this: Breakcold markets itself as an AI-native CRM for salespeople that can automatically move leads through the pipeline, apply tags, create follow-up tasks, and generate follow-up messages matched to a configurable AI persona and writing style. Auto lead scoring and an email assistant for drafting messages are included on higher tiers. Breakcold also supports outbound email campaigns with rotation across sending addresses and campaign-level analytics.

Pricing is per seat and split into two published tiers. CRM Essentials costs $29 per user per month and includes a unified email inbox, CRM analytics with 30-day history, unlimited pipelines, contacts, and activity history, plus management across seven or more platforms. CRM Pro costs $59 per user per month and adds the unified LinkedIn inbox, unlimited-history analytics, auto lead scoring, one-click LinkedIn follow-ups, email campaigns with analytics, an AI email assistant, and email rotation. A free trial gives full access to the AI agent automation, social listening, unified inbox, and pipeline features with no credit card required, but there is no permanent free plan.

Breakcold is aimed primarily at individual salespeople, sales development reps, founders doing their own outbound, small agencies, and consultants who rely heavily on LinkedIn for pipeline generation — audiences that value a lightweight, social-first CRM over the configuration overhead of platforms like Salesforce or HubSpot. It is less suited to large enterprise sales organizations needing deep custom object modeling, extensive role-based permissioning, or offline/desktop CRM requirements. Direct competitors include Close, Folk, Attio, and social-selling-focused tools like LinkedIn Sales Navigator combined with a lightweight CRM. As a small, bootstrapped company, Breakcold ships features quickly but has a smaller partner and integration ecosystem than larger incumbents.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Unified Multi-Channel Inbox$q$, $q$Consolidates email, LinkedIn, WhatsApp, and Telegram messages into one view.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Social Selling Engagement Feed$q$, $q$Surfaces prospects' LinkedIn and Twitter/X posts inside the CRM for relationship-building before outreach.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$AI-Native Pipeline Automation$q$, $q$Automatically moves leads through stages, applies tags, and creates follow-up tasks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Unlimited Custom Sales Pipelines$q$, $q$Configurable pipeline stages with no limit on number of pipelines.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Auto Lead Scoring$q$, $q$Automatically scores leads based on engagement and activity data (Pro tier).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Email Campaigns & Rotation$q$, $q$Outbound email campaigns with sending-address rotation and campaign analytics.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$AI Email Assistant$q$, $q$Drafts follow-up messages matched to a configurable AI persona and writing style.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Purpose-built for LinkedIn-driven social selling, unlike generic CRMs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Unified inbox reduces app-switching across channels$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$AI automation for lead movement, tagging, and follow-ups$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Transparent, relatively affordable per-seat pricing versus enterprise CRMs$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$No permanent free plan, only a free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Small team and company size means a smaller integration ecosystem than major CRMs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$LinkedIn-heavy workflow may not suit teams that don't sell on social$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Advanced features (LinkedIn inbox, lead scoring, campaigns) are gated to the $59/user Pro tier$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$What is Breakcold used for?$q$, $q$Breakcold is a sales CRM built for social selling, combining a unified inbox for email, LinkedIn, WhatsApp, and Telegram with AI-driven pipeline automation.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$How much does Breakcold cost?$q$, $q$Breakcold has two paid tiers: CRM Essentials at $29/user/month and CRM Pro at $59/user/month.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Does Breakcold have a free plan?$q$, $q$No, but Breakcold offers a free trial with full feature access and no credit card required.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$What channels does Breakcold support?$q$, $q$Email, LinkedIn, WhatsApp, and Telegram, plus a LinkedIn/Twitter engagement feed for social selling.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Who founded Breakcold?$q$, $q$Breakcold was founded in 2021 by Arnaud Belinga and a co-founder as a bootstrapped company based in Paris, France.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$LinkedIn-Based Outbound$q$, $q$Solo founders and SDRs use social warming and the unified inbox to run LinkedIn-driven outreach.$q$, $q$Founders and sales development reps$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$Multi-Client Pipeline Management$q$, $q$Sales agencies and consultants manage multiple client pipelines from a single unified interface.$q$, $q$Sales agencies and consultants$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$CRM Essentials$q$, $q$$29/user/month$q$, $q$monthly$q$, NULL, $q$["Unified email inbox","CRM analytics (30-day history)","Unlimited sales pipelines","Unlimited contacts","Activity history","Reminders & notes"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$CRM Pro$q$, $q$$59/user/month$q$, $q$monthly$q$, NULL, $q$["All Essentials features","Unified LinkedIn inbox","Unlimited-history CRM analytics","Auto lead scoring","One-click LinkedIn follow-up","Email campaigns & analytics","AI email assistant","Email rotation"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Breakcold is a bootstrapped sales CRM founded in 2021 and based in Paris, France, built around social selling on LinkedIn and Twitter/X combined with a unified multi-channel inbox and AI-driven pipeline automation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$A unified inbox consolidates email, LinkedIn, WhatsApp, and Telegram conversations, while an engagement feed surfaces prospects' LinkedIn and Twitter posts for social warming before outreach.$q$, $q$An AI layer automates lead movement through the pipeline, tagging, follow-up task creation, and message drafting matched to a configurable AI persona, alongside auto lead scoring and email campaign tools on the Pro tier.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Breakcold offers two per-seat plans: CRM Essentials at $29/user/month and CRM Pro at $59/user/month, which adds the LinkedIn inbox, lead scoring, and email campaigns. A free trial is available with no credit card required, but there is no permanent free plan.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── BreatheHR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$BreatheHR (Breathe) is UK HR software for SMEs, covering holiday and absence tracking, performance management, and document storage for growing teams.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (tiered by employee count)$q$, pricing_model),
  starting_price = COALESCE($q$£24/month$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$Part of the ELMO Software group; serves 16,000+ SME customers$q$, company_size),
  headquarters = COALESCE($q$Horsham, West Sussex, UK$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$BreatheHR (Breathe): UK HR Software Pricing & Features$q$, seo_title),
  seo_meta_description = COALESCE($q$BreatheHR is UK HR software for SMEs with holiday, absence, and performance management. See pricing tiers from £24/month and key features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$BreatheHR, marketed simply as "Breathe," is a cloud-based HR software platform built specifically for small and medium-sized UK businesses. It was founded in 2012 with the goal of freeing SME HR teams from manual, spreadsheet-based administration, and in 2020 the company became part of the ELMO Software group, an Australian-listed HR and payroll technology company, while continuing to operate under the Breathe brand. Breathe is headquartered in Horsham, West Sussex, England, and states it serves more than 16,000 SMEs and over 950 HR consultancies across the UK.

The platform's core module covers the essentials of day-to-day people management: holiday and absence request and approval workflows with automatic UK-pattern entitlement calculations, real-time absence and sickness tracking, secure document and policy storage, and performance management tools including 1:1s, goal-setting, and reviews. Breathe advertises more than 40 features across these areas, and the product is explicitly scoped for organizations of up to roughly 250 employees rather than large enterprises.

Beyond the core HR suite, Breathe sells four optional add-on modules that can be purchased individually or bundled: Breathe Rota, Time & Attendance (from £11/month) for shift scheduling and clock-in tracking; Breathe Learn (from £15/month) for e-learning and training records; Breathe Recruitment (from £16/month) for applicant tracking; and Breathe Expenses (from £14/month) for expense claims. A Health & Safety add-on is also available from £12/month. Customers can buy a "Business Essentials" bundle of the four core add-ons for £81/month, a discount versus buying them separately.

Core pricing scales with headcount across six named tiers: Micro (1-10 employees, £24/month), Starter (11-20, £44/month), Regular (21-50, £99/month), Pro (51-100, £175/month), Premium (101-150, £419/month), and Plus (151-200, £579/month) — all tiers share the same core feature set, so customers pay more as their organization grows rather than for unlocking additional functionality. Paying annually rather than monthly saves roughly 15% on the Micro through Pro tiers and roughly 10% on Premium and Plus. A 14-day free trial with full access to all features and add-ons is available with no credit card required.

Breathe is best suited to UK-based small and mid-sized employers, and the HR consultancies who support them, that want an affordable, easy-to-administer HR system without the complexity or cost of enterprise HRIS platforms like Workday or SAP SuccessFactors. It is not designed for organizations above roughly 200-250 employees or for companies outside the UK needing multi-country payroll and compliance support, since its entitlement calculations and compliance tooling are built around UK employment norms. Common alternatives in this space include BrightHR, PeopleHR, CharlieHR, and HiBob.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Holiday & Absence Management$q$, $q$Request, approval, and entitlement-calculation workflows built around UK working patterns.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Performance Management$q$, $q$1:1s, goal-setting, and review tools for ongoing employee performance tracking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Document & Policy Management$q$, $q$Secure storage for HR documents and company policies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$HR Reporting Dashboard$q$, $q$Reporting on absence, headcount, and other core HR metrics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Breathe Rota / Time & Attendance$q$, $q$Optional add-on for shift scheduling and clock-in tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Breathe Learn$q$, $q$Optional add-on for e-learning and training record management.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Breathe Recruitment$q$, $q$Optional applicant tracking add-on.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Breathe Expenses$q$, $q$Optional add-on for employee expense claims.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Affordable, transparent tiered pricing scaled to UK SME headcount$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Purpose-built for UK employment rules, including holiday entitlement calculations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Modular add-ons let businesses pay only for what they need$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$14-day free trial with full feature access and no credit card required$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Scoped for organizations up to roughly 250 employees, not enterprise scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Focused on UK compliance norms, limited fit for multi-country employers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Core plans do not include payroll processing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Higher tiers (Premium/Plus) get comparatively expensive for larger SME headcounts$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$What is BreatheHR used for?$q$, $q$Breathe is UK HR software for SMEs, covering holiday and absence management, performance reviews, and document storage.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$How much does Breathe cost?$q$, $q$Pricing starts at £24/month for the Micro plan (1-10 employees) and scales up to £579/month for the Plus plan (151-200 employees).$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Is Breathe suitable for companies outside the UK?$q$, $q$Breathe is built around UK employment norms and compliance, making it best suited to UK-based employers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Does Breathe offer a free trial?$q$, $q$Yes, a 14-day free trial with full access to all features and add-ons is available with no credit card required.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$What add-ons does Breathe offer?$q$, $q$Rota/Time & Attendance, Learn (e-learning), Recruitment, Expenses, and Health & Safety, each priced separately or bundled.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$UK SME HR Administration$q$, $q$Growing UK businesses centralize holiday, absence, and performance management in one system.$q$, $q$UK small and mid-sized employers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$HR Consultancy Client Management$q$, $q$HR consultancies use Breathe to administer HR processes across multiple SME clients.$q$, $q$UK HR consultancies$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Micro$q$, $q$£24/month$q$, $q$monthly (approx. 15% off annually)$q$, NULL, $q$["1-10 employees","Holiday & absence management","Document management","Performance management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Starter$q$, $q$£44/month$q$, $q$monthly (approx. 15% off annually)$q$, NULL, $q$["11-20 employees","Core HR feature set"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Regular$q$, $q$£99/month$q$, $q$monthly (approx. 15% off annually)$q$, NULL, $q$["21-50 employees","Core HR feature set"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Pro$q$, $q$£175/month$q$, $q$monthly (approx. 15% off annually)$q$, NULL, $q$["51-100 employees","Core HR feature set"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Premium$q$, $q$£419/month$q$, $q$monthly (approx. 10% off annually)$q$, NULL, $q$["101-150 employees","Core HR feature set"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Plus$q$, $q$£579/month$q$, $q$monthly (approx. 10% off annually)$q$, NULL, $q$["151-200 employees","Core HR feature set"]$q$::jsonb, 5);

DELETE FROM tool_content_blocks WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Breathe (BreatheHR) is a cloud HR platform founded in 2012 for UK small and medium-sized businesses, now part of the ELMO Software group. It's headquartered in Horsham, West Sussex, and serves over 16,000 SMEs and 950+ HR consultancies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The core platform covers holiday and absence management with UK-pattern entitlement calculations, real-time sickness tracking, document and policy storage, and performance management (1:1s, goals, reviews) across 40+ features.$q$, $q$Optional add-ons extend the platform into rota and time tracking, e-learning, recruitment, and expenses, which can be bundled as a discounted "Business Essentials" package.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Pricing scales with headcount across six tiers from Micro (1-10 employees, £24/month) to Plus (151-200 employees, £579/month), all sharing the same core feature set. Annual billing saves roughly 10-15%, and a 14-day free trial is available.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Breezy HR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Breezy HR is a cloud-based applicant tracking system that helps small and mid-sized companies post jobs, screen candidates, and manage hiring pipelines.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Bootstrap plan); paid plans from $157/month billed annually$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE($q$Subsidiary of Learning Technologies Group (LTG), acquired 2019$q$, company_size),
  headquarters = COALESCE($q$Jacksonville, FL, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Breezy HR: Applicant Tracking System Pricing & Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Breezy HR is an ATS for small and mid-sized businesses with a free plan, drag-and-drop pipelines, and AI-assisted hiring. See pricing tiers and features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Breezy HR is a cloud-based applicant tracking system (ATS) and recruiting platform founded in 2014 by Darren Bounds. It is headquartered in Jacksonville, Florida (some earlier records list Raleigh, North Carolina), and was acquired in April 2019 by Learning Technologies Group (LTG), a UK-listed education and talent management company, under which it continues to operate as a standalone product.

The platform is designed to manage the full recruiting funnel: creating and branding a careers site, distributing job postings to more than 50 job boards and social channels simultaneously, organizing candidates in a customizable drag-and-drop pipeline, scheduling and hosting video interviews, and coordinating hiring-team feedback and collaboration in one place. Resume parsing supports over 20 languages, and the platform includes built-in GDPR compliance tooling and multi-language support for global hiring teams. More recently, Breezy added AI-assisted features, branded "Breezy Intelligence," for candidate evaluation, interview summarization, and resume auditing, sold as a metered add-on ($30 per 100,000 credits) on top of any plan.

Breezy uses a freemium pricing model with five tiers. The free "Bootstrap" plan supports one active job position or candidate pool with unlimited users and candidates, a branded career site, distribution to 50+ job boards, GDPR tools, and resume parsing, making it usable indefinitely for very low-volume hiring, not just as a trial. Paid tiers unlock unlimited open positions and add capability as you move up: "Startup" ($157/month annual, $189/month monthly) adds unlimited positions, background-screening integrations, candidate questionnaires, customizable pipelines, calendar integration, mobile apps, self-scheduling, live video interviews, and Slack integration. "Growth" ($273/month annual, $329/month monthly), Breezy's most popular tier, adds automated reference checking, customizable interview guides and scorecards, an employee referral portal, eSignatures, support for up to five hiring locations, and multiple concurrent pipelines. "Business" ($439/month annual, $529/month monthly) adds advanced multi-path questionnaires, assessment-tool integrations, candidate comparison tools, nurture campaigns, custom roles and permissions, HRIS integrations, and offer-approval workflows. A top "Custom Pro" tier is quote-based and adds a dedicated account manager, API access, advanced reporting, SSL enforcement, and data import/export.

Breezy is best suited to small and mid-sized businesses, roughly 10 to 500 employees, that need a full-featured, self-serve ATS without the implementation overhead of enterprise systems like Workday Recruiting, Greenhouse, or SAP SuccessFactors. Its free tier and moderate mid-tier pricing make it attractive to startups hiring for a handful of roles, while the Business and Custom Pro tiers extend it toward companies running structured, multi-location hiring programs with HRIS integration needs. Common alternatives include Greenhouse, Lever, JazzHR, Recruitee, and Workable.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Multi-Job-Board Distribution$q$, $q$Posts jobs to more than 50 job boards and social channels simultaneously.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Drag-and-Drop Candidate Pipelines$q$, $q$Customizable recruiting pipelines for tracking candidates through hiring stages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Built-In Video Interviewing$q$, $q$Live video interviews and candidate self-scheduling without third-party tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Resume Parsing$q$, $q$Automated resume parsing supporting more than 20 languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Breezy Intelligence$q$, $q$Paid AI add-on for candidate evaluation, interview summarization, and resume auditing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Candidate Self-Scheduling$q$, $q$Candidates book their own interview times based on hiring-team availability.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Employee Referral Portal$q$, $q$Lets employees refer candidates directly into the pipeline (Growth tier and above).$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$HRIS & Calendar Integrations$q$, $q$Connects to calendar tools on all paid plans and HRIS systems on Business and above.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Genuinely usable free plan for low-volume hiring, not just a time-limited trial$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Drag-and-drop pipeline and built-in video interviewing reduce tool sprawl$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Distributes postings to 50+ job boards from one place$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$AI add-on (Breezy Intelligence) for resume and interview evaluation$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Free plan limited to a single open position or candidate pool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Higher tiers (Growth, Business) get expensive relative to some ATS competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Breezy Intelligence AI features are a paid add-on, not included by default$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Some company records conflict between Jacksonville and Raleigh headquarters listings$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Does Breezy HR have a free plan?$q$, $q$Yes, the Bootstrap plan is free forever and supports one active position or candidate pool with unlimited users and candidates.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$How much does Breezy HR cost?$q$, $q$Paid plans start at $157/month (billed annually) for Startup and go up to $439/month for Business, plus a custom-quoted Custom Pro tier.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Who owns Breezy HR?$q$, $q$Breezy HR has been owned by Learning Technologies Group (LTG), a UK-listed talent management company, since its acquisition in April 2019.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$What is Breezy Intelligence?$q$, $q$Breezy Intelligence is a paid AI add-on for candidate evaluation, interview summarization, and resume auditing, priced at $30 per 100,000 credits.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$How many job boards does Breezy HR post to?$q$, $q$Breezy HR distributes job postings to more than 50 job boards and social channels simultaneously.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Startup Hiring$q$, $q$Early-stage companies use the free or Startup tier to manage a handful of open roles without paying for enterprise ATS software.$q$, $q$Startups and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Multi-Location Recruiting Programs$q$, $q$Mid-market companies use Growth or Business tiers to run structured hiring across multiple locations with HRIS integration.$q$, $q$Mid-market HR and recruiting teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Bootstrap$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Unlimited users and candidates","1 active position or pool","Branded career site","Distribution to 50+ job boards","GDPR compliance tools","Resume parsing (20+ languages)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Startup$q$, $q$$157/month (annual) / $189/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited positions","Background screening integrations","Candidate questionnaires","Customizable pipelines","Mobile apps","Interview self-scheduling","Live video interviews","Slack integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Growth$q$, $q$$273/month (annual) / $329/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Automated reference checking","Customizable interview guides & scorecards","Employee referral portal","eSignatures","Up to 5 locations","Multiple recruiting pipelines"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Business$q$, $q$$439/month (annual) / $529/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Advanced multi-path questionnaires","Assessment integrations","Candidate comparison tools","Custom roles & permissions","HRIS integrations","Offer approval workflows"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Custom Pro$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["All Business features","Dedicated account manager","API access","Advanced reporting","SSL enforcement","Data import/export"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Breezy HR is a cloud-based applicant tracking system founded in 2014 by Darren Bounds and acquired by Learning Technologies Group (LTG) in 2019. It manages the full recruiting funnel, from job posting and candidate pipelines to video interviews and hiring-team collaboration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Job postings distribute to 50+ boards at once, candidates move through a customizable drag-and-drop pipeline, and video interviews and self-scheduling are built in. Resume parsing supports 20+ languages, and GDPR compliance tools are included.$q$, $q$Breezy Intelligence, a paid AI add-on, offers candidate evaluation, interview summarization, and resume auditing on top of any plan.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Breezy HR's free Bootstrap plan supports one open position indefinitely. Paid tiers range from Startup ($157-189/month) through Growth, Business, and a custom-quoted Custom Pro tier, unlocking unlimited positions, advanced screening, HRIS integrations, and API access as you move up.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Brella ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Brella is a Finnish event platform offering AI-powered attendee matchmaking, 1:1 meeting booking, and networking tools for conferences and exhibitions.$q$, short_description),
  pricing_model = COALESCE($q$Custom/Quote-based$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE($q$~50-60 employees$q$, company_size),
  headquarters = COALESCE($q$Helsinki, Finland$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Brella: Event Networking & Matchmaking Platform Review$q$, seo_title),
  seo_meta_description = COALESCE($q$Brella is an event platform with AI-powered attendee matchmaking, 1:1 meeting booking, and native apps for conferences, exhibitions, and hybrid events.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Brella is an event technology platform founded in 2016 and headquartered in Helsinki, Finland, with a team of roughly 50 to 60 employees working across Europe, North America, and Asia. The company was built specifically to solve networking and matchmaking at in-person, virtual, and hybrid events such as conferences, trade shows, and exhibitions, a distinct focus from broader event-management suites that emphasize registration and ticketing.

The core of Brella's product is AI-driven, intent-based attendee matchmaking: attendees fill out interests, goals, and networking intents, and Brella's algorithm surfaces relevant people, sessions, and exhibitors to connect with, along with tools to book 1:1 meetings directly inside the app. The platform provides live and virtual meeting areas, in-app chat, attendee tracking and engagement analytics, sponsor and exhibitor promotion tools, live streaming for sessions, and event push notifications. Native mobile apps for iOS and Android let attendees browse the agenda, message other attendees, and manage their meeting schedule from their phone throughout the event.

Brella positions its matchmaking and meeting-booking experience as a differentiator versus generic event apps, citing higher meeting-acceptance and meeting-quality rates than typical event applications. The platform serves both organizers, who configure matchmaking rules, sponsor visibility, and analytics, and attendees and exhibitors who use the app to network and manage their schedules, and supports both physical events with an on-site companion app and fully virtual or hybrid formats with livestreaming.

Brella does not publish standard pricing tiers or per-attendee rates. Pricing for its "Professional" plan is quote-based and depends on total attendee count and which consulting or support services an organizer selects; prospective customers must book a call with Brella's sales team to receive a quote. There is no self-serve signup or free plan, which reflects Brella's target market of mid-size to large B2B conferences and trade shows rather than small meetups or webinars.

Brella is best suited to conference organizers, association event teams, and trade-show operators running events where structured networking and sponsor ROI are central goals, for example industry conferences where paid attendees expect curated introductions to peers, or trade shows where sponsors need measurable engagement data. It is less suited to casual meetups, webinar-only formats, or organizers who want transparent self-serve pricing without a sales conversation. Competitors in the event-networking and matchmaking space include Grip, Swapcard, Bizzabo, and Whova.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fe53f9a3-19f4-4579-b9ed-212212081f85' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$AI-Powered Attendee Matchmaking$q$, $q$Intent-based matching algorithm surfaces relevant people, sessions, and exhibitors for each attendee.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$1:1 Meeting Booking$q$, $q$Attendees can schedule and manage one-on-one meetings directly inside the app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Native iOS & Android Event Apps$q$, $q$Mobile apps for browsing the agenda, messaging, and managing meetings on-site.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Sponsor & Exhibitor Promotion Tools$q$, $q$Tools for sponsors and exhibitors to increase visibility and measure engagement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Live Streaming for Sessions$q$, $q$Supports streaming sessions for virtual and hybrid event formats.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Attendee Engagement Analytics$q$, $q$Reporting on attendee activity, meetings, and session engagement for organizers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$In-App Chat & Networking Feed$q$, $q$Direct messaging and a networking feed for attendee-to-attendee interaction.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Matchmaking and 1:1 meeting booking are purpose-built and go deeper than generic event apps$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Supports physical, virtual, and hybrid event formats in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Strong sponsor and exhibitor tooling for demonstrating event ROI$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Native mobile apps for on-site attendee engagement$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$No public pricing; requires a sales call to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$No free plan or self-serve signup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Pricing scales with attendee count, which can get costly for large events$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Focused on B2B conference use cases, less suited to casual or small events$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$What is Brella used for?$q$, $q$Brella is an event platform used to power AI-driven attendee matchmaking and 1:1 meeting booking at conferences, trade shows, and hybrid events.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$How much does Brella cost?$q$, $q$Brella uses custom, quote-based pricing tied to attendee count; there is no published pricing list.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Does Brella support hybrid events?$q$, $q$Yes, Brella supports physical, virtual, and hybrid event formats, including live streaming of sessions.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Does Brella have a free plan?$q$, $q$No, Brella does not offer a free plan or self-serve signup.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$What makes Brella's matchmaking different from other event apps?$q$, $q$Brella uses intent-based AI matchmaking driven by attendee-stated interests and goals, aimed at producing higher meeting-acceptance rates than generic event apps.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$B2B Industry Conferences$q$, $q$Conference organizers use Brella's matchmaking to drive structured networking among paid attendees.$q$, $q$Conference and association event organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Trade Shows & Exhibitions$q$, $q$Trade show operators use Brella's sponsor tools and analytics to demonstrate exhibitor engagement ROI.$q$, $q$Trade show and exhibition organizers$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Brella is an event technology platform founded in 2016 and headquartered in Helsinki, Finland, focused specifically on attendee networking and matchmaking at conferences, trade shows, and exhibitions across physical, virtual, and hybrid formats.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AI-driven, intent-based matchmaking surfaces relevant people, sessions, and exhibitors for each attendee, with built-in 1:1 meeting booking, in-app chat, and native iOS and Android apps for on-site engagement.$q$, $q$Organizer-facing tools include sponsor and exhibitor promotion, engagement analytics, live streaming for sessions, and attendee tracking.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Brella uses quote-based pricing tied to attendee count and selected support services, with no published tiers or free plan; organizers book a call with sales to get a quote.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Brevo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Brevo (formerly Sendinblue) is a Paris-based multi-channel marketing platform combining email, SMS, WhatsApp, marketing automation, and a sales CRM.$q$, short_description),
  pricing_model = COALESCE($q$Freemium (usage-based on email volume for paid tiers)$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $9/month)$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$850+ employees$q$, company_size),
  headquarters = COALESCE($q$Paris, France$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Italian$q$, $q$Portuguese$q$]::text[],
  seo_title = COALESCE($q$Brevo (Sendinblue): Pricing, Features & Platform Review$q$, seo_title),
  seo_meta_description = COALESCE($q$Brevo is a multi-channel marketing platform with email, SMS, WhatsApp, automation, and CRM. Free plan available; paid plans start at $9/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Brevo, known until 2023 as Sendinblue, is a multi-channel marketing and sales platform founded in 2012 by Armand Thiberge and Kapil Sharma, later joined by co-founders Amalia Bercot and Mickael Arias. The company is headquartered in Paris, France, with additional offices including Seattle and Noida, India, and employs more than 850 people worldwide as of 2026.

Brevo's platform combines several channels and functions that are often sold as separate products elsewhere: email marketing and transactional email, SMS campaigns, WhatsApp marketing, web and mobile push notifications, marketing automation workflows, and a built-in sales CRM with pipeline management. The unifying idea is that a single contact record can be messaged across any of these channels and enrolled in automation workflows triggered by behavior such as opens, clicks, purchases, or form submissions, without stitching together separate marketing and CRM tools. Brevo also offers AI-assisted features for subject-line and content generation and AI-powered audience segmentation.

A distinguishing feature of Brevo's pricing is that it bills by emails sent per month rather than by number of contacts stored; every paid plan includes unlimited contacts, which differentiates it from many competitors like Mailchimp or Klaviyo that charge based on list size. The free plan allows 300 emails per day and up to 100,000 stored contacts, with Brevo branding included in sent emails. Paid tiers scale with volume: Starter begins at $9/month for around 5,000 emails, rising to roughly $69/month for 100,000 emails, and adds the option to remove Brevo branding for an extra $9/month; Standard starts at $18/month for 5,000 emails, up to roughly $129/month for 100,000 emails, and adds marketing automation and A/B testing; Professional pricing starts around $499/month and adds advanced send-time optimization, multi-user access, and enhanced reporting; and Enterprise is custom-quoted for large-volume senders needing dedicated IPs, SSO, and advanced support. Dedicated sending IP addresses are available as an add-on for $251/year on eligible plans, and annual billing offers roughly a 10% discount over monthly.

Brevo's interface is available in multiple languages, including English, French, German, Spanish, Italian, and Portuguese, reflecting its European roots and international customer base. The platform is aimed primarily at small and mid-sized businesses, e-commerce brands, and marketing teams that want to consolidate email, SMS, and light CRM functionality into one moderately priced tool rather than paying for several point solutions. It's a common recommendation for cost-conscious teams migrating off more expensive per-contact email platforms, since the unlimited-contacts model can produce substantial savings for businesses with large but relatively low-engagement contact lists. It is less suited to teams needing deep, code-level marketing automation logic or advanced e-commerce-specific personalization at the level of dedicated tools like Klaviyo, though Brevo does offer e-commerce integrations (Shopify, WooCommerce, Magento) and transactional email APIs for developers. Competitors include Mailchimp, Klaviyo, ActiveCampaign, Constant Contact, and Mailerlite.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd2949bf-02b3-4401-a031-61e56f53b753';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd2949bf-02b3-4401-a031-61e56f53b753' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'fd2949bf-02b3-4401-a031-61e56f53b753';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Email & Transactional Email$q$, $q$Marketing email campaigns and transactional email delivery via API or SMTP.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$SMS & WhatsApp Campaigns$q$, $q$Send SMS and WhatsApp marketing messages alongside email from the same platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Marketing Automation Workflows$q$, $q$Behavior-triggered automation for opens, clicks, purchases, and form submissions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Built-In Sales CRM$q$, $q$Pipeline management and contact tracking included in the platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Unlimited Contacts on Paid Plans$q$, $q$Billing is based on email volume sent, not the number of contacts stored.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$AI Content & Subject-Line Assistance$q$, $q$AI-generated email content and subject-line suggestions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Transactional Email API$q$, $q$Developer API for sending transactional emails programmatically.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$E-commerce Integrations$q$, $q$Native integrations with Shopify, WooCommerce, and Magento.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'fd2949bf-02b3-4401-a031-61e56f53b753';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Free plan and low-cost entry tiers make it accessible for small businesses$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Bills by email volume, not contact list size, with unlimited contacts on all paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Combines email, SMS, WhatsApp, automation, and CRM in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Available in six interface languages, suited to international teams$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'fd2949bf-02b3-4401-a031-61e56f53b753';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Free and Starter plans include Brevo branding unless you pay extra to remove it$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Professional tier pricing jumps sharply to around $499/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Automation and personalization are less advanced than e-commerce-focused specialists like Klaviyo$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Deliverability and support quality can vary by plan tier per user reviews$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'fd2949bf-02b3-4401-a031-61e56f53b753';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Is Brevo free?$q$, $q$Yes, Brevo offers a free plan with 300 emails per day and up to 100,000 stored contacts.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$How is Brevo priced?$q$, $q$Brevo bills by the number of emails sent per month, not by contacts stored; every paid plan includes unlimited contacts.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$What was Brevo called before?$q$, $q$Brevo was formerly known as Sendinblue before rebranding in 2023.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Does Brevo include a CRM?$q$, $q$Yes, Brevo includes a built-in sales CRM with pipeline management alongside its marketing tools.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$What languages does Brevo support?$q$, $q$Brevo's interface is available in English, French, German, Spanish, Italian, and Portuguese.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'fd2949bf-02b3-4401-a031-61e56f53b753';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$SMB Marketing Consolidation$q$, $q$Small businesses combine email, SMS, and light CRM into one moderately priced platform instead of multiple point tools.$q$, $q$Small and mid-sized marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$E-commerce Transactional & Marketing Email$q$, $q$Online stores use Brevo's Shopify/WooCommerce integrations and transactional API for order and marketing emails.$q$, $q$E-commerce businesses$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'fd2949bf-02b3-4401-a031-61e56f53b753';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["300 emails/day","Up to 100,000 stored contacts","Brevo branding included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Starter$q$, $q$From $9/month$q$, $q$monthly (annual discount available)$q$, NULL, $q$["From 5,000 emails/month","Unlimited contacts","Optional branding removal (+$9/month)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Standard$q$, $q$From $18/month$q$, $q$monthly (annual discount available)$q$, NULL, $q$["Marketing automation","A/B testing","Unlimited contacts"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Professional$q$, $q$From $499/month$q$, $q$monthly$q$, NULL, $q$["Advanced send-time optimization","Multi-user access","Enhanced reporting"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Dedicated IP","SSO","Advanced support"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = 'fd2949bf-02b3-4401-a031-61e56f53b753';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Brevo, formerly Sendinblue, is a Paris-based multi-channel marketing platform founded in 2012, combining email, SMS, WhatsApp, marketing automation, and a built-in sales CRM in one product for small and mid-sized businesses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Brevo bills by email volume rather than contact list size, with unlimited contacts on every paid plan. It supports marketing automation triggered by behavior, AI-assisted content generation, transactional email APIs, and e-commerce integrations with Shopify, WooCommerce, and Magento.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Brevo has a free plan (300 emails/day) and paid tiers from Starter ($9/month) through Standard, Professional ($499/month), and a custom-quoted Enterprise tier, all scaling by email send volume rather than contacts stored.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Brex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Brex is a fintech platform providing corporate cards, expense management, and business banking for startups and enterprises, acquired by Capital One in 2026.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Essentials); Premium at $12/user/month$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$~1,100 employees (at time of Capital One acquisition)$q$, company_size),
  headquarters = COALESCE($q$San Francisco, CA, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Brex: Corporate Card & Spend Management Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Brex offers corporate cards, expense management, and business banking. Free Essentials plan available; Premium from $12/user/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Brex is a financial technology company founded in 2017 by Pedro Franceschi and Henrique Dubugras, alumni of Y Combinator, originally built to offer corporate credit cards to venture-backed startups without requiring a personal guarantee or credit check tied to founders' personal credit. The company is headquartered in San Francisco, California; after several years without a formal headquarters, Brex leased office space in San Francisco's South of Market district in August 2025. In January 2026, Capital One announced an agreement to acquire Brex, and the deal closed on April 7, 2026, in a transaction reported at roughly $5.15 billion combining cash and Capital One stock. Brex had approximately 1,100 employees at the time of the acquisition and continues to operate its own product under the Brex brand as a Capital One subsidiary.

The platform has expanded well beyond its original corporate-card product into a broader spend-management and business-banking suite. Core offerings include corporate charge cards with unlimited employee cards, automated expense categorization and receipt capture, real-time spend controls and approval policies, business banking and cash management accounts, bill pay, travel booking, and local-currency wire transfers. Brex integrates with accounting and ERP systems including QuickBooks, Xero, and NetSuite, with automated field mapping to reduce manual bookkeeping work. The company has increasingly emphasized AI agents within its platform to automate expense-policy enforcement and reduce manual transaction review.

Brex uses a freemium pricing structure with three tiers. The free "Essentials" plan includes global Brex corporate cards, reimbursements, travel booking, local-currency wires, real-time reporting, standard accounting integrations, automated accounting field mapping, and basic spend controls, with no monthly per-user fee. "Premium," at $12 per user per month, adds more advanced configuration: custom roles and permissions, customizable ERP and HRIS integrations, VAT documentation, live budgets, dynamic spend-limit requests and approvals, and more granular policy automation. An "Enterprise" tier is available at custom pricing for larger organizations needing dedicated support and further customization.

Brex's original and continuing core customer base is venture-backed startups and scale-ups, companies that often can't qualify for traditional corporate cards from legacy banks due to limited credit history, along with growing mid-market and enterprise customers as the product has matured. Its free Essentials tier makes it accessible to very early-stage startups, while Premium and Enterprise tiers target finance teams at larger companies needing tighter controls and ERP integration. The Capital One acquisition is expected to combine Brex's startup-friendly, AI-native software with Capital One's larger balance sheet and underwriting scale, though the long-term product roadmap under Capital One ownership was not yet fully detailed as of mid-2026. Competitors include Ramp, Mercury, Divvy (Bill.com), and traditional corporate card programs from Amex and Chase.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '90a5952e-cd43-4cf5-bc88-317304be7a50';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '90a5952e-cd43-4cf5-bc88-317304be7a50' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Corporate Charge Cards$q$, $q$Unlimited employee cards with real-time spend visibility.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Automated Expense Categorization$q$, $q$Automatically categorizes transactions and captures receipts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Real-Time Spend Controls & Approval Policies$q$, $q$Configurable spend limits and approval workflows enforced in real time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Business Banking & Cash Management$q$, $q$Business bank accounts with local-currency wires and cash management tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Bill Pay & Travel Booking$q$, $q$Integrated bill payment and corporate travel booking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$ERP/Accounting Integrations$q$, $q$Connects to QuickBooks, Xero, and NetSuite with automated field mapping.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$AI-Driven Policy Automation$q$, $q$AI agents help automate expense-policy enforcement and reduce manual review.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Free Essentials plan with no per-user fee, accessible to early-stage startups$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$No personal credit check or guarantee required for corporate cards, per its original model$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Combines cards, banking, and expense management in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Backed by Capital One's balance sheet following the 2026 acquisition$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Long-term product roadmap under Capital One ownership isn't fully settled as of 2026$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Advanced controls, custom roles, and ERP customization require the paid Premium tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Historically focused on VC-backed startups, so eligibility criteria may not fit all businesses$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Enterprise tier pricing is custom/quote-based, not published$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Is Brex free to use?$q$, $q$Yes, Brex's Essentials plan is free with no per-user fee, including global corporate cards and basic spend controls.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Did Capital One acquire Brex?$q$, $q$Yes, Capital One completed its acquisition of Brex on April 7, 2026, in a deal reported at roughly $5.15 billion; Brex continues to operate under its own brand.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Does Brex require a personal credit check?$q$, $q$Brex's corporate cards were originally built to avoid requiring a personal guarantee or personal credit check tied to founders.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$What accounting software does Brex integrate with?$q$, $q$Brex integrates with QuickBooks, Xero, and NetSuite, with automated accounting field mapping.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$What is included in Brex Premium?$q$, $q$Premium ($12/user/month) adds custom roles and permissions, customizable ERP/HRIS integrations, VAT documentation, live budgets, and more granular spend-policy automation.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Early-Stage Startup Card & Expense Management$q$, $q$Startups use the free Essentials plan to issue employee cards and manage expenses without a per-user fee.$q$, $q$Early-stage startup finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Mid-Market ERP-Integrated Spend Controls$q$, $q$Growing companies use Premium for custom roles, ERP integrations, and granular approval policies.$q$, $q$Mid-market finance and operations teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Essentials$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Global Brex cards","Reimbursements","Travel booking","Local-currency wires","Real-time reporting","Standard accounting integrations","Basic spend controls"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Premium$q$, $q$$12/user/month$q$, $q$monthly$q$, NULL, $q$["Custom roles & permissions","Customizable ERP/HRIS integrations","VAT documentation","Live budgets","Dynamic spend-limit approvals","Granular policy automation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Dedicated support","Advanced customization"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Brex is a fintech company founded in 2017 by Pedro Franceschi and Henrique Dubugras, offering corporate cards, expense management, and business banking. It's headquartered in San Francisco and was acquired by Capital One in a deal that closed in April 2026, continuing to operate under the Brex brand.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Brex offers unlimited employee corporate cards, automated expense categorization, real-time spend controls, business banking and cash management, bill pay, travel booking, and local-currency wires, with integrations into QuickBooks, Xero, and NetSuite.$q$, $q$The platform increasingly uses AI agents to automate expense-policy enforcement and reduce manual transaction review.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Brex offers a free Essentials plan with no per-user fee, a Premium tier at $12/user/month adding advanced controls and ERP/HRIS integrations, and a custom-priced Enterprise tier for larger organizations.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


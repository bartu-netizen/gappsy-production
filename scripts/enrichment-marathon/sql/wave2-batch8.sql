-- Enrichment marathon batch: Ambition, Amie, Ampache, Amplemarket, Amplitude, Anchr, AnonAddy, Anrok

-- ── Ambition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ambition is a B2B sales performance platform combining coaching orchestration, activity tracking, and AI-driven performance intelligence for revenue teams.$q$, short_description),
  pricing_model = COALESCE($q$Custom / demo-based pricing$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$50-100 employees$q$, company_size),
  headquarters = COALESCE($q$Chattanooga, Tennessee, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Ambition: Sales Coaching & Performance Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Ambition helps sales teams coach reps, track activity, and surface AI-driven performance insights in one platform for managers and RevOps.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ambition is a B2B sales performance and coaching platform built by Ambition, Inc., a company founded in 2013 and headquartered in Chattanooga, Tennessee. The platform positions itself as an 'Execution Operating System' for revenue organizations, unifying sales coaching, activity tracking, and performance intelligence in a single system. Its core modules include Coaching Orchestration, which automates 1:1 coaching cadences and centralizes coaching documentation for sales managers; Sales Activation, which gives leaders visibility into rep execution and reinforces behaviors tied to bookings; and Performance Intelligence, which uses AI to surface risk signals and insights across pipeline and activity data. Ambition targets sales managers, revenue operations teams, and enablement leaders at mid-market and enterprise companies, with publicly referenced customers including T-Mobile, Zoom, Paycor, and the Dallas Mavericks. Pricing is not published on the website; prospective customers are directed to request a demo, which is typical of enterprise sales-led SaaS. The product is delivered as a web-based platform rather than as open source or self-hosted software. Ambition is best suited for organizations with dedicated sales management and coaching processes that want to standardize manager behaviors, reduce rep ramp time, and get earlier visibility into performance risk, rather than solo users or very small sales teams.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Coaching Orchestration$q$, $q$Automates 1:1 coaching cadences, session scheduling, and centralized coaching documentation for sales managers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Sales Activation$q$, $q$Tracks rep activity and execution against goals to reinforce behaviors correlated with bookings.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Performance Intelligence$q$, $q$AI-powered analytics that surface risk signals and performance trends across the revenue organization.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Unified Performance Graph$q$, $q$Combines revenue strategy, activity data, and pipeline data into a single performance view.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Manager Dashboards & Reporting$q$, $q$Gives leaders visibility into team and individual rep performance metrics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Gamification$q$, $q$Leaderboards and recognition tools that motivate sales teams, building on Ambition's original product focus.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Centralizes sales coaching workflows that are often scattered across spreadsheets and calls.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$AI-driven performance intelligence can flag at-risk reps or deals earlier.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Used by large, recognizable enterprise sales organizations (T-Mobile, Zoom, Paycor).$q$, 2);

DELETE FROM tool_cons WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Pricing isn't published, so cost comparison requires a sales call.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Built for structured sales management processes, likely more than very small teams need.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Does Ambition publish its pricing?$q$, $q$No, Ambition's website doesn't list pricing; you need to request a demo to get a quote.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Who is Ambition designed for?$q$, $q$Sales managers, revenue operations, and enablement teams at mid-market and enterprise companies.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Does Ambition include gamification?$q$, $q$Yes, Ambition originally built its reputation on sales leaderboards and gamification, and it retains that alongside newer coaching and AI features.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Is Ambition self-hosted?$q$, $q$No, it's a cloud-based web platform, not self-hosted software.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Sales coaching standardization$q$, $q$Managers use automated cadences and centralized notes to run consistent 1:1 coaching.$q$, $q$Sales managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Performance risk detection$q$, $q$AI surfaces reps or deals that are trending off-track before they become quota problems.$q$, $q$RevOps and sales leadership$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$New rep onboarding$q$, $q$Coaching workflows help ramp new sales development reps faster.$q$, $q$Sales enablement teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ambition is a sales performance and coaching platform founded in 2013 and headquartered in Chattanooga, Tennessee. It describes itself as an 'Execution Operating System' that unifies sales coaching, activity tracking, and AI-driven performance intelligence for revenue organizations.$q$, $q$The platform is used by revenue leaders, sales managers, and enablement teams at companies including T-Mobile, Zoom, Paycor, and the Dallas Mavericks, spanning industries like technology, financial services, telecommunications, and logistics.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Ambition's Coaching Orchestration module automates 1:1 coaching cadences and centralizes coaching documentation, while Sales Activation gives managers visibility into rep execution against goals. Performance Intelligence layers AI-generated insights and risk detection on top of pipeline and activity data, and a Unified Performance Graph ties revenue strategy, activity, and pipeline data together in one view.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Ambition is aimed at sales managers, revenue operations professionals, and sales enablement teams at mid-market and enterprise organizations that already have structured sales management processes and want to standardize coaching, monitor execution, and catch performance risk earlier.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Amie ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amie is an AI-powered calendar and meeting assistant that merges calendar, to-dos, and bot-free meeting notes into one app for Mac, Windows, and iOS.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Berlin, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amie: AI Calendar, To-Dos & Meeting Notes$q$, seo_title),
  seo_meta_description = COALESCE($q$Amie combines calendar, to-do lists, and bot-free AI meeting notes in one app for Mac, Windows, and iOS, with a free plan and paid Pro/Business tiers.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amie is a calendar and task management app built by Amie GmbH, a Berlin-based startup founded in 2020 by Dennis Müller, a former N26 product manager. The app merges a calendar, to-do lists, and AI-generated meeting notes into a single interface, with native apps for macOS (Intel and Apple Silicon), Windows, and iOS, plus a menu-bar calendar widget. Amie has raised funding from investors including Spark Capital, Creandum, and Tiny. Its standout feature is bot-free meeting recording and transcription across Zoom, Google Meet, Microsoft Teams, Slack Huddles, Whereby, Webex, and BlueJeans, supporting 17 languages, paired with context-aware AI summaries and action items. An integrated AI chat assistant can draft emails and create tasks using context from a user's calendar, email, and past meetings, and Amie integrates with tools like HubSpot, Notion, Slack, Linear, and Pipedrive. Amie uses a freemium pricing model: a Free plan covers unlimited calendars and to-do lists with basic features, while paid Pro and Business plans (with a 7-day free trial) unlock AI scheduling, audio file uploads for AI notes, custom templates, advanced CRM/ATS integrations, and enterprise features like custom branding and audit logs. Amie is aimed at individuals, founders, and sales or customer-facing teams who want to consolidate their calendar, tasks, and meeting notes into a single app instead of juggling separate tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Unified Calendar$q$, $q$Syncs unlimited Google and Apple calendars into one view with a menu-bar widget.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$AI Meeting Notes$q$, $q$Records and transcribes calls on Zoom, Meet, Teams, Slack Huddles, Webex, and BlueJeans without a bot joining the call, in 17 languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$AI Chat Assistant$q$, $q$Chats with context from your calendar, email, and meeting notes to draft emails and create tasks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$To-Do & Task Management$q$, $q$Unified to-do lists that integrate with your calendar and third-party task tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Pomodoro Timer$q$, $q$Built-in focus timer alongside the calendar and task views.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Third-Party Integrations$q$, $q$Connects with HubSpot, Notion, Slack, Linear, and Pipedrive, among others.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Combines calendar, tasks, and meeting notes in one app instead of juggling separate tools.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Bot-free meeting recording avoids a visible notetaker bot joining calls.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Native apps for Mac, Windows, and iOS, with a free tier to try before paying.$q$, 2);

DELETE FROM tool_cons WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$No Android app, which limits mobile use for non-Apple users.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$AI scheduling, advanced integrations, and custom branding require a paid Pro or Business plan.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Is Amie free to use?$q$, $q$Yes, Amie offers a free plan with core calendar and to-do features; AI scheduling and advanced integrations require the paid Pro or Business plan.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Does Amie require a bot to join my meetings?$q$, $q$No, Amie records and transcribes meetings without a visible bot joining the call.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$What platforms does Amie support?$q$, $q$Amie has native apps for macOS (Intel and Apple Silicon), Windows, and iOS.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Who makes Amie?$q$, $q$Amie is developed by Amie GmbH, a Berlin-based company founded in 2020 by Dennis Müller.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Meeting notes automation$q$, $q$Sales and customer success teams record calls and get AI summaries and action items.$q$, $q$Sales and CS professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Personal calendar and task consolidation$q$, $q$Individuals combine multiple calendars and to-do lists into one app.$q$, $q$Knowledge workers and founders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$GTM workflow integration$q$, $q$Meeting insights flow into HubSpot, Notion, and Slack.$q$, $q$GTM and sales teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Free$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Unlimited Google & Apple calendars","Unlimited to-do lists","Calendar in menu bar","Bot-free meeting recordings (limited)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Pro$q$, $q$From $15/month (billed annually) or $20/month (billed monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["AI scheduling","Upload audio files as AI notes","Custom templates","Advanced integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Business$q$, $q$From $21/month (billed annually) or $30/month (billed monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["Custom branding on shared notes","End-to-end encryption","Recordings with custom bot","Customer success manager","Audit log"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amie is a calendar, to-do, and AI meeting notes app built by Amie GmbH, a Berlin-based company founded in 2020 by Dennis Müller. The app is designed to replace a stack of separate calendar, task, and meeting-notes tools with a single interface.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Amie's AI note taker records and transcribes meetings on Zoom, Google Meet, Teams, Slack Huddles, Whereby, Webex, and BlueJeans without a bot visibly joining the call, and supports 17 languages. Context-aware AI summaries generate action items, and an integrated AI chat assistant can draft emails or create tasks using context from a user's calendar, email, and meeting history. The app syncs unlimited Google and Apple calendars and to-do lists, and integrates with tools including HubSpot, Notion, Slack, Linear, and Pipedrive.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Amie offers a Free plan with core calendar, to-do, and limited meeting-notes functionality. Paid Pro and Business plans, available with a 7-day free trial, add AI scheduling, audio-upload AI notes, custom templates, advanced ATS/CRM integrations, and (on Business) custom branding, end-to-end encryption, and an audit log.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$Amie ships native apps for macOS (Intel and Apple Silicon), Windows, and iOS, alongside a menu-bar calendar widget on desktop.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Ampache ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ampache is a free, open-source, self-hosted web application for streaming and managing your personal music and video collection from any device.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2001, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Ampache: Open-Source Self-Hosted Music Streaming$q$, seo_title),
  seo_meta_description = COALESCE($q$Ampache is a free, open-source, self-hosted server for streaming your own music and video library to phones, browsers, and third-party apps.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ampache is a free, open-source web-based application for streaming and managing personal music and video collections, first released in 2001 and still actively maintained on GitHub under the AGPLv3 license. Users self-host Ampache on their own server or via an official Docker image (built for linux/amd64, linux/arm/v7, and linux/arm64), then browse, organize, and stream their media library through a built-in HTML5 web player or any Subsonic-API-compatible client. This API compatibility layer lets Ampache work with a wide range of third-party apps, including DSub, Symfonium, Power Ampache 2, Submariner, and Feishin on Android, and Substreamer on iOS, as well as UPnP/DLNA backends for smart TVs and a DAAP backend for iTunes-compatible clients. Core features include catalog management for local and remote music/video libraries, playlist creation, Localplay device control, and multi-device synchronization so a collection can be accessed from home, work, or on the go. Because it is fully open source and self-hosted, there is no subscription cost and no vendor lock-in; users retain full control of their data and files, and the only cost is the infrastructure needed to run it. Ampache is best suited for people who already own or have ripped a personal media collection and want a private, self-hosted alternative for streaming it to their own devices, rather than a subscription streaming service with licensed catalog content.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e99d3f06-f0d5-4075-94ed-49469f876517';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e99d3f06-f0d5-4075-94ed-49469f876517' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e99d3f06-f0d5-4075-94ed-49469f876517';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Self-Hosted Media Server$q$, $q$Run Ampache on your own server or via Docker to control your music/video library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Web-Based Streaming$q$, $q$Built-in HTML5 web player for streaming from any browser.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Subsonic API Compatibility$q$, $q$Works with third-party clients like DSub, Symfonium, Power Ampache 2, and Substreamer.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Catalog Management$q$, $q$Organize local and remote music/video catalogs with metadata and playlists.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Localplay Control$q$, $q$Direct playback control on connected devices/players.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$UPnP/DLNA & DAAP Support$q$, $q$Stream to UPnP/DLNA devices or use with iTunes/DAAP-compatible clients.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'e99d3f06-f0d5-4075-94ed-49469f876517';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Completely free and open source, with no subscription fees.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Full control over your own music and video data via self-hosting.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Broad client compatibility through the Subsonic API.$q$, 2);

DELETE FROM tool_cons WHERE tool_id = 'e99d3f06-f0d5-4075-94ed-49469f876517';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Requires self-hosting and basic server/Docker knowledge; there's no managed hosting from the project itself.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Interface and setup are less polished than commercial consumer streaming apps.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = 'e99d3f06-f0d5-4075-94ed-49469f876517';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Is Ampache free?$q$, $q$Yes, Ampache is free and open source under the AGPLv3 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Do I need technical skills to run Ampache?$q$, $q$Yes, Ampache is self-hosted software you install on your own server or via Docker; it isn't a managed cloud service.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Can I use Ampache on my phone?$q$, $q$Yes, through Subsonic-API-compatible apps like DSub and Symfonium on Android, or Substreamer on iOS.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$How long has Ampache been around?$q$, $q$Ampache has been in active development since 2001.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e99d3f06-f0d5-4075-94ed-49469f876517';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Personal music streaming$q$, $q$Self-host your own library and stream it to any device.$q$, $q$Audiophiles and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Home media server$q$, $q$Combine with UPnP/DLNA to stream to TVs and other networked devices.$q$, $q$Home media enthusiasts$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'e99d3f06-f0d5-4075-94ed-49469f876517';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ampache is a free, open-source web application, active since 2001, that lets you access and stream your own music and video collection from anywhere. It is licensed under AGPLv3 and self-hosted, either on your own server or via an official Docker image.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Ampache provides catalog management for local and remote music/video libraries, playlist creation, and Localplay device control, all accessible through a built-in HTML5 web player. Its Subsonic-API compatibility layer lets it work with third-party mobile clients like DSub and Symfonium on Android, and Substreamer on iOS, and it also supports UPnP/DLNA and DAAP (iTunes-compatible) backends.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$Ampache runs as a self-hosted web server, deployable via Docker on linux/amd64, linux/arm/v7, and linux/arm64. Mobile and desktop access is provided through Subsonic-API-compatible clients rather than a single official app.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Amplemarket ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amplemarket is an AI-powered sales platform that combines lead sourcing, buying-intent signals, multichannel outreach, and email deliverability tools for B2B sales teams.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$600/month (Startup plan, billed annually)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE($q$100-150 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amplemarket: AI Sales Prospecting & Outreach Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Amplemarket combines lead search, AI intent signals, and multichannel outreach in one platform for B2B sales teams. Plans start at $600/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amplemarket is an AI-powered sales engagement and prospecting platform aimed at B2B sales teams, sales leaders, and founders building outbound sales motions, headquartered in San Francisco, California. The platform combines several previously separate sales-tooling categories into one product: a lead database ('Searcher') with advanced filtering, real-time buying-intent signals pulled from sources like Slack, G2, and social media, an AI sales agent called 'Duo Copilot' that identifies signals and drafts personalized outreach, multichannel sequencing across email, social, and phone/voice, and email deliverability tooling such as domain health monitoring, mailbox warmup, and spam testing. A unified inbox ('Unibox') consolidates replies across channels, and built-in contact and company data enrichment supports list building. Amplemarket is sold on annual subscription terms, with a published Startup plan starting at $600 per month for two users, and higher Growth and Elite tiers priced on request that add features like Duo Voice and a shared team inbox; all plans include a free trial. The company counts customers such as Deel, Ceros, Cabify, and Wasabi, and has been recognized by Gartner as a 'Cool Vendor' in generative AI for sales. Amplemarket is best suited for sales development and revenue teams that want to consolidate prospecting, outreach, and deliverability management into a single AI-assisted platform rather than stitching together multiple point tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Duo Copilot$q$, $q$AI sales agent that surfaces buying signals and drafts personalized outreach sequences.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Searcher (Lead Database)$q$, $q$Advanced filtering to find and build prospect lists.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$AI Intent Signals$q$, $q$Detects buying intent from sources like Slack, G2, and social media.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Multichannel Sequences$q$, $q$Automates outreach across email, social, and phone/voice.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Deliverability Tools$q$, $q$Domain health monitoring, mailbox warmup, and spam testing to protect sender reputation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Unibox$q$, $q$Unified inbox for managing replies across all outreach channels.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Combines prospecting, outreach, and deliverability tools that are often separate point solutions.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$AI intent signals can help prioritize which leads to contact first.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Published starting price ($600/month) offers more pricing transparency than many competitors.$q$, 2);

DELETE FROM tool_cons WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Higher-tier Growth and Elite plans require contacting sales for custom pricing.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$The entry Startup plan is billed on an annual term, which may not suit teams wanting monthly flexibility.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$How much does Amplemarket cost?$q$, $q$The Startup plan is listed at $600/month on an annual term for 2 users; Growth and Elite plans are custom-priced.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Does Amplemarket offer a free trial?$q$, $q$Yes, all published plans include a free trial.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Who is Amplemarket built for?$q$, $q$B2B sales reps, sales leaders, and founders running outbound prospecting and outreach.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$What is Duo Copilot?$q$, $q$Duo Copilot is Amplemarket's AI sales agent that identifies buying signals and helps create personalized outreach sequences.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Outbound prospecting$q$, $q$Sales teams source and qualify leads using intent signals.$q$, $q$SDRs and account executives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Multichannel outreach automation$q$, $q$Teams run email, social, and phone sequences from a single platform.$q$, $q$Sales teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Deliverability protection$q$, $q$Teams monitor domain health and warm up mailboxes to protect sender reputation.$q$, $q$RevOps$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Startup$q$, $q$$600/month$q$, $q$Annual term$q$, NULL, $q$["2 users included","27,000 contacts","13,500 email credits/user/year","600 phone credits/user/year","Multichannel sequences","AI intent signals","Duo Copilot","Workflows & analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Growth$q$, $q$Custom$q$, $q$Annual term$q$, NULL, $q$["4 users included","140,000 contacts","35,000 email credits/user/year","5,000 phone credits/user/year","Duo Voice","Dedicated CSM"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Elite$q$, $q$Custom$q$, $q$Annual term$q$, NULL, $q$["10 users included","400,000 contacts","Duo Inbox","Dedicated CSM & personalized onboarding"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amplemarket is an AI-powered sales platform headquartered in San Francisco, California, that unifies lead sourcing, buying-intent signals, multichannel outreach, and deliverability management for B2B sales teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Amplemarket's Duo Copilot is an AI sales agent that identifies buying signals and drafts personalized outreach sequences. The Searcher lead database offers advanced filtering for prospecting, while AI Intent Signals detect buying intent from sources like Slack, G2, and social media. Multichannel Sequences automate outreach across email, social, and phone/voice, deliverability tools protect sender reputation through domain health monitoring and mailbox warmup, and Unibox consolidates replies into one inbox.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Amplemarket publishes a Startup plan at $600/month (annual term) for 2 users, including 27,000 contacts and core outreach, signals, and deliverability features. Growth and Elite plans scale up contact volume, credits, and support (dedicated CSM) at custom pricing, and all plans include a free trial.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Amplitude ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Amplitude is a digital analytics platform for tracking user behavior, running experiments, and using AI-driven insights to improve product experiences.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (up to 2M events/month)$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$1,000+ employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Amplitude: Product Analytics & Experimentation Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Amplitude offers product analytics, session replay, experimentation, and AI-powered insights, with a free plan for up to 2M monthly events.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amplitude is a digital analytics platform developed by Amplitude, Inc., a publicly traded company (Nasdaq: AMPL) founded in 2012 and headquartered in San Francisco, California. The platform helps product, marketing, data, and engineering teams understand user behavior and turn that understanding into product decisions. Core capabilities include product analytics (user journey tracking, funnels, retention, and behavioral cohorts), session replay and heatmaps for visual behavior analysis, A/B testing and feature experimentation, and feature flag/feature management tooling. Amplitude has also added AI-native capabilities, including AI agents that continuously analyze data and an Amplitude MCP integration that connects the platform to AI coding and agent tools such as Claude and Cursor. Amplitude uses usage-based, freemium pricing: a Free plan covers up to 2 million tracked events per month indefinitely with no credit card required, a self-serve Plus plan scales with event volume on a pay-as-you-go basis, and Growth and Enterprise tiers add features like SSO, advanced governance, monitoring, and higher session-replay volumes at custom, event-based pricing. Amplitude serves organizations ranging from startups to large enterprises across industries including B2B SaaS, financial services, media, healthcare, and ecommerce, and was recognized as a Leader in the Forrester Wave for digital analytics platforms. It's best suited for product and growth teams that need rigorous, event-based behavioral analytics beyond what basic web analytics tools provide.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Product Analytics$q$, $q$Tracks user journeys, funnels, retention, and behavioral cohorts from event data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Session Replay & Heatmaps$q$, $q$Visual playback of user sessions and aggregated heatmaps of behavior.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Experimentation$q$, $q$Built-in A/B and multivariate testing for features and web pages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$AI Agents$q$, $q$Automated, continuous data analysis that surfaces insights without manual querying.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Feature Management$q$, $q$Feature flags and targeted rollouts tied to analytics data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Amplitude MCP$q$, $q$Connects Amplitude data to AI tools like Claude and Cursor via the Model Context Protocol.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Data Governance$q$, $q$Data quality controls, access management, and compliance tooling.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Generous free tier (2M events/month) with no credit card required.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Combines analytics, experimentation, and feature management in one platform.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$AI Agents and MCP integration extend the data into AI workflows.$q$, 2);

DELETE FROM tool_cons WHERE tool_id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Pricing beyond the Plus tier is custom/event-based, making cost forecasting harder at scale.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Full feature depth (SSO, advanced governance, high replay volumes) is reserved for Growth/Enterprise plans.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Is Amplitude free?$q$, $q$Yes, Amplitude has a permanent free plan covering up to 2 million events per month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$What is Amplitude used for?$q$, $q$Tracking user behavior, running experiments, and generating product analytics insights, including AI-generated analysis.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Does Amplitude integrate with AI tools?$q$, $q$Yes, via Amplitude MCP, which connects Amplitude data to AI agents like Claude and Cursor.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Is Amplitude a public company?$q$, $q$Yes, Amplitude, Inc. trades on Nasdaq under the ticker AMPL.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Product analytics$q$, $q$Track feature adoption, funnels, and retention.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Experimentation$q$, $q$Run A/B tests tied directly to behavioral analytics data.$q$, $q$Growth teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$AI-assisted insight generation$q$, $q$Use AI agents to surface trends automatically instead of manual querying.$q$, $q$Data teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Free$q$, $q$$0$q$, $q$Ongoing$q$, NULL, $q$["2M events/month forever","Basic product analytics","AI Agents and MCP","10K monthly session replays","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Plus$q$, $q$Starts at $0, scales with usage$q$, $q$Pay-as-you-go$q$, NULL, $q$["Up to 70M events/month","Custom events and formulas","20 behavioral cohorts","Alerts","Heatmaps","2-year data retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Growth$q$, $q$Custom (event-based)$q$, $q$Custom$q$, NULL, $q$["Advanced behavioral exploration","Currency conversion","Monitoring and alerts","20K monthly session replays","SSO & project permissions"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Enterprise$q$, $q$Custom (event-based)$q$, $q$Custom$q$, NULL, $q$["Unlimited projects per portfolio","Data access controls","Unlimited monitoring and alerts","50K monthly session replays","Advanced user management (RBAC)"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'd40dfcb1-d37b-4b46-88e3-e3880ecbeec8';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Amplitude is a digital analytics platform founded in 2012 and headquartered in San Francisco, California. It is a publicly traded company (Nasdaq: AMPL) that helps product, marketing, data, and engineering teams understand user behavior and act on it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Amplitude's core is product analytics: user journey tracking, funnels, retention, and behavioral cohorts built from event data. It also includes session replay and heatmaps, built-in A/B and multivariate experimentation, and feature management tooling for targeted rollouts. Newer AI-native features include AI Agents that continuously analyze data and Amplitude MCP, which connects Amplitude data to AI tools like Claude and Cursor via the Model Context Protocol.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Amplitude's Free plan covers up to 2 million events per month indefinitely with no credit card required. The self-serve Plus plan scales with event volume up to roughly 70 million events/month, while Growth and Enterprise tiers add SSO, advanced data governance, higher session-replay volumes, and unlimited monitoring at custom, event-based pricing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Anchr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Anchr is an open-source, self-hostable toolbox for bookmark collections, encrypted image uploads, and link shortening, also offered as a hosted service from Germany.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Anchr: Open-Source Bookmarks, Images & Link Shortener$q$, seo_title),
  seo_meta_description = COALESCE($q$Anchr is an open-source toolbox for bookmark collections, encrypted image uploads, and link shortening — self-host it or use the hosted service.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Anchr is an open-source toolbox for small everyday internet tasks, combining a searchable bookmark manager, an encrypted image upload service, and a link shortener with malicious-link checking in one project. It originated in 2014 during the early MEAN-stack era and is maintained on GitHub at github.com/muety/anchr, with the codebase since modernized and still actively released — version 3.5.2 shipped in late 2025. The project can be self-hosted via Docker (bring your own MongoDB instance, with an nginx reverse proxy recommended for SSL and compression), or used through the hosted version at anchr.io, which is built and hosted in Germany. Features include bookmark collections organized for fast search, client-side encrypted image uploads, shortlinks with malicious-URL checking, a REST API, OAuth2 authentication, browser extensions for Chrome and Firefox, an Android app, Prometheus metrics, ShareX integration, and a Telegram bot. The project describes itself as 'mostly feature-complete,' with ongoing maintenance rather than rapid new-feature development. Anchr is aimed at privacy-conscious users and self-hosters who want a lightweight, no-frills alternative to commercial bookmarking and URL-shortening services and are comfortable either running their own instance or trusting a small, Germany-based hosted deployment.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a8479085-b069-4122-84f4-d7d97ae020d3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a8479085-b069-4122-84f4-d7d97ae020d3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a8479085-b069-4122-84f4-d7d97ae020d3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Bookmark Collections$q$, $q$Organize and search saved links into categorized collections.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Encrypted Image Uploads$q$, $q$Client-side encrypted image hosting.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Link Shortener$q$, $q$Create shortlinks with built-in malicious-link checking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$REST API$q$, $q$Automate bookmark, image, and shortlink management programmatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Browser Extensions$q$, $q$Chrome and Firefox extensions for quick saving.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Self-Hosting via Docker$q$, $q$Deploy your own instance instead of using the hosted service.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'a8479085-b069-4122-84f4-d7d97ae020d3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Fully open source, so it can be self-hosted for free and audited.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Combines three useful utilities (bookmarks, image upload, shortlinks) in one tool.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Hosted option available for users who don't want to run their own server.$q$, 2);

DELETE FROM tool_cons WHERE tool_id = 'a8479085-b069-4122-84f4-d7d97ae020d3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Self-hosting requires running your own MongoDB instance and reverse proxy setup.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$The project describes itself as feature-complete, meaning a slower pace of new feature development.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = 'a8479085-b069-4122-84f4-d7d97ae020d3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Is Anchr free?$q$, $q$Yes, Anchr is open source and free to self-host; a hosted version is also available at anchr.io.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Can I self-host Anchr?$q$, $q$Yes, via Docker, though you need to provide your own MongoDB instance.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$What does Anchr do?$q$, $q$It's a toolbox combining a bookmark manager, encrypted image uploads, and a link shortener.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Where is the hosted Anchr.io service based?$q$, $q$It's made and hosted in Germany.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a8479085-b069-4122-84f4-d7d97ae020d3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Personal bookmark management$q$, $q$Save and search links across devices.$q$, $q$Individuals and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Privacy-focused link shortening$q$, $q$Create shortlinks with malicious-link checks.$q$, $q$Privacy-conscious users$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'a8479085-b069-4122-84f4-d7d97ae020d3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anchr is an open-source toolbox combining a bookmark manager, encrypted image uploads, and a link shortener. It originated in 2014 and is maintained on GitHub, with the option to self-host via Docker or use the hosted service at anchr.io, built and hosted in Germany.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Anchr organizes saved links into searchable collections, offers client-side encrypted image uploads, and generates shortlinks with malicious-URL checking. It exposes a REST API for automation, supports OAuth2 authentication, and ships browser extensions for Chrome and Firefox, an Android app, Prometheus metrics, ShareX integration, and a Telegram bot.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$development-history$q$, $q$Development History$q$, 2, ARRAY[$q$Anchr's backend originated in the MEAN-stack era of 2014 and has since been refactored to modern JavaScript. The maintainer describes the project as mostly feature-complete but continuously maintained, with the latest release (3.5.2) shipping in November 2025.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AnonAddy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AnonAddy (rebranded as addy.io) is an open-source email alias service that lets you create unlimited forwarding addresses to protect your real inbox from spam and leaks.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Geelong, Australia$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AnonAddy (addy.io): Anonymous Email Alias Service$q$, seo_title),
  seo_meta_description = COALESCE($q$AnonAddy (addy.io) is an open-source email alias service that forwards unique addresses to your inbox to block spam and protect your identity.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AnonAddy was an open-source anonymous email forwarding service that in 2024 was rebranded to addy.io, though it is still widely referenced by its original name. Created in 2019 by developer Will Browning, the service lets users generate unique email aliases for each website or contact, which forward incoming mail to a single real inbox, preventing that real address from being exposed or sold. Aliases can be created using a personal username, a random string, or a custom domain, and replies can be sent anonymously from an alias without revealing the underlying address. The service supports GPG/OpenPGP encryption of forwarded mail, routing a single alias to multiple recipients, a developer API for automating alias management, and browser extensions for Firefox, Chrome, Edge, and Safari, plus native iOS and Android apps. addy.io is open source under the AGPL-3.0 license and can be self-hosted via Docker, or used as a hosted service, with the company behind it headquartered in Geelong, Australia. Pricing is freemium: a Free plan includes 10 shared-domain aliases and 1 recipient; a low-cost Lite plan (from $1/month billed yearly) raises those limits; and a Pro plan (from $3/month billed yearly, or $4/month billed monthly) offers unlimited shared-domain aliases, more recipients, and higher daily reply limits. addy.io is aimed at privacy-conscious individuals who want to compartmentalize their online identity, reduce spam, and optionally self-host their own alias infrastructure.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Unlimited Email Aliases$q$, $q$Generate unique forwarding addresses per site or contact.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Custom Domains$q$, $q$Use your own domain for aliases instead of the shared addy.io domain.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Anonymous Replies$q$, $q$Reply from an alias without exposing your real email address.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$GPG/OpenPGP Encryption$q$, $q$Encrypt forwarded emails using recipients' public keys.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Developer API$q$, $q$Automate alias creation and account management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Browser Extensions & Mobile Apps$q$, $q$Firefox, Chrome, Edge, and Safari extensions plus iOS and Android apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Self-Hosting$q$, $q$Open-source AGPL-3.0 codebase that can be deployed on your own server via Docker.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Open source with a self-hosting option for full control over data.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Functional free plan, with paid tiers starting as low as $1/month.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Supports custom domains and GPG encryption for advanced privacy needs.$q$, 2);

DELETE FROM tool_cons WHERE tool_id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$The free plan is limited to a single recipient and 10 shared-domain aliases.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$The rebrand to addy.io may cause confusion since the product is still widely known as AnonAddy.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Is AnonAddy still called that?$q$, $q$The service rebranded to addy.io in 2024; the underlying product and open-source codebase are the same.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Can I self-host AnonAddy/addy.io?$q$, $q$Yes, it's open source under AGPL-3.0 and can be self-hosted via Docker.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Does addy.io have a free plan?$q$, $q$Yes, the Free plan includes 10 shared-domain aliases and 1 recipient at no cost.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$What's the cheapest paid plan?$q$, $q$The Lite plan starts at roughly $1/month when billed yearly.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Spam reduction$q$, $q$Create a unique alias per signup to trace and block leaks.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Anonymous replies$q$, $q$Communicate without revealing your real email address.$q$, $q$Freelancers and professionals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Self-hosted email privacy$q$, $q$Run your own alias infrastructure instead of relying on the hosted service.$q$, $q$Technical users and self-hosters$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Free$q$, $q$$0/month$q$, $q$N/A$q$, NULL, $q$["10 shared-domain aliases","1 recipient","10MB bandwidth"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Lite$q$, $q$$1/month (billed yearly)$q$, $q$Annual$q$, NULL, $q$["50 shared-domain aliases","5 recipients","100MB bandwidth","50 daily replies"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Pro$q$, $q$$3/month (billed yearly) or $4/month (billed monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["Unlimited shared-domain aliases","30 recipients","Unlimited bandwidth","200 daily replies"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AnonAddy is an open-source anonymous email forwarding service created in 2019 by developer Will Browning. In 2024 the product was rebranded to addy.io, though the underlying open-source codebase and functionality are unchanged.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Users generate unique email aliases per website or contact, using a personal username, random string, or custom domain, which forward to a single real inbox. Replies can be sent anonymously from an alias, forwarded mail can be encrypted with GPG/OpenPGP, and a single alias can route to multiple recipients. A developer API supports automation, and the service ships browser extensions for Firefox, Chrome, Edge, and Safari plus native iOS and Android apps.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The Free plan includes 10 shared-domain aliases and 1 recipient. The Lite plan starts around $1/month billed yearly with higher limits, and the Pro plan starts around $3/month billed yearly (or $4/month billed monthly) with unlimited shared-domain aliases, more recipients, and higher daily reply limits.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$development-history$q$, $q$Development History$q$, 2, ARRAY[$q$The project is open source under AGPL-3.0 and can be self-hosted via Docker. It was renamed from AnonAddy to addy.io in 2024, with the open-source self-hosting option still actively maintained.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Anrok ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Anrok is a sales tax and VAT compliance platform that automates nexus monitoring, registration, calculation, filing, and remittance for SaaS and ecommerce companies.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based (per market)$q$, pricing_model),
  starting_price = COALESCE($q$$50/market/month (ecommerce) or $100/market/month (SaaS)$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$100-150 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Anrok: Global Sales Tax & VAT Compliance Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Anrok automates sales tax and VAT compliance for SaaS and ecommerce companies, handling nexus monitoring, filing, and remittance. From $50/market/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Anrok is a sales tax and VAT compliance platform for growing SaaS and ecommerce companies, founded in 2020 by Kannan Goundan and Michelle Valentine and headquartered in San Francisco, California. The platform automates the full tax compliance lifecycle: it monitors economic and physical nexus in real time across more than 100 countries and over 13,000 US jurisdictions, handles tax registration, calculates tax at checkout or on invoices through a system it calls Anrok Atlas, and manages filing, remittance, and reconciliation. It connects to billing and commerce systems through more than 40 native integrations, including Stripe, NetSuite, Salesforce, and Shopify, and can track physical nexus using HRIS data. Anrok positions expert-verified returns as a differentiator, claiming fewer than 1% require revision. Pricing is published per market: a Starter plan for SaaS companies costs $100 per market per month, a Starter plan for ecommerce brands costs $50 per market per month, and larger companies operating in 10+ markets or facing complex, multi-entity, or IPO-track requirements can move to a custom-priced plan with added features like single sign-on, multi-entity management, and priority support. Customers referenced on Anrok's site include Notion, Vanta, Sourcegraph, Descript, and Anthropic, and the company reports processing roughly $50 billion in annual transaction volume through the platform. Anrok is built for finance and operations teams at multi-jurisdictional software and ecommerce businesses that need to stay compliant with sales tax and VAT obligations without building that expertise in-house.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Nexus Monitoring$q$, $q$Real-time tracking of economic and physical nexus across 100+ countries and 13,000+ US jurisdictions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Automated Registration$q$, $q$Handles tax registration once nexus thresholds are triggered.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Real-Time Tax Calculation (Anrok Atlas)$q$, $q$Calculates sales tax and VAT at checkout or on invoices.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Filing & Remittance$q$, $q$Automates tax return filing and payment remittance across jurisdictions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$40+ Native Integrations$q$, $q$Connects with Stripe, NetSuite, Salesforce, Shopify, and other billing/commerce systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Physical Nexus Tracking via HRIS$q$, $q$Detects physical nexus triggered by remote employee locations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Exemption Certificate Management$q$, $q$Tracks and manages tax exemption certificates.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Published, transparent per-market pricing rather than fully opaque quote-only pricing.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Broad native integrations with common billing and commerce platforms.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Backed by recognizable customers (Notion, Vanta, Sourcegraph) suggesting enterprise-grade reliability.$q$, 2);

DELETE FROM tool_cons WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Per-market pricing can get expensive quickly for companies with nexus in many jurisdictions.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Best suited for companies that already have (or are approaching) multi-state/multi-country tax obligations, not pre-revenue startups.$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$How much does Anrok cost?$q$, $q$The Starter plan is $100/market/month for SaaS companies and $50/market/month for ecommerce; larger, multi-market companies use a custom plan.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$What does Anrok integrate with?$q$, $q$Anrok has 40+ native integrations including Stripe, NetSuite, Salesforce, and Shopify.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Does Anrok handle tax filing?$q$, $q$Yes, Anrok automates filing and remittance across the jurisdictions where you're registered.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Who founded Anrok?$q$, $q$Anrok was founded in 2020 by Kannan Goundan and Michelle Valentine.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$SaaS tax compliance$q$, $q$Automate nexus monitoring, calculation, and filing for subscription billing.$q$, $q$Finance teams at SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Ecommerce checkout tax$q$, $q$Calculate and remit sales tax on platforms like Shopify and WooCommerce.$q$, $q$Ecommerce finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Multi-entity global expansion$q$, $q$Manage tax compliance across many markets ahead of an IPO or scale-up.$q$, $q$Enterprise finance and operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Starter (SaaS)$q$, $q$$100/market/month$q$, $q$Monthly$q$, NULL, $q$["Global exposure monitoring","Real-time tax calculation","Filing and remittance","Exemption certificate management","Physical nexus tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Starter (Ecommerce)$q$, $q$$50/market/month$q$, $q$Monthly$q$, NULL, $q$["Registration","Real-time tax calculation","Filing and remittance","Exemption certificate management","Shopify/WooCommerce integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Custom$q$, $q$Custom quote$q$, $q$Custom$q$, NULL, $q$["Advanced integrations","Multi-billing system support","Multi-entity management","Audit-ready reporting","Priority support","Single sign-on"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anrok is a sales tax and VAT compliance platform founded in 2020 by Kannan Goundan and Michelle Valentine, headquartered in San Francisco, California. It automates nexus monitoring, registration, calculation, filing, and remittance for SaaS and ecommerce companies operating across multiple jurisdictions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Anrok monitors economic and physical nexus in real time across 100+ countries and 13,000+ US jurisdictions, automates tax registration once thresholds are triggered, and calculates tax at checkout or on invoices via Anrok Atlas. It also automates filing and remittance, tracks exemption certificates, and can detect physical nexus triggered by remote employees using HRIS data.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Anrok publishes per-market pricing: a Starter plan for SaaS companies costs $100 per market per month, and a Starter plan for ecommerce companies costs $50 per market per month. Companies scaling to 10+ markets or needing multi-entity management, SSO, and priority support move to a custom-priced plan.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Anrok offers more than 40 native integrations with billing and commerce platforms, including Stripe, NetSuite, Salesforce, and Shopify, plus HRIS integrations for physical nexus tracking.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


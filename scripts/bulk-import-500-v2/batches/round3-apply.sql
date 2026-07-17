-- Enrichment batch: Hiver, Trengo, Respond.io, SleekFlow, Interakt, WATI, DelightChat, Kommunicate, Chatwoot, Smartsupp, Chaport, JivoChat, HelpCrunch, SupportBee, ProProfs Help Desk, LiveAgent, TeamSupport, Deskpro, Humaans, CharlieHR, BreatheHR, Namely, Justworks, Papaya Global, Oyster, Multiplier, Plane, RemotePass, WorkMotion, Pinpoint, Manatal, Jobvite, SmartRecruiters, iCIMS, Bullhorn, Gem, Fetcher, AmazingHiring, Payhawk, Airwallex, Mercury, Novo, Relay Financial, Moss, Spendesk, Pleo, Jeeves, Mesh Payments, Float Financial, Rho, Tipalti, AvidXchange, Melio, Payoneer, GoCardless, Mollie, Checkout.com, Braintree, FastSpring, Lemon Squeezy, Orb, Metronome, Billsby, Pendo, Userpilot, Appcues, Chameleon, Product Fruits, UserGuiding, WalkMe, Whatfix, Apty, LogSnag, Pirsch, Fathom Analytics, Simple Analytics, Cabin, Statsig, GrowthBook, JumpCloud, Duo Security, Twingate, Teleport, StrongDM, Drata, Hyperproof, Thoropass, Sprinto, Scrut Automation, Astra Security
-- Publishes 90 bulk-imported tool(s) with full editorial content.

-- ── Hiver ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Hiver is an omnichannel customer service platform that unifies email, chat, Slack, voice, and WhatsApp with AI agents and automation.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan available; paid plans from $25/user/month (Growth, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hiver unifies email, chat, Slack, voice, and WhatsApp into one shared inbox with AI agents, automation, and analytics for support teams.$q$,
  og_description = $q$Hiver unifies email, chat, Slack, voice, and WhatsApp into one shared inbox with AI agents, automation, and analytics for support teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Omnichannel inbox$q$, $q$Consolidates email, chat, Slack, voice, and WhatsApp into one shared inbox.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$AI Agents$q$, $q$Execute multi-step support procedures across integrated tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$AI Copilot$q$, $q$Assists with ticket triage, reply drafting, and task execution.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$AI Help Center$q$, $q$Auto-generates help articles from resolved tickets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$AI Insights$q$, $q$Monitors quality and tracks customer health signals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Workflow automation$q$, $q$Rule-based and agentic automation for routing and assignment.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Native integrations$q$, $q$Connects with Salesforce, Shopify, NetSuite, and 10,000+ tools.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Wide channel coverage (email, chat, Slack, voice, WhatsApp) in one inbox$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Free tier available before committing to a paid plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$AI copilot and AI agents built into paid tiers for ticket handling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Native integrations with Salesforce, Shopify, and NetSuite$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Advanced AI features (AI QA, AI insights, AI knowledge builder) are limited to the top Elite plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Minimum of 2 seats required, jumping to 5-seat increments beyond that$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Per-seat pricing rises quickly across tiers, from $25 to $85/user/month annually$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Does Hiver have a free plan?$q$, $q$Yes, Hiver offers a permanently free tier with shared inbox and ticketing for email, chat, and help center channels.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$What is the cheapest paid Hiver plan?$q$, $q$The Growth plan starts at $25/user/month billed annually, or $35/user/month billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Does Hiver include AI features?$q$, $q$Yes; AI agents and AI copilot are included from the Growth plan up, with AI QA and AI insights added on the Elite plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$What integrations does Hiver support?$q$, $q$Hiver lists native integrations with Salesforce, Shopify, NetSuite, and over 10,000 tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Multi-channel support desks$q$, $q$Teams juggling email, chat, Slack, and WhatsApp support conversations in one place.$q$, $q$Customer support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Internal service management$q$, $q$IT, HR, and finance teams that need ticketing without complex service-desk software.$q$, $q$Internal service teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Shared inbox and ticketing","Email, chat, and help center channels","24/7 support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Growth$q$, $q$$25/user/month annual, $35/user/month monthly$q$, $q$monthly$q$, $q$["Everything in Free","AI agents","AI copilot","Voice (add-on)","Rule-based automation","Round-robin assignment","Basic analytics","Fundamental integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Pro$q$, $q$$55/user/month annual, $65/user/month monthly$q$, $q$monthly$q$, $q$["Everything in Growth","Customer portal","Slack channel management","SLAs and CSAT surveys","Advanced analytics","Premium integrations","API access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Elite$q$, $q$$85/user/month annual, $95/user/month monthly$q$, $q$monthly$q$, $q$["Everything in Pro","AI QA","AI insights","AI knowledge builder","Customer intelligence","Skill-based routing","Custom objects","SSO, HIPAA, custom roles"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$overview$q$, $q$What is Hiver?$q$, 2, ARRAY[$q$Hiver is a customer service platform built around a shared inbox that brings together email, live chat, Slack, voice, and WhatsApp conversations in one place.$q$, $q$Paid tiers add AI agents, an AI copilot for drafting replies, automated help-center article generation, and quality-monitoring insights, alongside native integrations with tools like Salesforce, Shopify, and NetSuite.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$who-its-for$q$, $q$Who Hiver is for$q$, 2, ARRAY[$q$Hiver suits support, IT, HR, and finance teams that need ticketing and multi-channel conversation management without adopting a full standalone help-desk suite.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Trengo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Trengo is a customer engagement platform combining WhatsApp, email, social media, and voice into one inbox with AI Agents that automate replies.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$€299/month (Boost plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Trengo unifies WhatsApp, email, social media, and voice in one inbox, with AI Agents to automatically resolve customer conversations.$q$,
  og_description = $q$Trengo unifies WhatsApp, email, social media, and voice in one inbox, with AI Agents to automatically resolve customer conversations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '463b249f-58f5-4f62-8f21-0f807fd8bd65';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '463b249f-58f5-4f62-8f21-0f807fd8bd65' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Omnichannel inbox$q$, $q$Combines WhatsApp, email, Instagram, Facebook, and voice in one shared inbox.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$AI Agents$q$, $q$Automatically resolve routine conversations; Trengo states up to 80% of volume.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$AI Journeys$q$, $q$Automated flows for lead qualification and nurturing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$AI Voice Agents$q$, $q$AI-handled phone interactions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$WhatsApp Business API$q$, $q$Native WhatsApp messaging integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Business integrations$q$, $q$Connects with Shopify, WooCommerce, HubSpot, Salesforce, and Wix.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Combines chat, email, WhatsApp, and voice into a single inbox$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$AI Agents can resolve routine conversations without agent involvement (Trengo claims up to 80%)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Established integrations with Shopify, HubSpot, Salesforce, and WooCommerce$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Used by well-known brands including Uber and Porsche, per the company site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$No free-forever plan; the entry Boost tier starts at €299/month for up to 10 users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Conversation volume beyond the plan cap (500/month on Boost) costs extra at €18 per 100$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$AI-enhanced conversations are billed separately at €0.30 each$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Enterprise pricing is quote-only$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Does Trengo have a free plan?$q$, $q$No published free-forever plan; pricing starts at the Boost plan (€299/month for up to 10 users).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Does Trengo offer a free trial?$q$, $q$Trengo directs new users to a trial signup from its homepage, though trial length and terms are not detailed on the pricing page.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$What channels does Trengo support?$q$, $q$WhatsApp, email, Instagram, Facebook, and voice, unified into one inbox.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$How much do extra conversations cost on Trengo?$q$, $q$Additional conversations beyond a plan's included volume cost €18 per 100, and AI-enhanced conversations cost €0.30 each.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$eCommerce customer support$q$, $q$Online stores managing WhatsApp and email support at scale.$q$, $q$eCommerce support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Hospitality guest communication$q$, $q$Hotels and travel operators coordinating guest messages across channels.$q$, $q$Hospitality and travel businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Boost$q$, $q$€299/month$q$, $q$monthly$q$, $q$["10 users included","500 conversations/month","Unified inbox","WhatsApp Business API","AI Agent","Basic automation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Pro$q$, $q$€499/month$q$, $q$monthly$q$, $q$["20 users included","1,500 conversations/month","All Boost features","Advanced security","Additional integrations","Live chat and phone support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom users and conversation volume","Tailored solutions","Dedicated success manager","Custom integrations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$overview$q$, $q$What is Trengo?$q$, 2, ARRAY[$q$Trengo is a customer engagement platform that consolidates WhatsApp, email, Instagram, Facebook, and voice conversations into a single shared inbox.$q$, $q$Its AI Agents and AI Journeys automate routine replies and lead-nurturing flows, while integrations with Shopify, HubSpot, Salesforce, and WooCommerce connect conversations to existing business systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$who-its-for$q$, $q$Who Trengo is for$q$, 2, ARRAY[$q$Trengo targets eCommerce, hospitality, leisure, travel, financial services, automotive, and education businesses that handle high volumes of multi-channel customer conversations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Respond.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Respond.io is an AI-powered customer communication platform unifying WhatsApp, Instagram, TikTok, and other channels for sales, marketing, and support.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$79/month (Starter plan, monthly)$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$Kuala Lumpur, Malaysia$q$,
  languages = '{}',
  seo_meta_description = $q$Respond.io unifies WhatsApp, Instagram, TikTok, and other channels into one inbox with AI Agents for sales, marketing, and support teams.$q$,
  og_description = $q$Respond.io unifies WhatsApp, Instagram, TikTok, and other channels into one inbox with AI Agents for sales, marketing, and support teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Unified team inbox$q$, $q$Consolidates WhatsApp, TikTok, Instagram, and Facebook in one thread per contact.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$AI Agents$q$, $q$Respond to inquiries, qualify leads, and complete tasks with built-in guardrails.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$CRM integration$q$, $q$Brings full customer context into every conversation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$WhatsApp and Messenger Calls$q$, $q$Handles VoIP-based WhatsApp Business Calls and Messenger Calls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Workflow automation$q$, $q$Automates lead routing and assignment.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Broadcasts and campaigns$q$, $q$Built-in campaign management and analytics (Growth plan and up).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Developer API and integrations$q$, $q$Zapier and Make integrations plus a developer API on Growth plan and up.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Handles WhatsApp, Instagram, TikTok, and voice calls, not just chat, from one inbox$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$7-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Official Meta and TikTok partner$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Reports 99.999% uptime and a 4.8/5 G2 rating from 500+ reviews$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$No permanent free plan, only a 7-day trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Workflow automation and AI agents are gated behind the Growth plan ($159/month) and above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$SSO and custom channels require the Advanced plan ($279/month)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Additional users cost extra on every tier ($12-$24/month per user)$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Does Respond.io offer a free plan?$q$, $q$No; it offers a 7-day free trial with no credit card required, not a free-forever tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$How much does Respond.io cost?$q$, $q$Plans start at $79/month (Starter) and go up to $279/month (Advanced), plus custom Enterprise pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$When was Respond.io founded?$q$, $q$Respond.io was founded on February 17, 2017.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Where is Respond.io headquartered?$q$, $q$Kuala Lumpur, Malaysia.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Multi-channel sales and support$q$, $q$Businesses managing WhatsApp, Instagram, and TikTok conversations in one place.$q$, $q$B2C sales and support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Lead qualification automation$q$, $q$Teams using AI agents to qualify and route inbound leads automatically.$q$, $q$Marketing and sales teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Starter$q$, $q$$79/month, $948/year$q$, $q$monthly$q$, $q$["Team and custom inboxes","Mobile app","AI prompt","AI assist","Basic reports","2FA","5 users included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Growth$q$, $q$$159/month, $1,908/year$q$, $q$monthly$q$, $q$["Everything in Starter","Broadcasts","Workflow automation","AI agents","Advanced reports","Zapier and Make integrations","Developer API","10 users included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Advanced$q$, $q$$279/month, $3,348/year$q$, $q$monthly$q$, $q$["Everything in Growth","Masked phone/email","Multiple workspaces","HTTP requests in workflows","Webhooks","SSO","Custom channels"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Advanced","Unlimited users","Higher workspace limits","Higher API rate limits"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$overview$q$, $q$What is Respond.io?$q$, 2, ARRAY[$q$Respond.io is a customer communication platform that brings WhatsApp, Instagram, TikTok, and Facebook conversations into one unified inbox for sales, marketing, and support teams.$q$, $q$It adds AI Agents for handling inquiries and lead qualification, workflow automation, and voice-call handling via WhatsApp Business Calls and Messenger Calls.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$who-its-for$q$, $q$Who Respond.io is for$q$, 2, ARRAY[$q$It targets B2C businesses managing high volumes of customer conversations across chat, social, and voice channels, particularly those relying on WhatsApp, Instagram, and TikTok.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── SleekFlow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SleekFlow is an AI conversational operations platform centralizing WhatsApp, Instagram, and other channels into one inbox with AI agents for sales and support.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan available; Pro AI plan from HK$399/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$Arabic$q$, $q$German$q$, $q$English$q$, $q$Spanish$q$, $q$French$q$, $q$Indonesian$q$, $q$Italian$q$, $q$Malay$q$, $q$Dutch$q$, $q$Portuguese$q$, $q$Chinese (Simplified)$q$, $q$Chinese (Traditional)$q$]::text[],
  seo_meta_description = $q$SleekFlow centralizes WhatsApp, Instagram, and other channels into one inbox with AI agents for sales, marketing, and support teams.$q$,
  og_description = $q$SleekFlow centralizes WhatsApp, Instagram, and other channels into one inbox with AI agents for sales, marketing, and support teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Omnichannel inbox$q$, $q$Centralizes WhatsApp, Messenger, Instagram, Telegram, TikTok, LINE, Viber, WeChat, SMS, and Outlook.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$AI Inbound Agent$q$, $q$Completes tasks like product recommendations and appointment scheduling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$AI Data Analyst Agent$q$, $q$Generates market insights from customer conversations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Automation Flow Builder$q$, $q$Builds automated messaging workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$WhatsApp Forms$q$, $q$Collects lead-qualification and appointment-booking data via WhatsApp.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Analytics dashboards$q$, $q$Tracks conversations and conversion metrics (Premium AI plan).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$CRM integration$q$, $q$Connects with Shopify, HubSpot, Salesforce, and VTEX for customer data.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Free plan available to test core features before paying$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Broad channel and integration coverage including WhatsApp, Shopify, HubSpot, and Salesforce$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Supports 12 UI languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Used by 2,000+ enterprises across 70 countries, per the company$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Free plan limited to 3 users and 50 monthly active contacts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Analytics dashboards, webhooks/API access, and role-based access require the Premium AI plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Salesforce and custom integrations are Enterprise AI-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Pricing is listed in Hong Kong dollars (HK$), requiring conversion for other markets$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Does SleekFlow have a free plan?$q$, $q$Yes, a free plan supports 3 user accounts and 50 monthly active contacts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$What's the cheapest paid SleekFlow plan?$q$, $q$Pro AI starts at HK$399 per user/month, with a minimum of 3 users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$What languages does SleekFlow support?$q$, $q$Arabic, German, English, Spanish, French, Indonesian, Italian, Malay, Dutch, Portuguese, and Simplified/Traditional Chinese.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Does SleekFlow offer API access?$q$, $q$Yes, webhook and API calls are included from the Premium AI plan.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$WhatsApp commerce$q$, $q$Online brands using WhatsApp catalogs and payment links to sell.$q$, $q$E-commerce brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Multi-market support teams$q$, $q$Teams needing a UI available in multiple languages across regions.$q$, $q$Multinational support teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Free$q$, $q$Free$q$, $q$monthly$q$, $q$["3 user accounts","50 monthly active contacts","Core AI features (limited usage)","Free onboarding support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Pro AI$q$, $q$HK$399/user/month$q$, $q$monthly$q$, $q$["500 monthly active contacts","Broadcast campaigns","Unlimited Flow Builder usage","Unlimited contact storage","Inbox (web and mobile)","AI Agent"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Premium AI$q$, $q$HK$579/user/month$q$, $q$monthly$q$, $q$["1,000 monthly active contacts","Analytics dashboards","Webhook and API calls","Role-based access control","Advanced AI Agents with integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Enterprise AI$q$, $q$Custom$q$, NULL, $q$["Custom monthly active contacts and users","Salesforce and custom integrations","Dedicated Customer Success manager","PII masking"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$overview$q$, $q$What is SleekFlow?$q$, 2, ARRAY[$q$SleekFlow is a conversational operations platform that centralizes customer chats across WhatsApp, Instagram, Messenger, and other channels into one inbox.$q$, $q$AI agents built into paid plans handle tasks like product recommendations and appointment scheduling, while a Data Analyst Agent surfaces insights from conversation data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$who-its-for$q$, $q$Who SleekFlow is for$q$, 2, ARRAY[$q$SleekFlow serves small businesses through mid-market and enterprise B2C brands in e-commerce, beauty and wellness, automotive, travel, real estate, and education.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Interakt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Interakt is a WhatsApp, Instagram, and RCS customer engagement platform with a no-code chatbot builder, CRM, and AI agents.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan available; Growth plan from $55/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Interakt combines WhatsApp, Instagram, and RCS messaging with a no-code chatbot builder, CRM, and AI agents for business communication.$q$,
  og_description = $q$Interakt combines WhatsApp, Instagram, and RCS messaging with a no-code chatbot builder, CRM, and AI agents for business communication.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '993a2b5b-ee72-498b-b5f1-82135cc21b11';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '993a2b5b-ee72-498b-b5f1-82135cc21b11' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$No-code chatbot builder$q$, $q$Drag-and-drop WhatsApp chatbot creation without developer resources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Multi-channel messaging$q$, $q$Automates conversations across WhatsApp, Instagram, and RCS.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$AI Agents$q$, $q$Handle conversational interactions and query responses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$WhatsApp Store$q$, $q$Product catalog and payment integration for commerce inside WhatsApp.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Sales CRM$q$, $q$Pipeline management and lead organization for sales teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Catalog sync$q$, $q$Syncs product catalogs from Shopify, WooCommerce, and Excel.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Analytics$q$, $q$Tracks campaign performance and team activity.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Free Starter tier available with unlimited owner-role agents$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$14-day free trial on paid plans, no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$No-code chatbot builder needs no developer resources$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Serves 50,000+ businesses across multiple industries, per the company$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Free Starter tier excludes WhatsApp messaging (Instagram only)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Advanced chatbot flows with branching require the Advanced plan ($69/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$The RCS channel is Enterprise-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$The Sales CRM (₹2,499/month) is a separate plan billed independently from the main messaging plans$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Does Interakt have a free plan?$q$, $q$Yes, the Starter tier is free but limited to Instagram messaging, 15 custom fields, and 15 custom tags.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Does Interakt support WhatsApp on the free plan?$q$, $q$No, WhatsApp messaging requires the Growth plan ($55/month) or higher.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Is there a free trial?$q$, $q$Yes, a 14-day free trial with no credit card required is offered.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$How many businesses use Interakt?$q$, $q$Interakt states it serves 50,000+ businesses globally.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$WhatsApp commerce automation$q$, $q$Online sellers automating WhatsApp catalogs, payments, and support replies.$q$, $q$D2C and retail businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Sales pipeline management$q$, $q$Teams tracking leads through a WhatsApp-integrated CRM.$q$, $q$B2B sales teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Starter (Free)$q$, $q$Free$q$, $q$monthly$q$, $q$["Unlimited owner-role agents","Instagram only","Basic campaigns","15 custom fields","15 custom tags"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Growth$q$, $q$$55/month$q$, $q$monthly$q$, $q$["Unlimited agents (all roles)","WhatsApp and Instagram","Advanced campaigns","25 custom fields","30 custom tags","5 custom events"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Advanced$q$, $q$$69/month$q$, $q$monthly$q$, $q$["Everything in Growth","Advanced chatbot flows with branching","Chat auto-assignment","Advanced webhooks","30 custom fields","45 custom tags","7 custom events"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited agents (all roles)","Unlimited messages","No markup charges","Dedicated account manager","RCS channel included"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$overview$q$, $q$What is Interakt?$q$, 2, ARRAY[$q$Interakt is a customer engagement platform built around WhatsApp, Instagram, and RCS messaging, with a no-code chatbot builder and a WhatsApp-native store for commerce.$q$, $q$It also includes a Sales CRM for pipeline tracking and lead organization, plus AI agents for conversational interactions and product recommendations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$who-its-for$q$, $q$Who Interakt is for$q$, 2, ARRAY[$q$Interakt targets B2B sales teams and consumer businesses in travel, restaurants, spas, health and wellness, beauty, education, automotive, real estate, and banking/finance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── WATI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WATI is a WhatsApp-first customer engagement platform offering a team inbox, no-code chatbots, campaigns, and an AI support agent.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$20/month (Growth plan, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$Portuguese$q$, $q$Spanish$q$, $q$English$q$, $q$Chinese (Simplified)$q$, $q$Chinese (Traditional)$q$, $q$Arabic$q$]::text[],
  seo_meta_description = $q$WATI offers a WhatsApp Business API inbox with no-code chatbots, campaign broadcasts, and an AI agent that deflects routine customer queries.$q$,
  og_description = $q$WATI offers a WhatsApp Business API inbox with no-code chatbots, campaign broadcasts, and an AI agent that deflects routine customer queries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6defa3eb-e961-45d0-b2f3-df7356237cfc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6defa3eb-e961-45d0-b2f3-df7356237cfc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$WhatsApp Business API$q$, $q$Connects businesses with customers at scale via WhatsApp.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$No-code chatbot builder$q$, $q$Builds AI-powered, human-like chatbots for various use cases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Team Inbox$q$, $q$Unifies sales and service conversations for the whole team.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$AI Support Agent$q$, $q$Deflects up to 60% of customer queries, per the company.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Campaign management$q$, $q$Sends personalized messaging at scale.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Click-to-WhatsApp ads$q$, $q$Converts ad clicks directly into WhatsApp conversations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Multi-channel support$q$, $q$Extends to Instagram, Facebook, SMS, and website chat.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Deep WhatsApp Business API focus with click-to-WhatsApp ad support$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$AI Support Agent claims to deflect up to 60% of queries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Over 100 integrations available$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Reports 16,000+ customers worldwide$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$No free plan or trial period confirmed on the pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Advanced chatbots and AI agents (Astra add-on) are limited to the Pro plan and above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Additional users cost extra on every paid tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Multiple WhatsApp numbers and high message throughput require the Business plan ($240+/month)$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Does WATI offer a free trial?$q$, $q$Not specified on the pricing page; a pay-as-you-go single-user option (₹999 one-time) is offered instead.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$What's the cheapest WATI plan?$q$, $q$The Growth plan starts at $20/month billed annually ($25/month billed monthly), for 3 users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$What languages does the WATI interface support?$q$, $q$Portuguese, Spanish, English, Simplified and Traditional Chinese, and Arabic.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Does WATI have AI features?$q$, $q$Yes, "Wati AI" includes Copilot, AI Agents, and Bring Your Own Agent (BYOA) support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$WhatsApp marketing and support$q$, $q$Brands running WhatsApp broadcast campaigns alongside customer support.$q$, $q$Marketing and support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$High-volume WhatsApp operations$q$, $q$Businesses needing multiple WhatsApp numbers and high message throughput.$q$, $q$Enterprise support operations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Growth$q$, $q$$20/month annual, $25/month monthly$q$, $q$monthly$q$, $q$["3 users included","15,000 broadcasts/month","Omnichannel inbox","Campaigns","Click-to-WhatsApp ads","E-commerce tools","Basic support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Pro$q$, $q$$60/month annual, $75/month monthly$q$, $q$monthly$q$, $q$["5 users included","Unlimited broadcasts","Advanced chatbots","Lead qualification","Smart retargeting","AI agents (Astra add-on)","Advanced team inbox","24/7 support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Business$q$, $q$$240/month annual, $300/month monthly$q$, $q$monthly$q$, $q$["5 users included","Multiple WhatsApp numbers","4,000 messages/minute capacity","Dedicated customer success manager","Priority support","Compliance features"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$overview$q$, $q$What is WATI?$q$, 2, ARRAY[$q$WATI is a WhatsApp-first customer engagement platform built around the WhatsApp Business API, with a shared team inbox for sales and support conversations.$q$, $q$A no-code chatbot builder and an AI Support Agent handle routine queries automatically, while campaign tools and click-to-WhatsApp ad support cover marketing use cases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$who-its-for$q$, $q$Who WATI is for$q$, 2, ARRAY[$q$WATI serves e-commerce, eLearning, healthcare, and marketing-agency teams handling marketing, sales, and support conversations primarily over WhatsApp.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── DelightChat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$DelightChat is an omnichannel support and WhatsApp marketing platform built for Shopify-based D2C e-commerce brands.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$29/month (Startup plan) + WhatsApp charges$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DelightChat unifies WhatsApp, Instagram, Facebook, email, and live chat for Shopify brands, with WhatsApp marketing and an AI response assistant.$q$,
  og_description = $q$DelightChat unifies WhatsApp, Instagram, Facebook, email, and live chat for Shopify brands, with WhatsApp marketing and an AI response assistant.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Omnichannel inbox$q$, $q$Consolidates WhatsApp, Instagram, Facebook, Email, Live Chat, and Messenger.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$WhatsApp Marketing$q$, $q$Official API broadcasts, abandoned cart recovery, and order notifications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Shopify integration$q$, $q$View and modify order data while replying to customers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$AI-powered responses$q$, $q$GPT-powered assistant drafts and refines support replies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Automation rules$q$, $q$Keyword-triggered auto-replies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Self-service widget$q$, $q$Lets customers check order status and browse help articles.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Mobile apps$q$, $q$iOS and Android apps for managing conversations on the go.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Deep, purpose-built Shopify integration for order-aware support replies$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$GPT-powered AI assistant included from the entry Startup plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$iOS and Android apps available$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$14-day free trial with a 1:1 onboarding call$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$No permanent free plan, only a 14-day trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$WhatsApp messaging charges are billed separately on top of the subscription fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Support ticket and marketing contact volumes are capped per plan, with per-unit overage fees$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Multiple Shopify stores require the Scale plan ($99/month) or above$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Does DelightChat have a free plan?$q$, $q$No; it offers a 14-day free trial rather than a permanent free tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$How much does DelightChat cost?$q$, $q$Plans start at $29/month (Startup) plus WhatsApp messaging charges.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Does DelightChat include AI features?$q$, $q$Yes, a GPT-powered AI Assistant helps draft and refine support responses on all plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Is DelightChat built for Shopify?$q$, $q$Yes, it is marketed specifically to Shopify-based D2C brands with native order-data integration.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Shopify order support$q$, $q$Support teams answering order-status questions using live Shopify data.$q$, $q$Shopify store support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$WhatsApp marketing for D2C brands$q$, $q$Brands running abandoned-cart recovery and broadcast campaigns.$q$, $q$D2C e-commerce marketers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Startup$q$, $q$$29/month + WhatsApp charges$q$, $q$monthly$q$, $q$["Support across WhatsApp, Instagram, Facebook, Email, Live Chat","5 team members","3 support channels","1 Shopify store","WhatsApp marketing","GPT-powered AI assistant","500 tickets/month","2,500 marketing contacts/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Scale$q$, $q$$99/month + WhatsApp charges$q$, $q$monthly$q$, $q$["All Startup features","20 team members","10 support channels","3 Shopify stores","2,000 tickets/month","10,000 marketing contacts/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Growth$q$, $q$$299/month + WhatsApp charges$q$, $q$monthly$q$, $q$["All Scale features","50 team members","25 support channels","Unlimited Shopify stores","Dedicated account manager","6,000 tickets/month","30,000 marketing contacts/month"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$overview$q$, $q$What is DelightChat?$q$, 2, ARRAY[$q$DelightChat is an omnichannel customer support and WhatsApp marketing platform built specifically for Shopify-based D2C e-commerce brands.$q$, $q$It combines a shared inbox for WhatsApp, Instagram, Facebook, Email, and Live Chat with WhatsApp marketing tools and a GPT-powered AI assistant that drafts support replies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$who-its-for$q$, $q$Who DelightChat is for$q$, 2, ARRAY[$q$DelightChat is aimed at Shopify-based D2C e-commerce brands that need order-aware support and WhatsApp marketing in one tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Kommunicate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Kommunicate is a no-code AI agent builder for customer support that automates conversations and hands off to human agents with full context.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$40/month (Starter plan, monthly)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$Arabic$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Portuguese$q$, $q$Italian$q$, $q$Swedish$q$, $q$Russian$q$]::text[],
  seo_meta_description = $q$Kommunicate is a no-code AI agent builder for support teams, with human handoff, omnichannel deployment, and multi-LLM support.$q$,
  og_description = $q$Kommunicate is a no-code AI agent builder for support teams, with human handoff, omnichannel deployment, and multi-LLM support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '11ab9318-aa3a-43fc-9832-012d933cd2d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '11ab9318-aa3a-43fc-9832-012d933cd2d2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$AI Agent Builder$q$, $q$No-code platform for creating AI agents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Human handoff$q$, $q$Native escalation to human agents with full context preservation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Multi-model support$q$, $q$Compatible with OpenAI, Anthropic's Claude, and Google Gemini.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Omnichannel deployment$q$, $q$Operates across web, WhatsApp, email, and mobile apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Real-time dashboard$q$, $q$Monitors AI behavior and escalation patterns.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$AI Email Automation$q$, $q$Automates email-based ticket handling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Campaign messaging$q$, $q$Sends outbound messaging campaigns (Professional plan and up).$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$No-code AI agent builder usable without lengthy implementation projects$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Supports multiple LLM providers (OpenAI, Anthropic's Claude, Google Gemini) rather than locking into one$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Native human handoff preserves conversation context$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$30-day free trial, no credit card required$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$No permanent free plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Zendesk, Freshdesk, and Google Analytics integrations require the Professional plan ($200/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Salesforce, HubSpot, and Zapier integrations are Enterprise-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Additional AI agents and team members are billed as per-seat add-ons on every tier$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Does Kommunicate have a free plan?$q$, $q$No; it offers a 30-day free trial with no credit card required, not a free-forever tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Which AI models does Kommunicate support?$q$, $q$OpenAI, Anthropic's Claude, and Google Gemini, among other integrations like Dialogflow, AWS Lex, and IBM Watson.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$What's the cheapest Kommunicate plan?$q$, $q$Starter, at $40/month, includes 1 AI agent, 1 team member, and 250 conversations/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Does Kommunicate integrate with helpdesks?$q$, $q$Yes, Zendesk and Freshdesk integrations are available from the Professional plan; Salesforce and HubSpot require Enterprise.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Automated ticket deflection$q$, $q$Support teams wanting to cut ticket volume with AI before human handoff.$q$, $q$Customer support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Multi-channel AI deployment$q$, $q$Businesses deploying the same AI agent across web, WhatsApp, and mobile apps.$q$, $q$Growing startups and enterprises$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Starter$q$, $q$$40/month monthly, $34/month annual$q$, $q$monthly$q$, $q$["1 AI agent","1 team member","250 conversations/month","Web, mobile, WhatsApp, Telegram, Instagram channels","AI email automation","1-year chat history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Professional$q$, $q$$200/month monthly, $167/month annual$q$, $q$monthly$q$, $q$["2 AI agents","3 team members","2,000 conversations/month","Zendesk, Freshdesk, Google Analytics integration","AI summary","Auto-resolve tickets","Agent assist","Campaign messaging","API and webhooks"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom AI agents and team seats","Discounted conversation pricing","Salesforce, HubSpot, Zapier integrations","Dedicated account manager","SLA-backed support","SSO and identity management"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$overview$q$, $q$What is Kommunicate?$q$, 2, ARRAY[$q$Kommunicate is a no-code AI agent builder for customer support that lets teams create automation without lengthy implementation projects.$q$, $q$AI agents can hand off conversations to human agents with full context preserved, and the platform supports multiple LLM providers including OpenAI, Anthropic's Claude, and Google Gemini.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$who-its-for$q$, $q$Who Kommunicate is for$q$, 2, ARRAY[$q$Kommunicate targets customer support teams at growing startups and enterprises seeking controlled AI automation deployable across web, WhatsApp, email, and mobile channels.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Chatwoot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Chatwoot is an open-source customer support platform unifying live chat, WhatsApp, email, and social channels with an AI agent and copilot.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Hacker plan, up to 2 agents); paid plans from $19/agent/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Chatwoot is an open-source, AI-powered customer support platform with a shared inbox, help center, and Captain AI agent for automating replies.$q$,
  og_description = $q$Chatwoot is an open-source, AI-powered customer support platform with a shared inbox, help center, and Captain AI agent for automating replies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Captain AI agent$q$, $q$Automates conversations and reduces support ticket volume.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Captain Copilot$q$, $q$Suggests answers and surfaces conversation history for agents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Omnichannel inbox$q$, $q$Website chat, email, WhatsApp, Facebook, Instagram, and Telegram in one place.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Customizable live chat widget$q$, $q$Embeddable, brandable chat widget for websites.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Knowledge base$q$, $q$Help center with AI-powered search.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Real-time translation$q$, $q$Multi-language support for conversations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Self-hosted deployment$q$, $q$Open-source option for full data ownership.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Developer APIs$q$, $q$Enables custom integrations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Open-source with a self-hosted option for full data ownership$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Free Hacker plan for up to 2 agents and 500 conversations/month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$25,000+ GitHub stars and 400+ contributors signal an active open-source community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$SOC 2 Type II compliant$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Free Hacker plan is limited to live chat only, excluding WhatsApp, email, and other channels$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Voice support requires the top Enterprise plan ($99/agent/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Captain AI credits are capped per plan, with paid add-ons ($20 per 1,000 extra credits) once exceeded$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$SSO/SAML and audit logs require the Enterprise tier$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Is Chatwoot open source?$q$, $q$Yes, it is an open-source platform with a self-hosted deployment option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Does Chatwoot have a free plan?$q$, $q$Yes, the Hacker plan is free for up to 2 agents and 500 conversations/month, live chat only.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$What is Captain AI?$q$, $q$Chatwoot's built-in AI agent that automates conversations, alongside Captain Copilot, which suggests answers to human agents.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Can I self-host Chatwoot?$q$, $q$Yes, a self-hosted option is available for organizations wanting full data sovereignty.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Data-sovereign support desk$q$, $q$Companies needing self-hosted support software for compliance reasons.$q$, $q$Regulated or privacy-conscious businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Open-source helpdesk alternative$q$, $q$Teams seeking an open-source alternative to proprietary helpdesks.$q$, $q$Cost-conscious support teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Hacker$q$, $q$$0/agent/month$q$, $q$annual$q$, $q$["Up to 2 agents","500 conversations/month","Live chat only","30-day data retention","Private notes, mentions, labels, canned responses"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Startups$q$, $q$$19/agent/month$q$, $q$annual$q$, $q$["Unlimited conversations (fair use)","All channels except voice","300 Captain AI credits","1-year data retention","Help center","Custom views/filters","Business hours","Auto-responder","Campaigns"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Business$q$, $q$$39/agent/month$q$, $q$annual$q$, $q$["Unlimited conversations (fair use)","All channels including voice","500 Captain AI credits","2-year data retention","Teams","Automation rules","Custom attributes","Pre-chat forms","CSAT reports"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Enterprise$q$, $q$$99/agent/month$q$, $q$annual$q$, $q$["Unlimited conversations (fair use)","All channels including voice","800 Captain AI credits","3-year data retention","SSO/SAML","Audit logs","Remove branding"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$overview$q$, $q$What is Chatwoot?$q$, 2, ARRAY[$q$Chatwoot is an open-source customer support platform that unifies live chat, WhatsApp, email, Facebook, Instagram, and Telegram conversations in one inbox.$q$, $q$Its Captain AI agent automates repetitive conversations, while Captain Copilot suggests answers to human agents; a self-hosted deployment option gives teams full control over their data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$who-its-for$q$, $q$Who Chatwoot is for$q$, 2, ARRAY[$q$Chatwoot suits businesses seeking an open-source alternative to Intercom or Zendesk, especially those that value data ownership or need to self-host for compliance reasons.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Smartsupp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Live chat and AI chatbot platform combining a Mira AI agent with human operator handover for website and e-commerce support.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$17/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Czech$q$, $q$Spanish$q$, $q$French$q$, $q$Hungarian$q$, $q$Italian$q$, $q$German$q$, $q$Dutch$q$, $q$Polish$q$]::text[],
  seo_meta_description = $q$Smartsupp offers live chat, AI chatbots, and a Mira AI agent for e-commerce sites, with a free plan and paid tiers from $17/month.$q$,
  og_description = $q$Smartsupp offers live chat, AI chatbots, and a Mira AI agent for e-commerce sites, with a free plan and paid tiers from $17/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Live Chat$q$, $q$Real-time messaging widget for websites and online stores.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Mira AI Agent$q$, $q$AI shopping assistant that answers FAQs and recommends products, resolving common questions automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$AI Reply Assist$q$, $q$Suggests responses to human operators to speed up replies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Automation Workflows$q$, $q$Automated messaging and routing rules for repetitive tasks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Multichannel Inbox$q$, $q$Manages live chat, email, WhatsApp, and Facebook Messenger conversations in one place.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Reporting & Analytics$q$, $q$Tracks conversation and agent performance metrics.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Mobile Apps$q$, $q$iOS and Android apps for managing conversations on the go.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$E-commerce Integrations$q$, $q$80+ integrations including Shopify, WordPress, WooCommerce, PrestaShop, Wix, and Magento.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Native integrations with major e-commerce platforms (Shopify, WooCommerce, Magento)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Mira AI agent can resolve routine questions without human involvement$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Mobile apps for iOS and Android let agents respond on the go$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$AI reply assists and Mira AI conversations are capped per plan, requiring upgrades for higher volume$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$5+ operator teams require the Expert or Ultimate plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Full AI Agent capability is billed as a separate add-on from the core chat plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Does Smartsupp have a free plan?$q$, $q$Yes, the Free plan includes 1 operator, 25 conversations per month, and 14-day chat history at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Does Smartsupp use AI?$q$, $q$Yes, via a Mira AI Agent that answers FAQs and recommends products, plus an AI Reply Assist for human operators.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$What channels does Smartsupp support?$q$, $q$Live chat, WhatsApp, and Facebook Messenger are included on all plans, with additional email addresses on paid tiers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Is there a mobile app?$q$, $q$Yes, Smartsupp offers iOS and Android apps.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$How much does Smartsupp cost?$q$, $q$Paid plans start at $17/month (Solo, billed annually) up to Ultimate from $280/month; the Mira AI Agent is a separate add-on starting at $16/month.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$E-commerce pre-sales support$q$, $q$Live chat widget with native Shopify, WooCommerce, and Magento integrations for shopper questions.$q$, $q$Online stores$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Small support teams$q$, $q$Solo and Plus plans cover teams of 1-3 operators with unlimited conversations.$q$, $q$Small businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$AI-first customer service$q$, $q$Mira AI Agent or Unlimited AI Agents plan for automating FAQ and product recommendation conversations.$q$, $q$Growing customer service teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Free$q$, $q$$0$q$, NULL, $q$["1 operator","25 conversations/month","14-day chat history","live chat, WhatsApp, Messenger"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Solo$q$, $q$$17/month (annual) / $24/month (monthly)$q$, $q$monthly$q$, $q$["1 operator","unlimited conversations","3 email addresses","basic automated messages","50 AI reply assists/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Plus$q$, $q$$25/month (annual) / $35/month (monthly)$q$, $q$monthly$q$, $q$["3 operators","unlimited conversations","10 email addresses","automation workflows","MCP & API","250 AI reply assists/month"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Expert$q$, $q$$83/month (annual) / $117/month (monthly)$q$, $q$monthly$q$, $q$["5+ operators","50 email addresses","premium support","500 AI reply assists/month"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Ultimate$q$, $q$From $280/month$q$, $q$annual$q$, $q$["custom setup","dedicated account manager","API & data exports"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$overview$q$, $q$What is Smartsupp?$q$, 2, ARRAY[$q$Smartsupp is a customer engagement platform that combines live chat with AI automation. Its Mira AI Agent answers common shopping and support questions and recommends products, while human operators can step in when needed.$q$, $q$The platform includes automation workflows, a multichannel inbox covering WhatsApp and Facebook Messenger, and 80+ integrations with e-commerce platforms like Shopify, WooCommerce, and Magento.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$who-its-for$q$, $q$Who Smartsupp is for$q$, 2, ARRAY[$q$Smartsupp fits online stores and small-to-midsize support teams that want a free entry point plus the option to add AI-driven automation and multichannel messaging as they grow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Chaport ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Customer messaging platform combining live chat, AI chatbots, and multichannel support across email, Facebook, Telegram, and Viber.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$, $q$Italian$q$, $q$Portuguese$q$]::text[],
  seo_meta_description = $q$Chaport offers live chat, AI chatbots, and multichannel messaging with a free plan for 2 operators and paid plans from €29/month.$q$,
  og_description = $q$Chaport offers live chat, AI chatbots, and multichannel messaging with a free plan for 2 operators and paid plans from €29/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '02537e9f-5e3e-4e2f-9b7e-a73669114bd6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '02537e9f-5e3e-4e2f-9b7e-a73669114bd6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Live Chat Widget$q$, $q$Real-time chat widget for websites.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$AI Chatbots$q$, $q$Automate sales and support questions on the Unlimited plan.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Knowledge Base + FAQ Bot$q$, $q$Self-service articles with a bot that auto-suggests relevant content in chat.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Multichannel Messaging$q$, $q$Connect Facebook, Telegram, Viber, and email alongside live chat.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Mobile & Desktop Apps$q$, $q$Synced apps for iOS, Android, Windows, and macOS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Auto-Invitations & Typing Insights$q$, $q$Proactively invite visitors to chat and see what they're typing in real time.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Saved Replies & Group Chats$q$, $q$Reusable canned responses and team group chat support.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Zapier Integration$q$, $q$Connects to 4,000+ apps via Zapier.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Free plan available for small teams (2 operators)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$14-day free trial of the full Unlimited plan, no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Native apps across web, iOS, Android, Windows, and macOS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Zapier integration connects to thousands of other apps$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Chatbots and the knowledge base/FAQ bot are only included on the top-tier Unlimited plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Free plan is limited to 2 operators$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Annual billing discount amounts aren't detailed on the pricing page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Does Chaport have a free plan?$q$, $q$Yes, the Free plan includes 2 operators, unlimited chats and websites, and 60-day chat history.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Which plan includes chatbots?$q$, $q$Chatbots, the knowledge base, and FAQ bot are only available on the Unlimited plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Is there a free trial?$q$, $q$Yes, a 14-day free trial of the full Unlimited plan is offered with no credit card required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$What channels does Chaport support?$q$, $q$Live chat plus Facebook, Telegram, Viber, and email messaging.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$What platforms does Chaport support?$q$, $q$Web, iOS, Android, Windows, and macOS apps with synchronization.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Small support teams$q$, $q$Free or Pro plan for teams of 2-4 operators handling live chat and email.$q$, $q$Small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Self-service deflection$q$, $q$Unlimited plan's FAQ bot auto-suggests knowledge base articles to reduce repetitive questions.$q$, $q$Support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Multichannel sales$q$, $q$Combine live chat with Facebook, Telegram, and Viber messaging for lead capture.$q$, $q$Sales teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Free$q$, $q$€0/month$q$, $q$monthly$q$, $q$["2 operators","unlimited chats & websites","60-day chat history","basic widget customization"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Pro$q$, $q$€29/month$q$, $q$monthly$q$, $q$["4 operators","unlimited chat history","auto-invitations","advanced customization","email & messenger integration","saved replies","pre-chat forms","detailed reports"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Unlimited$q$, $q$€99/month$q$, $q$monthly$q$, $q$["unlimited operators","chatbots","knowledge base + FAQ bot","teams","assignment rules","advanced reports","Zapier integration"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$overview$q$, $q$What is Chaport?$q$, 2, ARRAY[$q$Chaport is a customer messaging platform that combines a live chat widget with AI chatbots, a knowledge base with FAQ bot, and multichannel messaging across email, Facebook, Telegram, and Viber.$q$, $q$It ships with synced apps for web, iOS, Android, Windows, and macOS, plus a Zapier integration for connecting to other business tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$who-its-for$q$, $q$Who Chaport is for$q$, 2, ARRAY[$q$Chaport suits startups and SMBs that want a free live chat entry point and can grow into chatbots and a self-service knowledge base on the Unlimited plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── JivoChat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Omnichannel customer service platform with live chat, an AI Agent, and channels like WhatsApp, Telegram, and Instagram.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$28/agent/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Turkish$q$, $q$Spanish$q$, $q$Portuguese$q$]::text[],
  seo_meta_description = $q$JivoChat provides live chat, an AI Agent, and omnichannel messaging with a free plan for 5 agents and paid tiers from $28/agent/month.$q$,
  og_description = $q$JivoChat provides live chat, an AI Agent, and omnichannel messaging with a free plan for 5 agents and paid tiers from $28/agent/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f76f119f-94eb-416d-8b1a-53da64763684';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f76f119f-94eb-416d-8b1a-53da64763684' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Live Chat Widget$q$, $q$Website chat widget with proactive invitations and visitor monitoring on paid plans.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$AI Agent$q$, $q$Automated agent that resolves conversations without human intervention (paid add-on).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$AI Assistant$q$, $q$OpenAI-powered assistant that helps agents draft replies faster (paid add-on).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Omnichannel Messaging$q$, $q$Telegram, Facebook, Instagram, Viber, and WhatsApp in one inbox.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Video Calls$q$, $q$In-chat video calling module (paid add-on).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$JivoChat CRM$q$, $q$Built-in CRM included from the Basic plan up.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Telephony Plus$q$, $q$Business phone system add-on module.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Desktop Apps$q$, $q$Native apps for Windows, Mac, and Linux.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Free plan available for up to 5 agents$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$14-day free trial on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$AI Agent can automatically resolve a majority of conversations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Wide channel coverage including WhatsApp and social messengers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$WhatsApp, AI Assistant, AI Agent, and video calls are billed as separate paid add-ons$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Enterprise plan caps out at 100 agents$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Company founding year and headquarters aren't published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Does JivoChat have a free plan?$q$, $q$Yes, the Free plan supports 5 agents with online chat, social integrations, callback, and offline forms.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Is WhatsApp included?$q$, $q$WhatsApp is an add-on module priced at $27/month, separate from the core plans.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$What does the AI Agent cost?$q$, $q$The AI Agent add-on is priced at $69/agent/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Is there a free trial?$q$, $q$Yes, a 14-day trial is available on paid plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$What desktop platforms are supported?$q$, $q$JivoChat offers desktop apps for Windows, Mac, and Linux, alongside mobile and web access.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Small teams starting free$q$, $q$Free plan covers up to 5 agents with core live chat and social channels.$q$, $q$Small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$WhatsApp-driven support$q$, $q$Add-on modules bring WhatsApp, voice messages, and chatbot integration into one inbox.$q$, $q$E-commerce and retail support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$AI-automated conversations$q$, $q$AI Agent add-on resolves routine conversations without agent involvement.$q$, $q$Scaling support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Free$q$, $q$$0$q$, NULL, $q$["5 agents","online chat","social media integration","callback feature","offline forms","desktop/mobile apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Basic$q$, $q$$28/agent/month (annual billing)$q$, $q$annual$q$, $q$["proactive invitations","pre-chat buttons","real-time visitor monitoring","automatic assistant","anti-spam protection","JivoChat CRM"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Professional$q$, $q$$42/agent/month (annual billing)$q$, $q$annual$q$, $q$["Telephony Plus module","WhatsApp integration","voice messages on social platforms","chatbot integration","chat rescue"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$Enterprise$q$, $q$$56/agent/month (annual billing)$q$, $q$annual$q$, $q$["mobile SDK","chat routing","video call module","chat API","up to 100 agents"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$overview$q$, $q$What is JivoChat?$q$, 2, ARRAY[$q$JivoChat is an omnichannel customer service platform that unifies live chat with messengers such as WhatsApp, Telegram, and Instagram, plus an AI Agent that can resolve conversations automatically.$q$, $q$Paid add-on modules extend the core plans with WhatsApp, an OpenAI-powered AI Assistant, video calls, and a business phone system (Telephony Plus).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$who-its-for$q$, $q$Who JivoChat is for$q$, 2, ARRAY[$q$JivoChat suits businesses that want a free entry-level live chat plan with the option to layer on social messaging channels and AI automation as support volume grows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── HelpCrunch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Customer communication platform unifying live chat, chatbot, shared inbox, and email marketing in one dashboard.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Wilmington, DE, USA$q$,
  languages = ARRAY[$q$English$q$, $q$Ukrainian$q$, $q$Russian$q$]::text[],
  seo_meta_description = $q$HelpCrunch combines live chat, chatbot, shared inbox, and email marketing for support and sales teams, with a free trial available.$q$,
  og_description = $q$HelpCrunch combines live chat, chatbot, shared inbox, and email marketing for support and sales teams, with a free trial available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b4cf4770-d131-451c-a3a1-895ba3bfb0da';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b4cf4770-d131-451c-a3a1-895ba3bfb0da' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Live Chat Widget$q$, $q$Real-time customer communication on websites.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Chatbot$q$, $q$Qualifies leads and delivers instant answers around the clock.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Shared Inbox$q$, $q$Consolidates all communication channels into one dashboard.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Knowledge Base$q$, $q$SEO-optimized self-service help content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Email Marketing$q$, $q$Targeted campaigns and automation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Popups$q$, $q$On-site lead generation forms.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Mobile SDKs$q$, $q$In-app support SDKs for iOS, Android, and React Native.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$AI Editor & AI Agents$q$, $q$AI-assisted message composition and AI agents with a free monthly conversation allowance on paid plans.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Combines support, marketing, and sales tools in a single platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Native SDKs for iOS, Android, and React Native apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$AI Agents included on paid plans with a free monthly conversation allowance$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Pricing scales by monthly email volume, making exact plan cost hard to predict upfront$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Additional AI conversations and AI data sources are billed as separate paid add-ons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Only English, Ukrainian, and Russian interface languages are documented$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Is there a free trial?$q$, $q$Yes, HelpCrunch offers a free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$How is HelpCrunch priced?$q$, $q$The Basic and PRO plans scale by monthly email volume; an Unlimited plan covers unlimited team members with 50,000 emails/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Are AI features included?$q$, $q$AI Agents come with a free monthly conversation limit on paid plans, with paid extensions available; an AI Editor helps draft messages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$What mobile platforms are supported?$q$, $q$HelpCrunch provides SDKs for iOS, Android, and React Native.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Where is HelpCrunch based?$q$, $q$The company lists its headquarters in Wilmington, DE, USA.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$SaaS customer support$q$, $q$Shared inbox and chatbot for handling product support conversations.$q$, $q$SaaS support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$E-commerce marketing and support$q$, $q$Combine live chat with email marketing campaigns and popups for lead generation.$q$, $q$E-commerce teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Agencies managing client communication$q$, $q$Shared inbox consolidates client conversations across channels.$q$, $q$Agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Basic$q$, $q$Starts free, scales with email volume (0-200,000+ emails/month)$q$, $q$monthly$q$, $q$["manual inbox replies","email blasts","automated campaigns","chat-to-email auto-resend"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$PRO$q$, $q$Starts free, scales with email volume (0-1,000,000+ emails/month)$q$, $q$monthly$q$, $q$["same as Basic","AI Agents with free monthly conversation limit"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Unlimited$q$, $q$Not stated$q$, $q$monthly$q$, $q$["unlimited team members","50,000 emails/month","AI Agents included"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$overview$q$, $q$What is HelpCrunch?$q$, 2, ARRAY[$q$HelpCrunch is a customer communication platform that unifies live chat, a chatbot, a shared team inbox, a knowledge base, and email marketing into one dashboard.$q$, $q$AI Agents are included on paid plans with a free monthly conversation allowance, and additional AI conversation or data-source capacity can be purchased as add-ons.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$who-its-for$q$, $q$Who HelpCrunch is for$q$, 2, ARRAY[$q$HelpCrunch fits SaaS, e-commerce, and agency teams that want support, marketing, and lead-generation tools together rather than as separate products.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── SupportBee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Email-based ticketing system that turns customer emails into a shared team inbox for tracking and resolving support tickets.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$17/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SupportBee is a simple email-based ticketing system with a shared team inbox, plans from $17/seat/month, and a 14-day free trial.$q$,
  og_description = $q$SupportBee is a simple email-based ticketing system with a shared team inbox, plans from $17/seat/month, and a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '56724599-1872-4e62-b903-ed19a3916f2f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '56724599-1872-4e62-b903-ed19a3916f2f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Team Inbox$q$, $q$Email-like shared inbox for assigning, commenting on, and resolving tickets as a team.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Knowledge Base (KBee)$q$, $q$Integrated self-service knowledge base.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Customer Portal$q$, $q$Lets customers track their ticket status.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Ticket Automation$q$, $q$Filters and rules for managing incoming tickets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$API Access$q$, $q$API available on both plans for custom integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Customer Satisfaction Ratings$q$, $q$Collects CSAT ratings on resolved tickets.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Audit Trails$q$, $q$Tracks ticket and data history.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Simple, email-like interface with a low learning curve$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Transparent per-seat pricing with monthly or annual billing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Customer portal and satisfaction ratings included even on the entry plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$No long-term contract; cancel anytime$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$No permanently free plan, only a 14-day trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$No AI features are advertised on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Only two pricing tiers, which may limit options for larger teams$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Supported interface languages aren't documented on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Is there a free plan?$q$, $q$No, SupportBee offers a 14-day free trial rather than a permanently free plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$How much does SupportBee cost?$q$, $q$The Startup plan is $17/seat/month billed annually ($20/seat monthly); Enterprise is $21/seat/month billed annually ($25/seat monthly).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Can I cancel anytime?$q$, $q$Yes, the site states you can upgrade, downgrade, or cancel your subscription at any time.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Does SupportBee have AI features?$q$, $q$No AI capabilities are mentioned on the SupportBee website.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$What's included in the Enterprise plan?$q$, $q$Everything in Startup plus enterprise integrations, business hours, a customer portal, audit log and data history, and portal access for customer groups.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Email-first support teams$q$, $q$Manage customer emails as tickets without leaving an inbox-like interface.$q$, $q$Small support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Professional services$q$, $q$Law firms and accounting firms tracking client email requests as tickets.$q$, $q$Professional services firms$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Startup$q$, $q$$17/seat/month (annual) / $20/seat/month (monthly)$q$, $q$monthly$q$, $q$["shared inbox","snippets","1 knowledge base & 1 team","filters","basic integrations","API access","unlimited email inboxes/tickets","customer satisfaction ratings"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$Enterprise$q$, $q$$21/seat/month (annual) / $25/seat/month (monthly)$q$, $q$monthly$q$, $q$["everything in Startup","enterprise integrations","business hours","customer portal","audit log and data history","portal access for customer groups"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$overview$q$, $q$What is SupportBee?$q$, 2, ARRAY[$q$SupportBee is a ticketing system that converts customer emails into organized support tickets that a team can assign, comment on, and resolve together.$q$, $q$It includes a shared team inbox, a customer-facing portal, an integrated knowledge base (KBee), and API access, priced per seat across two plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$who-its-for$q$, $q$Who SupportBee is for$q$, 2, ARRAY[$q$SupportBee fits small support teams and professional services firms that want an email-like ticketing workflow without a steep learning curve.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── ProProfs Help Desk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered help desk that centralizes email, live chat, and messaging tickets with automated response drafting and summarization.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ProProfs Help Desk is an AI-powered ticketing platform with a free plan for 1 agent and paid tiers from $29.99/month.$q$,
  og_description = $q$ProProfs Help Desk is an AI-powered ticketing platform with a free plan for 1 agent and paid tiers from $29.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '20d62d48-b10a-49b7-a013-1df91c3f9d32';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '20d62d48-b10a-49b7-a013-1df91c3f9d32' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$AI Support Agent$q$, $q$Resolves routine tickets, summarizes long threads, and suggests responses.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Omnichannel Ticketing$q$, $q$Integrates email, live chat, messaging, and ticket forms into one inbox.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Ticket Automation$q$, $q$Round-robin assignment, canned responses, and automated alerts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Team Collaboration$q$, $q$Internal notes, child tickets, priorities, filters, and labels.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Reporting & CSAT Surveys$q$, $q$Performance metrics and customer satisfaction tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Mobile App$q$, $q$Native iOS and Android apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Two-Factor Authentication$q$, $q$2FA and role-based permissions for security.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Salesforce Integration$q$, $q$Connects with Salesforce CRM plus ProProfs Live Chat, Knowledge Base, and Survey Maker.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Free forever plan for a single agent$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$15-day money-back guarantee, no credit card required for the free plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Built-in AI features (response drafting, categorization) available from the Essentials tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Native mobile apps for iOS and Android$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Free plan limited to 1 agent and 100 emails/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Advanced AI features (emotion detection, data redaction) are reserved for the top Business Complete Elite tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Company founding year, headquarters, and supported languages aren't published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Does ProProfs Help Desk have a free plan?$q$, $q$Yes, the Free plan gives 1 agent unlimited inboxes and ticket history with 100 emails/month at $0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Does it use AI?$q$, $q$Yes, an AI Support Agent resolves routine tickets, summarizes threads, suggests responses, and adjusts tone, with more advanced AI (emotion detection) on higher tiers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Is there a mobile app?$q$, $q$Yes, native iOS and Android apps are available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$How much does it cost?$q$, $q$Paid plans start at Essentials for $29.99/month ($23.88/month billed annually), up to Customer Delight Suite starting at $499/month.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Is there a trial or guarantee?$q$, $q$All plans include a 15-day money-back guarantee with no credit card required for trials.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Solo agents starting free$q$, $q$Free plan covers a single agent with unlimited inboxes and basic ticketing.$q$, $q$Solo founders and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$AI-assisted ticket resolution$q$, $q$Essentials and Business plans add AI response drafting, categorization, and tone rewriting.$q$, $q$Growing support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Omnichannel enterprise support$q$, $q$Business Complete Elite adds WhatsApp, Facebook, SSO/SAML, and 40+ integrations.$q$, $q$Enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1 agent","unlimited inboxes","unlimited ticket history","100 emails/month","canned responses","mobile app","basic reports"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Essentials$q$, $q$$29.99/month ($23.88/month billed annually)$q$, $q$monthly$q$, $q$["1,000 tickets/month","AI response drafts (50/month)","ticket categorization","grammar check","basic automation rules","CSAT surveys"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Business$q$, $q$$47.88/month (billed annually) / $29.99/month (monthly)$q$, NULL, $q$["6,000 tickets/month","AI first response generator","tone rewriting","unlimited inboxes","custom ticket forms","workflow automation"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Business Complete Elite$q$, $q$$179.97/month (billed annually)$q$, $q$annual$q$, $q$["3 seats","15,000 tickets/month","AI emotion detection","data redaction","native mobile app","omnichannel (WhatsApp/Facebook)","SSO/SAML","40+ integrations"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Customer Delight Suite$q$, $q$Starts at $499/month$q$, $q$monthly$q$, $q$["unlimited users","60,000 tickets/month","Live Chat, Knowledge Base, Survey Maker, and Qualaroo included"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$overview$q$, $q$What is ProProfs Help Desk?$q$, 2, ARRAY[$q$ProProfs Help Desk is a ticketing platform that centralizes email, live chat, messaging, and web forms into one inbox, with an AI Support Agent that summarizes tickets, drafts responses, and detects sentiment.$q$, $q$Higher tiers add omnichannel messaging, advanced AI (emotion detection, data redaction), and enterprise security controls like SSO/SAML.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$who-its-for$q$, $q$Who ProProfs Help Desk is for$q$, 2, ARRAY[$q$It suits solo agents and small teams that want a free starting point, as well as growing support teams that want AI-assisted ticket handling as volume increases.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── LiveAgent ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Omnichannel help desk with ticketing, live chat, an AI chatbot, and a built-in call center with IVR.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$15/agent/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Arabic$q$, $q$Chinese$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Polish$q$, $q$Portuguese$q$, $q$Russian$q$, $q$Japanese$q$]::text[],
  seo_meta_description = $q$LiveAgent is an omnichannel help desk with ticketing, live chat, an AI chatbot, and call center features, starting at $15/agent/month.$q$,
  og_description = $q$LiveAgent is an omnichannel help desk with ticketing, live chat, an AI chatbot, and call center features, starting at $15/agent/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '861123b5-2ddd-4c46-aa4f-eb2c58a34c58';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '861123b5-2ddd-4c46-aa4f-eb2c58a34c58' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Ticketing System$q$, $q$Converts messages from all channels into trackable tickets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Live Chat$q$, $q$Real-time website chat widget.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$AI Chatbot$q$, $q$Operates 24/7 and supports 100+ languages, resolving inquiries instantly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$AI Answer Assistant$q$, $q$Polishes and improves human agent replies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$AI Autoresponder$q$, $q$Automatically resolves eligible tickets.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Call Center with IVR$q$, $q$Built-in phone support with interactive voice response.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Knowledge Base$q$, $q$Self-service help articles and FAQs.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Social Media Integration$q$, $q$Manages Facebook, Instagram, WhatsApp, Viber, and Telegram conversations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$30-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Very broad feature set (175+ features) and 200+ integrations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$AI chatbot supports 100+ languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Call center with IVR is included on paid plans$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$No permanently free plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Call center and detailed reporting only unlock from the Medium plan and above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Social channel integrations (Facebook, Instagram, WhatsApp) require the Large plan or higher$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Is there a free trial?$q$, $q$Yes, LiveAgent offers a 30-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Does LiveAgent have a free plan?$q$, $q$No, only a free trial is offered; paid plans start at $15/agent/month billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Does LiveAgent include a call center?$q$, $q$Yes, call center functionality with IVR is included starting on the Medium Business plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$What languages does the AI chatbot support?$q$, $q$The AI chatbot operates in 100+ languages, including Arabic, Chinese, Spanish, French, German, Polish, Portuguese, Russian, and Japanese.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$How many integrations does LiveAgent offer?$q$, $q$LiveAgent lists over 200 integrations and 175+ features.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Multichannel support teams$q$, $q$Small Business plan combines ticketing, live chat, and a knowledge base.$q$, $q$Small support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Call center-heavy support$q$, $q$Medium plan and above add call center, IVR, and SLA management.$q$, $q$Phone-first support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Global social support$q$, $q$Large plan adds Facebook, Instagram, WhatsApp, Viber, and Telegram channels.$q$, $q$Multichannel support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Small Business$q$, $q$$15/agent/month (annual) / $19/agent/month (monthly)$q$, $q$monthly$q$, $q$["ticketing","live chat","knowledge base","customer portal","contact forms","automation","AI Answer Assistant","AI Chatbot"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Medium Business$q$, $q$$29/agent/month (annual) / $35/agent/month (monthly)$q$, $q$monthly$q$, $q$["everything in Small","call center","IVR","time rules","reports","proactive chat","agent ratings","SLA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Large Business$q$, $q$$49/agent/month (annual) / $59/agent/month (monthly)$q$, $q$monthly$q$, $q$["everything in Medium","SSO","custom roles","social channels (Facebook, Instagram, X, Viber, Telegram, WhatsApp)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Enterprise$q$, $q$$69/agent/month (annual) / $85/agent/month (monthly)$q$, $q$monthly$q$, $q$["everything in Large","dedicated account manager","priority support","custom billing","service review calls"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$overview$q$, $q$What is LiveAgent?$q$, 2, ARRAY[$q$LiveAgent is an omnichannel customer service platform that unifies ticketing, live chat, an AI chatbot, and a call center with IVR into a single dashboard.$q$, $q$It lists 175+ features and 200+ integrations, with AI tools including an Answer Assistant that polishes agent replies and an Autoresponder that resolves eligible tickets automatically.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$who-its-for$q$, $q$Who LiveAgent is for$q$, 2, ARRAY[$q$LiveAgent fits support teams that need phone support alongside chat and ticketing, and teams serving international customers thanks to its 100+ language AI chatbot.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── TeamSupport ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$B2B customer support platform with account-level ticketing, AI-driven insights, and a Customer Distress Index to flag at-risk accounts.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$45/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Dallas, TX, USA$q$,
  languages = '{}',
  seo_meta_description = $q$TeamSupport is a B2B customer support platform with AI ticket insights and a Customer Distress Index, starting at $45/month for up to 5 users.$q$,
  og_description = $q$TeamSupport is a B2B customer support platform with AI ticket insights and a Customer Distress Index, starting at $45/month for up to 5 users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3478a3af-daa1-4153-b114-3f47610904fd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3478a3af-daa1-4153-b114-3f47610904fd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Account-Level Ticketing$q$, $q$360-degree customer view built for B2B support teams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$AI Ticket Analysis$q$, $q$Analyzes tickets, surfaces customer insights, and suggests solutions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Customer Distress Index$q$, $q$Proprietary scoring that flags at-risk accounts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Product Analytics & Bug Priority Scoring$q$, $q$Helps prioritize product issues based on customer impact.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Customer Playbooks$q$, $q$Structured workflows for customer success teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Live Chat & Messaging$q$, $q$Add-on messaging channel billed per agent.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Omnichannel Support$q$, $q$Consolidates support conversations across channels.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Account-level 360-degree view built specifically for B2B support teams$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$AI-driven Customer Distress Index is a distinctive account health feature$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Professional and Scale plans include unlimited users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Starting prices are published directly on the pricing page$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$No free plan or free trial is advertised$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Live chat/messaging is a separate paid add-on ($15/agent/month) on every tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Training, data import, and the Insights module carry additional one-time or recurring fees$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Starter plan caps out at 5 users$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Does TeamSupport offer a free trial?$q$, $q$The pricing page does not mention a free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$How much does TeamSupport cost?$q$, $q$Plans start at $45/month (Starter, billed annually, up to 5 users), with Professional at $65/month and Scale at $85/month, both with unlimited users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Is live chat included?$q$, $q$No, messaging and live chat are a separate add-on priced at $15/month per agent on every plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$What is the Customer Distress Index?$q$, $q$It's TeamSupport's proprietary scoring system for identifying at-risk customer accounts.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Where is TeamSupport based?$q$, $q$TeamSupport's headquarters is listed at 5005 Lyndon B Johnson Fwy, Dallas, TX.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$B2B SaaS support and success$q$, $q$Account-level ticketing and playbooks for onboarding, retaining, and expanding accounts.$q$, $q$B2B SaaS support and success teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Account health monitoring$q$, $q$Customer Distress Index flags at-risk accounts before they churn.$q$, $q$Customer success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Manufacturing support teams$q$, $q$Ticketing and product analytics for manufacturing-sector support operations.$q$, $q$Manufacturing support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Starter$q$, $q$$45/month (billed annually)$q$, $q$annual$q$, $q$["max 5 users","ticketing","AI productivity tools","basic training"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Professional$q$, $q$$65/month (billed annually)$q$, $q$annual$q$, $q$["unlimited users","ticketing","customer intelligence","AI tools","customer portal","1 playbook","knowledge base"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Scale$q$, $q$$85/month (billed annually)$q$, $q$annual$q$, $q$["unlimited users","customer intelligence","AI tools","3 playbooks","Insights add-on","custom fields","automation","broadcast messaging"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$overview$q$, $q$What is TeamSupport?$q$, 2, ARRAY[$q$TeamSupport is a customer support and success platform built for B2B support teams, providing account-level ticketing with a 360-degree customer view rather than individual-contact-based tickets.$q$, $q$It includes AI-driven ticket analysis and a proprietary Customer Distress Index that flags accounts at risk of churning, plus customer playbooks for structured success workflows.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$who-its-for$q$, $q$Who TeamSupport is for$q$, 2, ARRAY[$q$TeamSupport is aimed at B2B SaaS and manufacturing support and success teams that manage multi-contact accounts and want account-health scoring built into their ticketing system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Deskpro ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Multi-channel help desk with a built-in AI chatbot, agent assist co-pilot, and flexible cloud, private-cloud, or self-hosted deployment.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/agent/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Deskpro is a multi-channel help desk with a built-in AI chatbot and agent assist, priced from $39/agent/month with flexible deployment options.$q$,
  og_description = $q$Deskpro is a multi-channel help desk with a built-in AI chatbot and agent assist, priced from $39/agent/month with flexible deployment options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Unified Inbox$q$, $q$Combines email, chat, voice, SMS, WhatsApp, and social media in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Deskpro AI Chatbot$q$, $q$Resolves common issues before they reach human agents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$AI Agent Assist (Co-Pilot)$q$, $q$Summarizes tickets, drafts replies, and creates knowledge base articles.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$AI Workflow Automations$q$, $q$Routes tickets automatically based on intent, sentiment, and language.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Self-Service Help Center$q$, $q$Customer-facing knowledge base.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Slack & Microsoft Teams Integration$q$, $q$Connects ticket workflows to internal collaboration tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Mobile Apps$q$, $q$Apps for managing tickets on the go.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Flexible Deployment$q$, $q$Cloud, private cloud, self-hosted, on-premise, or sovereign data center options.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Flexible deployment options including self-hosted and on-premise, uncommon among help desk SaaS tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$SOC II, ISO 27001, and HIPAA certified$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Deskpro AI (chatbot, agent assist, automations) is built into the platform rather than a separate product$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Enterprise plan supports 22 AWS regions for data residency needs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Team plan requires a minimum of 5 agents and Enterprise requires 25, raising the cost floor for very small teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Deskpro AI and white-labeling are gated behind the Professional plan and above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Exact free trial length isn't stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Does Deskpro offer a free trial?$q$, $q$Yes, a free trial is available, though the exact duration isn't specified on the site.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$How much does Deskpro cost?$q$, $q$Cloud pricing starts at $39/agent/month for the Team plan (minimum 5 agents), up to $99/agent/month for Enterprise (minimum 25 agents).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Can Deskpro be self-hosted?$q$, $q$Yes, deployment options include cloud, private cloud, self-hosted, on-premise, and sovereign data centers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Does Deskpro include AI?$q$, $q$Yes, Deskpro AI includes a chatbot, an agent assist co-pilot, and workflow automations based on intent, sentiment, and language.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Is Deskpro compliant with security standards?$q$, $q$Yes, it is SOC II, ISO 27001, and HIPAA certified.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Regulated industries$q$, $q$HIPAA-compliant hosting and on-premise deployment for healthcare and government support teams.$q$, $q$Healthcare and government support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Self-hosted deployments$q$, $q$Private cloud or self-hosted options for organizations with strict data residency requirements.$q$, $q$Enterprises with compliance requirements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$AI-assisted support teams$q$, $q$Deskpro AI chatbot and agent assist reduce ticket volume reaching human agents.$q$, $q$Growing support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Team$q$, $q$$39/agent/month$q$, $q$monthly$q$, $q$["minimum 5 agents","unified inbox","self-service help center","chatbot","apps & integrations","mobile apps","reporting & analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Professional$q$, $q$$59/agent/month$q$, $q$monthly$q$, $q$["minimum 10 agents","lite agents","Deskpro AI","AI-powered chatbot","white-label options","multiple brand support","CRM sync"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Enterprise$q$, $q$$99/agent/month$q$, $q$monthly$q$, $q$["minimum 25 agents","22 AWS regions","quarterly health checks","security reviews","sandbox environment","HIPAA-compliant hosting","dedicated account manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$overview$q$, $q$What is Deskpro?$q$, 2, ARRAY[$q$Deskpro is a multi-channel help desk covering email, chat, voice, SMS, WhatsApp, and social media, with Deskpro AI providing a chatbot, an agent assist co-pilot, and workflow automations.$q$, $q$It differentiates itself with flexible deployment, offering cloud, private cloud, self-hosted, on-premise, and sovereign data center options alongside SOC II, ISO 27001, and HIPAA certification.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$who-its-for$q$, $q$Who Deskpro is for$q$, 2, ARRAY[$q$Deskpro suits mid-size to enterprise support teams, especially in regulated industries like healthcare and government, that need deployment flexibility beyond a standard multi-tenant cloud help desk.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Humaans ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered HRIS that centralizes employee data, workflow automation, and an AI Companion for employee self-service, for growing companies.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Humaans is an AI-powered HRIS for people data, workflow automation, and an AI Companion for employee self-service, with quote-based pricing.$q$,
  og_description = $q$Humaans is an AI-powered HRIS for people data, workflow automation, and an AI Companion for employee self-service, with quote-based pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '263780ad-dbb8-4862-b01a-e1ce95f8fa3a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '263780ad-dbb8-4862-b01a-e1ce95f8fa3a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Employee Database$q$, $q$Central system of record for employee data across 300+ global locations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Workflow Automation$q$, $q$Automates requests, approvals, onboarding, and offboarding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Absence Management & Timesheets$q$, $q$Tracks time off and logs compliance-related time data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Performance Reviews & Engagement Tracking$q$, $q$Built-in review cycles and employee engagement monitoring.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$People Analytics$q$, $q$Real-time workforce insights and reporting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$AI Companion$q$, $q$Gives employees instant answers to policy and document questions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Compensation & Headcount Planning$q$, $q$Tools for managing pay and planning team growth.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$API, Webhooks & Integrations$q$, $q$Pre-built integrations plus a robust API and webhooks.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Supports HR operations across 300+ global locations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$AI Companion gives employees self-service answers without HR involvement$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$SOC 2 Type II, ISO 27001:2022, and GDPR compliance documented$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Enterprise plan adds SSO, unlimited custom fields, and audit log exports$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$No public pricing; plan costs require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Custom permission roles are capped at 2 on the Growth plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Supported UI languages aren't documented on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$How much does Humaans cost?$q$, $q$Pricing is not published; the site directs prospects to contact sales for Growth, Enterprise, and Athena plan pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Does Humaans include AI features?$q$, $q$Yes, an AI Companion answers employee questions instantly, and an 'Agentic AI Workforce' (Athena) handles admin work end-to-end.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Where is Humaans based?$q$, $q$Humaans lists offices in London, New York City, and San Francisco.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Is Humaans compliant with security standards?$q$, $q$Yes, it is SOC 2 Type II, ISO 27001:2022, and GDPR compliant.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$What's included in the Enterprise plan?$q$, $q$All Growth plan features plus SSO, unlimited custom permission roles and fields, webhooks, a dedicated sandbox, and a dedicated customer success manager.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Multi-country HR system of record$q$, $q$Centralizes employee data across 300+ global locations for scaling companies.$q$, $q$Growing, globally distributed companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$AI-assisted employee self-service$q$, $q$AI Companion answers policy and document questions so HR spends less time on repetitive queries.$q$, $q$HR teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$Enterprise security and compliance$q$, $q$Enterprise plan adds SSO, audit logs, and unlimited custom fields for larger organizations.$q$, $q$Enterprises$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$overview$q$, $q$What is Humaans?$q$, 2, ARRAY[$q$Humaans is an AI-powered HRIS that centralizes employee data and automates HR workflows like onboarding, offboarding, absence management, and performance reviews across 300+ global locations.$q$, $q$Its AI Companion answers employee questions about policies and documents instantly, and an 'Agentic AI Workforce' offering (Athena) is positioned to handle HR admin tasks end-to-end.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$who-its-for$q$, $q$Who Humaans is for$q$, 2, ARRAY[$q$Humaans targets growing companies that need a single system of record for HR data across multiple countries, with an Enterprise tier for organizations that require SSO and stricter security controls.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── CharlieHR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CharlieHR is an HR platform that automates onboarding, time off, performance reviews and employee records for small UK businesses.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$£20/month for 1-4 employees$q$,
  founded_year = NULL,
  company_size = $q$~30 employees$q$,
  headquarters = $q$London, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$CharlieHR: HR software for UK small businesses covering onboarding, time off, performance reviews, employee records and perks.$q$,
  og_description = $q$CharlieHR: HR software for UK small businesses covering onboarding, time off, performance reviews, employee records and perks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '28db2214-8104-44f7-8d16-5482ac920f21';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '28db2214-8104-44f7-8d16-5482ac920f21' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Onboarding$q$, $q$Automated collection of new-hire information before day one.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Time Off Management$q$, $q$Automated leave request and approval workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Performance Reviews$q$, $q$Tools for team development and growth conversations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Employee Engagement$q$, $q$Polls and engagement tracking for teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Perks & Benefits$q$, $q$Access to 30,000+ discounts and deals included in every subscription.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Document Storage$q$, $q$Centralized employee records and HR documentation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Charlie Recruit (add-on)$q$, $q$Automated hiring workflows, interview scheduling and eSignature contracts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Charlie Advice (add-on)$q$, $q$Dedicated HR advisor support with legal compliance checks.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$All-in-one HR admin platform purpose-built for small UK teams$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Perks and discounts marketplace included in every plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$7-day free trial with no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$ISO 27001 certified and GDPR compliant$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Focused on UK employment and compliance, not a global payroll or EOR solution$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Recruiting and HR-advisor support are paid add-ons rather than included features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Per-employee price rises quickly as team-size bands increase$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Does CharlieHR offer a free trial?$q$, $q$Yes, a 7-day free trial is available and does not require a credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$What is included in every Charlie plan?$q$, $q$Onboarding, time off, employee engagement, perks, employee records, performance reviews and key integrations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Are recruiting and HR advisory services included?$q$, $q$No, they are paid add-ons called Charlie Recruit and Charlie Advice.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Who is CharlieHR designed for?$q$, $q$UK-based startups and small businesses, from teams of 1-4 employees up to 250+.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Startup HR admin$q$, $q$Centralizes onboarding, leave requests and employee records for early-stage UK startups.$q$, $q$Founders and office managers at small UK startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Employee perks and engagement$q$, $q$Gives teams access to a marketplace of 30,000+ discounts alongside engagement polls.$q$, $q$HR and People teams at small UK companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Charlie (core plan)$q$, $q$From £20/month (1-4 employees) up to £735/month (250+ employees), tiered by team size$q$, $q$monthly$q$, $q$["Onboarding","Time off","Employee engagement","Perks & discounts","Employee records","Performance reviews","Key integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Charlie Recruit (add-on)$q$, $q$From £55/month$q$, $q$monthly$q$, $q$["Automated recruitment tasks","Smart interview scheduling","eSignature contracts","Custom careers site"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$Charlie Advice (add-on)$q$, $q$From £179/month$q$, $q$monthly$q$, $q$["One-to-one HR guidance","Unlimited support","Legal compliance checks","Personalised handbook"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$overview$q$, $q$What is CharlieHR?$q$, 2, ARRAY[$q$CharlieHR is an HR management platform built for small UK businesses, handling onboarding, time off, performance reviews and employee records in one system.$q$, $q$The platform bundles a marketplace of employee perks and discounts into every subscription and offers paid add-ons for recruiting and dedicated HR advice.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$who-its-for$q$, $q$Who CharlieHR is for$q$, 2, ARRAY[$q$CharlieHR targets UK-based startups and small companies, from teams of just 1-4 employees up to larger SMEs of 250+, typically run by founders or office managers rather than dedicated HR departments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── BreatheHR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Breathe (BreatheHR) is an HR platform for UK SMEs covering absence, leave, onboarding, performance management and e-learning.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = 2012,
  company_size = NULL,
  headquarters = $q$Horsham, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Breathe (BreatheHR): HR software for UK SMEs with absence tracking, leave, onboarding, performance management and e-learning.$q$,
  og_description = $q$Breathe (BreatheHR): HR software for UK SMEs with absence tracking, leave, onboarding, performance management and e-learning.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Holiday and leave management$q$, $q$Tracks holiday entitlement and requests.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Absence and sickness tracking$q$, $q$Records and reports on employee absence.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Onboarding workflows$q$, $q$Structured new-hire onboarding process.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Performance management$q$, $q$Tools for reviews and goal tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$E-learning platform$q$, $q$100+ UK-specific training courses.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Rota and shift scheduling$q$, $q$Plans shifts and rotas for teams.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Document management$q$, $q$Centralized HR documents with e-signatures.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Xero payroll integration$q$, $q$Connects employee data to Xero payroll.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Broad feature set (HR, e-learning, rotas, expenses) in one platform for SMEs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$No long-term contract; commitment-free plans that can be cancelled anytime$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Free trial without requiring a credit card$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Purpose-built for UK compliance, including UK-specific e-learning content$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Acquired by ELMO Cloud HR & Payroll in 2020, so it now operates as part of a larger group$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Designed for companies up to 250 employees, so not suited to larger enterprises$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Public pricing details were not accessible on the pricing page at time of review$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Is there a free trial?$q$, $q$Yes, a commitment-free trial is available without requiring a credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$What size of company is Breathe designed for?$q$, $q$SMEs with 1-250 employees.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Does Breathe integrate with payroll?$q$, $q$Yes, it integrates with Xero for payroll.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Who owns Breathe?$q$, $q$Breathe was acquired by ELMO Cloud HR & Payroll in 2020.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Absence and leave tracking$q$, $q$Centralizes holiday requests, sickness tracking and approvals for SME HR teams.$q$, $q$HR managers at UK SMEs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$Employee training$q$, $q$Delivers 100+ UK-specific e-learning courses alongside core HR records.$q$, $q$People teams needing compliance training$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$overview$q$, $q$What is BreatheHR?$q$, 2, ARRAY[$q$Breathe (formerly marketed as BreatheHR) is an HR platform built for small and medium-sized UK businesses, combining leave management, absence tracking, onboarding and performance reviews.$q$, $q$The platform also includes an e-learning library of UK-specific courses, rota scheduling and Xero payroll integration, and has been part of the ELMO Cloud HR & Payroll group since 2020.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$who-its-for$q$, $q$Who BreatheHR is for$q$, 2, ARRAY[$q$Breathe serves UK SMEs with up to 250 employees across sectors including charities, construction, education, healthcare and legal services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Namely ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Namely is a human capital management (HCM) platform combining HR, payroll and benefits administration for midsized US companies.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2012,
  company_size = NULL,
  headquarters = $q$New York, NY, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Namely is an HCM platform for midsized companies, combining HR management, payroll and benefits administration with custom pricing.$q$,
  og_description = $q$Namely is an HCM platform for midsized companies, combining HR management, payroll and benefits administration with custom pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '868cf043-41bd-45f4-8568-13b59cf7fb93';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '868cf043-41bd-45f4-8568-13b59cf7fb93' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Core HCM$q$, $q$HR management, payroll processing and time & attendance tracking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Benefits administration$q$, $q$Manages employee benefits enrollment and eligibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Applicant tracking$q$, $q$Tracks candidates through the hiring process.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Performance management$q$, $q$Tools for employee reviews and goal tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Compliance guidance$q$, $q$Support for HR compliance requirements.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Managed services$q$, $q$Optional outsourced HR, payroll and benefits administration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Mobile app$q$, $q$Employee self-service access on mobile.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Reporting$q$, $q$Real-time workforce analytics and custom visualizations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Combines payroll, benefits and core HR into one HCM platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Offers managed/outsourced service options in addition to self-service software$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Serves multiple industries with tailored solution pages (finance, nonprofit, healthcare, retail, etc.)$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Pricing is not published; requires requesting a quote or demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Website does not disclose company size or specific customer counts$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$What does Namely's pricing look like?$q$, $q$Namely does not publish pricing; the site directs visitors to request a quote via "Get Pricing."$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$What company sizes does Namely target?$q$, $q$Midsized companies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Does Namely offer payroll?$q$, $q$Yes, payroll processing is part of its core HCM offering.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$When was Namely founded?$q$, $q$2012.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$All-in-one HCM$q$, $q$Runs HR, payroll and benefits administration from a single platform.$q$, $q$Midsized company HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$Outsourced HR/payroll$q$, $q$Namely's managed services let companies outsource HR, payroll and benefits administration.$q$, $q$Companies wanting hands-off HR operations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$overview$q$, $q$What is Namely?$q$, 2, ARRAY[$q$Namely is a human capital management (HCM) platform for midsized companies, unifying payroll, benefits administration and core HR into a single system.$q$, $q$Beyond self-service software, Namely also offers managed services where its team handles outsourced HR, payroll and benefits administration on a company's behalf.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$who-its-for$q$, $q$Who Namely is for$q$, 2, ARRAY[$q$Namely targets midsized organizations across industries such as finance, nonprofits, technology, manufacturing, construction, healthcare, hospitality, retail and professional services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Justworks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Justworks is a PEO offering payroll, benefits, compliance and HR support for small businesses, priced per employee per month.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$79/employee/month$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = $q$New York, NY, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Justworks is a PEO offering payroll, benefits, compliance and HR support, with PEO Basic and Plus plans priced per employee per month.$q$,
  og_description = $q$Justworks is a PEO offering payroll, benefits, compliance and HR support, with PEO Basic and Plus plans priced per employee per month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '938ab555-9fbc-47d8-a414-f6dbfadcc473';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '938ab555-9fbc-47d8-a414-f6dbfadcc473' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Payments & payroll$q$, $q$Payroll processing and payments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Compliance support$q$, $q$Helps businesses stay compliant with employment regulations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$HR support & consultation$q$, $q$Access to HR guidance and consultation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Reporting tools$q$, $q$Reporting on payroll and workforce data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Contractor & vendor payments$q$, $q$Manages payments to contractors and vendors.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Health insurance administration$q$, $q$Available on the PEO Plus plan, including HSA/FSA accounts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$401(k) retirement plans$q$, $q$Retirement benefits included in PEO plans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$International contractor management$q$, $q$Add-on for paying contractors and hiring employees abroad.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Transparent, published per-employee pricing for PEO plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Bundles payroll, benefits, compliance and HR support under one PEO plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Employee perks marketplace (e.g., fitness and wellness benefits) included$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$PEO Plus plan (with health insurance) costs notably more per employee than Basic$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$International hiring is a separate, higher-cost add-on rather than included in core plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Workers' compensation is a required inclusion, which may not suit every business structure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$How much does Justworks cost?$q$, $q$The PEO Basic plan is $79 per employee per month; PEO Plus, which adds health insurance benefits, costs $109 per employee per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Does Justworks support international employees?$q$, $q$Yes, through an add-on for international contractor management and global employment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Is there a payroll-only plan?$q$, $q$Yes, Justworks offers a Payroll plan with a monthly base fee plus a per-employee charge.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$When was Justworks founded?$q$, $q$2012.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$PEO for small business$q$, $q$Bundles payroll, benefits, workers' comp and compliance into one PEO plan billed per employee.$q$, $q$Small business owners and operations leads$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Global contractor payments$q$, $q$Adds international contractor management for companies hiring outside the US.$q$, $q$Companies with distributed or remote contractor teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$Payroll$q$, $q$$50/month base + $8/employee/month$q$, $q$monthly$q$, $q$["Payroll processing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$PEO Basic$q$, $q$$79/employee/month$q$, $q$monthly$q$, $q$["Payments & Payroll","Compliance Support","HR Support & Consultation","Reporting Tools","Contractor & Vendor Payments","Workers' Comp","401(k)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$PEO Plus$q$, $q$$109/employee/month$q$, $q$monthly$q$, $q$["Everything in PEO Basic","Health insurance administration","HSA/FSA accounts","Mental health benefits","Fertility benefits"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$overview$q$, $q$What is Justworks?$q$, 2, ARRAY[$q$Justworks is a Professional Employer Organization (PEO) that bundles payroll, benefits administration, compliance support and HR consultation into per-employee-per-month plans.$q$, $q$Its PEO Basic and PEO Plus tiers add services like health insurance, HSA/FSA accounts and wellness perks as pricing increases, and a separate Payroll-only plan is available for companies that don't need full PEO services.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$who-its-for$q$, $q$Who Justworks is for$q$, 2, ARRAY[$q$Justworks is aimed at small businesses that want to outsource payroll, benefits and HR compliance rather than manage them in-house, including companies that occasionally need to pay international contractors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Papaya Global ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Papaya Global is a workforce management platform offering Employer of Record, global payroll and contractor payments in 160+ countries.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$25/employee/month (Global Payroll)$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = $q$New York, NY, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Papaya Global is a workforce management platform for Employer of Record, global payroll and contractor payments across 160+ countries.$q$,
  og_description = $q$Papaya Global is a workforce management platform for Employer of Record, global payroll and contractor payments across 160+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1ccd5534-faa4-40e5-8b15-5ca13db08e2e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1ccd5534-faa4-40e5-8b15-5ca13db08e2e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Employer of Record$q$, $q$Employs workers on a company's behalf in 160+ countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Global payroll$q$, $q$Payroll for companies with their own foreign entities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Contractor payments$q$, $q$Manages and pays international contractors.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Own payments infrastructure$q$, $q$Cross-border disbursements running on Papaya's own payments system, supporting 130+ currencies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Workforce OS / Payments OS / Contingent OS$q$, $q$Three-part product architecture covering employment, payments and contractor governance.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Operates its own payments infrastructure rather than relying solely on third parties$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Wide country coverage (160+ countries) for EOR and payroll$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Offers tiered EOR pricing, including a premium tier with dedicated HR support$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$EOR pricing starts significantly higher than several competitors, from $650/employee/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Multi-product lineup (Workforce OS, Payments OS, Contingent OS) may require sales guidance to navigate$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$What does Papaya Global's EOR cost?$q$, $q$Standard EOR pricing starts at $650/employee/month, with a premium tier at $770/employee/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Does Papaya Global support contractor payments?$q$, $q$Yes, contractor management starts at $30/contractor/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$How many countries does Papaya Global cover?$q$, $q$160+ countries for EOR, payroll and contractor services.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$When was Papaya Global founded?$q$, $q$2016.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Global EOR hiring$q$, $q$Employs workers on a company's behalf across 160+ countries without setting up local entities.$q$, $q$Companies scaling international headcount$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Global payroll consolidation$q$, $q$Runs payroll for a company's own foreign entities from one platform.$q$, $q$Companies with existing international legal entities$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Employer of Record - Standard$q$, $q$$650/employee/month$q$, $q$monthly$q$, $q$["Standard EOR coverage in 160+ countries"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Employer of Record - Premium$q$, $q$$770/employee/month$q$, $q$monthly$q$, $q$["Dedicated HR support","Priority compliance review"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Global Payroll$q$, $q$$25/employee/month$q$, $q$monthly$q$, $q$["Payroll for companies with their own entities"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$Contractor Management$q$, $q$$30/contractor/month$q$, $q$monthly$q$, $q$["Contractor payments and management"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$overview$q$, $q$What is Papaya Global?$q$, 2, ARRAY[$q$Papaya Global is a workforce management platform that combines Employer of Record services, global payroll and contractor payments on its own payments infrastructure.$q$, $q$The company organizes its products into three systems: Workforce OS for employment and payroll, Payments OS for cross-border disbursements, and Contingent OS for contractor and vendor workforce management, covering 160+ countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$who-its-for$q$, $q$Who Papaya Global is for$q$, 2, ARRAY[$q$Papaya Global targets companies that need to employ or pay workers internationally, whether hiring through Papaya's EOR entities or running payroll through the company's own foreign legal entities.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Oyster ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Oyster is an Employer of Record platform for hiring, paying and managing employees and contractors in 180+ countries without local entities.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$29/contractor/month (Global Contractors plan)$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$San Francisco, California, United States (fully distributed team)$q$,
  languages = '{}',
  seo_meta_description = $q$Oyster is an EOR platform for compliant hiring, payroll and benefits across 180+ countries, plus contractor payments and a US PEO option.$q$,
  og_description = $q$Oyster is an EOR platform for compliant hiring, payroll and benefits across 180+ countries, plus contractor payments and a US PEO option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '44ab8232-5537-40f1-b180-862658c8fcf5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '44ab8232-5537-40f1-b180-862658c8fcf5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Compliant onboarding$q$, $q$Onboards employees in as little as 48 hours across 180+ countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Multi-country payroll$q$, $q$Handles payroll in 120+ currencies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Global Contractors$q$, $q$Instant contracts and payments for contractors in 180+ countries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$US PEO$q$, $q$Hire employees across US states through co-employment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$People Partner Services$q$, $q$White-glove, project-based HR advisory billed hourly.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Visa sponsorship$q$, $q$Supports talent mobility and visa sponsorship.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$HRIS/ATS integrations$q$, $q$Connects with tools including Xero, Slack, HiBob, Personio, Ashby, BambooHR, Greenhouse and QuickBooks.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Misclassification analyzer$q$, $q$Flags contractor misclassification risk.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Certified B Corporation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Broad country coverage (180+ countries) for EOR and contractor hiring$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Integrates with multiple common HR, ATS and accounting tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Discount programs for nonprofits, B-corps, refugees and startups$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$EOR pricing ($699/employee/month) is a flat per-employee fee regardless of country, which can be costly for smaller teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$People Partner Services is billed hourly ($300/hour) on top of other plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Company headquarters and size are not detailed on the official site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$How much does Oyster's Employer of Record plan cost?$q$, $q$$699 per employee per month, with annual discounts available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Is there a free option?$q$, $q$The Global Contractors plan is free for the first 30 days, then $29/contractor/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Does Oyster offer US-only hiring?$q$, $q$Yes, through its US PEO plan at $114/employee/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$When was Oyster founded?$q$, $q$2020.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Global EOR hiring$q$, $q$Employs full-time staff compliantly across 180+ countries without setting up local entities.$q$, $q$Companies scaling international teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Contractor payments$q$, $q$Generates instant contracts and pays international contractors in 120+ currencies.$q$, $q$Companies hiring global freelancers or contractors$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Employer of Record$q$, $q$$699/employee/month$q$, $q$monthly$q$, $q$["Compliant employment in 120+ countries","Multi-country payroll in 120+ currencies","Automated expenses, time-off and reports","Onboarding & offboarding specialists"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$Global Contractors$q$, $q$Free for 30 days, then $29/contractor/month$q$, $q$monthly$q$, $q$["Instant contracts in 180+ countries","Contractor payments in 120+ currencies","Identity verification and onboarding","Misclassification analyzer"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$US PEO$q$, $q$$114/employee/month$q$, $q$monthly$q$, $q$["Hire in any US state via co-employment","Payroll processing","Benefits at competitive rates","HR admin and compliance outsourcing"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$People Partner Services$q$, $q$$300/hour$q$, NULL, $q$["Project-based HR advisory","Support for EOR and own entities"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$overview$q$, $q$What is Oyster?$q$, 2, ARRAY[$q$Oyster is a global employment platform offering Employer of Record (EOR) services so companies can hire, pay and manage employees and contractors in 180+ countries without setting up local legal entities.$q$, $q$Beyond EOR, Oyster also offers a Global Contractors product, a US PEO plan for domestic hiring, and hourly People Partner Services for hands-on HR advisory.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$who-its-for$q$, $q$Who Oyster is for$q$, 2, ARRAY[$q$Oyster serves companies hiring internationally, from startups converting contractors to full-time employees to larger organizations needing visa sponsorship and multi-country payroll, and holds Certified B Corporation status.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Multiplier ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Multiplier is an Employer of Record platform for hiring, paying and managing employees and contractors globally at flat per-employee pricing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$400/month per employee$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$Singapore$q$,
  languages = '{}',
  seo_meta_description = $q$Multiplier is an EOR and global payroll platform offering flat-rate hiring, contractor management and immigration support worldwide.$q$,
  og_description = $q$Multiplier is an EOR and global payroll platform offering flat-rate hiring, contractor management and immigration support worldwide.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'da1eed86-f886-4ac0-9587-89ab0dce35f5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'da1eed86-f886-4ac0-9587-89ab0dce35f5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Employer of Record$q$, $q$Employs full-time staff globally without local entities.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Contractors (COR)$q$, $q$Onboards and pays contractors worldwide within minutes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Global payroll$q$, $q$Manages multi-country payroll from one platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Immigration support$q$, $q$Visa processing and expert support across countries.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$ESOP support$q$, $q$Supports Employee Stock Ownership Plans for global hires.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$24/5 local support$q$, $q$Local HR and legal support available 24/5.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Flat-rate EOR pricing with no setup or offboarding fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Fast onboarding, typically completed within 24-72 hours$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$ISO and SOC 2+3 certified security$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Backed by 100+ owned entities across 150+ countries$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Global payroll and immigration services are custom-priced rather than published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Flat per-employee pricing may not reflect true cost differences between countries with very different statutory costs$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$How much does Multiplier's EOR plan cost?$q$, $q$A flat $400/month per employee, with no setup or offboarding fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Does Multiplier support contractors?$q$, $q$Yes, contractor management costs $40/contractor/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$How fast is onboarding?$q$, $q$Employee onboarding typically completes within 24-72 hours.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Where is Multiplier headquartered?$q$, $q$Singapore.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Global EOR hiring$q$, $q$Employs full-time staff worldwide at a flat per-employee monthly rate.$q$, $q$Companies scaling international teams on a budget$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Contractor management$q$, $q$Onboards and pays international contractors within minutes.$q$, $q$Companies working with global freelance talent$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Employer of Record$q$, $q$$400/month per employee$q$, $q$monthly$q$, $q$["No setup or offboarding fees","Global hiring in 100+ countries"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Contractors (COR)$q$, $q$$40/contractor/month$q$, $q$monthly$q$, $q$["Contractor onboarding and payments in 120+ currencies"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Global Payroll$q$, $q$Custom pricing$q$, NULL, $q$["Multi-country payroll management"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$Immigration$q$, $q$Custom pricing$q$, NULL, $q$["Visa processing and expert support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$overview$q$, $q$What is Multiplier?$q$, 2, ARRAY[$q$Multiplier is a global employment platform offering Employer of Record (EOR) services at a flat monthly rate per employee, letting companies hire full-time staff in 100+ countries without local entities.$q$, $q$The platform also covers contractor onboarding and payments, multi-country payroll, and immigration/visa support, and reports being backed by 100+ owned entities across 150+ countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$who-its-for$q$, $q$Who Multiplier is for$q$, 2, ARRAY[$q$Multiplier is aimed at companies that want predictable, flat-rate pricing for international hiring, including startups building distributed teams and businesses that need to onboard contractors quickly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Plane ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Plane is a global payroll platform for paying US employees, EOR hires, and contractors in 240+ countries from one system.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19/month per US employee ($0/month for the HRIS module)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Plane: global payroll, EOR, and contractor payments platform covering US employees, 240+ countries, and free HRIS tools.$q$,
  og_description = $q$Plane: global payroll, EOR, and contractor payments platform covering US employees, 240+ countries, and free HRIS tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '41688164-bff2-4d0a-8c55-4d847c936f12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '41688164-bff2-4d0a-8c55-4d847c936f12' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Unified global payroll$q$, $q$Pays US employees, contractors in 240+ countries, and EOR hires from a single system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Free HRIS$q$, $q$Onboarding, PTO tracking, and team reporting for all worker types at $0/month.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Open API, CLI & MCP support$q$, $q$Automation-first design with agent integration (Claude, ChatGPT, custom agents) via MCP.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Plane Agent (beta)$q$, $q$AI assistant in Slack for payroll queries and reporting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Compliance automation$q$, $q$State tax registration and locally compliant contract generation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Local payment rails$q$, $q$International transfers with lower fees and fair exchange rates.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Combines EOR, US payroll, and contractor payments in one system$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Free HRIS module with no per-seat fee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$No minimum charges, setup fees, or cancellation fees across plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Open API, CLI, and MCP support for AI-agent automation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$EOR pricing at $499/month per hire is a premium tier compared to its own contractor/employee plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Plane Agent AI assistant is labeled beta$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$No mobile apps mentioned on the site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$No founding year, headquarters, or company size disclosed$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$What does Plane cost?$q$, $q$Plane charges $0/month for HRIS, $19/month per US employee, $39/month per contractor, and $499/month per EOR hire, with no setup or cancellation fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Does Plane support international payroll?$q$, $q$Yes, Plane pays contractors in 240+ countries and offers EOR hiring in 100+ countries.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Is there an AI assistant in Plane?$q$, $q$Yes, Plane Agent is a beta AI assistant in Slack for payroll queries and reporting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Does Plane integrate with accounting software?$q$, $q$Yes, Plane integrates with QuickBooks for accounting automation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Paying global contractors$q$, $q$Pay contractors in 240+ countries with local currencies and automated 1099/W-8/W-9 tax form collection.$q$, $q$Companies with distributed contractor teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Hiring without a local entity$q$, $q$Plane's EOR service lets companies hire full-time employees in 100+ countries without setting up a local legal entity.$q$, $q$Companies expanding internationally$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$US payroll$q$, $q$Run multi-state W-2 payroll with automated tax filing for US-based employees.$q$, $q$US employers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$HRIS Platform$q$, $q$$0/month per person$q$, $q$monthly$q$, $q$["Guided hiring & onboarding with tasks","Contractor & employee directory","Custom reports","Holidays and time tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Employees - US$q$, $q$$19/month per person$q$, $q$monthly$q$, $q$["Multi-state W2 payroll","Automated tax filing and payments","Form I-9 and W-4 support","Multiple pay schedules"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$Contractors$q$, $q$$39/month per person$q$, $q$monthly$q$, $q$["Payments in 240+ countries","70+ local currencies","W-8 & W-9 collection and 1099 filing","Health insurance available"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$EOR (Employer of Record)$q$, $q$$499/month per person$q$, $q$monthly$q$, $q$["Hire in 100+ countries","No local entity required","Locally compliant contracts","Immigration and visa assistance"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$overview$q$, $q$What is Plane?$q$, 2, ARRAY[$q$Plane is a global payroll and HR platform that lets companies pay US employees, EOR hires, and contractors across 240+ countries from one system, with a free HRIS module for onboarding and PTO tracking.$q$, $q$It's built for automation, offering an open API, CLI, and MCP support so payroll data can be accessed by tools like Claude or ChatGPT.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$who-its-for$q$, $q$Who Plane is for$q$, 2, ARRAY[$q$Plane suits fast-growing companies managing a mix of US employees, international contractors, and EOR hires that want a single payroll system instead of stitching together multiple vendors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── RemotePass ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$RemotePass is a global payroll and HR platform for onboarding, paying, and managing contractors, EOR hires, and employees in 150+ countries.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$15/month per employee (Local Payroll)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Arabic$q$]::text[],
  seo_meta_description = $q$RemotePass: pay and manage global contractors, EOR hires, and employees in 150+ countries, with SpendCards and an AI insights assistant.$q$,
  og_description = $q$RemotePass: pay and manage global contractors, EOR hires, and employees in 150+ countries, with SpendCards and an AI insights assistant.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ad918d40-0018-4143-a607-5a36dd55baf6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ad918d40-0018-4143-a607-5a36dd55baf6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Global payroll$q$, $q$Single-payment processing for global and local workforces with multi-currency support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$HR management$q$, $q$Guided onboarding, time-off tracking, expense management, and equipment handling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Compliance$q$, $q$Automated, country-specific documentation collection and verification.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$SpendCards$q$, $q$Instant debit card issuance for team members worldwide.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Ask AI$q$, $q$Natural-language interface for HR/finance data insights and workforce analytics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Integrations$q$, $q$Connects with QuickBooks, Xero, FreshBooks, Google Workspace, HiBob, BambooHR, Sapling, Okta, Zoho Invoice, and Wafeq.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Supports contractors, EOR, and direct employees in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$SpendCards enable instant debit card issuance for global teams$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Ask AI feature for natural-language HR/finance queries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Mobile apps for iOS and Android$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$SOC2 Type I & II and GDPR compliant$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Contractor and EOR plans are priced per worker per month, which can add up for large teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$EOR and Contractor pricing is billed as an annual rate (quoted monthly)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Enterprise plan pricing is quote-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$No founding year, headquarters, or company size disclosed$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$What does RemotePass cost?$q$, $q$Plans start at $15/month per employee for Local Payroll, $39/month per contractor, $299/month per Contractor of Record, and $349/month per Employer of Record hire.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Does RemotePass have mobile apps?$q$, $q$Yes, RemotePass offers iOS and Android apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$What is Ask AI?$q$, $q$Ask AI is RemotePass's natural-language interface for querying HR and finance data and workforce analytics.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$What integrations does RemotePass support?$q$, $q$RemotePass integrates with QuickBooks, Xero, FreshBooks, Google Workspace, HiBob, BambooHR, Sapling, Okta, Zoho Invoice, and Wafeq.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Paying global contractors$q$, $q$Onboarding, compliance, and payroll for contractors in 150+ countries.$q$, $q$Companies hiring international contractors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Hiring without an entity$q$, $q$EOR and Contractor of Record plans let companies hire full-time or contract workers abroad without setting up a local entity.$q$, $q$Companies expanding globally$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Issuing global team cards$q$, $q$SpendCards let distributed teams receive instant debit cards for spending and reimbursement.$q$, $q$Finance and HR teams managing distributed spend$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Local Payroll$q$, $q$$15/month per employee$q$, NULL, $q$["Payroll and compliance for your own entity employees","Benefits management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Contractors$q$, $q$$39/month per contractor$q$, $q$annual$q$, $q$["Hire contractors in 150+ countries","Automated onboarding","Payroll in 100+ countries","Time tracking","Expense management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Contractor of Record (CoR)$q$, $q$$299/month per contractor$q$, NULL, $q$["RemotePass hires on your behalf","Handles all compliance","Single monthly invoice"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Employer of Record (EOR)$q$, $q$From $349/month per employee (incl. tax)$q$, $q$annual$q$, $q$["Hire full-time employees in 150+ countries","Health insurance and benefits","Time-off tracking","Automated payroll"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Visa Sponsorship$q$, $q$From $549/month$q$, NULL, $q$["Talent sourcing","Hiring","Visa and work permit sponsorship"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$Enterprise$q$, $q$Custom (contact sales)$q$, NULL, $q$["All platform capabilities","Dedicated support"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$overview$q$, $q$What is RemotePass?$q$, 2, ARRAY[$q$RemotePass is a global payroll and HR platform that lets companies onboard, pay, and manage contractors, EOR hires, and local employees across 150+ countries.$q$, $q$It adds SpendCards for instant debit-card issuance and an Ask AI feature for querying HR and finance data in natural language.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$who-its-for$q$, $q$Who RemotePass is for$q$, 2, ARRAY[$q$RemotePass suits startups and mid-market companies building distributed teams that need contractor payments, EOR hiring, and compliance handled in one place.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── WorkMotion ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WorkMotion is a Berlin-based EOR and global HR platform for hiring and paying employees and contractors in 160+ countries.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$31/month per contractor (Contractor Management)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Berlin, Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$WorkMotion: Berlin-based EOR and global HR platform for hiring, payroll, and compliance in 160+ countries, from $31/month per contractor.$q$,
  og_description = $q$WorkMotion: Berlin-based EOR and global HR platform for hiring, payroll, and compliance in 160+ countries, from $31/month per contractor.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1a0ac46b-2692-406a-b868-73e8c7b627db';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1a0ac46b-2692-406a-b868-73e8c7b627db' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Employer of Record (EOR)$q$, $q$Hire in 160+ countries through WorkMotion's subsidiary network.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Direct Hiring$q$, $q$Employ talent directly with real-time law monitoring and compliance alerts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Contractor Management$q$, $q$Onboard and pay global contractors with automated invoicing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Global payroll$q$, $q$Payroll processing covering contracts and statutory contributions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Wanda AI$q$, $q$AI-powered support tool for the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Platform calculators$q$, $q$Salary, cost, and offboarding calculators plus a country explorer tool.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Covers EOR, direct hiring, and contractor management in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Transparent starting prices published for all three hiring types$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$IEC Gold Certification for compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Serves 1,000+ companies including Trade Republic and Axel Springer$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$EOR pricing (from $549/month) is higher than the platform's contractor management tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Only English and German language support confirmed on-site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$No mobile app mentioned$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Company founding year and size not publicly disclosed$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$What does WorkMotion cost?$q$, $q$Contractor Management starts at $31/month per contractor, Direct Hiring at $429/month per employee, and Employer of Record at $549/month per employee (pricing varies by currency).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Where is WorkMotion based?$q$, $q$WorkMotion was founded in Berlin, Germany.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$What is Wanda AI?$q$, $q$Wanda AI is WorkMotion's AI-powered support tool for its platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$In how many countries can WorkMotion hire?$q$, $q$WorkMotion enables hiring in 160+ countries through its Employer of Record network.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Hiring abroad without an entity$q$, $q$EOR lets companies employ workers in 160+ countries without setting up a local subsidiary.$q$, $q$Companies expanding internationally$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Managing global contractors$q$, $q$Contractor Management handles onboarding, invoicing, and compliance for freelancers worldwide.$q$, $q$Companies engaging global freelancers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Direct international hiring$q$, $q$Direct Hiring suits companies with a longer-term legal presence in a country, with ongoing compliance monitoring.$q$, $q$Companies with established international presence$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Contractor Management$q$, $q$From $31/month per contractor$q$, $q$monthly$q$, $q$["Manage international contractors and freelancers","Avoid misclassification risks","Invoice and project management","Payments in 160+ countries"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Direct Hiring$q$, $q$From $429/month per employee$q$, $q$monthly$q$, $q$["Register as an employer in another country","Legal and HR guidance","Custom benefits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$Employer of Record (EOR)$q$, $q$From $549/month per employee$q$, $q$monthly$q$, $q$["Hiring in 160+ countries","End-to-end payroll management","Legal and HR guidance","Standard compliant contract templates"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$overview$q$, $q$What is WorkMotion?$q$, 2, ARRAY[$q$WorkMotion is a Berlin-based global HR platform offering Employer of Record, direct hiring, and contractor management for companies hiring across 160+ countries.$q$, $q$It publishes starting per-worker prices for each hiring type and includes an AI support tool called Wanda.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$who-its-for$q$, $q$Who WorkMotion is for$q$, 2, ARRAY[$q$WorkMotion suits companies that want to hire employees or contractors internationally without setting up their own legal entities in every country.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pinpoint ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pinpoint is a cloud-based applicant tracking system with AI hiring tools, branded careers sites, and end-to-end recruitment workflow management.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pinpoint: cloud ATS with AI hiring copilot, branded careers sites, and workflow automation for talent acquisition teams.$q$,
  og_description = $q$Pinpoint: cloud ATS with AI hiring copilot, branded careers sites, and workflow automation for talent acquisition teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1850649f-0915-4e09-87b7-b7aa588ddd00';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1850649f-0915-4e09-87b7-b7aa588ddd00' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$AI hiring tools$q$, $q$AI Hiring Copilot, AI Match Score, AI Candidate Filters, AI Criteria Checklist, and an AI Notetaker.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Branded careers sites$q$, $q$Multilingual candidate experience with employer branding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Flexible workflows$q$, $q$Multi-stream hiring, approval processes, and automations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Selection tools$q$, $q$Anonymized screening, video interviewing, interview scheduling, and candidate scorecards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Onboarding$q$, $q$Background checks and reference checks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Reporting & analytics$q$, $q$Executive dashboards, time-to-hire metrics, and compliance tracking.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$100+ integrations$q$, $q$Native integrations including Slack, LinkedIn, Indeed, Rippling, BambooHR, Checkr, DocuSign, and Microsoft Teams, plus an open API.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$AI tools (Hiring Copilot, Match Score, Notetaker) built into the ATS$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$100+ native integrations including Slack, LinkedIn, Indeed, and BambooHR$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$ISO 27001, ISO 42001, SOC 2, and GDPR certified$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$High third-party ratings (G2 4.8/5, Capterra 4.8/5)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$No public pricing; requires a sales request for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$No founding year, headquarters, or company size disclosed on-site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$No documented list of supported languages despite a "multilingual" claim$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$How much does Pinpoint cost?$q$, $q$Pinpoint does not publish pricing; interested buyers must request a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Does Pinpoint use AI?$q$, $q$Yes, Pinpoint includes AI Hiring Copilot, AI Match Score, AI Candidate Filters, and an AI Notetaker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$What integrations does Pinpoint support?$q$, $q$Pinpoint offers 100+ native integrations, including Slack, LinkedIn, Indeed, Rippling, BambooHR, Checkr, DocuSign, and Microsoft Teams.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Is Pinpoint compliant with data and security standards?$q$, $q$Yes, Pinpoint is ISO 27001, ISO 42001, SOC 2, and GDPR certified.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$High-volume hiring$q$, $q$Multi-stream workflows and automation help teams manage large applicant pools.$q$, $q$Talent acquisition teams at growing companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Multi-brand/multi-location hiring$q$, $q$Branded careers sites and workflows support hiring across multiple brands or locations.$q$, $q$Multi-brand or franchise organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$Regulated-industry hiring$q$, $q$Compliance tracking and audit trails support hiring in regulated industries.$q$, $q$HR leadership in regulated industries$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$overview$q$, $q$What is Pinpoint?$q$, 2, ARRAY[$q$Pinpoint is a cloud-based applicant tracking system that consolidates hiring workflows, candidate management, and onboarding into a single platform, with AI tools for matching, filtering, and note-taking.$q$, $q$It's certified to ISO 27001, ISO 42001, SOC 2, and GDPR standards and connects to 100+ tools including Slack, LinkedIn, and BambooHR.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$who-its-for$q$, $q$Who Pinpoint is for$q$, 2, ARRAY[$q$Pinpoint is aimed at talent acquisition teams, hiring managers, and HR leadership handling multi-stream, high-volume, or multi-location hiring.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Manatal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Manatal is a cloud recruitment platform with an ATS, AI candidate scoring, and an AI Interviewer that runs automated video interviews.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$15/month per user (Professional, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Manatal: cloud ATS with AI candidate scoring, profile enrichment, and an AI Interviewer, from $15/user/month with a 14-day free trial.$q$,
  og_description = $q$Manatal: cloud ATS with AI candidate scoring, profile enrichment, and an AI Interviewer, from $15/user/month with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd4790e8a-5afa-40c4-9e80-1e6489a84434';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd4790e8a-5afa-40c4-9e80-1e6489a84434' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$AI Interviewer$q$, $q$Conducts automated video interviews 24/7 for unlimited candidates (add-on).$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Candidate sourcing$q$, $q$Integrates with 2,500+ job boards, including LinkedIn, Indeed, Monster, and ZipRecruiter.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Applicant tracking system$q$, $q$Customizable pipeline with a Kanban board interface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Recruitment CRM$q$, $q$Manages client relationships and placements for agencies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$AI enrichment$q$, $q$Automatically builds candidate profiles using data from 20+ social platforms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$AI recommendations$q$, $q$Scores and matches candidates to job requirements.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Career page builder$q$, $q$Create branded, customizable career pages.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$AI Interviewer conducts automated video interviews around the clock$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Sources candidates from 2,500+ job boards$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Low starting price ($15/user/month) with a 14-day free trial and no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Supports 4 UI languages: English, Spanish, French, German$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$SOC II Type 2 certified$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Open API, SSO, and LLM integrations are limited to the top-tier Enterprise Plus plan ($55/user/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$AI Interviewer is a paid add-on, not included by default$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Custom plan pricing is not public$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$How much does Manatal cost?$q$, $q$Annual-billing plans start at $15/user/month (Professional), $35/user/month (Enterprise), and $55/user/month (Enterprise Plus); monthly billing is $19, $39, and $59 respectively.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Does Manatal offer a free trial?$q$, $q$Yes, a 14-day free trial is available with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$What does Manatal's AI Interviewer do?$q$, $q$It conducts automated video interviews with unlimited candidates, available as an add-on across all plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$What languages does Manatal support?$q$, $q$English, Spanish, French, and German.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Agency recruitment$q$, $q$A built-in Recruitment CRM helps staffing agencies manage clients and placements alongside candidate pipelines.$q$, $q$Recruitment agencies and headhunters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$High-volume candidate sourcing$q$, $q$Integration with 2,500+ job boards helps teams source candidates from one dashboard.$q$, $q$In-house HR and talent acquisition teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Automated first-round interviews$q$, $q$The AI Interviewer screens candidates via automated video interviews before human review.$q$, $q$Recruiters screening large applicant volumes$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Professional$q$, $q$$15/user/month$q$, $q$annual$q$, $q$["Up to 15 jobs","Up to 10,000 candidates","Unlimited hiring managers","AI enrichment","AI recommendations","ATS","Sourcing","Career page"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Enterprise$q$, $q$$35/user/month$q$, $q$annual$q$, $q$["Unlimited jobs and candidates","Everything in Professional","Workflow automation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Enterprise Plus$q$, $q$$55/user/month$q$, $q$annual$q$, $q$["Advanced report builder","LLM integration","Open API","Candidate portal","Custom permissions","SSO","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$Custom$q$, $q$On demand$q$, NULL, $q$["Custom integrations","Dedicated account manager","Phone support","Custom compliance reports"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$overview$q$, $q$What is Manatal?$q$, 2, ARRAY[$q$Manatal is a cloud-based recruitment platform combining an applicant tracking system, candidate sourcing across 2,500+ job boards, and AI tools for enrichment, scoring, and automated video interviewing.$q$, $q$Plans start at $15/user/month with a 14-day free trial, and the top Enterprise Plus tier adds SSO, an open API, and LLM integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$who-its-for$q$, $q$Who Manatal is for$q$, 2, ARRAY[$q$Manatal is used by in-house HR teams and recruitment agencies alike, from solo recruiters to staffing firms managing high candidate volumes.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Jobvite ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Jobvite is an applicant tracking system with AI candidate matching, recruitment marketing, and modular add-ons for onboarding and interviews.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Jobvite: modular ATS with AI candidate matching, recruitment marketing, and an AI Interview Companion; pricing is quote-based.$q$,
  og_description = $q$Jobvite: modular ATS with AI candidate matching, recruitment marketing, and an AI Interview Companion; pricing is quote-based.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06eb9255-8dff-49b4-92cb-b6dfc17d5493';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06eb9255-8dff-49b4-92cb-b6dfc17d5493' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Applicant tracking system$q$, $q$Built-in automation for managing hiring pipelines.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$AI candidate matching$q$, $q$Identifies top-fit applicants with match explanations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Career sites$q$, $q$Mobile-optimized, brandable career sites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Recruitment marketing$q$, $q$Employer branding campaign tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$AI Interview Companion$q$, $q$Supports consistent, structured interviews.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Analytics$q$, $q$60+ dashboards and reports.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Candidate messaging$q$, $q$SMS/text recruiting and multi-touch CRM campaigns.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Modular pricing lets buyers add only the modules they need (Onboarding, AI Companion, Recruitment Marketing)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$AI-powered candidate matching includes match explanations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$60+ built-in analytics dashboards$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Backed by Employ Inc., which also owns JazzHR and Lever$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$No public pricing; requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$No founding year, headquarters, or company size disclosed on-site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$No documented supported languages$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$How much does Jobvite cost?$q$, $q$Jobvite does not publish pricing; it uses a modular, quote-based model where customers add modules like Onboarding or AI Companion to a core ATS.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Does Jobvite use AI?$q$, $q$Yes, Jobvite includes AI-powered candidate matching and an AI Interview Companion.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Who owns Jobvite?$q$, $q$Jobvite is part of Employ Inc., which also owns JazzHR and Lever.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Does Jobvite support employee referrals?$q$, $q$Yes, Jobvite includes employee referral program tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Enterprise applicant tracking$q$, $q$A core ATS with automation handles high-volume hiring pipelines.$q$, $q$Mid-size to enterprise talent acquisition teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Employer branding campaigns$q$, $q$Recruitment marketing tools support multi-touch candidate campaigns and branded career sites.$q$, $q$Employer branding and recruitment marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$Structured interviewing$q$, $q$The AI Interview Companion helps standardize interview consistency across hiring teams.$q$, $q$Hiring managers conducting structured interviews$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$overview$q$, $q$What is Jobvite?$q$, 2, ARRAY[$q$Jobvite is an applicant tracking system with AI-powered candidate matching, recruitment marketing tools, and an AI Interview Companion for structured interviews.$q$, $q$It's sold on a modular, quote-based model, letting customers start with a core ATS and add modules like Onboarding or Recruitment Marketing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$who-its-for$q$, $q$Who Jobvite is for$q$, 2, ARRAY[$q$Jobvite targets mid-sized to enterprise organizations with complex hiring needs across industries like healthcare, retail, manufacturing, and financial services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SmartRecruiters ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SmartRecruiters is an AI-powered talent acquisition platform covering sourcing, ATS, scheduling, and hiring, with plans starting at $14,995.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$14,995 (Essential plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$]::text[],
  seo_meta_description = $q$SmartRecruiters: AI talent acquisition platform for sourcing, ATS, scheduling, and hiring; Essential plan starts at $14,995.$q$,
  og_description = $q$SmartRecruiters: AI talent acquisition platform for sourcing, ATS, scheduling, and hiring; Essential plan starts at $14,995.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7018fde8-f2e0-455a-ae95-59b95db2c107';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7018fde8-f2e0-455a-ae95-59b95db2c107' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Attract$q$, $q$Conversational AI chatbot, job distribution, recruitment CRM, and text recruiting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Select$q$, $q$Applicant tracking system, AI talent matching engine, candidate screening, and dynamic scheduling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Hire$q$, $q$AI-powered hiring agent, analytics/insights, offer management, and onboarding.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Winston Intelligence$q$, $q$AI layer that automates candidate matching, screening, and hiring assistance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$200+ integrations$q$, $q$Marketplace of 200+ integrations plus native SAP SuccessFactors integration.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$The entry-level Essential plan has a publicly listed starting price ($14,995)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Winston AI layer spans sourcing, matching, and hiring$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$200+ integration marketplace including native SAP SuccessFactors support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Used by large enterprises like McDonald's, KPMG, and Visa$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Only the Essential plan has public pricing; Professional, High Volume, and Complete tiers are quote-only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Aimed at organizations with 50+ employees, less suited to very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Founding year, headquarters, and company size not disclosed on-site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$How much does SmartRecruiters cost?$q$, $q$The Essential plan starts at $14,995; Professional, High Volume, and Complete plans require a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$What is Winston Intelligence?$q$, $q$Winston is SmartRecruiters' AI layer that powers candidate matching, screening automation, and hiring assistance across the platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Does SmartRecruiters integrate with SAP SuccessFactors?$q$, $q$Yes, SmartRecruiters offers native integration with SAP SuccessFactors.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$What languages does SmartRecruiters support?$q$, $q$English, German, and French are listed on the site.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$High-volume hiring$q$, $q$The High Volume plan adds AI candidate screening and conversational AI chat for large applicant pools.$q$, $q$Enterprises with high-volume hiring needs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$SAP-integrated enterprises$q$, $q$Native SAP SuccessFactors integration suits enterprises already on SAP HR systems.$q$, $q$SAP SuccessFactors customers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Recruitment marketing and sourcing$q$, $q$The Attract module combines job distribution, CRM, and text recruiting for candidate sourcing.$q$, $q$Talent acquisition and sourcing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Essential$q$, $q$$14,995$q$, NULL, $q$["ATS","CRM","Onboarding","SMS Messaging","Job Distribution","Dynamic Scheduling"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Professional$q$, $q$Custom quote$q$, NULL, $q$["Everything in Essential","AI-powered Hiring Agent","AI Talent Matching Engine","Add-on feature access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$High Volume$q$, $q$Custom quote$q$, NULL, $q$["Everything in Professional","AI-powered Candidate Screening","Conversational AI Chat","Increased SMS/job distribution volume"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$Complete$q$, $q$Custom quote$q$, NULL, $q$["Everything in High Volume","Advanced Analytics","Advanced Sandbox","Custom in-app guidance"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$overview$q$, $q$What is SmartRecruiters?$q$, 2, ARRAY[$q$SmartRecruiters is an AI-powered talent acquisition platform spanning sourcing (Attract), applicant tracking and screening (Select), and offer/onboarding (Hire), powered by its Winston Intelligence AI layer.$q$, $q$Its Essential plan starts at $14,995, while Professional, High Volume, and Complete tiers require a custom quote.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$who-its-for$q$, $q$Who SmartRecruiters is for$q$, 2, ARRAY[$q$SmartRecruiters targets enterprise organizations with 50+ employees and high-volume or complex hiring needs, including customers like McDonald's, KPMG, and Visa.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── iCIMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$iCIMS is an enterprise applicant tracking system with agentic AI (Coalesce AI) for sourcing, screening, and candidate matching at scale.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$United States$q$,
  languages = '{}',
  seo_meta_description = $q$iCIMS: enterprise ATS with Coalesce AI for candidate matching, sourcing, and onboarding, used by ~25% of Fortune 500 companies.$q$,
  og_description = $q$iCIMS: enterprise ATS with Coalesce AI for candidate matching, sourcing, and onboarding, used by ~25% of Fortune 500 companies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af2f837c-b8e2-4cf6-bb19-100a26c709af';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af2f837c-b8e2-4cf6-bb19-100a26c709af' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$iCIMS Hire$q$, $q$Configurable ATS for streamlined hiring workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$iCIMS Engage$q$, $q$Automated sourcing and candidate nurture campaigns.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Employer Branding$q$, $q$Career site builder, digital chatbot assistant, and video testimonials.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Coalesce AI$q$, $q$Purpose-built AI for candidate matching, personalization, and sourcing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$High-volume hiring tools$q$, $q$Conversational candidate experience with a mobile workspace and text recruiting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$800+ integrations$q$, $q$Connects with job boards, HR/payroll systems, background check providers, and assessment tools.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Coalesce AI covers matching, personalization, and sourcing in one AI layer$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$800+ partner integrations across job boards, payroll, and background checks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Responsible AI certification and bias-mitigation program$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Used by roughly 25% of Fortune 500 companies$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$No public pricing; demo request required$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$No founding year or company size disclosed on-site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$No documented list of supported languages despite multilingual career sites$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$How much does iCIMS cost?$q$, $q$iCIMS does not publish pricing; interested buyers must request a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$What is Coalesce AI?$q$, $q$Coalesce is iCIMS' purpose-built AI for candidate matching, personalization, and sourcing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$How many companies use iCIMS?$q$, $q$iCIMS serves 4,400+ companies across 200 countries, including about 25% of Fortune 500 companies.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Does iCIMS have a responsible-AI program?$q$, $q$Yes, iCIMS operates a Responsible AI program with independent certification for fairness and bias mitigation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Enterprise hiring at scale$q$, $q$iCIMS Hire provides a configurable ATS for large, complex hiring workflows.$q$, $q$Enterprise talent acquisition teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$High-volume, mobile-first hiring$q$, $q$Conversational, mobile-optimized candidate experience suits high-volume roles like retail and manufacturing.$q$, $q$High-volume hiring for retail/manufacturing$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$Automated sourcing and nurture$q$, $q$iCIMS Engage automates sourcing campaigns and candidate nurturing.$q$, $q$Recruiters managing talent pipelines$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$overview$q$, $q$What is iCIMS?$q$, 2, ARRAY[$q$iCIMS is an enterprise-grade applicant tracking system and AI recruitment platform, with Coalesce AI powering candidate matching, personalization, and sourcing across the hiring process.$q$, $q$It serves 4,400+ companies across 200 countries, including roughly 25% of Fortune 500 companies, and connects to 800+ partner technologies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$who-its-for$q$, $q$Who iCIMS is for$q$, 2, ARRAY[$q$iCIMS is built for enterprise organizations across retail, healthcare, manufacturing, and finance that need configurable, high-volume hiring workflows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bullhorn ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bullhorn is a cloud ATS and CRM for staffing and recruitment agencies, used by 80% of the world's largest staffing firms.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2000,
  company_size = $q$~1,400 employees$q$,
  headquarters = $q$Boston, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Bullhorn: cloud ATS and CRM for staffing agencies, with an Amplify AI suite and 300+ integrations; founded in 2000, HQ in Boston.$q$,
  og_description = $q$Bullhorn: cloud ATS and CRM for staffing agencies, with an Amplify AI suite and 300+ integrations; founded in 2000, HQ in Boston.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Amplify AI Suite$q$, $q$Includes Chat, Digital Workers, and Search & Match AI capabilities.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$ATS & CRM$q$, $q$Applicant tracking and customer relationship management in one system.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Automation$q$, $q$Recruitment workflow automation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Middle Office$q$, $q$Payroll and worker payment processing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Reporting & analytics$q$, $q$Business intelligence tools for staffing operations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Onboarding$q$, $q$New employee setup workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Purpose-built for staffing agencies, combining ATS, CRM, and Middle Office payroll$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Amplify AI suite adds AI search/match and "Digital Workers" for repetitive tasks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$300+ pre-built marketplace integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$26 years in business (founded 2000) with 10,000+ customers globally$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$No public pricing; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Offered across two distinct platforms (Bullhorn Platform and Salesforce-based Recruitment Cloud), which may add evaluation complexity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Company size and exact pricing details not fully disclosed on-site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$How much does Bullhorn cost?$q$, $q$Bullhorn does not publish pricing on its site; the pricing page directs prospects to contact sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$When was Bullhorn founded?$q$, $q$Bullhorn was founded in 2000 and is headquartered in Boston.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$What is Bullhorn Amplify?$q$, $q$Amplify is Bullhorn's AI suite, including Chat, Digital Workers, and Search & Match capabilities.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Does Bullhorn offer payroll for staffing agencies?$q$, $q$Yes, Bullhorn's Middle Office handles payroll and worker payment processing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Staffing agency operations$q$, $q$Combines ATS and CRM to manage both candidates and client relationships in one system.$q$, $q$Recruitment and staffing agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$Worker payroll for staffing firms$q$, $q$Middle Office processes payroll and worker payments, handling 1.3 million worker payments monthly.$q$, $q$Staffing agencies managing contractor/temp payroll$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$AI-assisted candidate search$q$, $q$The Amplify Search & Match tool and Digital Workers automate candidate matching and repetitive sourcing tasks.$q$, $q$Recruiters at high-volume agencies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$overview$q$, $q$What is Bullhorn?$q$, 2, ARRAY[$q$Bullhorn is a cloud-based recruitment and staffing software platform that unifies candidate management, client relationships, and job placement operations, founded in 2000 and headquartered in Boston.$q$, $q$Its Amplify AI suite adds AI chat, "Digital Workers," and Search & Match on top of the core ATS/CRM and Middle Office payroll modules.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$who-its-for$q$, $q$Who Bullhorn is for$q$, 2, ARRAY[$q$Bullhorn is built for staffing and recruitment agencies of all sizes, from startups to large enterprise firms; the company reports 80% of the world's largest agencies use it.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Gem ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gem is an AI-first recruiting platform that unifies sourcing, CRM, ATS, scheduling, and analytics for talent acquisition teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$130/month (startup program, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Gem is an AI recruiting platform combining sourcing, CRM, ATS, and analytics — used by 1,200+ talent acquisition teams including GitLab and Figma.$q$,
  og_description = $q$Gem is an AI recruiting platform combining sourcing, CRM, ATS, and analytics — used by 1,200+ talent acquisition teams including GitLab and Figma.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ade06e5-b645-47e5-8350-a2890ac101e4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ade06e5-b645-47e5-8350-a2890ac101e4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$AI Sourcing Agent$q$, $q$Searches 800M+ profiles and surfaces past candidates with verified contact info.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$AI Application Review Agent$q$, $q$Ranks applicants using AI reasoning to speed up application review.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$AI Fraud Detection Agent$q$, $q$Flags fraudulent or AI-generated candidate applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$CRM$q$, $q$Manages candidate pipelines with automated nurture sequences.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$ATS$q$, $q$Handles job postings, pipeline stages, and offer approvals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Scheduling$q$, $q$Automates interview booking.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Analytics$q$, $q$Provides hiring forecasts and pipeline insights.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$ATS Integrations$q$, $q$Connects with Greenhouse, Workday, Lever, and iCIMS.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$AI sourcing agent searches over 800 million candidate profiles$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Combines ATS, CRM, sourcing, and analytics in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Integrates with major ATS providers (Greenhouse, Workday, Lever, iCIMS)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Used by 1,200+ talent acquisition teams including Anthropic, GitLab, and Figma$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Startup program offers 6 months free plus a discount afterward$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Full platform pricing is quote-based and tied to company FTE count$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$No dedicated iOS or Android apps mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$AI-powered features are gated to a separate seat type from standard seats$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$What does Gem do?$q$, $q$Gem is an AI-first recruiting platform that combines sourcing, CRM, ATS, scheduling, and analytics into one system for talent acquisition teams.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Does Gem replace my existing ATS?$q$, $q$Gem offers two options: "Gem + Your ATS," which layers AI sourcing on top of an existing ATS, or "Gem All-in-One," which includes its own built-in ATS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$How much does Gem cost?$q$, $q$Pricing is custom based on company size; Gem's startup program lists a discounted rate of $130/month (billed annually) for companies with 1-10 employees.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Does Gem offer a free plan for startups?$q$, $q$Companies under 30 employees can get free access for six months, then 50% off paid plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$What AI features does Gem include?$q$, $q$Gem offers an AI Sourcing Agent, an AI Application Review Agent, and an AI Fraud Detection Agent.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Sourcing passive candidates at scale$q$, $q$Recruiters use Gem's AI Sourcing Agent to search 800M+ profiles and resurface past candidates with verified contact info.$q$, $q$Talent acquisition teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Replacing a fragmented recruiting stack$q$, $q$Companies use Gem All-in-One to combine ATS, CRM, sourcing, and analytics instead of running separate tools.$q$, $q$Growing startups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Screening high application volumes$q$, $q$Teams use the AI Application Review Agent to rank and flag fraudulent applicants faster during high-volume hiring.$q$, $q$Enterprise recruiting teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Startup Program (1-10 FTE)$q$, $q$$130/month (billed annually, discounted from $270/month)$q$, $q$annual$q$, $q$["AI Sourcing and CRM","Analytics","Scheduling","ATS"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Gem + Your ATS$q$, $q$Custom (based on company size)$q$, NULL, $q$["AI sourcing layered on existing ATS","Outreach automation","Scheduling","Analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$Gem All-in-One$q$, $q$Custom (based on company size)$q$, NULL, $q$["Built-in ATS","AI sourcing and CRM","Scheduling","Analytics"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$overview$q$, $q$What is Gem?$q$, 2, ARRAY[$q$Gem is an AI-first recruiting platform that brings sourcing, CRM, ATS, scheduling, and analytics together in a single system.$q$, $q$It layers AI agents for sourcing, application review, and fraud detection on top of a candidate pipeline, and can either connect to an existing ATS or serve as a company's full ATS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$who-its-for$q$, $q$Who Gem is for$q$, 2, ARRAY[$q$Gem is built for talent acquisition teams at startups, growing companies, enterprises, and recruiting firms that need to source, engage, and track candidates in one place. Gem runs a discounted startup program for companies under 100 employees.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Fetcher ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Fetcher is an AI-powered candidate sourcing platform that delivers qualified, engaged candidates to recruiting teams.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$115/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, NY$q$,
  languages = '{}',
  seo_meta_description = $q$Fetcher is an AI candidate sourcing platform with tiered plans from $115/month, giving recruiters access to a 500M+ talent database.$q$,
  og_description = $q$Fetcher is an AI candidate sourcing platform with tiered plans from $115/month, giving recruiters access to a 500M+ talent database.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$AI-Screened Sourcing$q$, $q$Surfaces and screens candidates using AI paired with a sourcing team.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Candidate Engagement$q$, $q$Tools to reach out to and engage sourced candidates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Recruitment Analytics$q$, $q$Reporting on sourcing performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Diversity Search Criteria$q$, $q$Lets recruiters customize searches around diversity goals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$ATS/CRM Integrations$q$, $q$Connects with existing ATS, CRM, email, and Slack tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Candidate Database Access$q$, $q$All plans include access to a 500M+ candidate database.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Transparent published pricing tiers starting at $115/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Access to a 500M+ candidate database on every plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Higher tiers include a dedicated sourcer for open roles$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Integrates with existing ATS, CRM, email, and Slack$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$No free trial or free plan listed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Entry-level Self-Serve plan is limited to one user seat and 300 leads/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Enterprise-level pricing requires a custom quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$How much does Fetcher cost?$q$, $q$Fetcher has three published plans: Self-Serve at $115/month, Growth at $379/month, and Amplify at $649/month, plus a custom Enterprise tier, with 30% off for annual billing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Does Fetcher offer a free trial?$q$, $q$No free trial or free plan is listed on Fetcher's pricing page.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$What's included in every Fetcher plan?$q$, $q$All plans include access to Fetcher's 500M+ candidate database.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Does Fetcher provide a dedicated sourcer?$q$, $q$The Amplify plan includes a dedicated sourcer for 4-6 roles and a dedicated success team.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Where is Fetcher based?$q$, $q$Fetcher's office is listed at 287 Park Avenue South, New York, NY.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Sourcing candidates without an internal team$q$, $q$Recruiters short on sourcing bandwidth use Fetcher's Self-Serve or Growth plans to get AI-screened candidates.$q$, $q$Solo recruiters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Scaling high-volume hiring$q$, $q$Companies with multiple open roles use the Amplify plan's dedicated sourcer and success team.$q$, $q$Growing recruiting teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Self-Serve$q$, $q$$115/month (30% off billed annually)$q$, $q$monthly$q$, $q$["300 leads/month","1 user seat","Up to 500 Fetcher-sourced talent annually","Basic analytics","Email integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Growth$q$, $q$$379/month (30% off billed annually)$q$, $q$monthly$q$, $q$["Up to 2,500 leads annually","1 user seat","Up to 1,000 Fetcher-sourced talent yearly","CRM","LinkedIn sourcing plugin","ATS integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Amplify$q$, $q$$649/month (30% off billed annually)$q$, $q$monthly$q$, $q$["Up to 5,000 leads annually","2 user seats","Dedicated sourcer for 4-6 roles","Dedicated success team","Up to 2,000 sourced candidates yearly"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["For large companies and agencies with high-volume needs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$overview$q$, $q$What is Fetcher?$q$, 2, ARRAY[$q$Fetcher is an AI-powered candidate sourcing platform that pairs automated screening with a sourcing team to deliver qualified candidates to recruiters.$q$, $q$It offers tiered plans that scale from self-serve sourcing to a fully dedicated sourcing team, all built on a 500M+ candidate database.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$who-its-for$q$, $q$Who Fetcher is for$q$, 2, ARRAY[$q$Fetcher serves recruiting teams hiring across engineering, finance, product, ops, marketing, sales, and customer success roles, from individual recruiters to larger teams needing dedicated sourcing support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AmazingHiring ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AmazingHiring is a talent sourcing platform that searches 50+ networks like GitHub and Stack Overflow to find tech candidates.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$AmazingHiring helps recruiters source tech talent by searching 50+ developer networks including GitHub, Stack Overflow, and LinkedIn.$q$,
  og_description = $q$AmazingHiring helps recruiters source tech talent by searching 50+ developer networks including GitHub, Stack Overflow, and LinkedIn.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c209af5-e769-4601-8b16-169d41b98725';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c209af5-e769-4601-8b16-169d41b98725' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Multi-Network Search$q$, $q$Searches GitHub, Stack Overflow, Kaggle, LinkedIn, and other developer communities.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Direct Contact Discovery$q$, $q$Surfaces direct contact information for candidates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Email Campaigns$q$, $q$Send outreach campaigns to sourced candidates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Chrome Extension$q$, $q$Free browser extension that surfaces a candidate's social and professional links.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Market Insights$q$, $q$Talent market data to inform sourcing decisions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$ATS Integrations$q$, $q$Connects with applicant tracking systems.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Searches over 50 technical and developer networks in one place$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Free Chrome extension for surfacing candidate profile links$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Used by 500+ talent acquisition teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Surfaces direct contact info, not just profile links$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Pricing is not published on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$No explicit AI branding despite advanced search capabilities$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$No dedicated mobile app beyond the browser extension$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$What does AmazingHiring do?$q$, $q$AmazingHiring is a sourcing platform that searches over 50 networks such as GitHub, Stack Overflow, Kaggle, and LinkedIn to find technical candidates.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Is AmazingHiring free?$q$, $q$The Chrome extension is free; full platform pricing is not published and requires contacting sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Does AmazingHiring integrate with an ATS?$q$, $q$Yes, it offers ATS integrations, though specific systems aren't named on the site.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Who uses AmazingHiring?$q$, $q$The site states it is trusted by 500+ talent acquisition teams, including Talentful, Lilium, Bolt, and Nortal.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Sourcing hard-to-find tech candidates$q$, $q$IT recruiters use AmazingHiring's multi-network search to find developers not active on LinkedIn.$q$, $q$Technical recruiters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$Quick candidate lookup while browsing$q$, $q$Recruiters use the free Chrome extension to surface a candidate's social and professional links while viewing a profile.$q$, $q$Individual sourcers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$overview$q$, $q$What is AmazingHiring?$q$, 2, ARRAY[$q$AmazingHiring is a talent sourcing platform focused on technical hiring. It searches more than 50 networks, including GitHub, Stack Overflow, Kaggle, and LinkedIn, to help recruiters find candidates and their contact information.$q$, $q$It also offers a free Chrome extension, email outreach campaigns, and market insights for sourcing decisions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$who-its-for$q$, $q$Who AmazingHiring is for$q$, 2, ARRAY[$q$AmazingHiring is built for talent acquisition teams and IT recruiters who need to source technical candidates beyond standard job boards and LinkedIn.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c209af5-e769-4601-8b16-169d41b98725', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Payhawk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Payhawk is a spend management platform combining corporate cards, expenses, travel, accounts payable, and procurement with AI.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$£149/month (Growth Program, UK/EEA small businesses)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$London, UK$q$,
  languages = ARRAY[$q$English$q$, $q$Bulgarian$q$, $q$Dutch$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$]::text[],
  seo_meta_description = $q$Payhawk unifies corporate cards, expenses, travel, AP, and procurement with AI automation for 6,000+ companies across Europe.$q$,
  og_description = $q$Payhawk unifies corporate cards, expenses, travel, AP, and procurement with AI automation for 6,000+ companies across Europe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '72083907-7b29-4e6e-80d3-6134cca542d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '72083907-7b29-4e6e-80d3-6134cca542d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Corporate Cards$q$, $q$Cards with built-in spend controls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Business Accounts$q$, $q$Multi-currency accounts and cross-border payments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Expense Management$q$, $q$Automated receipt capture and report generation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Accounts Payable$q$, $q$Invoice automation and approval routing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Business Travel$q$, $q$Booking and management of corporate travel.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Procurement$q$, $q$Pre-spend approval workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$AI Workflow Orchestration$q$, $q$AI-driven receipt chasing, approval routing, and policy enforcement.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$ERP Integrations$q$, $q$Connects with NetSuite, Microsoft Dynamics 365, Sage Intacct, and Workday.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Modular pricing lets companies pay only for the modules they use (Travel, Cards & Expenses, Bill Pay, Procure to Pay)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Native integrations with major ERPs (NetSuite, Dynamics 365, Sage Intacct, Workday)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$AI handles receipt chasing, approval routing, and policy enforcement$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Used by 6,000+ companies including Vinted and MAN Truck and Bus$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$iOS and Android apps available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Most plans require contacting sales for a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Only the Growth Program (UK/EEA small businesses, up to 20 employees) has a publicly listed price$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Growth Program requires a fixed 24-month contract term$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$What does Payhawk do?$q$, $q$Payhawk is a spend management platform that combines corporate cards, expense management, accounts payable, travel, and procurement in one system.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$How much does Payhawk cost?$q$, $q$Pricing is modular and mostly quote-based; the Growth Program for small UK/EEA businesses is listed at £149/month with a 7-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Does Payhawk use AI?$q$, $q$Yes, Payhawk uses AI for receipt chasing, approval routing, and policy enforcement.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Where is Payhawk based?$q$, $q$Payhawk is headquartered in London, UK, with additional offices across Europe.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Does Payhawk integrate with ERPs?$q$, $q$Yes, it integrates with NetSuite, Microsoft Dynamics 365, Sage Intacct, and Workday.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Controlling multi-entity spend$q$, $q$Finance teams at companies operating across multiple countries use Payhawk's multi-entity management and global visibility.$q$, $q$Finance teams at multinational companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Getting started with a fixed-price plan$q$, $q$Small UK/EEA businesses under 20 employees use the Growth Program for a fixed monthly price.$q$, $q$Small businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$Growth Program$q$, $q$£149/month$q$, $q$monthly$q$, $q$["Fixed 24-month term for UK/EEA small businesses","Up to 20 employees, single entity","10 cards, 10 user seats","Up to 15 invoices/reimbursements monthly","7-day free trial"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$overview$q$, $q$What is Payhawk?$q$, 2, ARRAY[$q$Payhawk is a spend management platform that brings corporate cards, expenses, business travel, accounts payable, and procurement into one system, with AI used to automate receipt chasing, approval routing, and policy enforcement.$q$, $q$Pricing is modular: companies choose core modules (Travel, Cards & Expenses, Bill Pay, Procure to Pay) and pay based on usage, though a fixed-price Growth Program exists for small UK/EEA businesses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$who-its-for$q$, $q$Who Payhawk is for$q$, 2, ARRAY[$q$Payhawk serves finance teams at companies managing spend across multiple entities, currencies, and countries, from small businesses to large multi-entity organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Airwallex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Airwallex is a global financial platform for multi-currency accounts, international transfers, corporate cards, and spend management.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Explore plan); Grow plan from $12/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Chinese (Simplified)$q$, $q$Chinese (Traditional)$q$, $q$Japanese$q$, $q$Spanish$q$, $q$Dutch$q$, $q$Vietnamese$q$, $q$Korean$q$]::text[],
  seo_meta_description = $q$Airwallex offers multi-currency business accounts, global transfers, and corporate cards, with a free Explore plan used by 200,000+ businesses.$q$,
  og_description = $q$Airwallex offers multi-currency business accounts, global transfers, and corporate cards, with a free Explore plan used by 200,000+ businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3f26fe2f-0d14-4d94-8521-de088090412c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3f26fe2f-0d14-4d94-8521-de088090412c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Global Accounts$q$, $q$Multi-currency accounts to receive funds in 20+ currencies.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$FX & Transfers$q$, $q$International transfers to 200+ countries at interbank rates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Corporate Cards$q$, $q$Multi-currency company and employee cards.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Bill Pay$q$, $q$Automated accounts payable management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Payment Checkout$q$, $q$Low-code, conversion-optimized payment form.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Payment Links$q$, $q$No-code payment acceptance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Invoicing$q$, $q$Global invoice generation with 160+ local payment methods.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$AI Expense Policy Agent$q$, $q$Always-on AI agent enforcing spend policy across entities and currencies (Grow plan).$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Free Explore plan with no monthly fee and up to 10 Spend users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Multi-currency accounts across 20+ currencies with interbank FX rates$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Free batch transfers to 120+ countries on the free plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Used by 200,000+ businesses including Shein and Canva$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$AI expense policy agent available on the Grow plan$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Payment processing fees apply on all plans (2.80%-4.30% + $0.30 per transaction)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Advanced approval workflows and the AI expense agent require the paid Grow plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Top-tier Accelerate plan is quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Is Airwallex free?$q$, $q$Airwallex's Explore plan is free at $0/user/month and includes multi-currency accounts and cards.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$What does the Grow plan add?$q$, $q$Grow adds advanced approval workflows, an AI expense policy agent, bill payment automation, and NetSuite/Dynamics 365 integration for $12/user/month plus a platform fee.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$How many currencies does Airwallex support?$q$, $q$Airwallex offers global accounts in 20+ currencies and transfers to 200+ countries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Does Airwallex charge card processing fees?$q$, $q$Yes — 2.80% + $0.30 for domestic cards and 4.30% + $0.30 for international cards, per the pricing page.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$What languages does Airwallex support?$q$, $q$The site is available in English, French, German, Chinese (Simplified and Traditional), Japanese, Spanish, Dutch, Vietnamese, and Korean.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Receiving international payments$q$, $q$Ecommerce and marketplace businesses use Global Accounts to receive customer payments in local currencies.$q$, $q$Ecommerce and marketplace businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Automating spend policy$q$, $q$Finance teams use the AI expense policy agent to enforce rules across entities and currencies.$q$, $q$Finance teams at multi-entity companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Explore$q$, $q$Free$q$, $q$monthly$q$, $q$["Unlimited multi-currency corporate cards, no international fees","Up to 10 free Spend users","Interbank FX rates","Global accounts in 20+ currencies","Free batch transfers to 120+ countries","3.15% yield on USD","Basic invoicing and subscription management","Xero and QuickBooks integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Grow$q$, $q$$12/user/month + platform fee$q$, $q$monthly$q$, $q$["Everything in Explore","Up to 250 Spend users","Advanced approval workflows","AI expense policy agent","Bill payment automation","NetSuite and Dynamics 365 integration","3.30% yield on USD"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Accelerate$q$, $q$Custom$q$, NULL, $q$["Everything in Grow","Purchase orders and 3-way matching","Up to 3 global entities","Dedicated account manager","Custom ERP Spend API integration","3.42% yield on USD"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$overview$q$, $q$What is Airwallex?$q$, 2, ARRAY[$q$Airwallex is a financial platform for global businesses that provides multi-currency accounts, international transfers, corporate cards, bill pay, and payment acceptance tools.$q$, $q$It offers a free Explore plan alongside paid Grow and Accelerate tiers that add automation, an AI expense policy agent, and ERP integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$who-its-for$q$, $q$Who Airwallex is for$q$, 2, ARRAY[$q$Airwallex serves ecommerce, SaaS, marketplace, travel, and fintech businesses that need to receive, hold, and pay out money across multiple currencies and countries.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mercury ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mercury is an online banking platform for startups offering free business checking, savings, credit cards, and AI-assisted bill pay.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (core banking); Mercury Plus $29.90/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mercury offers free business banking with checking, savings, and AI-powered bill pay, trusted by 300,000+ startups and entrepreneurs.$q$,
  og_description = $q$Mercury offers free business banking with checking, savings, and AI-powered bill pay, trusted by 300,000+ startups and entrepreneurs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Business Checking & Savings$q$, $q$No minimum balances or monthly fees.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Credit Cards$q$, $q$1.5% cashback with no personal guarantees required.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Virtual Cards$q$, $q$Instant card creation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Payment Processing$q$, $q$No fees on USD wires.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Invoicing & Accounting Automations$q$, $q$Syncs with QuickBooks, Xero, and NetSuite.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Expense Management$q$, $q$Team spend controls and approval workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Treasury$q$, $q$Yield up to 3.64% via Mercury Advisory (requires $250K+ balance).$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$AI Bill Pay$q$, $q$AI reads and populates bill details and categorizes transactions.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Free core banking with no monthly fees or minimum balances$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$4.9 rating on the Apple App Store$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Used by 300,000+ entrepreneurs, processing $20B+ in monthly transaction volume$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$AI-assisted bill pay and transaction categorization$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Integrates with QuickBooks, Xero, and NetSuite$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Free plan limits expense reimbursements to 5 active users/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Unlimited invoicing API and a dedicated relationship manager require the $299/month Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Treasury yield product requires a $250K+ balance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Is Mercury free to use?$q$, $q$Yes, Mercury's core business banking plan is $0/month with no minimum balance or overdraft fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$What does Mercury Plus include?$q$, $q$Mercury Plus ($29.90/month) adds recurring invoices, an invoicing API for up to 500 invoices/month, and reimbursements for up to 20 users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Does Mercury use AI?$q$, $q$Yes, Mercury uses AI to read and populate bill details and to categorize transactions automatically.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$What accounting tools does Mercury integrate with?$q$, $q$Mercury syncs with QuickBooks, Xero, and NetSuite.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$How many businesses use Mercury?$q$, $q$Mercury states it's trusted by 300,000+ entrepreneurs and that 1 in 3 startups choose Mercury.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Free startup banking$q$, $q$Early-stage startups use Mercury's no-fee checking and savings accounts to manage runway.$q$, $q$Startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Automating bill pay$q$, $q$Finance teams use Mercury's AI bill pay to read invoices and auto-categorize transactions.$q$, $q$Finance teams at scaling companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Mercury (Free)$q$, $q$$0/month$q$, $q$monthly$q$, $q$["No minimum balance","No overdraft or monthly fees","Free ACH, wire, and check payments","Free bill pay","Free expense reimbursements (up to 5 active users/month)","Free accounting automations (QuickBooks, Xero, NetSuite)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Mercury Plus$q$, $q$$29.90/month ($23.95/month billed annually)$q$, $q$monthly$q$, $q$["Everything in free plan","ACH invoice debit ($1/transaction)","Recurring invoices","Invoicing API (500 invoices/month)","Reimbursements up to 20 users/month","Unlimited 1099 tax filings"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Mercury Pro$q$, $q$$299/month ($239.90/month billed annually)$q$, $q$monthly$q$, $q$["Everything in Plus","Dedicated relationship manager","Free ACH invoice debit","Unlimited invoicing API","NetSuite categorizations","Reimbursements up to 250 users/month"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$overview$q$, $q$What is Mercury?$q$, 2, ARRAY[$q$Mercury is an online banking platform built for startups and scaling companies, offering business checking, savings, credit cards, payments, and invoicing with no minimum balance requirements.$q$, $q$It layers AI on top of core banking to auto-populate bills and categorize transactions, and offers paid Plus and Pro tiers with additional invoicing and reimbursement capacity.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$who-its-for$q$, $q$Who Mercury is for$q$, 2, ARRAY[$q$Mercury serves startups, SaaS companies, ecommerce brands, agencies, VC funds, and other scaling businesses that need free core banking with room to add invoicing and treasury features as they grow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Novo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Novo is a free business banking platform for small business owners with checking, invoicing, and expense tracking.$q$,
  pricing_model = $q$Free$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Novo offers free business banking with checking, invoicing, and AI-assisted expense tracking, trusted by 250,000+ small businesses.$q$,
  og_description = $q$Novo offers free business banking with checking, invoicing, and AI-assisted expense tracking, trusted by 250,000+ small businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Business Checking$q$, $q$Free checking account with no monthly fees.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Invoicing$q$, $q$Create and send invoices, accept payments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Vendor & Employee Payments$q$, $q$Send payments directly from the account.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Business Cards$q$, $q$Debit and credit cards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Expense Tracking$q$, $q$Automated expense categorization.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Novo Reserves$q$, $q$Set aside funds for taxes or specific goals.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Business Loans$q$, $q$Loan options for small businesses.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Tool Integrations$q$, $q$Connects accounting, payments, and payroll tools.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$No monthly fees for the core business checking account$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$4.8 rating on the App Store and 4.5 on Google Play$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$AI-assisted onboarding and expense categorization powered by Claude, OpenAI, and Gemini$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Trusted by 250,000+ independent businesses$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Novo Reserves feature for setting aside funds automatically$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Banking services are provided through a partner bank (Middlesex Federal Savings, F.A.) rather than Novo directly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Specific third-party integrations aren't individually named on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Business loan rates and terms aren't published publicly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Is Novo really free?$q$, $q$Yes, Novo advertises free business checking with no monthly fees for the core account.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Does Novo have a mobile app?$q$, $q$Yes, Novo has iOS (4.8 rating) and Android (4.5 rating) apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Does Novo use AI?$q$, $q$Novo states it uses AI powered by Claude, OpenAI, and Gemini for onboarding and expense categorization.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Who holds Novo deposits?$q$, $q$Novo banking services are provided by Middlesex Federal Savings, F.A., a Member FDIC bank.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$How many businesses use Novo?$q$, $q$Novo states it's trusted by 250,000+ independent businesses.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Free banking for solo business owners$q$, $q$Independent business owners use Novo's free checking account to avoid monthly banking fees.$q$, $q$Solo founders and independent business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Setting aside funds automatically$q$, $q$Business owners use Novo Reserves to automatically set aside money for taxes or specific expenses.$q$, $q$Small business owners$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Novo Business Checking$q$, $q$Free$q$, NULL, $q$["No monthly fees","Invoicing and payment acceptance","Vendor and employee payments","Debit and credit cards","Novo Reserves","Expense tracking"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$overview$q$, $q$What is Novo?$q$, 2, ARRAY[$q$Novo is a business banking platform offering a free checking account, invoicing, expense tracking, and business loans for small business owners.$q$, $q$Banking services are provided through partner bank Middlesex Federal Savings, F.A., while Novo layers on invoicing, payments, expense categorization, and AI-assisted onboarding.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$who-its-for$q$, $q$Who Novo is for$q$, 2, ARRAY[$q$Novo is built for independent business owners and small businesses looking for free checking with invoicing and expense tracking built in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Relay Financial ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Relay is business banking software offering up to 20 checking accounts, high-yield savings, and expense management tools.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Starter plan); Grow $30/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Relay offers free business banking with up to 20 checking accounts, high-yield savings, and paid Grow/Scale plans for teams.$q$,
  og_description = $q$Relay offers free business banking with up to 20 checking accounts, high-yield savings, and paid Grow/Scale plans for teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a668def-7d55-49ba-9faf-7c5b9537b7a6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a668def-7d55-49ba-9faf-7c5b9537b7a6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Multiple Checking Accounts$q$, $q$Up to 20 (50 on Scale) checking accounts with auto-transfer rules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$High-Yield Savings$q$, $q$Automated savings rules with APY up to 3.00%.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Visa Cards$q$, $q$Debit and credit cards with spend limits and real-time tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Expense Management$q$, $q$Receipt capture and accounting software sync.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Accounts Payable$q$, $q$Bill uploads, delegation, and automated approvals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Accounts Receivable/Invoicing$q$, $q$Flexible payment options for invoices.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Free Starter plan with no monthly fee and up to 20 checking accounts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Accounting integrations with Xero, QuickBooks Online, and Gusto$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$14-day free trial on paid Grow and Scale plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Serves 110,000+ businesses with $1B+ in managed deposits$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Up to 50 checking accounts on the Scale plan$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Higher savings APY (up to 3.00%) requires the paid Scale plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Recurring invoices and bookkeeping automations aren't available on the free Starter plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Scale plan price shown is a limited-time discounted rate$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Is Relay free?$q$, $q$Yes, Relay's Starter plan is free and includes up to 20 checking accounts and 1.11% APY on savings.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$What does the Grow plan add?$q$, $q$Grow ($30/month) adds a higher 1.75% APY, multi-step approval rules, recurring invoices, and bookkeeping automations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Does Relay offer a free trial?$q$, $q$Yes, Grow and Scale plans include a 14-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$What accounting tools does Relay integrate with?$q$, $q$Relay integrates with Xero, QuickBooks Online, and Gusto.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$How many businesses use Relay?$q$, $q$Relay states it serves 110,000+ businesses with over $1 billion in managed deposits.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Organizing money across accounts$q$, $q$Business owners use Relay's up to 20 checking accounts to separate funds for taxes, payroll, and operations.$q$, $q$Small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Team spend controls$q$, $q$Teams use Relay's Visa cards with spend limits and real-time tracking to manage employee spending.$q$, $q$Small and medium-sized teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Starter$q$, $q$Free$q$, $q$monthly$q$, $q$["1.11% APY on savings","1% cash back on credit cards","Up to 20 checking accounts","Built-in spend controls","Receipt upload reminders"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Grow$q$, $q$$30/month$q$, $q$monthly$q$, $q$["Everything in Starter","1.75% APY on savings","1.25% cash back on credit cards","Multi-step approval rules","Recurring invoices","Bookkeeping automations","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Scale$q$, $q$$90/month (discounted from $120/month)$q$, $q$monthly$q$, $q$["Everything in Grow","3.00% APY on savings","1.5% cash back on credit cards","Up to 50 checking accounts","10 free same-day ACH transfers monthly","Bill payment automation","Cash flow insights","14-day free trial"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$overview$q$, $q$What is Relay Financial?$q$, 2, ARRAY[$q$Relay is business banking software that gives businesses up to 20 (or 50 on the Scale plan) checking accounts, high-yield savings, Visa cards, and expense and invoicing tools.$q$, $q$It offers a free Starter plan alongside paid Grow and Scale tiers that add higher savings yields, approval workflows, and bookkeeping automations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$who-its-for$q$, $q$Who Relay is for$q$, 2, ARRAY[$q$Relay serves solopreneurs, startups, and small-to-medium teams that want to organize money across multiple accounts and add spend controls as they grow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Moss ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Moss is a European spend management platform combining corporate cards, invoices, and reimbursements with AI-powered accounting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (up to 3 users)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Dutch$q$]::text[],
  seo_meta_description = $q$Moss offers a free plan for corporate cards, invoices, and reimbursements, with AI-powered pre-accounting used by 7,000+ companies.$q$,
  og_description = $q$Moss offers a free plan for corporate cards, invoices, and reimbursements, with AI-powered pre-accounting used by 7,000+ companies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '11cc6093-d880-4046-9b74-e055ae089a8e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '11cc6093-d880-4046-9b74-e055ae089a8e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Corporate Cards$q$, $q$Card issuance with built-in spend controls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Invoice Processing$q$, $q$AI-powered invoice coding and automation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Expense Reimbursements$q$, $q$Employee reimbursement workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Budget Management$q$, $q$Purchase order and budget tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Multi-Currency Payments$q$, $q$Support for 70+ currencies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$ERP Integrations$q$, $q$40+ integrations including Xero, NetSuite, Dynamics, and DATEV.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$AI Pre-Accounting Agent$q$, $q$Automates expense coding and invoice processing.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Free plan for small teams (up to 3 users, 20 invoices/month)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$AI-powered pre-accounting agent for expense coding$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$40+ integrations including Xero, NetSuite, DATEV, Personio, and Workday$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Regulated by BaFin as an e-money institution$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Used by 7,000+ companies$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Paid plans use custom, quote-based pricing rather than public rates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Free plan is capped at 3 users and 20 invoices per month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Primarily focused on the European, German-speaking market$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Is Moss free?$q$, $q$Yes, Moss offers a free plan for up to 3 users with unlimited cards and up to 20 invoices per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$What does Moss's AI do?$q$, $q$Moss uses an AI-powered pre-accounting agent to automate invoice coding and expense processing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Who regulates Moss?$q$, $q$Moss is operated by Nufin GmbH and regulated by BaFin, Germany's financial supervisory authority, as an e-money institution.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$What integrations does Moss support?$q$, $q$Moss offers 40+ integrations, including Xero, NetSuite, Dynamics, DATEV, Deel, Personio, and Workday.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$How many currencies does Moss support?$q$, $q$Moss supports payments in 70+ currencies.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Getting started with free spend controls$q$, $q$Small teams use Moss's free plan to issue cards and process a limited number of invoices.$q$, $q$Small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Automating invoice coding$q$, $q$Finance teams use Moss's AI pre-accounting agent to code and process invoices automatically.$q$, $q$Finance teams at SMEs$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 3 users with unlimited cards","Up to 20 invoices per month","Customizable approval & verification steps","Moss wallet (debit only)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$Paid Plans$q$, $q$Custom (based on modules and transaction volume)$q$, NULL, $q$["Unlimited users & cards","Advanced approval flows & budget controls","Accounting integrations","HR software integrations","1:1 onboarding support","AI-powered accounting add-on"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$overview$q$, $q$What is Moss?$q$, 2, ARRAY[$q$Moss is a European spend management platform that combines corporate cards, invoice processing, and expense reimbursements, with an AI-powered pre-accounting agent to automate expense coding.$q$, $q$It offers a free plan for small teams and custom-priced paid plans billed by module and transaction volume.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$who-its-for$q$, $q$Who Moss is for$q$, 2, ARRAY[$q$Moss serves SMEs and mid-market companies across Europe, with particular emphasis on German-speaking markets, that need spend controls, invoice automation, and ERP integrations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Spendesk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Spendesk is a spend management platform unifying corporate cards, expenses, accounts payable, and procurement with AI automation.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Spendesk unifies corporate cards, expenses, AP, and procurement with AI automation, used by 3,000+ finance leaders across Europe.$q$,
  og_description = $q$Spendesk unifies corporate cards, expenses, AP, and procurement with AI automation, used by 3,000+ finance leaders across Europe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Foundations Platform$q$, $q$Unlimited physical and virtual cards and users.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Receipt OCR Automation$q$, $q$Automated receipt collection and reading.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Expense Tracking & Reimbursement$q$, $q$Employee expense workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Budget Monitoring$q$, $q$Real-time budget tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Multi-Entity Workflows$q$, $q$Manage spend across multiple entities.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$SSO/SAML & API Access$q$, $q$Enterprise access controls and API integration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Spendesk AI Connect$q$, $q$AI assistant integration for reading documents and flagging anomalies.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Unlimited cards and users included on the base Foundations plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$AI reads documents and suggests bookkeeping entries, flags duplicates and anomalies$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Free CFO Connect Pro membership (normally €625) included for customers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Processes over £10 billion in spend for 3,000+ finance leaders$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Integrates with Sage, Xero, NetSuite, SAP, and Datev$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$No public pricing figures — requires a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$No free trial or free plan advertised$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Add-on modules (procurement, accounts payable, advanced workflows) are priced separately$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$How much does Spendesk cost?$q$, $q$Spendesk doesn't publish fixed prices; it uses a fixed platform fee plus variable fees based on transaction volume, available only via a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Does Spendesk use AI?$q$, $q$Yes, Spendesk uses AI to read documents, suggest bookkeeping entries, detect duplicates, and flag anomalies, plus a Spendesk AI Connect integration.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$What's included in the Foundations plan?$q$, $q$Foundations includes unlimited physical and virtual cards, unlimited users, receipt OCR automation, expense tracking, budget monitoring, and API access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$What accounting tools does Spendesk integrate with?$q$, $q$Spendesk integrates with Sage, Xero, NetSuite, SAP, and Datev.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Where is Spendesk based?$q$, $q$The site describes Spendesk as "built, regulated, and profitable in Europe," without listing a specific headquarters city.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Consolidating spend management$q$, $q$Finance teams use Spendesk's Foundations plan to unify cards, expenses, and AP in one system.$q$, $q$CFOs and finance leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Managing multi-entity spend$q$, $q$Finance teams at multi-entity companies use Spendesk's multi-entity workflows and budget controls.$q$, $q$Finance teams at multi-entity companies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$overview$q$, $q$What is Spendesk?$q$, 2, ARRAY[$q$Spendesk is a spend management platform that unifies corporate cards, expense management, accounts payable, and procurement, with AI used to read documents, suggest bookkeeping entries, and flag anomalies.$q$, $q$Pricing combines a fixed platform fee with variable fees based on transaction volume, available only through a custom quote.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$who-its-for$q$, $q$Who Spendesk is for$q$, 2, ARRAY[$q$Spendesk serves CFOs, finance managers, accounts payable teams, and procurement leaders, particularly at companies in the 50-250 employee range, who need to consolidate spend management into one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pleo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pleo issues virtual and physical company cards with expense tracking, approval workflows, and accounting sync for European businesses.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$€4/month (Starter plan, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Copenhagen, Denmark$q$,
  languages = '{}',
  seo_meta_description = $q$Pleo offers business expense cards, spend management, and accounting integrations for startups, SMBs, and enterprises across Europe.$q$,
  og_description = $q$Pleo offers business expense cards, spend management, and accounting integrations for startups, SMBs, and enterprises across Europe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f4a927a2-feba-4930-ad55-823b90a5c145';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f4a927a2-feba-4930-ad55-823b90a5c145' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Virtual & physical cards$q$, $q$Issue company cards to employees with spending limits set before transactions occur.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Expense tracking$q$, $q$Automatically captures and categorizes employee expenses in real time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Subscription card management$q$, $q$Dedicated tools for tracking and controlling recurring vendor subscriptions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Accounting integrations$q$, $q$Syncs transactions with accounting systems including NetSuite, Sage, and Microsoft Dynamics 365 across multiple currencies and entities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Approval workflows$q$, $q$Lets finance teams set spending rules and approvals that apply before a purchase happens.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Multi-entity management$q$, $q$The Business plan supports centralized oversight of spending across multiple legal entities.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Every plan includes a free trial$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Deep accounting integrations, including NetSuite, Sage, Dynamics 365, Twinfield, and Exact Online$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Spending controls are enforced before a transaction happens, not just after$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Used by large, recognizable companies such as HelloFresh and Trade Republic$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Additional users cost extra on every plan (from €5 to €15 per user/month depending on tier)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Higher-tier features like budgets, advanced approvals, and multi-entity support require the Advanced or Business plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Business plan starts at €249/month and requires annual billing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Does Pleo offer a free trial?$q$, $q$Yes, Pleo's pricing page states that all plans include a free trial option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$What accounting software does Pleo integrate with?$q$, $q$Pleo integrates with systems including Oracle NetSuite, Microsoft Dynamics 365, Sage, Twinfield, Exact Online, and Zapier.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Where is Pleo based?$q$, $q$Pleo is headquartered in Copenhagen, Denmark.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Can Pleo manage spending across multiple entities?$q$, $q$The Business plan adds multi-entity management for organizations operating across several legal entities and currencies.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Startup expense control$q$, $q$Small teams issue a limited number of cards with preset credit limits on the Starter plan.$q$, $q$Startups and small companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Mid-market spend management$q$, $q$Growing companies use the Essential or Advanced plans for expense reports, mileage tracking, and flexible card limits.$q$, $q$Mid-sized businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Multi-entity finance oversight$q$, $q$Enterprises with several legal entities use the Business plan for centralized, multi-currency spend management.$q$, $q$Enterprise finance teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Starter$q$, $q$€4/month$q$, $q$annual$q$, $q$["1 user included (max 3 total)","Physical & virtual cards","Expense tracking","Chat support","Credit limit up to €5,000"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Essential$q$, $q$€18-20/month$q$, $q$monthly$q$, $q$["Expense reports","Mileage allowance","AI-driven policies","Flexible card limits up to 25","Credit limit up to €20,000"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Advanced$q$, $q$€99-109/month$q$, $q$monthly$q$, $q$["Budgets","Advanced approvals","HRIS integrations","Vendor cards up to 100","Cashback option","Credit limit up to €250,000"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$Business$q$, $q$From €249/month$q$, $q$annual$q$, $q$["Multi-entity management","Premium integrations","AI expense assessment","Cash management","Credit limit up to €500,000"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$overview$q$, $q$What is Pleo?$q$, 2, ARRAY[$q$Pleo is a business expense management platform that combines company payment cards with expense tracking and accounting integration. It is used by more than 40,000 companies across Europe, including HelloFresh, Soho House, and Trade Republic.$q$, $q$The platform lets finance teams set spending limits and approval rules that apply before a purchase happens, rather than reconciling expenses after the fact.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$who-its-for$q$, $q$Who Pleo is for$q$, 2, ARRAY[$q$Pleo serves startups needing basic card and expense control, mid-sized businesses that want centralized expense data, and enterprises that need multi-entity, multi-currency oversight.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Jeeves ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Jeeves offers corporate cards, cross-border payments, and expense management for businesses operating across 30+ countries.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Jeeves provides corporate cards, global payments, and expense management for businesses operating across Latin America, North America, and Europe.$q$,
  og_description = $q$Jeeves provides corporate cards, global payments, and expense management for businesses operating across Latin America, North America, and Europe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '639b380d-84c6-419b-a52a-8ad57b880d9c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '639b380d-84c6-419b-a52a-8ad57b880d9c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Corporate cards$q$, $q$Physical and virtual cards with real-time tracking and spending controls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Global payments$q$, $q$Transfers to 150+ countries in up to 40 currencies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Cross-border payments$q$, $q$Aims to reduce cross-border payment costs compared to traditional transfer methods.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Expense management$q$, $q$Automated tracking, approval workflows, and policy enforcement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Stablecoin transfers$q$, $q$Near-instant cross-border settlement option using stablecoins.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$AI insights$q$, $q$Predictive analysis and smart alerts on spending.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Corporate credit$q$, $q$Non-dilutive credit facilities for businesses.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Supports transfers in up to 40 currencies to 150+ countries$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Combines corporate cards, payments, and credit facilities in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Used by recognizable brands such as Porsche, H&M, and Burger King$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Offers stablecoin-based transfers for faster cross-border settlement$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Pricing isn't published; businesses must contact Jeeves for transaction, cross-border, and financing fee details$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$No public founding year or headquarters location disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$No mobile app or supported UI language list published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$What countries does Jeeves support?$q$, $q$Jeeves states it operates across 30+ countries, including markets in Latin America, North America, the UK, and Europe.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Does Jeeves support stablecoin payments?$q$, $q$Yes, Jeeves offers stablecoin transfers as a near-instant option for cross-border payments.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$How is Jeeves priced?$q$, $q$Jeeves does not publish fixed pricing; it charges transactional, cross-border, and/or financing fees that vary by business.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Does Jeeves integrate with accounting systems?$q$, $q$Yes, Jeeves integrates with ERP and accounting platforms to support month-end closing processes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$International expense management$q$, $q$Businesses with multi-country operations use Jeeves cards and controls to track spend in real time.$q$, $q$Finance teams at multinational companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Cross-border vendor payments$q$, $q$Companies paying international vendors or contractors use Jeeves' multi-currency transfers.$q$, $q$Businesses with global suppliers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Access to non-dilutive credit$q$, $q$Growth-stage companies use Jeeves corporate credit facilities for working capital.$q$, $q$Scale-ups needing working capital$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$overview$q$, $q$What is Jeeves?$q$, 2, ARRAY[$q$Jeeves is a financial operating system that combines corporate cards, cross-border payments, expense management, and credit into a single platform for businesses operating in 30+ countries across Latin America, North America, the UK, and Europe.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$who-its-for$q$, $q$Who Jeeves is for$q$, 2, ARRAY[$q$Jeeves targets companies with international operations that need corporate cards, multi-currency payments, and access to non-dilutive credit, including large brands like Porsche, H&M, and Burger King.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mesh Payments ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mesh Payments automates corporate card issuance, expense processing, and AP workflows for enterprise finance teams across 40+ countries.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Mesh Payments offers corporate cards, AI-powered expense automation, travel controls, and AP automation for enterprises in 40+ countries.$q$,
  og_description = $q$Mesh Payments offers corporate cards, AI-powered expense automation, travel controls, and AP automation for enterprises in 40+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '13a40e93-2361-4019-8f00-7522e0ed8bb9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '13a40e93-2361-4019-8f00-7522e0ed8bb9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Corporate cards$q$, $q$Virtual and physical cards with policy controls across 40+ countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$AI expense processing$q$, $q$AI-powered receipt processing with automatic GL coding and real-time reconciliation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Orchestration layer$q$, $q$Connects transactions with full context, applying policy checks and budget updates automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Mia Assistant$q$, $q$AI-powered employee assistant that handles requests via WhatsApp, Slack, and email.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Travel controls$q$, $q$Policy compliance and cost benchmarking for bookings across multiple channels.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Global operations$q$, $q$Multi-currency support in 140+ countries.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Combines cards, expense automation, travel, and AP in one orchestration layer$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$AI assistant (Mia) is reachable via WhatsApp, Slack, and email$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$SOC 2, PCI DSS, and GDPR compliant with 24/7 human support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Card issuing partnerships span the US, Canada, Europe/UK, and Australia/Singapore$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$No published pricing; businesses must request a demo for quotes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$No founding year disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$No dedicated consumer mobile app mentioned on the website$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Does Mesh Payments offer an AI assistant?$q$, $q$Yes, its "Mia" assistant handles employee requests via WhatsApp, Slack, and email.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$What compliance certifications does Mesh Payments have?$q$, $q$The company states it is SOC 2, PCI DSS, and GDPR compliant.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Who issues Mesh Payments cards?$q$, $q$Cards are issued through partner banks including SoFi Bank (US), Peoples Trust Company (Canada), Adyen (Europe/UK), and NIUM (Australia/Singapore).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Does Mesh Payments integrate with ERP systems?$q$, $q$Yes, it offers live, continuous sync with ERP and HRIS platforms rather than batch exports.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Enterprise T&E automation$q$, $q$Large finance teams with 3,000+ employees reduce manual expense processing and policy violations.$q$, $q$Enterprise finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Corporate travel policy enforcement$q$, $q$Companies use built-in travel controls for policy compliance and cost benchmarking.$q$, $q$Corporate travel managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$AI-assisted employee requests$q$, $q$Employees use the Mia assistant via Slack or WhatsApp for expense-related questions.$q$, $q$Distributed workforces$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$overview$q$, $q$What is Mesh Payments?$q$, 2, ARRAY[$q$Mesh Payments is a travel and expense management platform for enterprises, automating corporate card issuance, expense processing, travel management, and accounts payable through a connected orchestration layer.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$who-its-for$q$, $q$Who Mesh Payments is for$q$, 2, ARRAY[$q$The platform is built for enterprise finance teams, including large organizations with 3,000+ employees, that want to reduce manual expense processing and enforce spending policy in real time.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Float Financial ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Float provides Canadian corporate cards, CDIC-insured business accounts, bill pay, and AI-powered expense automation.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Essentials plan); Professional plan from $10/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Toronto, Ontario, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$Float offers corporate cards, business accounts, bill pay, and AI expense automation built for Canadian businesses, from startups to mid-market.$q$,
  og_description = $q$Float offers corporate cards, business accounts, bill pay, and AI expense automation built for Canadian businesses, from startups to mid-market.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b97775a6-c87a-47b1-802f-7aa8a3280f6a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b97775a6-c87a-47b1-802f-7aa8a3280f6a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Corporate cards$q$, $q$Unlimited CAD and USD cards with built-in spending controls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Business accounts$q$, $q$CDIC-insured accounts offering interest with no monthly fees.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Float Intelligence$q$, $q$AI-powered transaction coding for faster month-end close.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Bill pay$q$, $q$Automated accounts payable with free EFT/ACH and wire transfers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Reimbursements$q$, $q$Streamlined employee expense approval and payment processing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Foreign exchange$q$, $q$CAD/USD conversion at rates as low as 0.25% on the Essentials plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Accounting integrations$q$, $q$Direct connections to QuickBooks, Xero, and (on paid plans) NetSuite.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Free Essentials plan with no monthly fee and up to 1% cashback$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$CDIC-insured business accounts that earn interest$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$AI-powered transaction coding (Float Intelligence) on Professional and above$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Low FX markup starting at 0.25%$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Advanced accounting integration with NetSuite requires the Professional plan or higher$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Enterprise plan pricing is custom and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Physical cards are capped at 20 on the Essentials plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Does Float have a free plan?$q$, $q$Yes, the Essentials plan is $0 per user per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$What accounting software does Float integrate with?$q$, $q$Float integrates with QuickBooks, Xero, and, on paid plans, NetSuite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Where is Float based?$q$, $q$Float is headquartered in Toronto, Ontario, Canada.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Does Float serve businesses outside Canada?$q$, $q$Based on the website content, Float is designed specifically for Canadian companies.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Startup expense management$q$, $q$Solopreneurs and startups use the free Essentials plan for cards and business accounts.$q$, $q$Canadian startups and solopreneurs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Automated month-end close$q$, $q$Growing teams use Float Intelligence to speed up transaction coding.$q$, $q$Mid-market finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Vendor bill pay$q$, $q$Companies automate accounts payable with free EFT/ACH transfers.$q$, $q$Canadian SMBs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Essentials$q$, $q$$0/user/month$q$, $q$monthly$q$, $q$["Up to 20 physical and unlimited virtual cards","Credit limits up to $3M","Up to 1% cashback","CDIC-insured accounts earning up to 3.5% interest","0.25% FX rates","QuickBooks/Xero sync"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Professional$q$, $q$$10/user/month$q$, $q$monthly$q$, $q$["Unlimited physical and virtual cards","Multi-level requests and approvals","NetSuite integration","Float Intelligence transaction coding agent","International USD reimbursements","Post-transaction reviews"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom implementation and data migration","Dedicated Customer Success Manager","Premium support","Custom rewards structures"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$overview$q$, $q$What is Float Financial?$q$, 2, ARRAY[$q$Float is a financial management platform built for Canadian companies, combining corporate cards, interest-bearing business accounts, bill pay, and reimbursements with accounting sync to QuickBooks, Xero, and NetSuite.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$who-its-for$q$, $q$Who Float is for$q$, 2, ARRAY[$q$Float serves Canadian businesses from solopreneurs and startups to mid-market companies, including non-profits, agencies, e-commerce, and hospitality organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Rho ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rho combines business banking, corporate cards, treasury, and automated accounting close with no subscription or per-user fees.$q$,
  pricing_model = $q$Free$q$,
  starting_price = $q$$0 (no subscription or per-user fees; optional 1% foreign currency fee)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Rho offers business banking, cash-back corporate cards, treasury management, and automated close tools with $0 subscription fees.$q$,
  og_description = $q$Rho offers business banking, cash-back corporate cards, treasury management, and automated close tools with $0 subscription fees.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '04370e5b-5bb7-44db-b5e6-2db98849560d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '04370e5b-5bb7-44db-b5e6-2db98849560d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Business banking$q$, $q$Checking and savings accounts with $0 ACH fees and up to $75M FDIC insurance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Corporate cards$q$, $q$Cards earning up to 1.5% cash back on spending.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Expense management$q$, $q$Automated receipt capture and reimbursement handling.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Bill pay$q$, $q$Vendor payments with zero fees.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Treasury$q$, $q$Earn yield on idle cash reserves, managed as a registered investment advisor service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Invoicing$q$, $q$Send invoices and receive payments directly through Rho.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Rho Close$q$, $q$Automated accounting and reconciliation tools.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$No subscription costs or per-seat fees for the core platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Up to $75M in FDIC insurance across banking partners$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Up to 1.5% cash back on card spend$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Combines banking, cards, treasury, and close automation in one product$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Treasury management carries a separate management fee (0.15%-0.6% annually depending on deposit size)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Foreign currency transfers carry a 1% fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$No published founding year or detailed public company information beyond a New York address$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Does Rho charge subscription fees?$q$, $q$No, Rho states there are no per-seat fees or subscription costs for its core banking, card, and expense tools.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$How much FDIC insurance does Rho offer?$q$, $q$Rho states accounts can receive up to $75M in FDIC insurance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Does Rho offer treasury management?$q$, $q$Yes, Rho Treasury is a registered investment advisor service with a management fee ranging from 0.15% to 0.6% annually depending on deposit size.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$What cash back does Rho offer on cards?$q$, $q$Rho states its corporate cards earn up to 1.5% cash back on spend.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Startup banking$q$, $q$Startups use Rho for fee-free checking and savings accounts.$q$, $q$Startups and scale-ups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Idle cash management$q$, $q$Companies with cash reserves use Rho Treasury to earn yield.$q$, $q$Finance and treasury teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Automated close$q$, $q$Accounting teams use Rho Close to automate reconciliation.$q$, $q$Accountants and controllers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$overview$q$, $q$What is Rho?$q$, 2, ARRAY[$q$Rho is a business banking platform that consolidates checking and savings accounts, corporate cards, treasury management, and automated accounting close into one system, with no subscription or per-user fees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$who-its-for$q$, $q$Who Rho is for$q$, 2, ARRAY[$q$Rho serves startups, scale-ups, and enterprises that want fee-free banking and cards alongside treasury and automated close tools, including fractional CFOs managing multiple accounts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Tipalti ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tipalti automates global accounts payable, mass payouts, procurement, and expenses for mid-market and enterprise finance teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = $q$Foster City, California, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Tipalti is an AI-powered finance automation platform for AP, global mass payments, procurement, expenses, and treasury operations.$q$,
  og_description = $q$Tipalti is an AI-powered finance automation platform for AP, global mass payments, procurement, expenses, and treasury operations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3cb98c1a-15c7-489f-9a78-52137ee7cc38';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3cb98c1a-15c7-489f-9a78-52137ee7cc38' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$AP automation$q$, $q$End-to-end accounts payable with invoice and supplier management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Mass payments$q$, $q$Global payouts to 200+ countries in 120 currencies via 50+ payment methods.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Procurement$q$, $q$PO matching and workflow automation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Expense management$q$, $q$Automated expense tracking and submission.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Treasury management$q$, $q$Cash flow monitoring and account management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Tipalti AI$q$, $q$Machine learning capabilities for process optimization and insights.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Multi-entity support$q$, $q$Centralized management across organizational entities.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Controls & compliance$q$, $q$Multi-jurisdictional tax compliance and payment fraud detection.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Supports payouts to 200+ countries in 120 currencies via 50+ payment methods$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Pre-built connectors for major ERPs including NetSuite, SAP, Dynamics, and Sage Intacct$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Founded in 2010 with an established enterprise track record$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Recognized in the 2025 Deloitte Fast 500 (8th consecutive year) and as a 2025 CNBC Top Fintech Company (3rd consecutive year)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Pricing is subscription-based but not published; requires a demo request for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Targeted at mid-market/enterprise, which may be more than very small businesses need$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$When was Tipalti founded?$q$, $q$Tipalti was founded in 2010.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Where is Tipalti headquartered?$q$, $q$Tipalti is headquartered in Foster City, California, USA.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$What ERPs does Tipalti integrate with?$q$, $q$Tipalti has pre-built connectors for Oracle NetSuite, SAP, Microsoft Dynamics, and Sage Intacct, among others.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$How many countries can Tipalti pay out to?$q$, $q$Tipalti supports mass payouts to 200+ countries in 120 currencies.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Global supplier payouts$q$, $q$Companies with international supplier networks use Tipalti's mass payments.$q$, $q$AP teams at global companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Multi-entity finance operations$q$, $q$Enterprises with multiple legal entities use Tipalti for centralized AP and procurement.$q$, $q$Enterprise finance and controllership teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Marketplace and creator payouts$q$, $q$Platforms paying large numbers of payees use Tipalti's mass payment methods.$q$, $q$Marketplaces and platforms with royalty or creator payouts$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$overview$q$, $q$What is Tipalti?$q$, 2, ARRAY[$q$Tipalti is an AI-powered finance automation platform, founded in 2010 and headquartered in Foster City, California, that handles global accounts payable, mass payments, procurement, expenses, and treasury operations for mid-market and enterprise organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$who-its-for$q$, $q$Who Tipalti is for$q$, 2, ARRAY[$q$Tipalti serves mid-market to enterprise organizations across industries such as adtech, e-commerce, healthcare, manufacturing, nonprofits, and software, particularly those paying suppliers or creators in many countries and currencies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AvidXchange ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AvidXchange automates accounts payable — invoice capture, coding, approvals, and payments — for mid-market industries like real estate and construction.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Charlotte, NC, USA$q$,
  languages = '{}',
  seo_meta_description = $q$AvidXchange automates AP invoice processing, approvals, and payments with AI, serving real estate, construction, healthcare, and more.$q$,
  og_description = $q$AvidXchange automates AP invoice processing, approvals, and payments with AI, serving real estate, construction, healthcare, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5893a7aa-99e0-4440-9c42-21e023145c91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5893a7aa-99e0-4440-9c42-21e023145c91' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$AI-powered invoice automation$q$, $q$Reduces AP processing time and improves accuracy.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Invoice capture and coding$q$, $q$Digitizes paper-based invoice workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Payment automation$q$, $q$Multiple payment options including virtual card, ACH, and checks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Approval workflows$q$, $q$Customizable, multi-step invoice approval processes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Real-time visibility$q$, $q$Reporting and status tracking across AP workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Supplier network$q$, $q$Built on 25+ years of transaction data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Lien waiver management$q$, $q$Lien waiver tracking and analytics for construction customers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Over 200 integrations, including NetSuite, QuickBooks, Sage, and a Workday integration$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Serves specialized verticals like construction (lien waivers) and real estate (Yardi, MRI)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Backed by 25+ years of supplier transaction data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Multiple payment methods for suppliers (virtual card, ACH, checks)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$No published pricing; requires a demo request for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$No founding year disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Primarily built for mid-market/enterprise AP teams rather than very small businesses$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Where is AvidXchange headquartered?$q$, $q$AvidXchange is headquartered in Charlotte, NC.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$What industries does AvidXchange serve?$q$, $q$It serves real estate, construction, healthcare, nonprofits, government, financial services, higher education, and hospitality.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$What accounting/ERP systems does AvidXchange integrate with?$q$, $q$It integrates with 200+ systems including Oracle NetSuite, QuickBooks, Sage, Acumatica, Yardi, MRI, and Workday.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Does AvidXchange handle lien waivers?$q$, $q$Yes, it offers lien waiver management and analytics, aimed at construction customers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Construction AP and lien waivers$q$, $q$Construction finance teams manage supplier payments and lien waiver documentation.$q$, $q$Construction finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Real estate AP automation$q$, $q$Property managers automate invoice processing with integrations like Yardi and MRI.$q$, $q$Real estate and property management firms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$Nonprofit and government AP$q$, $q$Organizations use AvidXchange for approval workflows and reporting.$q$, $q$Nonprofit and government finance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$overview$q$, $q$What is AvidXchange?$q$, 2, ARRAY[$q$AvidXchange is an accounts payable automation platform, headquartered in Charlotte, NC, that digitizes invoice capture, coding, approvals, and supplier payments using AI, backed by 200+ accounting and ERP integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$who-its-for$q$, $q$Who AvidXchange is for$q$, 2, ARRAY[$q$AvidXchange serves finance teams across real estate, construction, healthcare, nonprofit, government, and hospitality organizations, as well as ERP and accounting system providers embedding its AP tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Melio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Melio lets businesses pay vendor bills by card, ACH, or international transfer, and collect customer payments in one platform.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = $q$600+ employees$q$,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Melio is a bill pay and invoicing platform for paying vendors and collecting customer payments, with AI tools and QuickBooks/Xero sync.$q$,
  og_description = $q$Melio is a bill pay and invoicing platform for paying vendors and collecting customer payments, with AI tools and QuickBooks/Xero sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '849e570b-901b-439e-b55b-ab7c7b657c2c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '849e570b-901b-439e-b55b-ab7c7b657c2c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Accounts payable$q$, $q$Pay vendors via credit card, ACH bank transfer, or international payment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Accounts receivable$q$, $q$Create invoices and custom payment links for receiving payments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Agent Mel$q$, $q$AI tool that provides instant answers about bills and payments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Automated bill capture$q$, $q$Capture bills via camera, email, or manual entry.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Batch payments & approvals$q$, $q$Workflow automation with team permission management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Tax management$q$, $q$W-9 collection and 1099 data sync.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Pay-over-time$q$, $q$Installment payments spread over up to 12 months.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Mobile app$q$, $q$Manage bill payments on the go.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Free 30-day trial$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Processes $100B+ annually across 100,000+ businesses, per company figures$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$AI assistant (Agent Mel) answers questions about bills and payments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Integrates with QuickBooks Online/Desktop, Xero, and NetSuite$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Specific transaction rates are not disclosed on the homepage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$High-volume "Platinum" tier requires custom/contact pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$No public founding year or single headquarters address disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Does Melio offer a free trial?$q$, $q$Yes, Melio offers a free 30-day trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$What accounting software does Melio integrate with?$q$, $q$Melio integrates with QuickBooks Online, QuickBooks Desktop, Xero, and NetSuite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Does Melio have an AI assistant?$q$, $q$Yes, "Agent Mel" provides instant answers about bills and payments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$How many businesses use Melio?$q$, $q$Melio states it serves 100,000+ businesses and processes $100B+ in payments annually.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Vendor bill payment$q$, $q$Small businesses pay vendors via card, ACH, or international transfer.$q$, $q$Small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Accounting firm bill pay$q$, $q$Firms manage bill payment workflows for multiple clients.$q$, $q$Accounting firms and wealth management advisors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Customer invoicing$q$, $q$Businesses create custom payment links to collect payments from customers.$q$, $q$Service businesses invoicing customers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$overview$q$, $q$What is Melio?$q$, 2, ARRAY[$q$Melio is a bill payment and invoicing platform that lets businesses pay vendors by credit card, ACH, or international transfer, and collect customer payments through custom payment links, with a team of over 600 people across New York, Denver, and Tel Aviv.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$who-its-for$q$, $q$Who Melio is for$q$, 2, ARRAY[$q$Melio serves small businesses through enterprise organizations, as well as accounting firms and wealth management advisors managing bill payments across industries like construction, retail, and healthcare.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Payoneer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Payoneer is a global payment platform for freelancers, businesses, and marketplaces to send and receive cross-border payments in 70 currencies.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = 2005,
  company_size = NULL,
  headquarters = $q$New York City, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Payoneer offers multi-currency accounts, mass payouts, and commercial cards for freelancers, businesses, and marketplaces in 190+ countries.$q$,
  og_description = $q$Payoneer offers multi-currency accounts, mass payouts, and commercial cards for freelancers, businesses, and marketplaces in 190+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f63dc78f-9d0d-4816-9ca0-858dd2947329';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f63dc78f-9d0d-4816-9ca0-858dd2947329' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Multi-currency accounts$q$, $q$Supports 70 currencies across 190+ countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Payment collection$q$, $q$Collect payments from clients and marketplaces globally.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Workforce management$q$, $q$Hire and pay teams across 160+ countries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Commercial cards$q$, $q$Mastercard-based cards for business expenses.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Mass payout platform$q$, $q$Distribute payouts to marketplace sellers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Working capital advance$q$, $q$Business funding option for eligible customers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Tax form collection$q$, $q$Collects 1099, W-9, and 1042 forms.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Stablecoin payments$q$, $q$Beta feature enabled via a partnership with Bridge.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Supports 70 currencies across 190+ countries$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Combines payment collection, mass payouts, cards, and working capital in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Integrates directly with major marketplaces like eBay, Fiverr, and Upwork$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Founded in 2005 with an established track record in cross-border payments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Specific fee and pricing details are not disclosed on the main site and require checking a separate pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Stablecoin payments are still in beta$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$No public company size or supported UI language list disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$When was Payoneer founded?$q$, $q$Payoneer was founded in 2005.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Where is Payoneer headquartered?$q$, $q$Payoneer is headquartered in New York City.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$What marketplaces integrate with Payoneer?$q$, $q$Payoneer integrates with marketplaces including eBay, Fiverr, and Upwork.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Does Payoneer support stablecoin payments?$q$, $q$Yes, as a beta feature through a partnership with Bridge.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Freelancer payments$q$, $q$Independent contractors receive payments from international clients and marketplaces.$q$, $q$Freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Marketplace payouts$q$, $q$Platforms distribute payouts to sellers or service providers worldwide.$q$, $q$Marketplaces$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Global workforce payments$q$, $q$Businesses hire and pay remote teams across 160+ countries.$q$, $q$Businesses with distributed teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$overview$q$, $q$What is Payoneer?$q$, 2, ARRAY[$q$Payoneer, founded in 2005 and headquartered in New York City, is a global payment platform that lets individuals and businesses send, receive, and manage money across 190+ countries in 70 currencies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$who-its-for$q$, $q$Who Payoneer is for$q$, 2, ARRAY[$q$Payoneer serves freelancers receiving international client payments, businesses managing cross-border payments and remote teams, and marketplaces distributing payouts to sellers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GoCardless ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GoCardless automates recurring payment collection via SEPA, UK Direct Debit, and Autogiro, with pay-as-you-go pricing and 350+ integrations.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$1% + 20p per transaction (capped at £4 for domestic UK payments, Standard plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Paris, France$q$,
  languages = '{}',
  seo_meta_description = $q$GoCardless collects recurring and one-off payments via Direct Debit across Europe, with pay-as-you-go pricing from 1% + 20p per transaction.$q$,
  og_description = $q$GoCardless collects recurring and one-off payments via Direct Debit across Europe, with pay-as-you-go pricing from 1% + 20p per transaction.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '44e76fa8-8fba-447b-a227-c3bb42e2b74f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '44e76fa8-8fba-447b-a227-c3bb42e2b74f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$SEPA Direct Debit collection$q$, $q$Collect euro payments across 34 SEPA countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Recurring payment automation$q$, $q$Automates subscription and recurring billing collection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Invoice payment processing$q$, $q$Collects one-off invoice payments via Direct Debit.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$REST API$q$, $q$Build custom integrations directly against GoCardless.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$350+ integrations$q$, $q$Pre-built connections including Xero, QuickBooks, and Zuora.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Success+$q$, $q$Add-on that automatically recovers up to 70% of failed payments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Protect+$q$, $q$Add-on fraud protection and chargeback challenge assistance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Pay-as-you-go pricing with no setup or monthly fees on the Standard plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$350+ integrations with accounting and business platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Add-on failed-payment recovery (Success+) and fraud protection (Protect+)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Covers 34 SEPA countries plus UK Direct Debit and Swedish Autogiro$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$International payment fees are higher than domestic rates across all plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Branded bank statements (£50/month) and fully custom checkout (£150/month) cost extra$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Custom/volume pricing requires £1m+ annual revenue or a sales conversation$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$How much does GoCardless charge per transaction?$q$, $q$The Standard plan charges 1% + 20p per transaction, capped at £4 for domestic UK payments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Where is GoCardless headquartered?$q$, $q$GoCardless SAS is headquartered in Paris, France.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$What payment schemes does GoCardless support?$q$, $q$It supports SEPA Direct Debit, UK Direct Debit, and Swedish Autogiro, across 34 SEPA countries plus the UK.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Does GoCardless offer failed payment recovery?$q$, $q$Yes, its Success+ add-on automatically recovers up to 70% of failed payments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Subscription billing$q$, $q$SaaS and subscription businesses automate recurring payment collection.$q$, $q$Subscription-based businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Invoice collection$q$, $q$Service businesses collect one-off invoice payments via Direct Debit.$q$, $q$Service businesses invoicing clients$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Failed payment recovery$q$, $q$Businesses reduce churn from failed Direct Debit payments using Success+.$q$, $q$Finance and billing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Standard$q$, $q$1% + 20p per transaction$q$, NULL, $q$["Capped at £4 for domestic UK payments","No setup or monthly fees","Basic payment collection","International payments from 40+ countries","350+ integrations","24/7 support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Advanced$q$, $q$1.25% + 20p per transaction$q$, $q$monthly$q$, $q$["Capped at £5 for domestic payments","All Standard features","Success+ automatic failed payment recovery","Enhanced identity verification with Verified Mandates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Pro$q$, $q$1.4% + 20p per transaction$q$, $q$monthly$q$, $q$["Capped at £5.60 for domestic payments","All Advanced features","Protect+ fraud protection","Chargeback challenge assistance"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Custom$q$, $q$Custom$q$, NULL, $q$["Volume-based discounts","For businesses with £1m+ annual revenue","Dedicated customer support","Tailored pricing agreement"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$overview$q$, $q$What is GoCardless?$q$, 2, ARRAY[$q$GoCardless is a payment collection platform, headquartered in Paris, France, that specializes in automated recurring and one-off payments via SEPA Direct Debit, UK Direct Debit, and Swedish Autogiro, with a REST API and 350+ integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$who-its-for$q$, $q$Who GoCardless is for$q$, 2, ARRAY[$q$GoCardless serves businesses of all sizes collecting subscription or recurring payments across European markets, from small businesses on pay-as-you-go pricing to large enterprises on custom volume-based plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mollie ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mollie is a European payment processor offering online and in-person payment acceptance, subscriptions, invoicing, and business accounts.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$1.80% + €0.25 per transaction (EEA consumer cards)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mollie: pay-per-transaction payment processing for online and in-person payments, serving 250,000+ businesses across Europe.$q$,
  og_description = $q$Mollie: pay-per-transaction payment processing for online and in-person payments, serving 250,000+ businesses across Europe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd50744af-e272-48a8-a0dc-044078b5dab2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd50744af-e272-48a8-a0dc-044078b5dab2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Online payments$q$, $q$Accepts cards, PayPal, SEPA, iDEAL, Klarna, Apple Pay and Google Pay with no monthly minimums or contracts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$In-person payments$q$, $q$Point-of-sale card terminals with pay-as-you-go or contracted Pro pricing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Recurring payments$q$, $q$Built-in subscription and recurring billing support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Payment links$q$, $q$Generate shareable payment links without building a full checkout.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Dashboard & reconciliation$q$, $q$Centralized dashboard for payment management, insights, and accounting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Fraud and risk management$q$, $q$Built-in fraud acceptance and risk controls on transactions.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$No monthly minimums, contracts, or hidden fees on standard pricing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Wide range of European-focused payment methods (iDEAL, SEPA, Klarna, Wero)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Serves over 250,000 businesses from startups to enterprises$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Prebuilt e-commerce integrations and libraries for JS, PHP, .NET, and Python$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Per-transaction fees vary widely by payment method and region, making total cost harder to predict$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Non-EEA card transactions carry a higher rate (3.25% + €0.25)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$In-person Pro plan requires a 1-year contract$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Does Mollie charge a monthly fee?$q$, $q$Standard online payment pricing has no monthly fee — you only pay per successful transaction.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$What payment methods does Mollie support?$q$, $q$Cards, PayPal, SEPA Direct Debit and Bank Transfer, iDEAL, Klarna, Apple Pay, Google Pay, and more, with fees varying by method.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Does Mollie support in-person payments?$q$, $q$Yes, via a Pay as You Go plan (€0/month) or a Pro plan (€20/month with a 1-year contract) using card terminals.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Is there volume pricing for high-volume merchants?$q$, $q$Businesses processing €100,000+ per month can get tailored volume pricing, and startups may have fees waived up to €1,000,000 depending on funding.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Online checkout for e-commerce$q$, $q$Accept a wide range of European and global payment methods on a website or app.$q$, $q$E-commerce businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$In-store card payments$q$, $q$Use Mollie's terminals for point-of-sale payments alongside online sales.$q$, $q$Retail and hospitality businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Subscription billing$q$, $q$Charge customers on a recurring basis using Mollie's recurring payments API.$q$, $q$SaaS and subscription businesses$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$Online Payments (Standard)$q$, $q$1.80% + €0.25 (EEA consumer cards)$q$, NULL, $q$["Pay-per-transaction, no contract","Rates vary by payment method and region"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$In-Person Pay as You Go$q$, $q$€0/month$q$, $q$monthly$q$, $q$["1.20%-2.90% depending on card type","Max 1 hardware terminal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$In-Person Pro$q$, $q$€20/month$q$, $q$annual$q$, $q$["1-year contract","Lower per-transaction rates","Additional terminals at €20/month each"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$overview$q$, $q$What is Mollie?$q$, 2, ARRAY[$q$Mollie is a payment processing platform built for European businesses, covering online payments, in-person card terminals, subscriptions, invoicing, and reconciliation.$q$, $q$It uses pay-per-transaction pricing with no fixed monthly cost for its standard online payments plan, and supports region-specific methods like iDEAL, SEPA, and Klarna alongside cards and digital wallets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$who-its-for$q$, $q$Who Mollie is for$q$, 2, ARRAY[$q$Mollie suits startups, SaaS platforms, marketplaces, and enterprises operating primarily in Europe that need flexible payment methods without long-term contracts, plus optional in-person payment hardware.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Checkout.com ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Checkout.com is a global enterprise payment processor for online payment acceptance, money movement, fraud protection, and payment optimization.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Checkout.com processes global payments for enterprises with local acquiring in 50+ countries, fraud protection, and custom flat-rate or interchange++ pricing.$q$,
  og_description = $q$Checkout.com processes global payments for enterprises with local acquiring in 50+ countries, fraud protection, and custom flat-rate or interchange++ pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '23986f65-446a-4255-8e2d-e265951f2262';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '23986f65-446a-4255-8e2d-e265951f2262' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Connect$q$, $q$Online payment acceptance across major card schemes and local payment methods.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Move$q$, $q$Global money movement and payouts to entities and customers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Boost$q$, $q$AI-powered payment optimization through Intelligent Acceptance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Protect$q$, $q$Fraud detection, authentication, and dispute management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Manage$q$, $q$Dashboard and financial controls for reconciliation and reporting.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Local acquiring capabilities in over 50 countries$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Processed $300BN in ecommerce payments in 2025$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Supports 150+ processing currencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Free processing for registered charities$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$No public pricing — requires contacting sales for a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Enterprise-oriented, likely less suited to very small merchants$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$No free trial or free plan mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$How much does Checkout.com cost?$q$, $q$Pricing is tailored per business via flat-rate or interchange++ fee models — there is no published price list; you contact their sales team for a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Does Checkout.com support multiple currencies?$q$, $q$Yes, it facilitates transactions in more than 150 processing currencies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Is Checkout.com free for charities?$q$, $q$Yes, registered charities in supported countries can process payments at no cost.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Who uses Checkout.com?$q$, $q$Enterprise merchants in ecommerce, gaming, marketplaces, travel, fintech, and crypto, including Microsoft, Spotify, eBay, Uber, and Klarna.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Global online checkout$q$, $q$Accept major card schemes and local payment methods across 50+ countries with local acquiring.$q$, $q$Enterprise merchants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Payout and disbursement$q$, $q$Move funds globally to business entities and end customers.$q$, $q$Marketplaces and platforms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$Fraud and dispute management$q$, $q$Detect fraud, authenticate transactions, and manage chargebacks/disputes.$q$, $q$Risk and finance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$overview$q$, $q$What is Checkout.com?$q$, 2, ARRAY[$q$Checkout.com is a global payment services provider that lets businesses accept online payments and disburse funds through local acquiring in over 50 countries and 150+ currencies.$q$, $q$Its platform bundles payment acceptance, global money movement, AI-based acceptance optimization, fraud/dispute protection, and a management dashboard.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$who-its-for$q$, $q$Who Checkout.com is for$q$, 2, ARRAY[$q$Checkout.com targets enterprise merchants across ecommerce, gaming, marketplaces, travel, fintech, and crypto that need global acquiring and custom-negotiated pricing rather than a self-serve small business plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23986f65-446a-4255-8e2d-e265951f2262', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Braintree ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Braintree, a PayPal company, is an enterprise payment processing platform for cards, PayPal, Venmo, and digital wallets with fraud protection.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$2.89% + $0.29 per transaction (standard commercial rate)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Braintree (PayPal) processes cards, PayPal, Venmo, and digital wallets with standard rates of 2.89% + $0.29 per transaction and no monthly fees.$q$,
  og_description = $q$Braintree (PayPal) processes cards, PayPal, Venmo, and digital wallets with standard rates of 2.89% + $0.29 per transaction and no monthly fees.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '633df78b-c6d3-45d8-a067-207679f3055d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '633df78b-c6d3-45d8-a067-207679f3055d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Unified checkout$q$, $q$Single-touch payments across cards, PayPal, Venmo, and digital wallets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Mobile SDKs$q$, $q$SDKs for integrating payments into mobile apps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Global currency acceptance$q$, $q$Accepts payments and issues payouts to 200+ markets in 50+ currencies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Fraud and risk management$q$, $q$Adaptive fraud protection and PCI DSS Level 1 compliant processing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Payment orchestration$q$, $q$Routes and manages payments across methods from one integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Sandbox environment$q$, $q$Free developer sandbox for testing integrations before going live.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$No monthly fees, setup fees, or minimum transaction fees on standard pricing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Backed by PayPal's global payments infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Supports cards, PayPal, Venmo, Apple Pay, Google Pay, and local payment methods$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Discounted charity rate available (2.19% + $0.29)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Standard rate (2.89% + $0.29) is higher than some flat-rate competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Custom/negotiated pricing for high-volume merchants ($80,000+/month) requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Additional fees apply for non-USD currency and cards issued outside the US$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$What are Braintree's standard transaction fees?$q$, $q$2.89% + $0.29 for cards and digital wallets, 3.49% + $0.49 for Venmo, and 0.75% (capped at $5) for standard ACH Direct Debit.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Is there a free trial?$q$, $q$Braintree offers a free sandbox environment for testing with no obligation to apply for an account.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Does Braintree charge monthly fees?$q$, $q$No monthly fees are listed for standard commercial pricing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Does Braintree offer nonprofit pricing?$q$, $q$Yes, verified 501(c)(3) organizations get a reduced rate of 2.19% + $0.29 on cards and digital wallets.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Unified online checkout$q$, $q$Accept cards, PayPal, Venmo, and wallets through one integration.$q$, $q$Enterprise merchants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Mobile app payments$q$, $q$Embed payments in iOS/Android apps via Braintree's mobile SDKs.$q$, $q$Mobile app developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Global payouts$q$, $q$Send payouts to recipients across 200+ markets and 50+ currencies.$q$, $q$Marketplaces and platforms$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Standard Commercial$q$, $q$2.89% + $0.29 per transaction$q$, NULL, $q$["Cards and digital wallets","No monthly fee"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Charity (501(c)(3))$q$, $q$2.19% + $0.29 per transaction$q$, NULL, $q$["Discounted rate for verified charities"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$Custom/Enterprise$q$, $q$Custom$q$, NULL, $q$["Flat-rate or interchange-plus pricing for $80,000+/month volume"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$overview$q$, $q$What is Braintree?$q$, 2, ARRAY[$q$Braintree is PayPal's enterprise payment processing platform, offering end-to-end checkout across cards, PayPal, Venmo, and digital wallets with a single integration.$q$, $q$It includes mobile SDKs, adaptive fraud protection, PCI DSS Level 1 compliance, and payouts to over 200 markets in 50+ currencies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$who-its-for$q$, $q$Who Braintree is for$q$, 2, ARRAY[$q$Braintree is aimed at enterprise businesses that want a single payments integration covering cards, PayPal, and Venmo, with custom pricing available for higher-volume processors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── FastSpring ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$FastSpring is a merchant-of-record platform for selling software, SaaS, and digital products globally with automated tax compliance.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2006,
  company_size = NULL,
  headquarters = $q$Santa Barbara, California, United States$q$,
  languages = '{}',
  seo_meta_description = $q$FastSpring is a merchant of record handling global payments, tax compliance, and subscription billing for software and digital product sellers.$q$,
  og_description = $q$FastSpring is a merchant of record handling global payments, tax compliance, and subscription billing for software and digital product sellers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Global online payments$q$, $q$Branded, localized checkout supporting 200+ regions and 35+ currencies.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Automated tax compliance$q$, $q$Handles VAT and sales tax as the merchant of record.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Subscription management$q$, $q$Manages recurring billing for SaaS and subscription products.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Fraud prevention$q$, $q$Built-in risk management and fraud prevention on transactions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Affiliate marketing network$q$, $q$Built-in affiliate program tools for driving referral sales.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Digital invoicing and quotes$q$, $q$Interactive quotes and invoicing for B2B sales.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Developer APIs$q$, $q$REST APIs, webhooks, and JavaScript libraries with documentation and code samples.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Acts as merchant of record, taking on tax and compliance liability$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Supports 21+ languages and 35+ currencies across 200+ regions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Serves 3,200+ customers and processes over $2B in transactions per year$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$All features included in flat-rate pricing rather than charged à la carte$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$No public pricing list — rates are negotiated per business with an account executive$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Custom flat-rate pricing makes upfront cost comparison harder$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$How much does FastSpring cost?$q$, $q$FastSpring uses simple, flat-rate pricing based on transaction type and business volume, determined by talking with their team — there is no fixed public price list.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Is there a free trial?$q$, $q$FastSpring's site offers a 'Try Now For Free' option, though specific trial terms aren't detailed on the homepage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$What does FastSpring handle as a merchant of record?$q$, $q$It manages global payments, tax compliance, fraud prevention, and reporting on behalf of sellers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$When was FastSpring founded and where is it based?$q$, $q$FastSpring was founded in 2006 and is headquartered in Santa Barbara, California, with additional offices in England, the Netherlands, and Canada.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Global SaaS sales$q$, $q$Sell subscriptions internationally with localized checkout and automated tax handling.$q$, $q$SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Digital product and game sales$q$, $q$Process one-time and recurring purchases for software, games, and digital courses.$q$, $q$Software and game publishers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Affiliate-driven sales$q$, $q$Use the built-in affiliate network to drive additional revenue.$q$, $q$Growth and marketing teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$overview$q$, $q$What is FastSpring?$q$, 2, ARRAY[$q$FastSpring, founded in 2006 and headquartered in Santa Barbara, California, is a merchant-of-record platform that lets businesses sell software, SaaS, and digital products globally.$q$, $q$It handles payment processing, subscription billing, automated tax compliance, fraud prevention, and affiliate marketing, supporting 200+ regions, 35+ currencies, and 21+ languages.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$who-its-for$q$, $q$Who FastSpring is for$q$, 2, ARRAY[$q$FastSpring suits software, SaaS, and digital product companies that want to offload global tax compliance and payment operations to a merchant of record rather than building this infrastructure themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Lemon Squeezy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lemon Squeezy is a merchant-of-record platform, now owned by Stripe, handling payments, tax compliance, and subscriptions for software sellers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$5% + $0.50 per transaction$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Lemon Squeezy is a merchant of record for software sellers, charging 5% + $0.50 per transaction with no monthly fee; now owned by Stripe.$q$,
  og_description = $q$Lemon Squeezy is a merchant of record for software sellers, charging 5% + $0.50 per transaction with no monthly fee; now owned by Stripe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Merchant of record$q$, $q$Takes on tax collection, calculation, and compliance liability across jurisdictions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Global payment acceptance$q$, $q$Accepts payments from 135+ countries and 130+ currencies with up to 21 payment methods, including PayPal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Fraud protection$q$, $q$AI-based fraud system to assess risk and reduce chargebacks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Dunning management$q$, $q$Handles failed card retries and customer emails to reduce involuntary subscription churn.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Reconciled revenue dashboard$q$, $q$Single dashboard for viewing reconciled revenue across sales.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$No setup cost$q$, $q$Free to start with no trial requirement or contract.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Single transaction fee (5% + $0.50) with no monthly fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Acts as merchant of record, absorbing tax and compliance liability$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Supports 135+ countries, 130+ currencies, and up to 21 payment methods$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$No setup cost or contract required to start$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Additional fees apply for international transactions (+1.5%), PayPal (+1.5%), subscriptions (+0.5%), abandoned cart recovery (+5%), and affiliates (+3%)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Now owned by Stripe and being evolved toward Stripe Managed Payments, which introduces migration uncertainty for existing merchants$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Percentage-based pricing can be more costly at higher sales volumes than flat-rate processors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$How much does Lemon Squeezy cost?$q$, $q$Lemon Squeezy charges 5% + $0.50 per transaction with no monthly fee; additional fees apply for international payments, PayPal, subscriptions, abandoned cart recovery, and affiliates.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Is Lemon Squeezy still owned independently?$q$, $q$No, Stripe acquired Lemon Squeezy in July 2024; the platform continues to operate under its own name while Stripe develops Stripe Managed Payments.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$What does Lemon Squeezy handle as a merchant of record?$q$, $q$It manages tax collection and calculation, compliance, fraud protection, and dispute handling on behalf of sellers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$How many payment methods does Lemon Squeezy support?$q$, $q$Up to 21 payment methods, including PayPal, across 135+ countries.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Selling digital products and SaaS$q$, $q$Handle global payments and tax compliance for software or digital product sales without building the infrastructure in-house.$q$, $q$Indie developers and SaaS founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Subscription billing$q$, $q$Manage recurring subscription payments with built-in dunning to reduce churn.$q$, $q$Subscription-based software businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Standard$q$, $q$5% + $0.50 per transaction$q$, NULL, $q$["No monthly fee","No setup cost or contract","+1.5% international, +1.5% PayPal, +0.5% subscriptions, +5% abandoned cart recovery, +3% affiliates"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$overview$q$, $q$What is Lemon Squeezy?$q$, 2, ARRAY[$q$Lemon Squeezy is a merchant-of-record platform for selling software, SaaS, and digital products, handling global payments, tax compliance, and fraud protection under a single 5% + $0.50 transaction fee.$q$, $q$Stripe acquired Lemon Squeezy in July 2024. As of 2026, Lemon Squeezy continues to operate under its own name while Stripe builds out Stripe Managed Payments, a related merchant-of-record product, with existing Lemon Squeezy merchants able to migrate over time.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$who-its-for$q$, $q$Who Lemon Squeezy is for$q$, 2, ARRAY[$q$Lemon Squeezy suits indie developers, SaaS founders, and small software businesses that want to sell globally without setting up their own tax compliance and payment infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Orb ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Orb is a revenue design platform that automates usage-based billing, pricing strategy, and invoicing for SaaS and AI companies.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Orb automates usage-based billing, pricing changes, and invoicing for SaaS and AI companies, with custom pricing based on billings and events.$q$,
  og_description = $q$Orb automates usage-based billing, pricing changes, and invoicing for SaaS and AI companies, with custom pricing based on billings and events.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a1062364-3f5b-45dc-b882-5a0283cbb0a9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a1062364-3f5b-45dc-b882-5a0283cbb0a9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Billing engine$q$, $q$Automates usage-based and hybrid pricing models.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Usage metering$q$, $q$Real-time event ingestion and usage tracking for billing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Price modeling$q$, $q$Tools for designing, evolving, and simulating pricing changes before rollout.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Orb Invoicing$q$, $q$Automated invoicing tied to metered usage and contracts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Spend controls$q$, $q$Alerts and limits to help customers manage usage-based spend.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Experience Kit$q$, $q$Prebuilt dashboards and checkout flow components.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Finance integrations$q$, $q$Connects usage data to finance workflows, including Salesforce and NetSuite on higher tiers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Purpose-built for usage-based and hybrid pricing models$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Includes pricing simulation tools to test changes before rollout$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Used by notable companies including Vercel, Supabase, and Replit$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Higher tiers add Salesforce, NetSuite, and data warehouse sync$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$No public pricing — all tiers (Core, Advanced, Enterprise) require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Pricing depends on billings and events plus a platform fee, making costs hard to estimate upfront$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$No free trial or free plan mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$How is Orb priced?$q$, $q$Orb bases pricing on two metrics — billings and events — plus a platform fee on the Advanced and Enterprise tiers; exact pricing requires contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$What plans does Orb offer?$q$, $q$Core, Advanced (most popular), and Enterprise, each requiring a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Does Orb integrate with CRM and finance tools?$q$, $q$The Advanced tier adds Salesforce and NetSuite integrations plus data warehouse sync.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Who uses Orb?$q$, $q$SaaS, AI, and infrastructure companies such as Vercel, Supabase, Redis, LaunchDarkly, and Replit.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Usage-based billing$q$, $q$Meter and bill customers based on consumption of a product or API.$q$, $q$SaaS and API companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Pricing experimentation$q$, $q$Simulate and roll out pricing changes to customer cohorts before full launch.$q$, $q$Product and finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$AI product monetization$q$, $q$Bill for usage of AI or agentic products based on consumption metrics.$q$, $q$AI companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Core$q$, $q$Custom$q$, NULL, $q$["Real-time event ingestion and alerting","Hybrid and usage-based billing","Orb Invoicing","Finance and tax integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Advanced$q$, $q$Custom$q$, NULL, $q$["Everything in Core","Data warehouse sync","Salesforce and NetSuite integration","Customer hierarchy","Premium support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Advanced","Enterprise-grade SLAs","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$overview$q$, $q$What is Orb?$q$, 2, ARRAY[$q$Orb is a revenue design platform that automates usage-based billing, pricing modeling, and invoicing for growing software companies.$q$, $q$It offers three tiers — Core, Advanced, and Enterprise — all priced on a custom basis tied to billings and event volume, with higher tiers adding CRM and finance integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$who-its-for$q$, $q$Who Orb is for$q$, 2, ARRAY[$q$Orb is aimed at SaaS, AI, and infrastructure companies that need flexible usage-based or hybrid pricing models rather than simple flat subscription billing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Metronome ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Metronome, now part of Stripe, is a usage-based billing platform for metering, invoicing, and monetizing SaaS and AI products.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$100,000 billing volume included, then 0.8%$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Metronome is a usage-based billing platform, now part of Stripe, offering real-time metering, invoicing, and spend controls for SaaS and AI companies.$q$,
  og_description = $q$Metronome is a usage-based billing platform, now part of Stripe, offering real-time metering, invoicing, and spend controls for SaaS and AI companies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3979638f-c194-4be0-8b95-c01a647146b8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3979638f-c194-4be0-8b95-c01a647146b8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Real-time metering$q$, $q$Meters usage events in real time for billing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Rate cards$q$, $q$Customizable pricing rate cards that can be updated quickly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$In-product billing dashboards$q$, $q$Embeddable dashboards giving customers visibility into their usage and spend.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Spend controls$q$, $q$Configurable alerts and limits on customer spend.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Usage and revenue analytics$q$, $q$Real-time reporting on usage and revenue.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Pricing experimentation$q$, $q$Cohort-based rollouts for testing new pricing models.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Stripe integration$q$, $q$Native integration with Stripe for payment processing.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Starter plan includes $100,000 in billing volume and 10M events before overage fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Supports usage-based, seat-based, subscription, and hybrid pricing models$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Native Stripe integration since Metronome is now part of Stripe$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Used by companies including OpenAI, Cribl, and Fly.io$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Custom plan pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Overage pricing (0.8% of billing volume, $0.04/1k events) adds cost unpredictability at scale$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$No free trial or free plan mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$How is Metronome priced?$q$, $q$The Starter plan includes $100,000 in billing volume (0.8% after) and 10M events ($0.04 per 1,000 events after); the Custom plan is quote-based.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Is Metronome still an independent company?$q$, $q$No, Metronome is now part of Stripe, combining both companies' monetization capabilities.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$What pricing models does Metronome support?$q$, $q$Usage-based, seat-based, subscription, and hybrid pricing models.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Does Metronome integrate with Stripe?$q$, $q$Yes, it has a native Stripe integration for payment processing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Usage-based SaaS billing$q$, $q$Meter product usage and generate invoices based on consumption.$q$, $q$SaaS and infrastructure companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$AI product monetization$q$, $q$Bill for consumption of AI or agentic products with real-time metering.$q$, $q$AI companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Pricing experimentation$q$, $q$Test new pricing models on customer cohorts before a full rollout.$q$, $q$Product and finance teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Starter$q$, $q$$100,000 billing volume included, 0.8% after; 10M events included, $0.04/1k events after$q$, NULL, $q$["Real-time usage metering and alerting","Usage-based, seat-based, subscription, and hybrid pricing","Native Stripe integration","Embeddable billing dashboards"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$Custom$q$, $q$Custom$q$, NULL, $q$["Everything in Starter","Salesforce, NetSuite, AWS/Azure/GCP marketplace integrations","Data warehouse and BI exports","Dedicated account manager","Enhanced SLAs"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$overview$q$, $q$What is Metronome?$q$, 2, ARRAY[$q$Metronome is a usage-based billing platform providing monetization infrastructure for SaaS companies, including real-time metering, rate cards, spend controls, and revenue analytics.$q$, $q$Metronome is now part of Stripe. Its Starter plan includes $100,000 in billing volume and 10M events before usage-based overage fees apply; larger customers use a custom quote-based plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$who-its-for$q$, $q$Who Metronome is for$q$, 2, ARRAY[$q$Metronome is built for fast-growing SaaS, AI, and infrastructure companies — including customers like OpenAI, Cribl, and Fly.io — that need consumption-based billing rather than flat subscriptions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Billsby ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Billsby is subscription billing software for managing recurring payments, dunning, tax compliance, and revenue reporting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$45/month + 0.4% on revenue over $15,000/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Billsby is subscription billing software with a free testing tier and paid plans from $45/month plus a small percentage on revenue over $15,000.$q$,
  og_description = $q$Billsby is subscription billing software with a free testing tier and paid plans from $45/month plus a small percentage on revenue over $15,000.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Products, plans and cycles$q$, $q$Set up unlimited subscription products, plans, and billing cycles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Multiple payment gateways$q$, $q$Supports multiple payment gateways on higher plans, including ACH processing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Integrated checkout$q$, $q$Embeddable checkout implementable with minimal code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Automated dunning$q$, $q$Automated dunning management to recover failed payments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Tax compliance$q$, $q$Built-in tax compliance functionality across multiple regions on the Pro plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Advanced reporting$q$, $q$Reporting and analytics on subscription revenue.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Developer API$q$, $q$Full API access on the Pro plan for custom integrations.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Free plan allows unlimited testing and setup before going live$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Core plan starts at a flat $45/month with a low percentage fee on revenue over $15,000$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Pro plan adds multi-language support, ACH processing, and full API access$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Rated 4.8 stars and described as the '#1 Rated Subscription Billing Software' on G2$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Higher-value features like multiple payment gateways and ACH are limited to the Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Custom/enterprise pricing is quote-only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Does Billsby have a free plan?$q$, $q$Yes, a free plan allows unlimited testing and setup before going live, with no time limit.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$How much does Billsby's Core plan cost?$q$, $q$$45/month for up to 5 users, plus 0.4% on revenue exceeding $15,000/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$What does the Pro plan add?$q$, $q$User permissions, multiple payment gateways, ACH processing, multiple tax regions, FreeAgent/TaxJar integrations, advanced reporting, multi-language support, and full API access, for $135/month plus 0.5% on revenue over $30,000/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Is custom pricing available?$q$, $q$Yes, a Custom plan with unlimited users is available via contacting the sales team.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Subscription setup and testing$q$, $q$Build and test subscription products and pricing on the free plan before launch.$q$, $q$Early-stage SaaS founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Recurring revenue management$q$, $q$Manage plans, dunning, and reporting for an established subscription business.$q$, $q$Small to mid-size subscription businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Multi-region billing$q$, $q$Handle multiple tax regions and payment gateways on the Pro plan.$q$, $q$Growing subscription companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Unlimited testing and unlimited time","Full setup access before going live"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Core$q$, $q$$45/month + 0.4% on revenue over $15,000/month$q$, $q$monthly$q$, $q$["5 users","Unlimited products/plans/cycles","Metered and pro-rated billing","Automated dunning","QuickBooks integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Pro$q$, $q$$135/month + 0.5% on revenue over $30,000/month$q$, $q$monthly$q$, $q$["25 users","Multiple payment gateways","ACH processing","Multi-language support","Full API access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Custom$q$, $q$Custom$q$, NULL, $q$["Unlimited users","Bespoke solution"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$overview$q$, $q$What is Billsby?$q$, 2, ARRAY[$q$Billsby is subscription billing software that helps businesses manage products, plans, billing cycles, dunning, tax compliance, and reporting for recurring revenue.$q$, $q$It offers a free plan for setup and testing, a Core plan at $45/month, a Pro plan at $135/month with more integrations and multi-language support, and a custom Enterprise tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$who-its-for$q$, $q$Who Billsby is for$q$, 2, ARRAY[$q$Billsby suits startups and small-to-mid-size businesses building subscription products that want to start free while testing and scale into paid plans as revenue grows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Pendo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pendo is an AI-powered product analytics and experience platform for tracking user behavior, in-app guides, and feedback.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (up to 500 MAUs)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pendo offers a free plan up to 500 MAUs plus custom-priced Base, Core, and Ultimate plans for product analytics, in-app guides, and session replay.$q$,
  og_description = $q$Pendo offers a free plan up to 500 MAUs plus custom-priced Base, Core, and Ultimate plans for product analytics, in-app guides, and session replay.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Product analytics$q$, $q$Captures and analyzes user behavior across software products.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Agent Analytics$q$, $q$Measures adoption and impact of AI agents within a product.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$In-app guides$q$, $q$Contextual in-app guidance to drive feature adoption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Session Replay$q$, $q$Replays real user sessions to see experiences firsthand (Core plan and above).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Listen$q$, $q$Converts user feedback into structured insights.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Predict$q$, $q$Identifies churn risk before it happens.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Leo$q$, $q$Natural-language question answering over product data.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Data Sync$q$, $q$Integrates product usage data across other systems.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Free plan available for up to 500 monthly active users with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Used by 14,000+ teams and tracks over 1 billion users across 35 trillion collected events$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Integrates with 50,000+ agents and apps, including Claude and ChatGPT$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Novus (beta) offers continuous product monitoring and AI-generated PRs at no cost during beta$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Base, Core, and Ultimate plans require contacting sales for custom pricing rather than published rates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Advanced features like session replay and sentiment surveys are gated behind higher tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Founding year, headquarters, and company size not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Does Pendo have a free plan?$q$, $q$Yes, a free plan supports up to 500 monthly active users with product analytics, in-app guides, and Pendo-branded roadmaps/NPS surveys, no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$How is Pendo priced beyond the free plan?$q$, $q$Base, Core, and Ultimate plans use custom pricing based on monthly active users (MAUs); contact sales for a quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$What is Pendo's Agent Analytics?$q$, $q$An add-on that measures the adoption and impact of AI agents within a product, priced on prompt volume with a free allowance included.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Does Pendo integrate with AI assistants?$q$, $q$Yes, Pendo's integrations include Claude and ChatGPT among its 50,000+ supported agents and apps.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Product usage analytics$q$, $q$Track how users interact with a product to identify friction points.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$In-app onboarding and guidance$q$, $q$Use in-app guides to drive feature adoption and reduce churn.$q$, $q$Product and customer success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$AI agent monitoring$q$, $q$Measure adoption and effectiveness of AI agents embedded in a product.$q$, $q$AI product teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 500 MAUs","Product analytics","In-app guides","Pendo-branded roadmaps and NPS surveys"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Base$q$, $q$Custom$q$, NULL, $q$["Product analytics","In-app guides"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Core$q$, $q$Custom$q$, NULL, $q$["Everything in Base","Session replay"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Ultimate$q$, $q$Custom$q$, NULL, $q$["Everything in Core","Sentiment surveys","Orchestrate","Listen","Data sync"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$overview$q$, $q$What is Pendo?$q$, 2, ARRAY[$q$Pendo is a product analytics and experience platform that captures user behavior across software and AI agents, surfaces where users struggle, and provides in-app guidance to improve adoption.$q$, $q$It offers a free plan for up to 500 MAUs, plus Base, Core, and Ultimate tiers priced on custom MAU volume, alongside add-ons like Predict for churn risk and Agent Analytics for AI adoption tracking.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$who-its-for$q$, $q$Who Pendo is for$q$, 2, ARRAY[$q$Pendo serves product, sales, IT, and enterprise teams that need to understand user behavior and drive adoption, spanning startups to large enterprises across 14,000+ teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Userpilot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Userpilot is a product analytics and onboarding platform for in-app engagement, user feedback, and retention.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$299/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Userpilot is a product analytics and onboarding platform starting at $299/month with in-app engagement, surveys, and session replay.$q$,
  og_description = $q$Userpilot is a product analytics and onboarding platform starting at $299/month with in-app engagement, surveys, and session replay.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Product analytics$q$, $q$Event autocapture and custom dashboards on the Growth plan and above.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$In-app engagement$q$, $q$Tooltips, banners, spotlights, and flows to guide users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$User feedback surveys$q$, $q$NPS and CSAT surveys to collect user feedback.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Session replay$q$, $q$Session replay available as an add-on on the Growth plan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Email and mobile engagement$q$, $q$Email engagement built in, with mobile engagement available as an add-on.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Lia AI agent$q$, $q$AI-powered agent for analyzing data and automating in-app actions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Workflows$q$, $q$Multi-channel engagement workflows across in-app, email, and other channels.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Free trial available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Starter plan includes SOC 2 Type 2, HIPAA, and GDPR compliance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Growth and Enterprise plans add advanced analytics, event autocapture, and premium integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Used by 1,200 companies across product, UX, customer success, marketing, and growth teams$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Starting price of $299/month is higher than some onboarding tool alternatives$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Session replay and mobile engagement are paid add-ons rather than included features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Enterprise plan pricing is custom/quote-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$How much does Userpilot cost?$q$, $q$The Starter plan is $299/month for up to 2,000 MAUs; the Growth plan starts from $849/month; Enterprise pricing is custom.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Is there a free trial?$q$, $q$Yes, Userpilot offers a free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$What is Lia?$q$, $q$Lia is Userpilot's AI-powered agent for analyzing product data and automating in-app actions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$What integrations does Userpilot support?$q$, $q$Salesforce, HubSpot, Segment, Mixpanel, Zendesk, Intercom, Google Analytics, Amplitude, and webhooks/API connections.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$User onboarding$q$, $q$Guide new users through in-app tooltips, flows, and spotlights.$q$, $q$Product and UX teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Product analytics$q$, $q$Track feature usage and engagement trends with autocaptured events.$q$, $q$Product managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Retention and feedback$q$, $q$Collect NPS/CSAT feedback and re-engage users via email workflows.$q$, $q$Customer success and growth teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Starter$q$, $q$$299/month$q$, $q$monthly$q$, $q$["Up to 2,000 MAUs","In-app engagement","User segmentation and tracking","NPS survey","3 seats","1 year data retention","SOC 2 Type 2, HIPAA, GDPR compliance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Growth$q$, $q$From $849/month$q$, $q$monthly$q$, $q$["2,000-100k MAUs","Advanced product analytics","Event autocapture","Resource center and advanced surveys","Email engagement","15 seats","3 year data retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["10k+ MAU minimum","Premium integrations","Data warehouse sync","SAML SSO","Unlimited seats","Dedicated customer success manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$overview$q$, $q$What is Userpilot?$q$, 2, ARRAY[$q$Userpilot is a product analytics and onboarding platform combining in-app engagement (tooltips, flows, spotlights), product analytics, feedback surveys, and session replay.$q$, $q$Pricing starts at $299/month for up to 2,000 MAUs, scaling to a Growth plan from $849/month and a custom Enterprise tier, with a free trial available on signup.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$who-its-for$q$, $q$Who Userpilot is for$q$, 2, ARRAY[$q$Userpilot is used by product management, UX/design, customer success, marketing, and growth teams at around 1,200 companies to drive user activation and retention.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Appcues ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Appcues is an in-app engagement platform for building onboarding tours, checklists, surveys, and messages to drive feature adoption.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Appcues helps product teams build in-app tours, checklists, surveys, and messages to onboard users and drive feature adoption.$q$,
  og_description = $q$Appcues helps product teams build in-app tours, checklists, surveys, and messages to onboard users and drive feature adoption.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06c62a86-d703-4a91-808a-a0aece77e321';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06c62a86-d703-4a91-808a-a0aece77e321' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$In-App Tours & Flows$q$, $q$Guided walkthroughs for onboarding new users and driving feature adoption.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Dynamic Content Library$q$, $q$Reusable in-app messages, surveys, offers, and guides.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$User Segmentation$q$, $q$Target experiences to specific groups of users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$AI-Assisted Experience Building$q$, $q$AI recommendations to help build and optimize in-app campaigns.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Analytics & Behavioral Insights$q$, $q$Track user engagement and campaign performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$In-App Surveys$q$, $q$Collect user feedback directly inside the product.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$All plans include the same core feature set (experience building, targeting, analytics, and AI) from the Start tier up$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Dedicated Spark plan tailored to small teams (under 25 people) shipping their first in-app experiences$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$AI-assisted campaign building and optimization recommendations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Reporting history scales up to 36 months on the Enterprise plan$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$No published pricing on the website; every plan requires booking a call to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Pricing is MAU-based, so costs scale directly with monthly active users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Number of published experiences is capped by plan tier (10/25/100)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Does Appcues publish its pricing?$q$, $q$No. Appcues pricing is based on monthly active users (MAUs) and requires booking a call; specific dollar amounts are not published on the site.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$What plans does Appcues offer?$q$, $q$Appcues offers Start, Grow, and Enterprise plans, plus a Spark plan for small teams, which differ by MAU volume, number of published experiences, and reporting history length.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Does every Appcues plan include AI features?$q$, $q$Yes, according to Appcues, all plans include experience building, user targeting, analytics, and AI capabilities from day one.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Who is the Spark plan for?$q$, $q$Spark is built for small teams (under 25 people) shipping their first in-app experiences.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$User Onboarding$q$, $q$Build guided in-app tours and checklists to walk new users through key setup steps.$q$, $q$Product and growth teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Feature Adoption$q$, $q$Use targeted in-app messages and tooltips to drive adoption of underused features.$q$, $q$Product managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$In-App Feedback Collection$q$, $q$Deploy surveys inside the product to gather user feedback and sentiment.$q$, $q$Customer success teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Spark$q$, $q$Custom$q$, NULL, $q$["Built for small teams (under 25 people) shipping their first in-app experiences"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Start$q$, $q$Custom$q$, NULL, $q$["Up to 3,000 MAUs","10 published experiences","12 months of reporting history"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Grow$q$, $q$Custom$q$, NULL, $q$["Starting at 3,000 MAUs","25 published experiences","24 months of reporting history"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom MAU volumes","100 published experiences","36 months of reporting history","Priority support and services"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$overview$q$, $q$What is Appcues?$q$, 2, ARRAY[$q$Appcues is an in-app engagement platform that helps product and customer success teams build onboarding tours, checklists, surveys, and in-app messages without needing engineering involvement for every change.$q$, $q$The platform includes user segmentation, campaign performance analytics, and AI-assisted tools for building and optimizing in-app experiences.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$who-its-for$q$, $q$Who Appcues is for$q$, 2, ARRAY[$q$Appcues is aimed at product teams, customer success managers, and growth teams at SaaS companies that want to drive user activation and feature adoption through in-app experiences.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Chameleon ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Chameleon is an in-app guidance platform combining behavior tracking, product tours, and AI-built experiences to reduce friction and drive adoption.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$279/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Chameleon offers in-app product tours, tooltips, surveys, and AI-built guidance (Copilot) to onboard users and drive feature adoption.$q$,
  og_description = $q$Chameleon offers in-app product tours, tooltips, surveys, and AI-built guidance (Copilot) to onboard users and drive feature adoption.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0a6ea67e-e786-4158-b3c6-d8553bbb3f73';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0a6ea67e-e786-4158-b3c6-d8553bbb3f73' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Compass$q$, $q$Monitors user behavior to find where users get stuck in the product.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Copilot$q$, $q$AI tool that builds in-app guidance automatically and runs analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Prism$q$, $q$Personalizes experiences for individual users (1:1 personalization).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Ranger$q$, $q$Flags stale flows, broken elements, and inactive seats.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$In-App Guidance Types$q$, $q$Tours, tooltips, surveys, launchers, banners, and checklists.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$A/B Testing & Segmentation$q$, $q$Test and target guidance to specific user segments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Integrations$q$, $q$Connects with HubSpot, Salesforce, Mixpanel, Heap, Figma, Slack, Linear, Snowflake, and Amplitude.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Copilot AI can auto-build in-app guidance rather than requiring fully manual creation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Ranger automatically flags stale or broken flows for upkeep$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Wide integration list including Salesforce, HubSpot, Slack, Linear, and Snowflake$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$14-day free trial with no credit card required, including Enterprise-level features$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Entry-level Pro plan starts around $750/month for 5,000 MTUs, a meaningful commitment for very small teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Enterprise plan pricing is custom and requires booking a demo$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Additional seats beyond plan limits cost extra ($300/month per 5 seats on Pro)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Does Chameleon offer a free trial?$q$, $q$Yes, Chameleon offers a 14-day free trial with full Enterprise-level access and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$What is Copilot?$q$, $q$Copilot is Chameleon's AI-powered tool for automatically building in-app guidance and running analysis.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$What does Chameleon integrate with?$q$, $q$Chameleon integrates with tools including HubSpot, Salesforce, Mixpanel, Heap, Figma, Slack, and Linear, plus data warehouses like Snowflake.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$How is Chameleon priced?$q$, $q$Chameleon's published plans (Startup, Pro, Growth) are priced by monthly tracked users (MTUs), starting at $279/month for the Startup plan at 2,000 MTUs; Enterprise pricing is custom.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$In-App Onboarding$q$, $q$Launch tours, tooltips, and checklists to guide new users through key product steps.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Friction Detection$q$, $q$Use Compass to monitor behavior and identify where users get stuck in the product.$q$, $q$Product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Automatic Guidance Creation$q$, $q$Use Copilot to auto-generate in-app guidance instead of building each flow manually.$q$, $q$Growth and product marketing teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Personalized Experiences$q$, $q$Use Prism to tailor in-app content to individual users or segments.$q$, $q$SaaS product teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Startup$q$, $q$$279/month$q$, $q$monthly$q$, $q$["For 2,000 MTUs","10 live experiences","Customization, targeting, email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Pro$q$, $q$$750/month$q$, $q$monthly$q$, $q$["For 5,000 MTUs","Up to 20 live experiences","Copilot for building and analysis","Themes and custom CSS","A/B testing and goals","5-language localization","10 seats (unlimited viewers)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Growth$q$, $q$$1,250/month$q$, $q$annual$q$, $q$["For 5,000 MTUs, billed annually","Unlimited live experiences","Ranger agent and governance suite","AI interactive demos and HelpBar","Dedicated customer success and onboarding","15 seats (unlimited viewers)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Everything in Growth","All roles and permissions","Unlimited localization","Account-switching capability","Unlimited seats","Custom contracts"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$overview$q$, $q$What is Chameleon?$q$, 2, ARRAY[$q$Chameleon is an in-app guidance platform that combines behavior monitoring (Compass), AI-built guidance (Copilot), 1:1 personalization (Prism), and flow maintenance alerts (Ranger) into one system for improving product experiences.$q$, $q$It supports guidance formats such as tours, tooltips, surveys, launchers, banners, and checklists, along with A/B testing and user segmentation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$who-its-for$q$, $q$Who Chameleon is for$q$, 2, ARRAY[$q$Chameleon is built for product managers, product marketers, and product designers at SaaS companies who want to reduce user friction, drive feature adoption, and personalize in-app experiences without heavy engineering involvement.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Product Fruits ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Product Fruits is a no-code platform for building product tours, checklists, tooltips, and AI-powered onboarding flows to drive feature adoption.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$96/month ($72/month billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Product Fruits offers no-code product tours, checklists, in-app announcements, and an AI onboarding copilot to boost user adoption.$q$,
  og_description = $q$Product Fruits offers no-code product tours, checklists, in-app announcements, and an AI onboarding copilot to boost user adoption.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af388462-725e-429b-a572-58a70a2238c4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af388462-725e-429b-a572-58a70a2238c4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Flows$q$, $q$Multichannel, AI-powered onboarding that adjusts to each user in real time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Elvin Copilot$q$, $q$AI assistant that automatically resolves user support questions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Product Tours & Guided Experiences$q$, $q$Step-by-step in-app walkthroughs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Onboarding Checklists$q$, $q$Track user setup progress.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Hints & Tooltips$q$, $q$Contextual in-app help.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$In-App Announcements$q$, $q$Communicate product updates directly in the product.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$NPS Surveys & Feedback$q$, $q$Collect user sentiment inside the app.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Knowledge Base$q$, $q$Searchable self-service help articles.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Elvin Copilot is claimed by the vendor to automatically resolve 93% of support questions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$25% discount for annual billing across paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Free trial available on every plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Rated 4.7/5 on G2 and 4.8/5 on Capterra per the vendor's site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Pricing scales with monthly active users (MAUs), so costs rise as your user base grows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Automatic translations and custom events are gated to the Pro tier and above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Enterprise-grade options (SAML SSO, security audit, SLA) require a custom plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Does Product Fruits require coding to use?$q$, $q$No, Product Fruits is built as a no-code platform for creating onboarding flows, tours, and other in-app content.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$What is Elvin Copilot?$q$, $q$Elvin Copilot is Product Fruits' AI assistant that automatically answers user support questions inside the product.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Does Product Fruits offer a free trial?$q$, $q$Yes, all plans include free trial access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$How much does Product Fruits cost?$q$, $q$The Starter plan starts at $96/month ($72/month billed annually), with Pro and Business plans at $149/month ($112/month annually); custom plans are available for larger organizations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Adaptive Onboarding$q$, $q$Use Flows to deliver AI-powered onboarding that adjusts to each user's behavior in real time.$q$, $q$Customer Success and Product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Support Deflection$q$, $q$Use Elvin Copilot to automatically resolve common in-app support questions.$q$, $q$Customer Success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Feature Adoption$q$, $q$Use hints, tooltips, and announcements to surface underused features to existing users.$q$, $q$Product Managers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Starter$q$, $q$$96/month ($72/month billed annually)$q$, $q$monthly$q$, $q$["1,500 MAUs","Linear flows","Standard adaptive onboarding","Onboarding creator agent","Public knowledge base","Basic integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Pro$q$, $q$$149/month ($112/month billed annually)$q$, $q$monthly$q$, $q$["Advanced flows","Advanced adaptive onboarding","Public & private knowledge base","Advanced integrations","Automatic translations","Custom events"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Business$q$, $q$$149/month ($112/month billed annually)$q$, $q$monthly$q$, $q$["Adaptive flows","Premium adaptive onboarding","Contextual & voice onboarding","Permissions & SAML SSO","Unlimited content creation"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$Custom$q$, $q$Custom$q$, NULL, $q$["Custom T&Cs","Security audit","SLA","Custom monthly users"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$overview$q$, $q$What is Product Fruits?$q$, 2, ARRAY[$q$Product Fruits is a no-code platform that lets teams build product tours, checklists, tooltips, and in-app announcements to onboard users and drive feature adoption.$q$, $q$Its Flows feature delivers AI-powered onboarding that adapts to each user, and its Elvin Copilot AI assistant automatically resolves common in-app support questions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$who-its-for$q$, $q$Who Product Fruits is for$q$, 2, ARRAY[$q$Product Fruits targets Customer Success teams, Product Managers, and growth/product marketing teams at SaaS, enterprise software, and education platforms who need onboarding without engineering resources.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af388462-725e-429b-a572-58a70a2238c4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af388462-725e-429b-a572-58a70a2238c4', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af388462-725e-429b-a572-58a70a2238c4', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af388462-725e-429b-a572-58a70a2238c4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── UserGuiding ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$UserGuiding is a no-code platform for building product tours, checklists, tooltips, and an AI support assistant to drive user onboarding and adoption.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$174/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Português (BR)$q$, $q$Español$q$, $q$Français$q$]::text[],
  seo_meta_description = $q$UserGuiding offers no-code product tours, onboarding checklists, tooltips, and an AI assistant to help SaaS teams onboard and retain users.$q$,
  og_description = $q$UserGuiding offers no-code product tours, onboarding checklists, tooltips, and an AI assistant to help SaaS teams onboard and retain users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9b0d980b-c01e-40ef-a82b-19f1c57289fc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9b0d980b-c01e-40ef-a82b-19f1c57289fc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Product Tours$q$, $q$Interactive guided experiences showing product value.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Onboarding Checklists$q$, $q$Step-by-step completion lists to improve conversion.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Hotspots & Tooltips$q$, $q$Non-intrusive contextual UI annotations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Banners$q$, $q$Persistent announcement bars for updates and promotions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$In-App Surveys$q$, $q$Quick in-product feedback collection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Knowledge Base & Resource Center$q$, $q$Self-service help documentation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$AI Assistant$q$, $q$24/7 multilingual in-app support agent.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Session Replay$q$, $q$Records user interactions for review.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Free forever 'Support Essentials' plan includes knowledge base, resource center, and 50 free AI Assistant resolutions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$30-day money-back guarantee on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$14-day free trial before converting to paid or free tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$AI Assistant supports multilingual in-app support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$A/B testing, custom CSS, and localization are gated to the Growth plan and above$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Enterprise compliance features (SOC2, GDPR, HIPAA, SAML SSO) require custom Enterprise pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Pricing scales with Monthly Active Users (MAU), so cost increases as your user base grows$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Does UserGuiding have a free plan?$q$, $q$Yes, the 'Support Essentials' plan is free forever and includes the Knowledge Base, Product Updates, Resource Center, and 50 free AI Assistant resolutions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Is there a free trial for paid plans?$q$, $q$Yes, UserGuiding offers a 14-day free trial before plans convert to paid or the free tier.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$What languages does the UserGuiding site support?$q$, $q$UserGuiding's site is available in English, Portuguese (BR), Spanish, and French.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$How is UserGuiding priced?$q$, $q$Pricing is based on Monthly Active Users (MAU), with the Starter plan starting at $174/month billed yearly.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Product Onboarding$q$, $q$Use product tours and checklists to guide new users toward activation.$q$, $q$SaaS onboarding teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Self-Service Support$q$, $q$Deploy a knowledge base and AI Assistant to reduce support tickets.$q$, $q$Customer support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Feature Announcements$q$, $q$Use banners and hotspots to announce new features to existing users.$q$, $q$Product marketing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Support Essentials$q$, $q$Free forever$q$, NULL, $q$["Knowledge Base","Product Updates","Resource Center","AI Assistant (50 free resolutions)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Starter$q$, $q$$174/month$q$, $q$annual$q$, $q$["All adoption features","AI Assistant","Reporting","Segmentation","Customizable surveys"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Growth$q$, $q$$349/month$q$, $q$annual$q$, $q$["Everything in Starter","A/B testing","Goal tracking","Custom CSS","Localization","Premium integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Everything in Growth","SOC2/GDPR/HIPAA compliance","Personalized coaching","SAML SSO","Activity logs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$overview$q$, $q$What is UserGuiding?$q$, 2, ARRAY[$q$UserGuiding is a no-code product adoption platform that lets teams build product tours, onboarding checklists, hotspots, tooltips, and banners without writing code.$q$, $q$It also includes a knowledge base, resource center, and a 24/7 multilingual AI Assistant for self-service support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$who-its-for$q$, $q$Who UserGuiding is for$q$, 2, ARRAY[$q$UserGuiding targets product teams and SaaS companies that want to improve onboarding and reduce support costs, and it offers a free forever plan for teams starting with basic self-service support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── WalkMe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WalkMe is an enterprise digital adoption platform providing in-app guidance, workflow automation, and analytics across enterprise applications.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Japanese$q$]::text[],
  seo_meta_description = $q$WalkMe offers AI-powered in-app guidance, workflow automation, and analytics to help enterprises adopt Salesforce, SAP, Workday, and more.$q$,
  og_description = $q$WalkMe offers AI-powered in-app guidance, workflow automation, and analytics to help enterprises adopt Salesforce, SAP, Workday, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '76b93382-78f6-4307-a718-eb538f112980';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '76b93382-78f6-4307-a718-eb538f112980' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$DeepUI Technology$q$, $q$Understands on-screen context to deliver guidance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$WalkMe AI$q$, $q$Omnipresent contextual assistance across applications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Omnichannel Support$q$, $q$Guidance delivered across desktop, mobile, and web.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Analytics Suite$q$, $q$Application usage, workflow, and form analytics plus license optimization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$In-App Guidance$q$, $q$Conversational interfaces and step-by-step walkthroughs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Workflow Automation$q$, $q$Automates and accelerates repetitive tasks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Cross-Application Workflows$q$, $q$Execute workflows that span multiple connected applications.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Supports major enterprise apps out of the box: Salesforce, Workday, SAP, Microsoft Dynamics 365, ServiceNow, and SuccessFactors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Available across desktop, mobile, and web$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$DeepUI technology reads on-screen context to power guidance$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$No published pricing; all plans require requesting a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Starting January 2027, certain AI capabilities will require additional 'AI Units', with no pricing yet disclosed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Positioned for enterprise buyers, which may not suit small teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Does WalkMe publish its pricing?$q$, $q$No, WalkMe uses quote-based pricing; the site directs visitors to 'Request a quote' rather than listing plan prices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$What applications does WalkMe support out of the box?$q$, $q$WalkMe lists support for Salesforce, Workday, SAP, Microsoft Dynamics 365, ServiceNow, and SuccessFactors.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$What languages does WalkMe support?$q$, $q$WalkMe's site lists English, French, German, and Japanese.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Will WalkMe's AI features change in pricing?$q$, $q$WalkMe states that starting January 2027, certain AI capabilities will require 'AI Units,' though pricing for these has not been disclosed.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Employee Software Adoption$q$, $q$Guide employees through enterprise systems like SAP, Workday, and Salesforce with in-app walkthroughs.$q$, $q$IT and HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Customer-Facing Guidance$q$, $q$Add contextual help and automation to customer-facing web and mobile applications.$q$, $q$Customer care teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$Workflow Automation$q$, $q$Automate repetitive multi-step tasks across connected enterprise applications.$q$, $q$Enterprise digital transformation teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$overview$q$, $q$What is WalkMe?$q$, 2, ARRAY[$q$WalkMe is a digital adoption platform that layers in-app guidance, workflow automation, and analytics onto enterprise applications such as Salesforce, SAP, Workday, and ServiceNow.$q$, $q$Its DeepUI technology reads on-screen context to power contextual assistance, and WalkMe AI provides omnipresent support across desktop, mobile, and web.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$who-its-for$q$, $q$Who WalkMe is for$q$, 2, ARRAY[$q$WalkMe is built for IT, HR, sales, and customer care teams at enterprises undergoing digital transformation and needing to drive adoption of complex internal or customer-facing software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76b93382-78f6-4307-a718-eb538f112980', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76b93382-78f6-4307-a718-eb538f112980', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Whatfix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Whatfix is a digital adoption platform offering in-app guidance, simulated training via Mirror, and product analytics for enterprise software.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Whatfix provides in-app guidance, simulated training (Mirror), and product analytics to help enterprises drive software adoption.$q$,
  og_description = $q$Whatfix provides in-app guidance, simulated training (Mirror), and product analytics to help enterprises drive software adoption.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4fb71d52-71a3-4323-95eb-7716ce97e45c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4fb71d52-71a3-4323-95eb-7716ce97e45c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$In-App Guidance$q$, $q$Flows, Smart Tips, Pop-Ups, and Task Lists for contextual walkthroughs and prompts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Content Lifecycle Management$q$, $q$Governance controls for managing in-app content over time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Mirror$q$, $q$Clones your application for training, AI roleplay scenarios, and guided simulations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Adaptive Assessments$q$, $q$Skills assessments delivered through Mirror.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Product Analytics$q$, $q$AutoCapture event collection, session replay, and real-time cohorts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Guidance Analytics$q$, $q$Measures the effectiveness of in-app content.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Covers both in-app guidance (DAP) and a separate Product Analytics offering with AutoCapture, session replay, and cohorts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Mirror lets teams clone the application for training and simulation instead of practicing in production$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Over 700 customers across 30+ countries with a claimed 99.5% CSAT per the vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$G2 rating of 4.6 stars across 545 reviews per the vendor's site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$No published pricing; every plan requires a demo or sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$The free Product Analytics Standard plan is only available bundled with a paid DAP plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Positioned primarily for large enterprises across regulated industries$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Does Whatfix have published pricing?$q$, $q$No. Whatfix pricing combines a flat fee plus user license fees and requires requesting a demo; specific amounts aren't published.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$What is Mirror?$q$, $q$Mirror is Whatfix's application-cloning feature used for training simulations, AI roleplay scenarios, and adaptive assessments.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Does Whatfix offer a free plan?$q$, $q$A free 'Standard' Product Analytics plan exists, but only as an add-on bundled with a paid DAP Web & Desktop plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$What industries does Whatfix serve?$q$, $q$Whatfix lists customers across banking, education, financial services, healthcare, insurance, pharma & life sciences, and the public sector.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Employee Onboarding & Training$q$, $q$Use Mirror to clone applications and run guided simulations or AI roleplay for new hires.$q$, $q$L&D and HR teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$In-App Guidance for Software Rollouts$q$, $q$Deploy Flows, Smart Tips, and Task Lists to guide users through new or complex software.$q$, $q$IT and product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Usage Analytics$q$, $q$Use AutoCapture and session replay to understand how employees or customers use an application.$q$, $q$Product and operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Standard$q$, $q$Custom$q$, NULL, $q$["DAP Web & Desktop, or Product Analytics (free only when bundled with a paid DAP plan)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Premium$q$, $q$Custom$q$, NULL, $q$["DAP Web & Desktop, Product Analytics, or Mirror for Web Apps"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Multi-app plans for employee or customer-facing applications"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$overview$q$, $q$What is Whatfix?$q$, 2, ARRAY[$q$Whatfix is a digital adoption platform combining in-app guidance (Flows, Smart Tips, Pop-Ups, Task Lists) with Mirror, a feature that clones applications for training simulations and AI roleplay, and a separate Product Analytics suite.$q$, $q$Whatfix serves enterprise customers across banking, healthcare, insurance, education, and the public sector.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$who-its-for$q$, $q$Who Whatfix is for$q$, 2, ARRAY[$q$Whatfix targets L&D, HR, sales, and product teams at large enterprises that need in-app guidance, training simulations, and usage analytics for complex internal or customer-facing software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Apty ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Apty is an AI-powered digital adoption platform adding in-app guidance, walkthroughs, and workflow analytics to apps like Salesforce and Workday.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$9,500/app/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Apty is a digital adoption platform offering AI-assisted in-app guidance, tooltips, and analytics for enterprise apps like Salesforce and ServiceNow.$q$,
  og_description = $q$Apty is a digital adoption platform offering AI-assisted in-app guidance, tooltips, and analytics for enterprise apps like Salesforce and ServiceNow.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e097cf49-379b-418c-9290-d13e3cc829ec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e097cf49-379b-418c-9290-d13e3cc829ec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$No-Code Content Creation & Walkthroughs$q$, $q$Build in-app guidance without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Validations & Tooltips$q$, $q$Contextual, field-level guidance inside applications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Adoption Analytics$q$, $q$Usage and process analytics with completion and friction tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Live Workflow Monitoring$q$, $q$Real-time engagement tracking with early risk and compliance alerts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Role-Based Access & Governance$q$, $q$Versioning and approval workflows for content changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Enterprise Integrations & API$q$, $q$Connects with 100+ enterprise applications.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Supports 1,000+ applications with 100+ pre-built integrations, including Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, and Infor$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Includes multi-language and user segmentation support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Includes early risk and compliance alerting for workflow monitoring$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Starting price of $9,500 per app annually may be cost-prohibitive for small teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Final pricing depends on custom factors (employee count, implementation complexity, compliance needs), so total cost isn't fully transparent upfront$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$White-label and on-premise authoring are separate paid add-ons$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$How much does Apty cost?$q$, $q$Apty's pricing starts at $9,500 per app annually, with the final price depending on user count, implementation complexity, and compliance requirements.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$What applications does Apty integrate with?$q$, $q$Apty integrates with 100+ enterprise applications, including Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, and Infor, and supports 1,000+ applications overall.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Is Apty no-code?$q$, $q$Yes, Apty's content creation and walkthroughs are built with no-code tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Does Apty offer white-label or on-premise options?$q$, $q$Yes, On-Premise Authoring and White-Label are available as optional paid add-ons.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Enterprise Software Adoption$q$, $q$Guide employees through complex systems like Salesforce, Workday, and ServiceNow with in-app walkthroughs.$q$, $q$IT and digital transformation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Compliance Monitoring$q$, $q$Use live workflow monitoring to catch early risk and compliance issues in business-critical processes.$q$, $q$CFOs and compliance leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Process Analytics$q$, $q$Track completion and friction across critical workflows to identify where employees get stuck.$q$, $q$Training and department managers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$Standard$q$, $q$Starting at $9,500/app/year$q$, $q$annual$q$, $q$["No-code content creation & walkthroughs","Validations & tooltips","Export in-app content and insights","Multi-language & user segments","Usage & process analytics","Completion & friction tracking","Role-based access & governance","Versioning & approval workflows","Enterprise integrations & APIs"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$overview$q$, $q$What is Apty?$q$, 2, ARRAY[$q$Apty is an AI-powered digital adoption platform that adds no-code in-app guidance, validations, and tooltips to enterprise applications, along with live workflow monitoring and adoption analytics.$q$, $q$It supports 1,000+ applications with over 100 pre-built integrations, including Salesforce, Workday, ServiceNow, Microsoft Dynamics, Coupa, and Infor.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$who-its-for$q$, $q$Who Apty is for$q$, 2, ARRAY[$q$Apty is built for IT leaders, training leaders, department managers, and digital transformation teams at enterprises that need to drive adoption and compliance across multiple business applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── LogSnag ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LogSnag turns simple HTTP events into real-time dashboards, funnels, and instant push notifications for tracking product activity.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$16/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$LogSnag: real-time event tracking with dashboards, funnels, and push notifications for SaaS and product teams.$q$,
  og_description = $q$LogSnag: real-time event tracking with dashboards, funnels, and push notifications for SaaS and product teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53917c26-0b07-4781-b634-418d24dbcef3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53917c26-0b07-4781-b634-418d24dbcef3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Event Tracking$q$, $q$Send events from any product via simple HTTP requests, with SDKs for multiple languages.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Real-time Dashboards$q$, $q$Converts tracked events into live dashboards and metrics.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Funnel Analysis$q$, $q$Tracks conversion rates and user journeys across event sequences.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Journey Tracking$q$, $q$Maps relationships between events for a given user, order, shipment, or other entity.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Push Notifications$q$, $q$Sends instant alerts for important events to desktop, mobile, and browser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Advanced Filtering$q$, $q$Locate specific events and KPIs from tracked activity.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Free forever plan with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Simple HTTP-based event integration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Real-time push notifications for tracked events$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Funnel and journey analysis included on paid plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Unlimited seats on all paid tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Free plan capped at 2,500 events/month and 3 seats$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Enterprise plan requires a custom quote rather than published pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$No founding year or headquarters information published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Does LogSnag have a free plan?$q$, $q$Yes, LogSnag offers a free forever plan with 3 seats and 2,500 events per month, no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$How do I send events to LogSnag?$q$, $q$Events are sent via simple HTTP requests, with SDKs available for common languages.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$What is Journey Tracking?$q$, $q$Journey Tracking maps relationships between events tied to the same user, order, or other entity to visualize activity over time.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Is there an annual billing discount?$q$, $q$Yes, all paid plans include the equivalent of 2 months free when billed annually.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$SaaS event monitoring$q$, $q$Track signups, billing events, and errors in real time across a SaaS product.$q$, $q$SaaS teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Order and shipment tracking$q$, $q$Follow an order or shipment's journey through multiple events.$q$, $q$E-commerce and logistics teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Solo founder alerts$q$, $q$Get instant push notifications for key events like new signups or payments.$q$, $q$Solo founders$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Free$q$, $q$$0$q$, NULL, $q$["3 seats","2,500 events/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Sprout$q$, $q$$16/month$q$, $q$annual$q$, $q$["50,000 events/month","Unlimited seats"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Seedling$q$, $q$$33/month$q$, $q$annual$q$, $q$["150,000 events/month","Unlimited seats"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Timber$q$, $q$$66/month$q$, $q$annual$q$, $q$["500,000 events/month","Unlimited seats"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom quote","Custom onboarding"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$overview$q$, $q$What is LogSnag?$q$, 2, ARRAY[$q$LogSnag is an event tracking and monitoring tool that lets teams send events from any product via HTTP requests and turn them into real-time dashboards, funnels, and journeys.$q$, $q$Beyond raw event logs, LogSnag adds push notifications so teams can be alerted the moment a meaningful event occurs, such as a new signup or a failed payment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$who-its-for$q$, $q$Who LogSnag is for$q$, 2, ARRAY[$q$LogSnag is built for SaaS teams, solo founders, and product teams that want lightweight event tracking and real-time alerts without setting up a full analytics stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Pirsch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pirsch is a privacy-focused, cookieless web analytics tool that tracks site traffic without consent banners.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$6/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Pirsch offers GDPR-compliant, cookieless website analytics with funnels, events, and a 30-day free trial.$q$,
  og_description = $q$Pirsch offers GDPR-compliant, cookieless website analytics with funnels, events, and a 30-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c25d8ee5-3608-4fe0-8763-83ed5faa70fe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c25d8ee5-3608-4fe0-8763-83ed5faa70fe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Cookieless tracking$q$, $q$Tracks visitors without cookies, so no consent banner is required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Events & conversion goals$q$, $q$Tracks custom events and conversion goals alongside standard traffic metrics.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Funnel analysis$q$, $q$Visualizes multi-step conversion funnels and individual session exploration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Tag-based segmentation$q$, $q$Segments visitors using custom tags.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Webhooks & API$q$, $q$RESTful API, SDKs, and webhook integrations for automation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$White-labeling$q$, $q$Custom domains and extensive white-label theming for agencies.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Data import$q$, $q$Imports historical data from Plausible, Fathom, and Google Analytics.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$No consent banners required (cookieless, GDPR/CCPA/PECR compliant)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$RESTful API and SDKs included even on the entry-level plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Can import historical data from Plausible, Fathom, and Google Analytics$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Hosted on a dedicated server cluster in Germany with 100% data ownership$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$No permanent free plan, only a 30-day free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Standard plan limited to 10,000 monthly page views and 50 websites$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Funnels, A/B testing, and white-labeling are reserved for the Plus plan and above$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Enterprise features like SSO and on-premise hosting require a custom quote$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Does Pirsch require a cookie consent banner?$q$, $q$No, Pirsch uses cookieless tracking so websites using it don't need a consent banner.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Is there a free trial?$q$, $q$Yes, Pirsch offers a 30-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Can I import data from Google Analytics?$q$, $q$Yes, Pirsch supports data import from Plausible, Fathom, and Google Analytics.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Where is Pirsch hosted?$q$, $q$Pirsch is made and hosted in Germany, using a secure server cluster in the country.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$GDPR-compliant site analytics$q$, $q$Track website traffic without cookie banners while staying compliant with EU privacy law.$q$, $q$Website owners and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Multi-client dashboards$q$, $q$White-label and manage analytics across many client websites from one account.$q$, $q$Agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Standard$q$, $q$$6/month$q$, $q$monthly$q$, $q$["10,000 monthly page views","50 websites","Unlimited members and data retention","Events & conversion goals","RESTful API & SDKs"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Plus$q$, $q$$12/month$q$, $q$monthly$q$, $q$["Unlimited websites","Funnels","A/B testing & segmentation","Custom domains and themes","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Managed cloud or on-premise setup","SAML SSO","Raw data access","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$overview$q$, $q$What is Pirsch?$q$, 2, ARRAY[$q$Pirsch is a privacy-focused web analytics platform positioned as an alternative to Google Analytics. It tracks visitor behavior without cookies, so sites using it don't need to show a consent banner.$q$, $q$The platform covers events, conversion goals, funnels, and session-level analysis, and is hosted on servers in Germany with GDPR, CCPA, and PECR compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$who-its-for$q$, $q$Who Pirsch is for$q$, 2, ARRAY[$q$Pirsch suits website owners and developers who want privacy-compliant analytics, as well as agencies managing multiple client sites that need white-label reporting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Fathom Analytics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Fathom Analytics offers simple, privacy-first website analytics with no cookie banners and permanent data retention.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$15/month$q$,
  founded_year = 2018,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Fathom Analytics is a privacy-first, cookieless web analytics tool used by over a million websites.$q$,
  og_description = $q$Fathom Analytics is a privacy-first, cookieless web analytics tool used by over a million websites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9974bf44-ff46-4392-bd8f-98b3ee10f69b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9974bf44-ff46-4392-bd8f-98b3ee10f69b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Single-line install$q$, $q$Adds to any CMS or framework with one line of code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Event tracking$q$, $q$Tracks user interactions like sign-ups, clicks, and sales.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Email reporting$q$, $q$Sends scheduled email reports of site performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$UTM campaign tracking$q$, $q$Tracks campaign performance via UTM parameters.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Forever data retention$q$, $q$Keeps analytics data permanently rather than expiring it.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Lightweight script$q$, $q$A 2kB tracking script designed not to hurt page speed or SEO.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Analytics API$q$, $q$Provides API access for developers, rate-limited to 600 requests/hour.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Cookieless and anonymous IP tracking, no cookie banner needed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$GDPR, CCPA, and ePrivacy compliant$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Lightweight 2kB script that doesn't slow down pages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Independently owned with no venture capital backing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Used by over one million websites including IBM and GitHub$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$No permanent free plan, only a 7-day free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Entry pricing starts around $15/month and scales with pageview volume$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Higher pageview tiers (1M+) require contacting sales rather than published pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Extra sites beyond the included 50 cost an additional $10/month per pack of 50$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Is there a free trial?$q$, $q$Yes, Fathom Analytics offers a 7-day unlimited free trial with no obligation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Does Fathom use cookies?$q$, $q$No, Fathom is cookieless and tracks anonymized IP data, so no cookie banner is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$How long is data retained?$q$, $q$Fathom retains analytics data forever rather than expiring it after a set period.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$How many sites are included?$q$, $q$Plans include 50 sites, with additional sites available in packs of 50 for $10/month.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Privacy-compliant site analytics$q$, $q$Measure traffic and events without cookie banners or consent friction.$q$, $q$Website owners and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Agency and multi-site reporting$q$, $q$Manage analytics for many websites under one account.$q$, $q$Agencies and larger organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Up to 500,000 pageviews$q$, $q$$45/month$q$, $q$monthly$q$, $q$["50 sites included","Forever data retention","Ecommerce and event tracking","Analytics API (600 requests/hour)"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$overview$q$, $q$What is Fathom Analytics?$q$, 2, ARRAY[$q$Fathom Analytics is a privacy-first web analytics tool that provides simple traffic dashboards without the complexity or privacy concerns of tools like Google Analytics.$q$, $q$It installs with a single line of code, tracks events and UTM campaigns, and retains data permanently, all without using cookies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$who-its-for$q$, $q$Who Fathom Analytics is for$q$, 2, ARRAY[$q$Fathom is aimed at website owners and developers, from startups to large companies, who want straightforward, privacy-compliant analytics without complex reporting structures.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Simple Analytics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Simple Analytics tracks website traffic without cookies or personal data, hosted entirely in the EU.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€20/month$q$,
  founded_year = 2018,
  company_size = NULL,
  headquarters = $q$Amsterdam, Netherlands$q$,
  languages = '{}',
  seo_meta_description = $q$Simple Analytics is a privacy-first, cookie-free web analytics tool with EU data hosting and a free tier.$q$,
  og_description = $q$Simple Analytics is a privacy-first, cookie-free web analytics tool with EU data hosting and a free tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '721b3a38-d061-4bfd-94f0-6785a52684c9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '721b3a38-d061-4bfd-94f0-6785a52684c9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Cookieless tracking$q$, $q$Collects traffic data without cookies or personal data, no consent banner needed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Full traffic capture$q$, $q$Aims to measure a higher share of visitors than tools blocked by consent requirements or ad-blockers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$EU-hosted data$q$, $q$Keeps all analytics data hosted in Europe.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$GA4 compatibility$q$, $q$Can run alongside an existing Google Analytics installation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$AI assistant$q$, $q$Includes an AI-powered assistant for exploring analytics data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$One-page dashboard$q$, $q$Presents traffic data on a single page without complex configuration.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Forever-free tier available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$No cookies, consent banners, or personal data collected$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$EU-hosted infrastructure with GDPR, PECR, and CCPA compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$14-day free trial on paid plans with no credit card required$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Free plan limited to 1 user, 5 websites, and 1 month of history$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Paid plan charges €20/month per additional user$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Enterprise plan requires a custom demo/quote rather than published pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$SOC 2 compliance is listed as 'coming soon' rather than in place$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Is there a free plan?$q$, $q$Yes, Simple Analytics offers a forever-free tier limited to 1 user across 5 websites with 1 month of history.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Does Simple Analytics use cookies?$q$, $q$No, it collects traffic data without cookies or personal data, so no consent banner is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Where is data hosted?$q$, $q$All data is hosted in the EU.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Is there a free trial for paid plans?$q$, $q$Yes, a 14-day free trial is available with no credit card required.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Privacy-minded site analytics$q$, $q$Track traffic without cookies or consent banners while staying GDPR compliant.$q$, $q$Privacy-minded teams and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Recovering lost traffic data$q$, $q$Capture visitor data missed by consent-gated or ad-blocked tools, used alongside existing GA4 setups.$q$, $q$Enterprises$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Free$q$, $q$€0$q$, NULL, $q$["1 user","5 websites","1 month history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Self-Serve$q$, $q$€20/month$q$, $q$monthly$q$, $q$["1 user included (additional users €20/month each)","EU-hosted infrastructure"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["SSO","Role-based access controls","Dedicated SLA","SOC 2 compliance (coming soon)"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$overview$q$, $q$What is Simple Analytics?$q$, 2, ARRAY[$q$Simple Analytics is a privacy-focused web analytics platform that collects traffic data without cookies or personal data, so sites using it don't need consent banners.$q$, $q$The company positions its full traffic capture as recovering visitors missed by consent-gated or ad-blocked analytics tools, while keeping all data hosted in the EU.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$who-its-for$q$, $q$Who Simple Analytics is for$q$, 2, ARRAY[$q$It's built for privacy-minded teams and agencies, as well as larger enterprises like Bloomberg and GOV.UK that need EU-hosted, consent-free analytics alongside existing tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Cabin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cabin is a privacy-first, cookie-free web analytics tool built with a lightweight script and carbon reporting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cabin offers cookie-free website analytics with carbon emissions reporting and EU-hosted data.$q$,
  og_description = $q$Cabin offers cookie-free website analytics with carbon emissions reporting and EU-hosted data.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f0050715-8a0a-4437-8c80-e7d842301783';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f0050715-8a0a-4437-8c80-e7d842301783' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Lightweight script$q$, $q$Tracking script described as 77 times smaller than Google Analytics.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Cookie-free tracking$q$, $q$No cookies, IP tracking, or browser fingerprinting used.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$CO2 reporting$q$, $q$Tracks estimated carbon emissions related to website traffic.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Custom events & UTM tracking$q$, $q$Tracks custom events and UTM campaign parameters.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Weekly email reports$q$, $q$Sends automated weekly traffic summaries by email.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Public dashboards$q$, $q$Supports public, shareable dashboards on custom domains.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Free tier with unlimited page views under fair use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$No cookies, IP tracking, or browser fingerprinting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Unique carbon emissions reporting for sustainability-focused teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$GDPR, CCPA, ePrivacy, and PECR compliant$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Data encrypted and stored exclusively in the EU$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Free tier limited to 1 website and 30 days of data retention$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Unlimited websites and retention require the $19/month Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$No founding year, headquarters, or company size published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Is there a free plan?$q$, $q$Yes, Cabin's Basic tier is free and includes 1 website with 30 days of data retention.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Does Cabin use cookies?$q$, $q$No, Cabin tracks visitors without cookies, IP tracking, or browser fingerprinting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$What is CO2 reporting?$q$, $q$Cabin includes carbon emissions reporting tied to website traffic as part of its sustainability focus.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Where is data stored?$q$, $q$Data is end-to-end encrypted and stored exclusively in the EU.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Sustainability-conscious analytics$q$, $q$Track website traffic while also monitoring estimated carbon emissions.$q$, $q$Sustainability-focused teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Basic privacy-first analytics$q$, $q$Get cookie-free traffic analytics for a single site at no cost.$q$, $q$Solo developers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Basic$q$, $q$$0$q$, NULL, $q$["1 website","30 days data retention","Unlimited page views (fair use)","CO2 reporting","Custom events"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$Pro$q$, $q$$19/month$q$, $q$monthly$q$, $q$["Unlimited websites","Unlimited data retention","Unlimited page views (fair use)","CO2 reporting","Custom events"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$overview$q$, $q$What is Cabin?$q$, 2, ARRAY[$q$Cabin is a privacy-focused web analytics tool that tracks website performance without cookies, IP tracking, or browser fingerprinting.$q$, $q$It differentiates itself with a very lightweight tracking script and built-in carbon emissions reporting, alongside standard features like custom events and weekly email reports.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$who-its-for$q$, $q$Who Cabin is for$q$, 2, ARRAY[$q$Cabin serves organizations ranging from solo developers to large organizations that want ethical, privacy-first analytics with a sustainability angle.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Statsig ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Statsig unifies feature flags, A/B testing, product analytics, and session replay in one platform.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$150/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Bellevue, WA$q$,
  languages = '{}',
  seo_meta_description = $q$Statsig combines experimentation, feature flags, product analytics, and session replay for product teams.$q$,
  og_description = $q$Statsig combines experimentation, feature flags, product analytics, and session replay for product teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Experimentation$q$, $q$Runs A/B tests with statistical analysis at scale.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Feature flags$q$, $q$Controls feature releases and rollouts linked to product data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Product analytics$q$, $q$Builds metrics and tracks user behavior.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Session replay$q$, $q$Records visual sessions linked to experiments and feature flags.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Warehouse native$q$, $q$Integrates directly with existing data warehouses.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Broad SDK support$q$, $q$Provides SDKs for 18+ programming languages and frameworks.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Generous free Developer tier with 2M events/month and unlimited flag checks$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Unlimited seats even on the free plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Warehouse-native architecture for direct data warehouse integration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Used by companies including OpenAI, Brex, and Notion$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$SOC 2 Type 2 certified$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Pro plan bills a $150/month baseline plus overages beyond 5M events$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Enterprise pricing is custom/quote-only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Advanced experimentation and unlimited data retention require the Pro plan or above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Is there a free plan?$q$, $q$Yes, the Developer tier is free and includes 2M events/month, unlimited flag checks, and unlimited seats.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$What does the Pro plan cost?$q$, $q$Pro is $150/month, including 5M events, with additional events billed at $0.05 per 1,000.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Does Statsig support session replay?$q$, $q$Yes, session replay is included and can be linked to experiments and feature flags.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$How many SDKs does Statsig support?$q$, $q$Statsig provides SDKs for 18+ programming languages and frameworks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Running product experiments$q$, $q$Launch and analyze A/B tests with statistical rigor.$q$, $q$Data scientists and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Controlled feature rollouts$q$, $q$Ship features gradually using feature flags tied to product data.$q$, $q$Product managers and DevOps teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Developer$q$, $q$$0$q$, NULL, $q$["2M events/month","Unlimited flag & config checks","50,000 session replays/month","1-year data retention","Unlimited seats"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Pro$q$, $q$$150/month$q$, $q$monthly$q$, $q$["5M events included, then $0.05/1K","100,000 session replays/month","Advanced experimentation and analytics","Unlimited retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Warehouse native deployment","SSO","Role-based access","Priority support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$overview$q$, $q$What is Statsig?$q$, 2, ARRAY[$q$Statsig is a unified product development platform that combines experimentation, feature flags, product analytics, and session replay in a single system.$q$, $q$It supports warehouse-native deployments so teams can run experiments and analyze behavior directly against their existing data warehouse.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$who-its-for$q$, $q$Who Statsig is for$q$, 2, ARRAY[$q$Statsig serves engineering teams, data scientists, and product managers across industries like gaming, B2B SaaS, and e-commerce who need to test and roll out features safely.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── GrowthBook ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GrowthBook is a warehouse-native platform for running A/B tests, managing feature flags, and product analytics.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$40/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GrowthBook lets teams run experiments and manage feature flags directly on their own data warehouse.$q$,
  og_description = $q$GrowthBook lets teams run experiments and manage feature flags directly on their own data warehouse.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Experimentation$q$, $q$Runs A/B tests at scale with statistical modeling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Feature flags$q$, $q$Ships features safely with auto-rollbacks and gradual ramp schedules.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Product analytics with AI Data Analyst$q$, $q$Explores user behavior and lets users ask an AI assistant questions about the data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Warehouse-native architecture$q$, $q$Queries metrics directly from an existing data warehouse rather than a separate store.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Broad SDK support$q$, $q$Supports 24+ SDKs including JavaScript, Python, React, Vue, iOS, and Android.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$AI Visual Editor$q$, $q$Builds experiments visually with AI assistance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$MCP Server & REST API$q$, $q$Integrates with AI agents and external tools via an MCP server and REST API.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Free Starter plan for up to 3 users, plus a free open-source self-hosted option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Warehouse-native: bring your own data warehouse instead of duplicating data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Broad SDK support across 24+ languages and platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Used by 3,000+ companies$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Self-hosted open-source version available with unlimited users$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Pro plan is billed per seat ($40/seat/month), which scales with team size$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$CDN request and bandwidth overages are billed beyond included limits$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Enterprise features (SSO, SCIM, advanced access control) require a custom quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Is GrowthBook free?$q$, $q$Yes, the Starter cloud plan is free for up to 3 users, and the open-source self-hosted version is also free with unlimited users.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$What does the Pro plan cost?$q$, $q$Pro is $40 per seat per month for up to 50 users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Does GrowthBook require its own data warehouse?$q$, $q$No, GrowthBook can connect to an existing data warehouse or use a managed warehouse option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Can I self-host GrowthBook?$q$, $q$Yes, GrowthBook offers a free open-source self-hosted version as well as a self-hosted Enterprise tier.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Running experiments on existing data$q$, $q$Analyze A/B tests directly against a company's own data warehouse.$q$, $q$Data teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Controlled feature releases$q$, $q$Roll out features gradually with auto-rollback protection.$q$, $q$Engineers and product managers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Starter$q$, $q$$0$q$, NULL, $q$["Up to 3 users","Unlimited feature flags","Unlimited experiments","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Pro$q$, $q$$40/seat/month$q$, $q$monthly$q$, $q$["Up to 50 users","Visual editor","Multi-arm bandits","Advanced permissioning","Premium support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Approval workflows","SSO & SCIM","Exportable audit logs","99.99% uptime SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Open Source$q$, $q$$0$q$, NULL, $q$["Unlimited users","Unlimited feature flags and experiments","Bring your own warehouse","Community support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$overview$q$, $q$What is GrowthBook?$q$, 2, ARRAY[$q$GrowthBook is a warehouse-native platform for running experiments, managing feature flags, and analyzing product data, connecting directly to a team's existing data warehouse.$q$, $q$It offers both a hosted cloud version and a free open-source self-hosted version, with SDKs covering 24+ languages and platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$who-its-for$q$, $q$Who GrowthBook is for$q$, 2, ARRAY[$q$GrowthBook serves engineers who need lightweight SDKs, data teams that want SQL-based metric definitions, and product managers who want to run experiments and control rollouts without engineering dependencies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── JumpCloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$JumpCloud is a cloud directory platform unifying identity, device, and access management for IT teams.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$9/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$JumpCloud unifies cloud directory, SSO, MFA, and device management for hybrid IT environments.$q$,
  og_description = $q$JumpCloud unifies cloud directory, SSO, MFA, and device management for hybrid IT environments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Cloud directory$q$, $q$Centralizes user lifecycle management and HRIS integration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Single sign-on & MFA$q$, $q$Provides SSO, multi-factor authentication, and conditional access.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Privileged access & password manager$q$, $q$Manages privileged access and includes a password manager.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Cross-platform device management$q$, $q$Manages endpoints across Windows, macOS, Linux, iOS, and Android.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Shadow AI & SaaS management$q$, $q$Discovers SaaS usage, governs shadow AI, and optimizes SaaS spend.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$IT automation$q$, $q$Automates IT workflows via APIs for orchestration.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$30-day fully-featured free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$A la carte pricing lets teams pay only for the modules they need$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Cross-platform device management spanning Windows, macOS, Linux, iOS, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Special pricing available for education, nonprofit, and MSP customers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$No permanent free plan is offered$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Platform-tier packages require contacting sales rather than published pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$No founding year or headquarters information published on the pages reviewed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Does JumpCloud offer a free trial?$q$, $q$Yes, JumpCloud offers a 30-day fully-featured trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$What does JumpCloud cost?$q$, $q$Package pricing starts at $9/user/month (annual) for Device Management, with SSO and combined packages priced higher; Platform tiers require contacting sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Which platforms does JumpCloud manage?$q$, $q$JumpCloud manages devices across Windows, macOS, Linux, iOS, and Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Does JumpCloud offer discounts?$q$, $q$Yes, JumpCloud offers special pricing for education, nonprofits, and MSP partners.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Unified IT management for hybrid teams$q$, $q$Manage identity, devices, and access from a single directory across a distributed workforce.$q$, $q$IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Multi-client IT administration$q$, $q$Administer identity and device management across multiple client organizations.$q$, $q$MSPs$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Device Management$q$, $q$$9/user/month$q$, $q$annual$q$, $q$["Device management and MDM"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$SSO$q$, $q$$11/user/month$q$, $q$annual$q$, $q$["SSO, MFA, and password manager"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Device Identity Management$q$, $q$$13/user/month$q$, $q$annual$q$, $q$["Device management plus identity features and MFA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Platform Essentials$q$, $q$Custom$q$, NULL, $q$["Limit of 300 users","Identity, device, SSO, and passwordless authentication"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Platform$q$, $q$Custom$q$, NULL, $q$["Unified identity, device, and access management"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Platform Prime$q$, $q$Custom$q$, NULL, $q$["Zero Trust","AI & SaaS Management","Premium support"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$overview$q$, $q$What is JumpCloud?$q$, 2, ARRAY[$q$JumpCloud is a unified platform for managing devices and access for human and non-human identities, combining a cloud directory, SSO, MFA, and cross-platform device management in one system.$q$, $q$It offers modular, a la carte pricing so organizations can purchase only the identity, access, or device management components they need.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$who-its-for$q$, $q$Who JumpCloud is for$q$, 2, ARRAY[$q$JumpCloud is aimed at organizations with hybrid or distributed workforces, including enterprises and managed service providers (MSPs) modernizing their IT operations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Duo Security ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Duo, by Cisco, provides multi-factor authentication, SSO, and identity security to protect workforce access.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$3/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Duo Security offers MFA, SSO, and identity threat protection, with a free tier for up to 10 users.$q$,
  og_description = $q$Duo Security offers MFA, SSO, and identity threat protection, with a free tier for up to 10 users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '70bf6be7-f47b-4ba4-936b-47ece1be0301';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '70bf6be7-f47b-4ba4-936b-47ece1be0301' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Phishing-resistant MFA$q$, $q$Provides multi-factor authentication and passwordless authentication without extra hardware.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Single sign-on$q$, $q$Unifies access across applications with SSO.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Duo Directory$q$, $q$Centralizes identity management.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Device Trust$q$, $q$Verifies device health and trust before granting access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Cisco Identity Intelligence$q$, $q$Adds threat detection across identity and access activity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Identity Threat Detection & Response (ITDR)$q$, $q$Detects and responds to identity-based threats.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Agentic IAM$q$, $q$Extends identity and access management controls to AI agents.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Free tier available for teams of 10 or fewer users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Tiered pricing from $3 to $9/user/month as needs grow$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Phishing-resistant MFA and passwordless authentication included from the Essentials tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Backed by Cisco's security infrastructure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Recognized as a Gartner Customers' Choice for Access Management$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Advanced features like Cisco Identity Intelligence and Zero Trust access require the higher Advantage or Premier tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$VPN-less remote access and complete device trust are reserved for the top Premier plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$No founding year or headquarters information published on the pages reviewed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Is there a free plan?$q$, $q$Yes, Duo Free is available at no cost for teams of 10 or fewer users.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$What are Duo's paid plans?$q$, $q$Duo offers three paid editions: Essentials ($3/user/month), Advantage ($6/user/month), and Premier ($9/user/month).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Does Duo require extra hardware?$q$, $q$No, Duo's MFA and passwordless authentication work without additional hardware tokens.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Who owns Duo Security?$q$, $q$Duo Security is owned by Cisco Systems, Inc.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Basic MFA for small teams$q$, $q$Add strong multi-factor authentication for up to 10 users at no cost.$q$, $q$Small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Enterprise identity security$q$, $q$Combine MFA, SSO, device trust, and threat detection for larger organizations.$q$, $q$Enterprises and government agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Duo Free$q$, $q$$0$q$, NULL, $q$["Up to 10 users","Strong MFA","Free authenticator app"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Duo Essentials$q$, $q$$3/user/month$q$, $q$monthly$q$, $q$["Duo Directory","Phishing-resistant MFA","Passwordless authentication","Single sign-on","Unlimited applications"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Duo Advantage$q$, $q$$6/user/month$q$, $q$monthly$q$, $q$["Everything in Essentials","Cisco Identity Intelligence","Duo Passport","Session theft protection","Risk-based authentication"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Duo Premier$q$, $q$$9/user/month$q$, $q$monthly$q$, $q$["Everything in Advantage","Zero Trust access","VPN-less remote access","Complete device trust"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$overview$q$, $q$What is Duo Security?$q$, 2, ARRAY[$q$Duo Security, part of Cisco, is an identity and access management platform centered on phishing-resistant MFA, single sign-on, and device trust.$q$, $q$It scales from a free tier for small teams up to enterprise editions that add identity threat detection, Zero Trust access, and VPN-less remote access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$who-its-for$q$, $q$Who Duo Security is for$q$, 2, ARRAY[$q$Duo serves organizations of many sizes, from small and medium businesses to enterprises, government agencies, and managed service providers across healthcare, finance, and education.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Twingate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zero Trust Network Access platform that replaces traditional VPNs with identity-based, least-privilege access to private resources.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/user/month (Teams plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Twingate: Zero Trust Network Access to replace VPNs, with identity-based least-privilege access and a free tier for small teams.$q$,
  og_description = $q$Twingate: Zero Trust Network Access to replace VPNs, with identity-based least-privilege access and a free tier for small teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b790465f-8d9b-4776-8b1b-364273fb48a0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b790465f-8d9b-4776-8b1b-364273fb48a0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Zero Trust Network Access$q$, $q$Provides remote access to office networks, cloud VPCs, and private resources without a traditional VPN.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Least privilege access controls$q$, $q$Automated, network-layer access policies that limit users and services to only the resources they need.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Device posture checks$q$, $q$Native checks on connecting devices before granting access, as part of conditional access policies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$DNS and content filtering$q$, $q$Built-in internet security features including DNS filtering and threat detection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Broad platform support$q$, $q$Native apps for macOS, Windows, Linux, Chrome OS, iOS, and Android.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Infrastructure-as-code support$q$, $q$Configurable via Terraform, Pulumi, and a REST API for automated deployment.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Free Starter plan available for up to 5 users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Fast deployment marketed as minutes rather than days$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Wide client platform support across desktop and mobile$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Terraform/Pulumi/API support for automated setup$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Clear per-user pricing for Teams and Business tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Enterprise tier pricing is custom/quote-only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Home plan is explicitly limited to non-commercial use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Headquarters and founding year are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Does Twingate have a free plan?$q$, $q$Yes, the Starter plan is free for up to 5 users with broad OS compatibility and peer-to-peer connections.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$What platforms does Twingate support?$q$, $q$Twingate has native clients for macOS, Windows, Linux, Chrome OS, iOS, and Android.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$How much does Twingate cost for a business?$q$, $q$The Teams plan is $5/user/month (up to 100 users) and the Business plan is $10/user/month (up to 500 users), both with a 15% discount when billed yearly.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Is Enterprise pricing available?$q$, $q$Yes, Twingate offers a custom Enterprise plan with custom user limits, SLAs, and geoblocking, priced on request.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$VPN replacement for remote teams$q$, $q$Gives distributed employees identity-based access to internal apps and networks instead of a traditional VPN.$q$, $q$IT and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Securing multi-cloud infrastructure$q$, $q$Uses Terraform/Pulumi and a REST API to codify least-privilege access to cloud VPCs and resources.$q$, $q$DevOps and platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Personal and homelab use$q$, $q$The free Starter plan and paid Home plan let individuals secure access to home networks and personal projects.$q$, $q$Individuals and hobbyists$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Starter$q$, $q$Free$q$, NULL, $q$["Up to 5 users","Broad OS compatibility","Peer-to-peer connections","Split tunneling","Conditional access controls"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Home$q$, $q$$15/month$q$, $q$monthly$q$, $q$["Up to 7 users","Secure service accounts","Exit networks","Device posture checks","MFA support","Non-commercial use only"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Teams$q$, $q$$5/user/month$q$, $q$monthly$q$, $q$["Up to 100 users","SSO via Google Workspace","SaaS application gating","Device posture checks","Automated least-privilege policies"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Business$q$, $q$$10/user/month$q$, $q$monthly$q$, $q$["Up to 500 users","IdP user provisioning","SSO via Okta/Entra ID","Endpoint detection integrations","DNS filtering"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom user limits","Custom MSA & SLAs","Geoblocking","Priority support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$overview$q$, $q$What is Twingate?$q$, 2, ARRAY[$q$Twingate is a Zero Trust Network Access (ZTNA) platform built to replace traditional corporate VPNs. It gives users and services identity-based, direct access to private resources such as office networks, cloud VPCs, and internal applications, enforced through least-privilege policies at the network layer.$q$, $q$The platform includes device posture checks, DNS and content filtering, and audit logging, and can be deployed and managed through Terraform, Pulumi, or its REST API.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$who-its-for$q$, $q$Who Twingate is for$q$, 2, ARRAY[$q$Twingate serves organizations replacing legacy VPNs, development and DevOps teams securing multi-cloud infrastructure, and individuals who use the free Starter plan or paid Home plan to secure personal networks and homelab projects.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Teleport ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Unified identity and access platform that replaces standing credentials with cryptographic, just-in-time access for infrastructure and AI agents.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Oakland, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Teleport unifies identity and access for humans, machines, and AI agents with cryptographic identity and no standing privileges.$q$,
  og_description = $q$Teleport unifies identity and access for humans, machines, and AI agents with cryptographic identity and no standing privileges.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '621c1563-301c-4006-9dc0-beb9d7803b61';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '621c1563-301c-4006-9dc0-beb9d7803b61' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Unified identity layer$q$, $q$A single identity model covering humans, machines, agents, and AI accessing infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Cryptographic, hardware-rooted identity$q$, $q$Eliminates shareable secrets in favor of hardware root-of-trust identity, including HSM, TPM, and biometric support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Ephemeral, just-in-time privileges$q$, $q$Grants time-limited access instead of maintaining standing privileges.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Agentic AI access control$q$, $q$Manages identity and access for AI agents and Model Context Protocol (MCP) tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Comprehensive audit trails$q$, $q$Full visibility and recording of access sessions and workflows across resources.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Compliance-ready access$q$, $q$Supports regulatory requirements including FedRAMP and FIPS 140-2.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Covers servers, Kubernetes, databases, and applications under one identity model$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Eliminates standing privileges and shared credentials$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Supports FedRAMP and FIPS 140-2 compliance requirements$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Active open-source community with 20K+ GitHub stars$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$No published pricing tiers; costs require submitting a form or downloading a pricing guide$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Homepage does not disclose specific plan names or feature comparisons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Founding year is not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$What is Teleport used for?$q$, $q$Teleport provides a unified identity and access layer for humans, machines, and AI agents accessing infrastructure like servers, Kubernetes, and databases.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Is Teleport pricing public?$q$, $q$No, Teleport uses transparent usage-based pricing based on active users and protected resources, but specific figures require requesting a quote or pricing guide.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Does Teleport offer a free trial?$q$, $q$Yes, a free trial is available according to the site.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Where is Teleport headquartered?$q$, $q$Teleport is headquartered at 2100 Franklin St, Suite 400, Oakland, CA 94612.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Privileged access management$q$, $q$Replaces shared credentials and standing privileges with cryptographic, just-in-time access across infrastructure.$q$, $q$Security and IAM teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Multi-cloud infrastructure access$q$, $q$Unifies access to servers, Kubernetes clusters, databases, and applications across cloud environments.$q$, $q$Engineering and DevOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$Governing AI agent access$q$, $q$Manages identity and permissions for AI agents and MCP tools operating in production systems.$q$, $q$Organizations deploying AI agents$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$overview$q$, $q$What is Teleport?$q$, 2, ARRAY[$q$Teleport is an identity and access management platform that gives humans, machines, and AI agents a single, cryptographic identity for reaching infrastructure, eliminating shareable secrets and standing privileges in favor of ephemeral, just-in-time access.$q$, $q$It supports servers, Kubernetes, databases, and applications, with full audit trails and compliance features such as FedRAMP and FIPS 140-2 support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$who-its-for$q$, $q$Who Teleport is for$q$, 2, ARRAY[$q$Teleport is used by engineering teams managing multi-cloud infrastructure, organizations with regulatory compliance requirements, and companies that need to govern access for AI agents alongside human users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── StrongDM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zero Trust Privileged Access Management platform providing runtime access control and session visibility across infrastructure and cloud resources.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$StrongDM is a Zero Trust PAM platform with runtime access control, live session visibility, and no standing privileges across infrastructure.$q$,
  og_description = $q$StrongDM is a Zero Trust PAM platform with runtime access control, live session visibility, and no standing privileges across infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Runtime access management$q$, $q$Adaptive access controls with full session visibility and no standing privileges.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Identity firewall$q$, $q$Continuously enforces authorization across connected resources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Cross-stack coverage$q$, $q$Supports Kubernetes, databases, network devices, cloud services, and servers under one access model.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Live session control$q$, $q$Real-time visibility and control over user actions during active sessions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Credential elimination$q$, $q$Removes standing credentials to reduce theft and lateral-movement risk.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Compliance framework support$q$, $q$Supports NIST 800-53, FedRAMP, HIPAA, SOC 2, PCI DSS 4.0, and ISO 27001.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Single SKU, per-user pricing model with all features included$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$No separate charges by protocol, resource type, or usage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Broad resource coverage across databases, Kubernetes, cloud, and servers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Backed by Delinea following its acquisition of StrongDM$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$No public pricing figures; requires a sales conversation or demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Recent acquisition by Delinea may bring product or roadmap changes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Founding year and headquarters are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$What is StrongDM?$q$, $q$StrongDM is a Zero Trust Privileged Access Management platform offering runtime access control, session visibility, and elimination of standing privileges.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Is StrongDM pricing public?$q$, $q$No, StrongDM uses a single SKU, per-user pricing model with all features included, but exact prices require contacting sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Who owns StrongDM?$q$, $q$StrongDM was recently acquired by Delinea to expand capabilities around agentic AI and context-aware authorization.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$What compliance frameworks does StrongDM support?$q$, $q$StrongDM supports NIST 800-53, FedRAMP, HIPAA, SOC 2, PCI DSS 4.0, and ISO 27001, among other standards.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Privileged access across infrastructure$q$, $q$Provides continuous authorization enforcement and session control for databases, servers, and Kubernetes.$q$, $q$Infrastructure and cloud teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Compliance-driven access management$q$, $q$Helps organizations meet frameworks like FedRAMP, HIPAA, and PCI DSS 4.0 through auditable access control.$q$, $q$Security and IAM professionals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$overview$q$, $q$What is StrongDM?$q$, 2, ARRAY[$q$StrongDM is a Zero Trust Privileged Access Management (PAM) platform that manages runtime access to databases, servers, Kubernetes clusters, network devices, and cloud resources, enforcing authorization continuously rather than relying on standing credentials.$q$, $q$It offers live session visibility and control, letting security teams monitor and interrupt sessions in real time, and supports compliance frameworks such as NIST 800-53, FedRAMP, HIPAA, SOC 2, and PCI DSS 4.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$who-its-for$q$, $q$Who StrongDM is for$q$, 2, ARRAY[$q$StrongDM is aimed at infrastructure, cloud, and security teams that need centralized privileged access management across a mixed technology stack without dictating architecture choices.$q$]::text[], 1);


-- ── Drata ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-driven GRC platform that automates compliance evidence collection, control monitoring, and audit readiness across frameworks like SOC 2 and ISO 27001.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Drata automates GRC operations with AI agents that map controls, collect evidence, and draft security questionnaire responses.$q$,
  og_description = $q$Drata automates GRC operations with AI agents that map controls, collect evidence, and draft security questionnaire responses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0661eaf-0146-4993-862a-300b62279f7d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0661eaf-0146-4993-862a-300b62279f7d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Enterprise GRC control mapping$q$, $q$Unified control mapping, evidence collection, and monitoring across multiple compliance frameworks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Continuous compliance automation$q$, $q$Ongoing evidence collection and control monitoring to keep organizations audit-ready.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Trust Center$q$, $q$A secure portal for sharing security posture with stakeholders and prospective customers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$AI questionnaire assistance$q$, $q$Autonomous agents draft consistent responses to incoming security questionnaires.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Third-party risk management$q$, $q$Automated vendor assessment and risk evaluation workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Agent governance$q$, $q$Discovers and governs AI agents operating in enterprise environments with policy enforcement.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Supports many major frameworks: SOC 2, ISO 27001, ISO 42001, GDPR, HIPAA, PCI DSS, DORA, FedRAMP, and CMMC$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$4.8/5.0 rating on G2$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Large customer base of 8,500+ organizations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$AI-assisted questionnaire responses and agent discovery reduce manual GRC work$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$No pricing details published on the site; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Specific integration list is not detailed on the homepage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Founding year and headquarters are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$What frameworks does Drata support?$q$, $q$Drata supports SOC 2, ISO 27001, ISO 42001, GDPR, HIPAA, PCI DSS, DORA, FedRAMP, CMMC, and custom frameworks.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Does Drata use AI?$q$, $q$Yes, Drata uses AI agents to draft security questionnaire responses and to discover and govern AI agents within an organization's environment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Is Drata pricing public?$q$, $q$No, Drata does not publish pricing; the homepage directs visitors to a demo or contact-sales flow.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$How many customers does Drata have?$q$, $q$Drata states it serves 8,500+ global customers and holds a 4.8/5.0 rating on G2.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Launching a first compliance program$q$, $q$Helps startups get SOC 2 or ISO 27001 readiness in place quickly.$q$, $q$Startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Scaling governance across teams$q$, $q$Expands control monitoring and evidence collection as companies grow.$q$, $q$Growth-stage companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$Managing multi-framework compliance$q$, $q$Supports enterprises managing compliance across multiple regions and frameworks at once.$q$, $q$Enterprise organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$overview$q$, $q$What is Drata?$q$, 2, ARRAY[$q$Drata is a governance, risk, and compliance (GRC) platform that automates evidence collection, control monitoring, and audit preparation across frameworks such as SOC 2, ISO 27001, ISO 42001, GDPR, HIPAA, PCI DSS, DORA, FedRAMP, and CMMC.$q$, $q$It also includes a Trust Center for sharing security posture externally, AI-assisted responses to security questionnaires, and a newer Agent Governance capability that discovers and applies policy to AI agents running in an organization's environment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$who-its-for$q$, $q$Who Drata is for$q$, 2, ARRAY[$q$Drata is built for startups launching their first compliance program, growth-stage companies expanding governance across teams, and enterprises managing compliance across multiple regions and frameworks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Hyperproof ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered GRC platform that automates compliance evidence collection, risk monitoring, and audit management across 160+ frameworks.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Seattle, WA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Hyperproof automates GRC work with AI-assisted control mapping, risk monitoring, and audit management across 160+ frameworks.$q$,
  og_description = $q$Hyperproof automates GRC work with AI-assisted control mapping, risk monitoring, and audit management across 160+ frameworks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0412c80c-5647-4376-b362-9ccece4ef8e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0412c80c-5647-4376-b362-9ccece4ef8e5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Compliance management$q$, $q$Continuous compliance automation with control mapping across frameworks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Risk management$q$, $q$Real-time threat monitoring and mitigation acceleration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Audit management$q$, $q$Evidence collection and secure collaboration with auditors.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Third-party risk management$q$, $q$Vendor assessment automation and ecosystem risk oversight.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Policy management$q$, $q$Centralized governance workflows aligning policies to controls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Hyperproof AI$q$, $q$Human-in-the-loop AI that automates control operations, mapping, and vendor assessments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$160+ pre-built compliance frameworks including HIPAA, SOC 2, ISO 27001, GDPR, PCI DSS, NIST, and FedRAMP$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$200+ integrations including Slack, AWS, ServiceNow, Okta, GitHub, Jira, and Datadog$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Hyperproof Gov offering is FedRAMP Moderate authorized$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$G2 Leader recognition in both Enterprise and Mid-Market categories$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$No pricing published on the site; requires a demo request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$AI feature scope is described only at a high level on the homepage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Founding year is not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$What frameworks does Hyperproof support?$q$, $q$Hyperproof includes 160+ pre-built frameworks such as HIPAA, SOC 2, ISO 27001, GDPR, PCI DSS, NIST standards, FedRAMP, and CMMC.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Does Hyperproof use AI?$q$, $q$Yes, Hyperproof AI automates control operations, mapping, and vendor assessments with human-in-the-loop oversight.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Where is Hyperproof headquartered?$q$, $q$Hyperproof is headquartered in Seattle, WA.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Is there a government-specific version of Hyperproof?$q$, $q$Yes, Hyperproof Gov is FedRAMP Moderate authorized.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Continuous compliance across frameworks$q$, $q$Automates evidence collection and control mapping for organizations managing multiple certifications.$q$, $q$Compliance and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Vendor and third-party risk oversight$q$, $q$Automates vendor risk assessments across an organization's supplier ecosystem.$q$, $q$Risk management teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Regulated industry compliance$q$, $q$Serves healthcare, fintech, aviation, and manufacturing organizations pursuing sector-specific certifications.$q$, $q$Regulated industry organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$overview$q$, $q$What is Hyperproof?$q$, 2, ARRAY[$q$Hyperproof is a governance, risk, and compliance (GRC) platform that automates control mapping, evidence collection, risk monitoring, and audit collaboration across more than 160 pre-built compliance frameworks, including HIPAA, SOC 2, ISO 27001, GDPR, and FedRAMP.$q$, $q$Its Hyperproof AI feature applies human-in-the-loop automation to control operations and vendor assessments, and the platform connects to 200+ tools including Slack, AWS, ServiceNow, Okta, and Jira.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$who-its-for$q$, $q$Who Hyperproof is for$q$, 2, ARRAY[$q$Hyperproof serves organizations across healthcare, technology, fintech, aviation, and manufacturing that need to manage multiple compliance certifications, including government contractors that require its FedRAMP Moderate authorized Hyperproof Gov offering.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Thoropass ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Compliance platform combining a licensed CPA audit firm with AI-assisted software to manage SOC 2, ISO 27001, and other framework audits end-to-end.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Thoropass pairs a licensed CPA audit firm with AI-assisted software to manage SOC 2, ISO 27001, and 30+ compliance frameworks.$q$,
  og_description = $q$Thoropass pairs a licensed CPA audit firm with AI-assisted software to manage SOC 2, ISO 27001, and 30+ compliance frameworks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '39e085ba-918c-440b-8ad4-af576ba5ba03';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '39e085ba-918c-440b-8ad4-af576ba5ba03' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Audit Lifecycle Platform (ALP)$q$, $q$Centralized system managing compliance from readiness through final audit reporting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Multi-framework support$q$, $q$Covers SOC 1/2, ISO 27001, HIPAA, HITRUST, PCI DSS, GDPR, NIST CSF 2.0, CMMC Level 1, and 30+ other frameworks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$AI-powered automation$q$, $q$Suggests control mappings, identifies gaps, and organizes audit evidence.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Penetration testing$q$, $q$CREST-accredited pentest services with audit-ready reporting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Vulnerability scanning$q$, $q$On-demand and scheduled scans with exportable audit evidence.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Compliance Suite monitoring$q$, $q$Real-time monitoring and alerts to maintain continuous compliance.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Bundles a licensed CPA audit firm (Laika Compliance, LLC) with the software platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Supports 30+ compliance frameworks with overlapping control mapping$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Includes in-house CREST-accredited penetration testing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Trusted by more than 1,000 organizations globally$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$No published pricing; quotes vary by framework, scope, and company size$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Bundled audit-plus-software model may cost more than software-only tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Founding year and headquarters are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$What is Thoropass?$q$, $q$Thoropass is a compliance and audit platform that combines a licensed CPA audit firm with AI-assisted software to manage security certifications like SOC 2 and ISO 27001.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Is Thoropass pricing public?$q$, $q$No, pricing varies by frameworks pursued, audit scope, company size, and required services, and is provided as a tailored quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Does Thoropass perform penetration testing?$q$, $q$Yes, Thoropass offers CREST-accredited penetration testing with audit-ready reporting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$How many frameworks does Thoropass support?$q$, $q$Thoropass supports SOC 1/2, ISO 27001, HIPAA, HITRUST, PCI DSS, GDPR, NIST CSF 2.0, CMMC Level 1, and 30+ additional frameworks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$End-to-end SOC 2 or ISO 27001 audits$q$, $q$Combines software and an in-house CPA audit firm to manage the full audit lifecycle.$q$, $q$Startups and SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Multi-framework compliance$q$, $q$Maps overlapping controls across frameworks to reduce duplicate audit work.$q$, $q$Regulated companies pursuing multiple certifications$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$overview$q$, $q$What is Thoropass?$q$, 2, ARRAY[$q$Thoropass is a compliance and audit platform that pairs its own licensed CPA firm, Laika Compliance, LLC (dba Thoropass Assurance), with AI-assisted software for managing security audits. Its Audit Lifecycle Platform (ALP) covers readiness, evidence organization, and final reporting for frameworks including SOC 1/2, ISO 27001, HIPAA, HITRUST, and PCI DSS.$q$, $q$The company also offers CREST-accredited penetration testing and vulnerability scanning, and its leadership includes co-founders Sam Li, Austin Ogilvie, and Eva Pittas.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$who-its-for$q$, $q$Who Thoropass is for$q$, 2, ARRAY[$q$Thoropass serves companies across healthcare, SaaS, and fintech pursuing compliance certifications, from startups to enterprises, and is used by more than 1,000 organizations globally.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Sprinto ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Automation-led compliance platform that continuously monitors controls and evidence to help companies achieve SOC 2 and other certifications.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sprinto automates SOC 2 and other compliance work with continuous control monitoring, 200+ integrations, and expert guidance.$q$,
  og_description = $q$Sprinto automates SOC 2 and other compliance work with continuous control monitoring, 200+ integrations, and expert guidance.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '01db3fa1-4544-4df3-b94a-c8779f0ed121';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '01db3fa1-4544-4df3-b94a-c8779f0ed121' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Automation-led compliance monitoring$q$, $q$Evaluates over 1 million compliance checks monthly across connected systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Centralized compliance dashboard$q$, $q$Manages multiple compliance frameworks and controls from one place.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$1:1 expert guidance$q$, $q$Onboarding support and 24/7 assistance throughout the compliance process.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$200+ integrations$q$, $q$Connects to a wide range of tools for continuous risk visibility.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Policy templates$q$, $q$Ready-to-use templates to speed up compliance documentation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Built-in lightweight MDM$q$, $q$Includes mobile device management as part of the platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Rated #1 for ease of use on G2 by 900+ customers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Includes built-in lightweight MDM, reducing need for a separate tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$200+ integrations for continuous compliance monitoring$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$1:1 expert guidance included alongside the software$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$No public pricing plans found on the site; not verifiable without contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Marketing claims (e.g., cost/time savings) are self-reported and not independently verified$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Founding year and headquarters are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$What does Sprinto automate?$q$, $q$Sprinto automates SOC 2 and other compliance work, evaluating over 1 million compliance checks monthly and providing continuous control monitoring.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Does Sprinto include device management?$q$, $q$Yes, Sprinto includes a built-in lightweight Mobile Device Management (MDM) capability.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$How many integrations does Sprinto support?$q$, $q$Sprinto supports 200+ integrations for compliance risk visibility.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Is Sprinto's pricing public?$q$, $q$Specific pricing plans were not available on the pages reviewed; interested buyers should check Sprinto's site directly or contact sales.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$SOC 2 Type II certification$q$, $q$Automates evidence collection and monitoring to help SaaS companies reach SOC 2 certification faster.$q$, $q$SaaS and tech companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Ongoing multi-framework compliance$q$, $q$Provides a centralized dashboard to manage several compliance frameworks continuously.$q$, $q$Compliance and security teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$overview$q$, $q$What is Sprinto?$q$, 2, ARRAY[$q$Sprinto is a compliance automation platform focused on frameworks like SOC 2, running continuous checks (over 1 million monthly) against connected systems to keep controls and evidence audit-ready.$q$, $q$It pairs automation with 1:1 expert guidance, 200+ integrations, policy templates, and a built-in lightweight MDM for device compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$who-its-for$q$, $q$Who Sprinto is for$q$, 2, ARRAY[$q$Sprinto is aimed at SaaS and tech companies pursuing SOC 2 Type II certification, particularly teams with limited in-house compliance resources who need to meet customer security requirements.$q$]::text[], 1);


-- ── Scrut Automation ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GRC automation platform with AI agents that continuously monitor controls, validate evidence, and manage vendor risk across 60+ frameworks.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Scrut Automation uses AI agents to monitor controls, validate evidence, and manage vendor risk across 60+ compliance frameworks.$q$,
  og_description = $q$Scrut Automation uses AI agents to monitor controls, validate evidence, and manage vendor risk across 60+ compliance frameworks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '52bf5267-89af-4200-b109-d8ec448cc105';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '52bf5267-89af-4200-b109-d8ec448cc105' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Continuous control monitoring$q$, $q$24/7 automated evaluation of security controls with real-time gap notifications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Scrut Teammates$q$, $q$AI-powered agents that provide guided remediation, evidence validation, and automated security questionnaire completion.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Pre-built compliance library$q$, $q$60+ frameworks including SOC 2, ISO 27001, GDPR, PCI DSS, HIPAA, and NIST AI RMF.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Customizable workflows$q$, $q$Supports custom frameworks, controls, and risk formulas.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Audit streamlining$q$, $q$Centralized audit tracking and evidence collection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Vendor risk management$q$, $q$AI-driven third-party risk assessments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$60+ pre-built frameworks including NIST AI RMF$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$AI agents (Scrut Teammates) automate evidence validation and questionnaire responses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Monitors 10 million+ assets monthly across customers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Recognized in Forrester's GRC Platforms Landscape (Q4 2025) and G2 Top 50$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$No public pricing found; the pricing page was not accessible during research$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Specific integration list is not detailed on the homepage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Founding year and headquarters are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$What are Scrut Teammates?$q$, $q$Scrut Teammates are AI-powered agents that provide guided remediation, intelligent evidence validation, and automated security questionnaire completion.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$How many frameworks does Scrut support?$q$, $q$Scrut offers 60+ pre-built frameworks, including SOC 2, ISO 27001, GDPR, PCI DSS, HIPAA, and NIST AI RMF.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$How many customers use Scrut?$q$, $q$Scrut states it serves 2,500+ organizations and monitors 10 million+ assets monthly.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Is Scrut's pricing public?$q$, $q$Specific pricing details were not accessible on the site during research; Scrut appears to use a demo/consultation-based sales approach.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Rapid compliance readiness$q$, $q$Helps startups quickly stand up controls and evidence collection for their first framework.$q$, $q$Startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$Managing multiple frameworks at scale$q$, $q$Supports growth-stage and enterprise companies running several compliance frameworks simultaneously.$q$, $q$Growth-stage and enterprise companies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$overview$q$, $q$What is Scrut Automation?$q$, 2, ARRAY[$q$Scrut Automation is a governance, risk, and compliance (GRC) platform that continuously monitors security controls and automatically collects evidence across 60+ pre-built frameworks, including SOC 2, ISO 27001, GDPR, PCI DSS, HIPAA, and NIST AI RMF.$q$, $q$Its 'Scrut Teammates' are AI agents that assist with guided remediation, evidence validation, and automated completion of security questionnaires, alongside vendor risk assessment tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$who-its-for$q$, $q$Who Scrut Automation is for$q$, 2, ARRAY[$q$Scrut serves startups needing rapid compliance readiness as well as growth-stage and enterprise companies managing multiple frameworks across industries such as enterprise software, financial services, healthcare, and travel.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Astra Security ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered continuous penetration testing platform combining PTaaS, DAST, API security, and cloud vulnerability scanning.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$69/month (DAST Scanner Lite)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Astra Security offers AI-powered pentesting, DAST, API security, and cloud vulnerability scanning with a $7 trial week and published pricing.$q$,
  og_description = $q$Astra Security offers AI-powered pentesting, DAST, API security, and cloud vulnerability scanning with a $7 trial week and published pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Penetration Testing as a Service (PTaaS)$q$, $q$Hacker-style vulnerability assessments with real-time collaboration between customers and testers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$DAST scanner$q$, $q$Dynamic application security testing covering 10,000+ vulnerabilities, including the OWASP Top 10.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$API security platform$q$, $q$Discovers shadow, zombie, and undocumented APIs and scans them for vulnerabilities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Cloud vulnerability scanner$q$, $q$Agentless scanning detecting 400+ misconfigurations across AWS, Azure, and GCP.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$AI-powered threat modeling$q$, $q$Uses AI to correlate and prioritize discovered vulnerabilities.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$CI/CD and ticketing integrations$q$, $q$Integrates with CI/CD pipelines, Slack, and Jira for remediation workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Trust Center$q$, $q$Demonstrates compliance posture for standards such as SOC 2, HIPAA, and ISO.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Published, transparent pricing across pentest, DAST, API, and cloud products$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Low-cost $7 trial week with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Covers web, API, and cloud security under one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$4.6 G2 rating and 1,000+ engineering team customers cited$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Enterprise tiers for Pentest, API, and Cloud products remain custom/quote-only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Per-product, per-target pricing can add up for organizations with many assets$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Headquarters and founding year are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Does Astra Security offer a free trial?$q$, $q$Yes, a $7 trial week is available for the DAST Scanner, API Scanner, and Cloud Starter products, with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$How much does Astra's DAST scanner cost?$q$, $q$The Scanner Lite tier starts at $69/month ($699/year), with a Scanner tier at $199/month and a Scanner Agency tier at $499/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Does Astra do penetration testing?$q$, $q$Yes, Astra offers Pentest Auto starting at $1,999/year and Pentest Expert (manual, certified-expert testing) at $5,999/year, plus a custom Enterprise tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Does Astra scan cloud infrastructure?$q$, $q$Yes, its Cloud Security Platform scans AWS, Azure, and GCP for 400+ misconfigurations, starting at $99/month for Cloud Starter.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Continuous web application security testing$q$, $q$Runs ongoing DAST scans covering 10,000+ tests including the OWASP Top 10.$q$, $q$Engineering and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$API attack surface discovery$q$, $q$Finds undocumented and shadow APIs and scans them for vulnerabilities.$q$, $q$Teams managing API-driven products$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Cloud misconfiguration detection$q$, $q$Agentless scanning across AWS, Azure, and GCP to catch security misconfigurations.$q$, $q$Cloud and DevOps teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Compliance-driven penetration testing$q$, $q$Combines automated and manual pentesting with compliance reporting for SOC 2, HIPAA, and ISO audits.$q$, $q$Companies handling sensitive data$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Scanner Lite$q$, $q$$69/month or $699/year$q$, $q$monthly$q$, $q$["1 target","3 monthly scans, 10,000+ tests","Authenticated scanning","1 integration","AI vulnerability assistance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Scanner$q$, $q$$199/month or $1,999/year$q$, $q$monthly$q$, $q$["1 target","Unlimited scans, 10,000+ tests","Unlimited integrations","4 expert-vetted scans annually","Compliance reporting"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Scanner Agency$q$, $q$$499/month or $4,999/year$q$, $q$monthly$q$, $q$["5-target pool (changeable every 30 days)","Everything in Scanner","Dedicated account manager"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Pentest Auto$q$, $q$$1,999/year$q$, $q$annual$q$, $q$["1 target","Autonomous pentest equivalent to a 2-week manual engagement","Same-day first report","Compliance reports","1 expert re-scan"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Pentest Expert$q$, $q$$5,999/year$q$, $q$annual$q$, $q$["1 target","Manual pentesting by certified experts","Cloud config review","API testing","2 re-scans","Verifiable certificate"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Cloud Starter$q$, $q$$99/month or $999/year$q$, $q$monthly$q$, $q$["1 cloud target (AWS/Azure/GCP)","Unlimited automated scans","250 resources/month","PDF reports"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Cloud Growth$q$, $q$$199/month or $1,999/year$q$, $q$monthly$q$, $q$["3 cloud targets","1,000 resources/month","Priority support","Slack/Jira integration","Compliance mapping"]$q$::jsonb, 6);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$overview$q$, $q$What is Astra Security?$q$, 2, ARRAY[$q$Astra Security is a continuous security testing platform combining Penetration Testing as a Service (PTaaS), a DAST scanner covering 10,000+ vulnerability checks, an API security platform that finds shadow and undocumented APIs, and a cloud vulnerability scanner for AWS, Azure, and GCP.$q$, $q$It uses AI to correlate and prioritize vulnerabilities, integrates with CI/CD pipelines, Slack, and Jira, and publishes tiered pricing across each product, including a $7 trial week for select plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$who-its-for$q$, $q$Who Astra Security is for$q$, 2, ARRAY[$q$Astra is aimed at engineering and security teams that need ongoing, rather than one-time, security testing for web applications, APIs, and cloud infrastructure, including companies handling sensitive data such as healthcare information.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;


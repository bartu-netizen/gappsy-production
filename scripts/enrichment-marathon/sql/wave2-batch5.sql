-- Enrichment marathon batch: Airmeet, Airtable, AirTrail, Airwallex, Aiven, Akaunting, Akeyless, Akiflow

-- ── Airmeet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Airmeet is a cloud-based platform for hosting virtual, hybrid, and in-person webinars and events, with AI-powered content tools and engagement features.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$167/month$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Airmeet: AI-Powered Virtual & Hybrid Event Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Airmeet lets teams host webinars, conferences, and hybrid events with AI content tools, live engagement features, and real-time analytics.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Airmeet is a cloud-based event platform, founded in 2019, that enables organizations to host virtual, hybrid, and in-person webinars, conferences, and other events. The platform includes AirGenie, an AI-powered tool that generates event summaries, blog posts, social media content, and performance analytics. Airmeet's engagement features include live polls, Q&A, emoji reactions, leaderboards, gamification, virtual lounges, breakout rooms, and speed networking. Organizers can apply custom branding and white-labeling, and access real-time analytics on attendance and audience behavior. The platform integrates with 50+ apps, including HubSpot, and offers iOS and Android mobile apps. Airmeet is used across industries such as enterprise, mid-market, associations, education, healthcare, finance, and non-profits, for use cases like webinars, townhalls, conferences, job fairs, learning and development, product launches, sales kickoffs, and virtual expos. Pricing is tiered: a Premium Webinars plan starts at $167/month (billed yearly) or $199/month (billed monthly) for up to 100 attendees and 150 events per year, with an Events plan and a Managed Events service (full-service event planning starting around $4,999 per event) available at custom quoted pricing for larger, multi-format needs. An Agency plan with pay-per-attendee pricing is also offered. Airmeet reports it is used by 4,000+ organizations, including large enterprises, and holds a 4.6/5 rating on G2 from 750+ reviews.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$AirGenie AI content generation$q$, $q$Automatically creates event summaries, blog posts, social media content, and performance analytics from event data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Live engagement tools$q$, $q$Polls, Q&A, emoji reactions, leaderboards, and gamification to keep attendees engaged during live sessions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Networking spaces$q$, $q$Virtual lounges, breakout rooms, and speed networking for attendee-to-attendee interaction.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Custom branding and white-labeling$q$, $q$Auto-branded, customizable event experiences to match an organizer's identity.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Real-time analytics$q$, $q$Attendance tracking, engagement metrics, and audience behavior insights with a report builder.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Hybrid and in-person support$q$, $q$Multi-track events with parallel sessions and on-site check-in via mobile app, available on higher-tier plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Monetization tools$q$, $q$Ticketing and sponsorship features for revenue-generating events.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$App integrations$q$, $q$50+ integrations including HubSpot, plus iOS and Android mobile apps.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$AI-powered content generation (AirGenie) automates post-event summaries and marketing assets$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Wide range of engagement and networking features for interactive virtual events$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Supports virtual, hybrid, and in-person formats on a single platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Scalable attendee capacity from 100 up to 10,000 per event$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Entry-level Premium Webinars plan is capped at 2 team seats$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Events and Agency plans require custom quotes rather than transparent self-serve pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Managed Events service pricing starts relatively high (from $4,999 per event)$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$What is Airmeet used for?$q$, $q$Airmeet is used to host virtual, hybrid, and in-person events such as webinars, conferences, townhalls, product launches, and job fairs, with built-in engagement and networking tools.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Does Airmeet offer a free trial?$q$, $q$Yes, Airmeet offers a free trial through its sign-up portal, in addition to its paid plans.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$How much does Airmeet cost?$q$, $q$Airmeet's Premium Webinars plan starts at $167/month billed yearly (or $199/month billed monthly). Higher-tier Events, Managed Events, and Agency plans are priced via custom quote.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$What is AirGenie?$q$, $q$AirGenie is Airmeet's AI-powered feature that automatically generates event summaries, blog posts, social media content, and performance analytics from event data.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Does Airmeet support hybrid events?$q$, $q$Yes, Airmeet's Events plan supports virtual, hybrid, and in-person event formats, including multi-track sessions and on-site mobile check-in.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Corporate webinars and townhalls$q$, $q$Companies use Airmeet's Premium Webinars plan to run live, simulive, or on-demand webinars with analytics and CRM integrations.$q$, $q$Marketing and communications teams at mid-market and enterprise companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Hybrid and in-person conferences$q$, $q$Organizations use the Events plan to run multi-track conferences combining virtual, hybrid, and in-person attendees with personalized experiences.$q$, $q$Event teams at associations, enterprises, and conference organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Fully managed brand conferences$q$, $q$Organizations that lack internal event production resources use Airmeet's Managed Events service for end-to-end planning and execution.$q$, $q$Enterprises and brands running large flagship conferences$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Premium Webinars$q$, $q$$167/month (yearly) or $199/month (monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["Up to 100+ attendees, scalable to 10,000","2 team members","Up to 150 events annually","Live, simulive, and on-demand webinars","In-depth analytics with report builder","CRM integrations and ticketing/sponsorship monetization","iOS and Android apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Events$q$, $q$Custom quote$q$, $q$Custom$q$, NULL, $q$["5 team members","Up to 250 events annually","Virtual, hybrid, and in-person formats","Multi-track events with parallel sessions","Custom email domain and scheduled private meetings","Dedicated customer success manager"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Managed Events$q$, $q$Starting from $4,999 per brand conference$q$, $q$Per event$q$, NULL, $q$["Full-service event planning and hosting","Custom landing page design","End-to-end registration management","Speaker prep and dry-runs","Multilingual closed captions and transcripts","Dedicated event success manager"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Agency$q$, $q$Custom (contact sales)$q$, $q$Custom$q$, NULL, $q$["Zero platform fee","Unlimited registrations, pay per attendee","Up to 250 events per year","Enterprise-grade features","Priority support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Airmeet is a cloud-based platform for hosting virtual, hybrid, and in-person events, including webinars, conferences, townhalls, and product launches. Founded in 2019, the platform combines live-streaming and event management tools with AI-powered content generation and real-time analytics.$q$, $q$The platform is aimed at organizations across enterprise, mid-market, associations, education, healthcare, finance, and non-profit sectors that need to run large-scale, interactive events with engagement and networking built in.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Airmeet's AirGenie AI tool automatically generates event summaries, blog posts, social content, and performance analytics from event data. Engagement tools include live polls, Q&A, emoji reactions, leaderboards, and gamification, while networking features include virtual lounges, breakout rooms, and speed networking.$q$, $q$Organizers can apply custom branding and white-labeling, monetize events through ticketing and sponsorships, and track real-time attendance and engagement analytics. The platform offers 50+ third-party integrations, including HubSpot, plus iOS and Android apps.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Airmeet's Premium Webinars plan starts at $167/month billed yearly (or $199/month billed monthly) for up to 100 attendees and 150 events annually, with 2 team seats included. The Events plan adds hybrid and in-person formats, multi-track sessions, and a dedicated customer success manager, priced via custom quote.$q$, $q$Managed Events is a full-service offering starting from $4,999 per brand conference, where Airmeet's team handles event planning, registration, and hosting. An Agency plan with a pay-per-attendee model and zero platform fee is also available on request.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Airtable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Airtable is a no-code platform that combines a relational database with spreadsheet-style interfaces, letting teams build custom apps, workflows, and AI-powered automations.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$700-1,000 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Airtable: No-Code Database & App Builder$q$, seo_title),
  seo_meta_description = COALESCE($q$Airtable combines a database with spreadsheet simplicity so teams can build custom apps, automations, and AI workflows without code. Free plan available.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Airtable is a cloud-based no-code platform, founded in 2012 by Howie Liu, Andrew Ofstad, and Emmett Nicholas and headquartered in San Francisco, California. It combines the flexibility of a relational database with the familiar interface of a spreadsheet, allowing individuals and teams to organize data, build custom applications, and automate workflows without writing code. Core capabilities include customizable tables and views (grid, kanban, calendar, gallery, Gantt), Interfaces for building dashboards and apps from underlying data, Automations for triggering workflows, and Portals for guest collaboration with external stakeholders. Airtable has expanded into AI-powered features, including AI-assisted app building and AI agents that can act across records, with integrations available for models from OpenAI, Google, Meta, and Anthropic, as well as third-party tools like Slack, Google Drive, Salesforce, Jira, and Zendesk. The platform is used by product, marketing, operations, sales, HR, and finance teams across industries such as agencies, retail, media, education, and manufacturing. Airtable offers a free tier and paid Team, Business, and Enterprise Scale plans priced per user with annual billing; it is available via web browser, iOS, Android, and desktop apps for Mac and Windows.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f8d0b370-224b-4156-8af1-97a407f171ba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f8d0b370-224b-4156-8af1-97a407f171ba' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f8d0b370-224b-4156-8af1-97a407f171ba';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Relational Database with Spreadsheet UI$q$, $q$Organize data in linked tables using a familiar grid interface, with support for kanban, calendar, gallery, and timeline views.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Interfaces$q$, $q$Build custom dashboards and lightweight apps on top of base data for different roles across a team.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Automations$q$, $q$Trigger workflows and actions automatically based on record changes, schedules, or form submissions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$AI Agents and App Building$q$, $q$Use conversational, AI-assisted tools to build apps and deploy agents that can act across records and connected tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Portals$q$, $q$Share and collect data securely with external guests and stakeholders outside the core team.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Third-Party Integrations$q$, $q$Connect to tools like Slack, Google Drive, Salesforce, Jira, and Zendesk, plus AI models from OpenAI, Google, Meta, and Anthropic.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'f8d0b370-224b-4156-8af1-97a407f171ba';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Flexible no-code database that non-technical users can adopt quickly$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Wide range of views and templates for different workflow types$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Strong integration ecosystem including major AI models and business tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Scales from free individual use to enterprise-grade deployments$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'f8d0b370-224b-4156-8af1-97a407f171ba';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Per-seat pricing on paid plans can become costly for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Advanced features like automations and AI agents may require a learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Enterprise-level administrative and security features require the most expensive plan$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'f8d0b370-224b-4156-8af1-97a407f171ba';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Is Airtable free to use?$q$, $q$Yes, Airtable offers a Free plan for individuals and small teams with no charge, alongside paid Team, Business, and Enterprise Scale plans for additional capacity and features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$What platforms does Airtable support?$q$, $q$Airtable is available as a web app, with native mobile apps for iOS and Android, and desktop applications for Mac and Windows.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Does Airtable support AI features?$q$, $q$Yes, Airtable offers AI-assisted app building and AI agents, with integrations to AI models including OpenAI, Google's Gemini, Meta's Llama, and Anthropic's Claude.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Who founded Airtable and when?$q$, $q$Airtable was founded in 2012 by Howie Liu, Andrew Ofstad, and Emmett Nicholas, and is headquartered in San Francisco, California.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f8d0b370-224b-4156-8af1-97a407f171ba';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Project and Workflow Tracking$q$, $q$Teams organize tasks, timelines, and dependencies using linked tables, kanban boards, and Gantt-style views.$q$, $q$Product, operations, and marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$CRM and Sales Pipeline Management$q$, $q$Sales teams track leads, deals, and customer interactions in a customizable relational database.$q$, $q$Sales and business development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$External Data Collection via Portals$q$, $q$Organizations collect information from vendors, clients, or partners through guest-accessible portals without giving full base access.$q$, $q$Agencies and operations teams working with external stakeholders$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'f8d0b370-224b-4156-8af1-97a407f171ba';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["For individuals and small teams with lightweight needs"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Team$q$, $q$$20/user/month$q$, $q$Billed annually$q$, NULL, $q$["More capacity than Free plan","Additional views and automation limits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Business$q$, $q$$45/user/month$q$, $q$Billed annually$q$, NULL, $q$["Additional customization","Greater data scale and flexibility","Administrative features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Enterprise Scale$q$, $q$Custom pricing$q$, $q$Annual invoice$q$, NULL, $q$["Unlimited org units, workspaces, and bases","Flexible payment options (PO, ACH, wire, check)","Advanced security and administration"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'f8d0b370-224b-4156-8af1-97a407f171ba';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Airtable is a cloud-based platform that blends database structure with a spreadsheet-like interface, enabling users to store, organize, and link data without technical expertise. Founded in 2012 and based in San Francisco, the company has grown into a widely used tool for building custom business applications and workflows.$q$, $q$Beyond basic data organization, Airtable now positions itself as a platform for building AI-powered apps and agents that can operate across large datasets and automate multi-step processes across a team's tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Airtable's core features include customizable views (grid, kanban, calendar, gallery, timeline/Gantt), linked records for relational data modeling, Interfaces for building simplified dashboards from base data, and Automations for triggering actions based on record changes or schedules.$q$, $q$Newer additions include AI-assisted app and agent building, integrations with third-party AI models (OpenAI, Gemini, Llama, and Anthropic's Claude), and Portals for securely sharing and collecting data from external guests.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Airtable offers a Free plan for individuals and small teams with lightweight needs. Paid plans are billed per user: the Team plan starts at $20/user/month (billed annually) and the Business plan at $45/user/month (billed annually), each unlocking additional customization, automation, and administrative controls.$q$, $q$An Enterprise Scale plan with custom pricing is available for organizations needing unlimited workspaces, advanced security, and support for very large record volumes, with billing handled through annual invoicing.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Airtable is used by product, marketing, operations, sales, HR, and finance teams, as well as agencies and organizations in retail, media & entertainment, education, and manufacturing that need to track and connect data without dedicated engineering resources.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── AirTrail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AirTrail is a free, open-source, self-hosted flight tracking app that lets users log flights, visualize them on an interactive world map, and view travel statistics.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AirTrail: Self-Hosted Personal Flight Tracker$q$, seo_title),
  seo_meta_description = COALESCE($q$AirTrail is a free, open-source, self-hosted app for logging flights, mapping travel on an interactive world map, and viewing flight statistics.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AirTrail is a free, open-source, self-hosted personal flight tracking application created and maintained by developer Johan Ohly, released under the GNU General Public License v3.0 (GPL-3.0). It lets individuals log their flight history and view it as an interactive world map, alongside statistics such as total distance traveled, flight time, number of airports and airlines visited. Users can import existing flight data from other trackers and services, including MyFlightRadar24, App in the Air, JetLog, TripIt, Flighty, byAir, JetLovers, and OpenFlights. AirTrail supports multiple user accounts with authentication (including OAuth provider integration) so flights can be shared or managed across users while keeping data isolated and privately controlled, since the app runs entirely on infrastructure the user owns rather than a third-party cloud service. It is built with SvelteKit and TypeScript on the frontend, a PostgreSQL database on the backend, and is distributed as a Docker image (johly/airtrail) with support for Docker Compose deployment and a one-line install script for Linux/Docker hosts; the source code is available on GitHub (johanohly/AirTrail), where the project has attracted over 1,000 stars. There is no paid tier, company, or commercial support behind AirTrail — it is a community-maintained open-source project aimed at aviation enthusiasts, frequent flyers, and privacy-conscious users who want to own and control their personal flight data instead of relying on a hosted third-party flight-logging service.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af972f5d-442a-4182-b478-b2ab2783c080';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af972f5d-442a-4182-b478-b2ab2783c080' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'af972f5d-442a-4182-b478-b2ab2783c080';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Interactive World Map$q$, $q$Visualizes all logged flights and routes on an interactive world map.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Flight History Tracking$q$, $q$Keeps a searchable, filterable record of all logged flights and airports.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Travel Statistics$q$, $q$Provides analytics such as total distance flown, flight time, and airport/airline counts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Multi-Source Import$q$, $q$Imports existing flight data from services like MyFlightRadar24, App in the Air, JetLog, TripIt, Flighty, byAir, JetLovers, and OpenFlights.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Multi-User Support with Authentication$q$, $q$Supports multiple user accounts, including OAuth provider integration, so flights can be shared or kept private per user.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Light and Dark Mode$q$, $q$Includes light and dark theme options with automatic adaptation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Docker-Based Self-Hosting$q$, $q$Deployable via a one-line install script, Docker, or Docker Compose for full control over hosting and data.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'af972f5d-442a-4182-b478-b2ab2783c080';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Free and open source under GPL-3.0, with no subscription cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Self-hosted, giving users full ownership and control of their flight data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Supports importing data from several popular existing flight-tracking services$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Multi-user support with authentication, useful for households or groups sharing flight logs$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'af972f5d-442a-4182-b478-b2ab2783c080';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Requires self-hosting knowledge (Docker/Docker Compose) rather than offering a managed hosted version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$No official company or paid support behind the project, since it's a community-maintained open-source tool$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$No native mobile apps mentioned; access is via a self-hosted web interface$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'af972f5d-442a-4182-b478-b2ab2783c080';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Is AirTrail free to use?$q$, $q$Yes, AirTrail is free and open source, released under the GNU General Public License v3.0 (GPL-3.0).$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Do I need to host AirTrail myself?$q$, $q$Yes, AirTrail is a self-hosted application, typically deployed via Docker or Docker Compose on your own server or infrastructure.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Can I import flight data from other apps?$q$, $q$Yes, AirTrail supports importing flight history from services including MyFlightRadar24, App in the Air, JetLog, TripIt, Flighty, byAir, JetLovers, and OpenFlights.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Does AirTrail support multiple users?$q$, $q$Yes, AirTrail supports multiple user accounts with authentication, including OAuth provider integration, allowing flights to be managed or shared among users.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$What technology is AirTrail built with?$q$, $q$AirTrail is built with SvelteKit and TypeScript on the frontend and uses a PostgreSQL database, distributed as a Docker image.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'af972f5d-442a-4182-b478-b2ab2783c080';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Personal flight history tracking$q$, $q$Frequent flyers and aviation enthusiasts can log every flight they take and see it visualized on a world map with statistics.$q$, $q$Individual travelers and aviation enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Privacy-conscious flight logging$q$, $q$Users who don't want their travel data stored on a third-party cloud service can self-host AirTrail to keep full control of their data.$q$, $q$Privacy-focused self-hosters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Shared family or group flight logs$q$, $q$Households or groups can use AirTrail's multi-user support to track and share flight history among several accounts.$q$, $q$Families or small groups of frequent travelers$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'af972f5d-442a-4182-b478-b2ab2783c080';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AirTrail is an open-source, self-hosted flight tracking application built by developer Johan Ohly. It allows users to log every flight they've taken, visualize their travel history on an interactive world map, and review statistics like total distance flown, flight time, and airports and airlines visited.$q$, $q$Because it is self-hosted, all flight data stays on infrastructure the user controls rather than a third-party server, which the project positions as a privacy-focused alternative to hosted flight-logging services.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include an interactive world map of logged flights, searchable flight history, travel statistics and analytics, multi-user accounts with authentication (including OAuth provider support), light and dark theme options, and a responsive interface. AirTrail also supports importing existing flight data from other trackers and services such as MyFlightRadar24, App in the Air, JetLog, TripIt, Flighty, byAir, JetLovers, and OpenFlights.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$self-hosting$q$, $q$Self-Hosting and Tech Stack$q$, 2, ARRAY[$q$AirTrail is distributed as a Docker image (johly/airtrail on Docker Hub) and can be deployed via a one-line install script, Docker Compose, or manually from source. It is built with SvelteKit and TypeScript on the frontend and uses PostgreSQL as its database. The source code is hosted on GitHub under johanohly/AirTrail and released under the GNU General Public License v3.0 (GPL-3.0), with no paid tier or company behind the project.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Airwallex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Airwallex is a global fintech platform providing multi-currency business accounts, payments, spend management, and embedded finance APIs for companies operating across borders.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$1,800-2,500 employees$q$, company_size),
  headquarters = COALESCE($q$Singapore and San Francisco, USA (dual headquarters)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Airwallex: Global Business Accounts & Payments$q$, seo_title),
  seo_meta_description = COALESCE($q$Airwallex offers multi-currency business accounts, global payments, spend management, and embedded finance APIs for international companies.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Airwallex is a global financial technology platform, founded in 2015 in Melbourne, Australia, and now dual-headquartered in Singapore and San Francisco. It provides businesses with an integrated set of financial tools instead of requiring multiple banking relationships: multi-currency business accounts for holding and receiving funds in 20+ currencies, international transfers to 200+ countries, multi-currency corporate cards, spend and expense management with approval workflows, online payment acceptance and checkout tools, subscription billing and invoicing, and a suite of embedded finance APIs (Platform APIs) that let other companies build payment and card-issuing products on top of Airwallex's infrastructure. Airwallex offers a free Explore plan, a paid Grow plan starting at $12 per user per month for growing teams needing advanced spend controls and an AI-driven expense policy agent, and a custom-priced Accelerate plan for large enterprises with multi-entity management needs. Beyond subscription fees, Airwallex charges transaction-based fees for currency conversion, SWIFT transfers, and card payments. The platform serves more than 200,000 businesses worldwide, including travel companies, e-commerce retailers, SaaS businesses, and marketplaces, with customers such as Xero, Canva, Rippling, and Qantas. It holds PCI DSS, SOC 1, and SOC 2 compliance certifications. Airwallex is best suited for companies with cross-border operations that want to consolidate banking, cards, payments, and treasury into a single platform rather than stitching together separate providers.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3f26fe2f-0d14-4d94-8521-de088090412c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3f26fe2f-0d14-4d94-8521-de088090412c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Multi-Currency Business Accounts$q$, $q$Hold and receive funds in 20+ currencies with local account details in major markets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Global Money Transfers$q$, $q$Send batch payments to 200+ countries and regions at rates close to interbank FX.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Multi-Currency Corporate Cards$q$, $q$Issue unlimited virtual and physical corporate cards with real-time spend controls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Spend & Expense Management$q$, $q$Track expenses, manage bill pay, and enforce approval workflows across teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Payment Acceptance$q$, $q$Accept online payments via checkout tools and local payment methods across major eCommerce platforms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Billing & Invoicing$q$, $q$Manage subscription billing, usage-based billing, and invoicing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Embedded Finance (Platform APIs)$q$, $q$Build payment, payout, and card-issuing products on top of Airwallex's infrastructure.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$AI Expense Policy Agent$q$, $q$Automated policy enforcement and rules-based approvals on Grow and Accelerate plans.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Consolidates multi-currency banking, cards, payments, and billing in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Free Explore plan gives smaller businesses no-cost access to global accounts and cards$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$FX rates close to interbank rates compared with traditional banks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Extensive currency and country coverage for international businesses$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Strong compliance certifications (PCI DSS, SOC 1, SOC 2)$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Transaction fees for FX conversion, SWIFT transfers, and card payments add up for high-volume users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Enterprise-level features like multi-entity management require custom Accelerate pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Primarily built for business use, not personal or consumer banking$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Is Airwallex a bank?$q$, $q$No. Airwallex is a fintech/payments company that partners with regulated financial institutions to hold and safeguard customer funds, rather than being a bank itself in most jurisdictions.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Does Airwallex have a free plan?$q$, $q$Yes, the Explore plan is free and includes global accounts, multi-currency corporate cards for up to 10 users, and batch transfers to 120+ countries.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$What currencies does Airwallex support?$q$, $q$Airwallex supports holding and receiving funds in 20+ currencies and sending transfers to 200+ countries and regions.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Does Airwallex offer developer APIs?$q$, $q$Yes, Airwallex's Platform APIs let businesses build embedded financial products, including payouts, connected accounts, and card issuing.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Is there a mobile app?$q$, $q$Yes, Airwallex has iOS and Android apps for managing accounts, cards, and transfers on the go.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Cross-Border E-commerce Payments$q$, $q$Collecting international sales revenue and paying overseas suppliers without excessive FX fees.$q$, $q$E-commerce and marketplace businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Global Team Expense Management$q$, $q$Issuing multi-currency corporate cards and enforcing spend policies for distributed teams.$q$, $q$Startups and scale-ups with international staff$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Embedded Finance for Platforms$q$, $q$Embedding payments, payouts, or card issuing into a software platform's own product via Airwallex APIs.$q$, $q$Software platforms and fintechs$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Explore$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Up to 10 free Spend users","Unlimited multi-currency corporate cards","Global accounts in 20+ currencies","Free batch transfers to 120+ countries"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Grow$q$, $q$$12/user/month + platform fee$q$, $q$monthly$q$, NULL, $q$["Up to 250 Spend users","AI expense policy agent","Rules-based automation for expenses and bills","Advanced approval workflows"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$Accelerate$q$, $q$Custom (contact sales)$q$, $q$custom$q$, NULL, $q$["Purchase orders and 3-way matching","Centralized management for up to 3 entities","Dedicated account manager"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3f26fe2f-0d14-4d94-8521-de088090412c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Airwallex is a fintech platform that gives businesses global financial infrastructure in one place: multi-currency accounts, international payments, corporate cards, spend management, billing, and embedded finance APIs. Rather than relying on separate banks and payment providers for each currency or market, businesses can hold funds in 20+ currencies and move money to 200+ countries from a single account.$q$, $q$Founded in 2015 in Melbourne, Australia, Airwallex is now dual-headquartered in Singapore and San Francisco, and reports serving more than 200,000 businesses globally, including Xero, Canva, Rippling, and Qantas.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Airwallex's core offering spans five areas: Business Accounts for holding and receiving funds in multiple currencies; Spend Management with unlimited multi-currency corporate cards, approval workflows, and bill pay; Payments tools for checkout and eCommerce integrations; Billing for invoicing and subscription management; and Platform APIs that let other companies embed payments, payouts, and card issuing into their own products.$q$, $q$Higher-tier plans add automation, including an AI expense policy agent and rules-based workflows for expense and bill approvals.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Airwallex offers three plans: the free Explore plan for basic global accounts and cards, the Grow plan at $12/user/month plus a platform fee for advanced spend controls, and the custom-priced Accelerate plan for large enterprises with multi-entity needs.$q$, $q$On top of subscription fees, Airwallex charges transaction-based fees: roughly 0.5% above interbank FX rates for major currencies, $15-$25 for SWIFT transfers, and 2.8%-4.3% plus $0.30 for card transactions depending on card type.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Airwallex is aimed at businesses with cross-border operations: e-commerce and marketplace sellers collecting international revenue, companies paying overseas suppliers or contractors, and SaaS or fintech platforms that want to embed payment and card-issuing capabilities into their own products via API.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Aiven ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Aiven is a fully managed, multi-cloud platform for open-source data infrastructure like PostgreSQL, Kafka, ClickHouse, and OpenSearch.$q$, short_description),
  pricing_model = COALESCE($q$Free plan + usage-based pricing$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE($q$450-500 employees$q$, company_size),
  headquarters = COALESCE($q$Helsinki, Finland$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Aiven: Managed Open-Source Data Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Aiven is a fully managed, multi-cloud platform for open-source data tools like PostgreSQL, Kafka, and ClickHouse, with transparent usage-based pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Aiven is a managed cloud data platform, founded in 2016 in Helsinki, Finland, by Oskari Saarenmaa, Hannu Valtonen, and Heikki Nousiainen. It provides fully managed hosting for open-source data infrastructure — including Apache Kafka, PostgreSQL, MySQL, ClickHouse, OpenSearch, Valkey (Redis-compatible), and Grafana — so engineering teams can deploy and operate these tools without managing the underlying servers, patching, or scaling themselves. Aiven runs across major cloud providers (AWS, Google Cloud, Microsoft Azure, DigitalOcean) and an EU Sovereign Cloud option, and offers a single API and console to manage services across providers and regions. Its Bring Your Own Cloud (BYOC) option lets customers run Aiven-managed services inside their own cloud account for data residency or private networking requirements. Pricing is transparent and usage-based: a free tier is available for testing without a credit card, a Developer tier starts around $5/month for small PostgreSQL or MySQL instances, and production tiers (Startup, Business, Premium) scale up in CPU, RAM, storage, and high-availability configuration, with Business and Premium tiers adding standby nodes and up to a 99.99% uptime SLA. Aiven serves organizations ranging from startups to large enterprises such as Bloomberg, DoorDash, Toyota, and Adobe. It's best suited for engineering teams that want production-grade, highly available open-source databases and streaming infrastructure without dedicating in-house staff to operating them, particularly organizations already spanning multiple public clouds.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1cae6850-050f-46cb-a2e7-0f9b43529d66' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Managed Open-Source Databases$q$, $q$PostgreSQL, MySQL, and other databases fully managed with automated patching and backups.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Apache Kafka Streaming$q$, $q$Managed Kafka clusters for event streaming and real-time data pipelines.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Multi-Cloud Deployment$q$, $q$Deploy across AWS, Google Cloud, Azure, and DigitalOcean from one platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$High Availability$q$, $q$Up to 99.99% uptime SLA with automated failover on Business and Premium tiers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Bring Your Own Cloud (BYOC)$q$, $q$Run Aiven-managed services inside a customer's own cloud account.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Unified API & Console$q$, $q$Manage all services and cloud providers from a single control plane.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$OpenSearch & ClickHouse$q$, $q$Managed search and real-time analytics services alongside core databases.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Simplifies operating multiple open-source data tools under one platform and billing relationship$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$True multi-cloud support avoids vendor lock-in to a single cloud provider$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Transparent, all-inclusive usage-based pricing without hidden fees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Free tier lets teams test services without a credit card$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$BYOC option supports strict data residency requirements$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Production-grade high-availability tiers (Business, Premium) get expensive at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Free and Developer tiers are limited to single-node deployments with no integrations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Requires familiarity with the underlying open-source tools (Kafka, PostgreSQL, etc.) to get full value$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$What databases and tools does Aiven support?$q$, $q$Aiven offers managed Apache Kafka, PostgreSQL, MySQL, ClickHouse, OpenSearch, Valkey, Grafana, and Metrics services.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Does Aiven have a free plan?$q$, $q$Yes, Aiven offers an always-on free tier for Kafka, PostgreSQL, MySQL, and OpenSearch that doesn't require a credit card, though it's limited to a single small VM.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Which clouds does Aiven run on?$q$, $q$Aiven runs on AWS, Google Cloud, Microsoft Azure, and DigitalOcean, and offers an EU Sovereign Cloud option.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$What is Aiven's Bring Your Own Cloud (BYOC) option?$q$, $q$BYOC lets customers deploy Aiven-managed services inside their own cloud account, useful for data residency and private networking requirements.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$How is Aiven priced?$q$, $q$Aiven uses transparent, usage-based pricing with hourly and monthly rates that scale with compute, memory, and storage, plus a free tier and a low-cost Developer tier.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Event Streaming Pipelines$q$, $q$Running managed Apache Kafka for real-time data pipelines without operating Kafka clusters in-house.$q$, $q$Data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Multi-Cloud Application Backends$q$, $q$Deploying managed PostgreSQL or MySQL databases that need to run consistently across multiple cloud providers.$q$, $q$Platform and DevOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Regulated Data Residency$q$, $q$Using BYOC to keep managed data services inside a company's own cloud account for compliance.$q$, $q$Enterprises in regulated industries$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["1 VM, 1 CPU, 1 GB RAM, 1 GB storage","No integrations or connection pooling","Available for Kafka, PostgreSQL, MySQL, OpenSearch"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Developer$q$, $q$$5/month$q$, $q$monthly$q$, NULL, $q$["1 VM, 1 CPU, 1 GB RAM, 8 GB storage","Cannot select specific cloud or region"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Startup$q$, $q$From $75/month$q$, $q$monthly$q$, NULL, $q$["1 VM with 2-32 CPU options","4-192 GB RAM, up to 11 TB storage","99.99% uptime SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Business$q$, $q$From $180/month$q$, $q$monthly$q$, NULL, $q$["2 VMs with high availability included","Same CPU/RAM/storage range as Startup"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$Premium$q$, $q$From $270/month$q$, $q$monthly$q$, NULL, $q$["3 VMs including a second standby node","Maximum redundancy configuration"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '1cae6850-050f-46cb-a2e7-0f9b43529d66';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aiven is a managed data infrastructure platform founded in 2016 in Helsinki, Finland. It hosts and operates popular open-source data tools — Apache Kafka, PostgreSQL, MySQL, ClickHouse, OpenSearch, Valkey, and Grafana — so engineering teams don't have to run the underlying servers, apply patches, or manage failover themselves.$q$, $q$The platform is cloud-agnostic, running on AWS, Google Cloud, Microsoft Azure, and DigitalOcean, plus an EU Sovereign Cloud option, with a single API and console to manage services across providers and regions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Aiven's managed services cover streaming (Kafka), relational databases (PostgreSQL, MySQL), search and analytics (OpenSearch, ClickHouse), caching (Valkey), and observability (Grafana). Higher production tiers add multi-node high availability with up to a 99.99% uptime SLA.$q$, $q$A Bring Your Own Cloud (BYOC) option lets organizations run Aiven-managed services inside their own cloud account, useful for data residency and VPC peering requirements.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Aiven uses transparent, usage-based pricing. A Free tier and a $5/month Developer tier support small, single-node deployments for testing. Production tiers — Startup (from $75/month), Business (from $180/month, with high availability), and Premium (from $270/month, with a second standby node) — scale CPU, RAM, and storage based on workload size.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Aiven targets engineering and data teams, from startups to large enterprises like Bloomberg, DoorDash, Toyota, and Adobe, that want production-grade open-source data infrastructure without operating it themselves, especially teams working across multiple cloud providers.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Akaunting ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Akaunting is a free, open-source online accounting and invoicing platform for small businesses and freelancers, available self-hosted or as a paid cloud service.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source, self-hosted) + Subscription (cloud)$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Istanbul, Turkey$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Akaunting: Free Open-Source Accounting Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Akaunting is free, open-source accounting and invoicing software for small businesses, available self-hosted or as a paid cloud service.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Akaunting is an online accounting and invoicing platform aimed at small businesses and freelancers, built by Akaunting Yazılım A.Ş., a company reportedly headquartered in Istanbul, Turkey. The core software is open source and can be self-hosted for free, or used as a paid cloud-hosted service. Akaunting provides double-entry accounting with a chart of accounts, balance sheet, and general ledger, along with invoicing, bill and expense tracking, bank feed reconciliation, inventory management, a client portal, and an app marketplace of 50+ add-ons covering payroll, projects, CRM, point of sale, and payment gateway integrations such as Stripe. It also exposes a RESTful API and is built on Laravel and Vue.js. The self-hosted, open-source version is free to run on a user's own server. The cloud-hosted version is sold in four tiers — Standard, Premium, Elite, and Ultimate — ranging from about $8/month to $145/month when billed yearly (with higher monthly rates for month-to-month billing), scaling up limits on companies, users, invoices, and available apps, with higher tiers unlocking payroll, projects, inventory, and CRM modules. Akaunting reports over 300,000 users across 100+ countries and more than 10 million invoices sent through the platform, with the interface translated into 50+ languages by volunteer contributors. It's best suited for freelancers, small businesses, and accountants who want a low-cost or self-hosted alternative to commercial accounting software like QuickBooks or Xero, especially those comfortable self-managing a server deployment.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Double-Entry Accounting$q$, $q$Full chart of accounts, general ledger, and balance sheet reporting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Invoicing & Billing$q$, $q$Create, send, and track professional invoices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Expense & Bill Tracking$q$, $q$Record and manage bills and business expenses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Bank Feed Reconciliation$q$, $q$Connect bank feeds for automated transaction reconciliation on paid tiers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$App Marketplace$q$, $q$50+ add-on apps including Payroll, Projects, CRM, Inventory, and POS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Client Portal$q$, $q$Secure portal for clients to view invoices and transactions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Self-Hosted or Cloud$q$, $q$Deploy on your own server for free or use Akaunting's paid cloud hosting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$RESTful API$q$, $q$Build custom integrations against Akaunting's API.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Free, open-source self-hosted option with no per-user licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Low-cost cloud plans compared with mainstream accounting software$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Wide app marketplace extends functionality (payroll, CRM, inventory, POS)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Translated into 50+ languages, useful for international freelancers and small businesses$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Self-hosting requires technical setup and ongoing server maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Entry-level cloud plan (Standard) is limited to one user and 1,000 invoices$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Official Android app functions largely as a wrapper around the mobile web interface, and there's no dedicated native iOS app$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Smaller ecosystem and support resources compared with larger incumbents like QuickBooks or Xero$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Is Akaunting really free?$q$, $q$The open-source, self-hosted version of Akaunting is free to download and run on your own server. Akaunting also sells a paid cloud-hosted version starting around $8/month when billed yearly.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Can I self-host Akaunting?$q$, $q$Yes, Akaunting's source code is available on GitHub and can be self-hosted, though this requires setting up and maintaining your own server environment.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Does Akaunting support multiple languages?$q$, $q$Yes, Akaunting is translated into 50+ languages through volunteer contributors.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Does Akaunting have a mobile app?$q$, $q$Akaunting has an Android app, though it functions largely as a wrapper around the mobile web interface; there is no dedicated native iOS app, but the web app is mobile-responsive.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$What's included in the paid cloud plans?$q$, $q$Paid cloud plans add features like double-entry accounting, bank feeds, expense claims, client portals, payroll, projects, inventory, and CRM depending on the tier.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Freelancer Invoicing$q$, $q$Sending professional invoices and tracking payments as a solo freelancer.$q$, $q$Freelancers and one-person businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Self-Hosted Small Business Accounting$q$, $q$Running accounting software on a company's own infrastructure for data control and no subscription fees.$q$, $q$Technical small business owners and developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Multi-Client Bookkeeping$q$, $q$Accountants managing books for multiple client companies from one account.$q$, $q$Accountants and bookkeeping firms$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Standard Cloud$q$, $q$$12/month ($8/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["1 Company, 1 User + 1 Accountant","1,000 Invoices","4 Apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Premium Cloud$q$, $q$$36/month ($24/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["10 Companies, 10 Users","10,000 Invoices, 10 Apps","Double-Entry, Bank Feeds, Client Portal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Elite Cloud$q$, $q$$84/month ($56/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["30 Companies, 30 Users","30,000 Invoices, 30 Apps","Payroll, Projects, Inventory, CRM"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Ultimate Cloud$q$, $q$$218/month ($145/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["Unlimited Companies, Users, Invoices","All 50+ Apps","Budgeting, POS, Custom Fields"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Akaunting is a free, open-source online accounting platform for small businesses and freelancers, built on Laravel and Vue.js. It can be self-hosted at no cost, or accessed through Akaunting's own paid cloud hosting.$q$, $q$The company reports more than 300,000 users across 100+ countries and over 10 million invoices sent through the platform, with translations into 50+ languages contributed by volunteers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core functionality includes double-entry accounting with a full chart of accounts, invoicing, bill and expense tracking, and bank feed reconciliation. A marketplace of 50+ apps extends the platform with payroll, project management, CRM, inventory management, point of sale, and payment gateway integrations like Stripe.$q$, $q$Akaunting also exposes a RESTful API for custom integrations and offers a client portal so customers can view their invoices and transaction history directly.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The open-source version is free to self-host on your own server. The cloud-hosted version has four tiers billed monthly or yearly: Standard ($12/mo or $8/mo yearly, 1 user), Premium ($36/mo or $24/mo yearly, 10 users), Elite ($84/mo or $56/mo yearly, 30 users), and Ultimate ($218/mo or $145/mo yearly, unlimited users), with higher tiers unlocking more apps and modules like payroll and CRM.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Akaunting suits freelancers and small businesses looking for a low-cost or free accounting tool, technical users who want to self-host their financial data, and accountants managing books for multiple client companies.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Akeyless ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Akeyless is a SaaS identity security platform for managing secrets, certificates, encryption keys, and machine/AI agent identities with zero-trust access controls.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Ramat Gan, Israel$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Akeyless: Unified Identity & Secrets Security$q$, seo_title),
  seo_meta_description = COALESCE($q$Akeyless is a SaaS platform for managing secrets, certificates, encryption keys, and machine and AI agent identities with zero-trust access control.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Akeyless is an identity security and secrets management platform, founded in 2018 and headquartered in Ramat Gan, Israel, with an additional presence in New York. It's built as a SaaS platform that helps organizations secure and manage secrets (API keys, credentials, tokens), TLS/SSL certificates, encryption keys, and machine and AI agent identities without deploying and maintaining a traditional self-hosted vault. Core capabilities include dynamic secrets management, just-in-time privileged access management (modern PAM) that eliminates standing access, automated certificate lifecycle management, multi-cloud key management (KMS) with quantum-resilient encryption options, and centralized governance across multiple vaults and environments. A newer focus area is securing AI agent identities, giving teams runtime visibility and control over what autonomous agents can access and do. Akeyless's underlying security model uses a patented Distributed Fragments Cryptography approach, designed so Akeyless itself never holds a complete encryption key. The platform offers a free tier with limited quotas (5 clients, 500 static secrets, limited certificates and encryption transactions) and a custom-priced Enterprise tier for larger organizations, billed on usage with annual reconciliation. Akeyless can be deployed as pure SaaS or in a hybrid model using on-premise gateways. It holds ISO 27001, SOC 2, FIPS 140-3, and other compliance certifications, and counts customers such as Thales, Wix, and Deutsche Bank. It's best suited for DevOps, security, and platform engineering teams that need centralized secrets and machine-identity management without operating vault infrastructure themselves.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Secrets Management$q$, $q$Dynamic delivery of API keys, credentials, and tokens without standing vault infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Modern PAM$q$, $q$Just-in-time privileged access that removes standing access privileges.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Certificate Lifecycle Management$q$, $q$Automated issuance, renewal, and compliance tracking for TLS/SSL certificates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$AI Agent Identity Security$q$, $q$Runtime visibility and control over AI agent actions and access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Multi-Cloud Encryption & KMS$q$, $q$Quantum-resilient key management spanning multiple cloud providers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Multi-Vault Governance$q$, $q$Centralized visibility and control across multiple vaults and environments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Distributed Fragments Cryptography$q$, $q$Patented zero-knowledge encryption architecture.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$SaaS delivery removes the operational burden of running vault infrastructure$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Free tier available for evaluation and small-scale use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Broad compliance certification coverage (ISO 27001, SOC 2, FIPS 140-3)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Covers secrets, certificates, encryption, and AI agent identity in one platform$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Enterprise pricing isn't published and requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Free tier quotas (e.g., 500 static secrets, 3-day audit retention) are quite limited$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Hybrid deployment with on-prem gateways adds setup complexity compared with pure SaaS$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Is Akeyless open source or self-hosted?$q$, $q$No, Akeyless is primarily a SaaS platform, though it offers a hybrid deployment option using on-premise gateways for organizations with data residency needs.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Does Akeyless have a free plan?$q$, $q$Yes, Akeyless offers a free tier with limited quotas across secrets management, certificate lifecycle management, and encryption/KMS.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$What is Distributed Fragments Cryptography?$q$, $q$It's Akeyless's patented zero-knowledge security architecture, designed so no single party, including Akeyless, ever holds a complete encryption key.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Does Akeyless support securing AI agents?$q$, $q$Yes, Akeyless offers AI Agent Identity Security features to track and control the actions and access of autonomous AI agents at runtime.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$What compliance certifications does Akeyless hold?$q$, $q$Akeyless holds ISO 27001, SOC 2, PCI DSS, FIPS 140-3, and DORA compliance, among others.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Centralized Secrets Management$q$, $q$Replacing scattered API keys and credentials across environments with dynamic, centrally managed secrets.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Privileged Access Governance$q$, $q$Enforcing just-in-time access instead of standing privileged credentials.$q$, $q$Security and identity teams at mid-size to large enterprises$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$AI Agent Access Control$q$, $q$Monitoring and restricting what autonomous AI agents can access and do within company systems.$q$, $q$Engineering teams deploying AI agents in production$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["5 clients, 500 static secrets, 5 dynamic secrets","5 managed certificates","1,000 encryption transactions/day, 5 encryption keys"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$custom$q$, NULL, $q$["Higher/unlimited quotas across all modules","Advanced options and governance","Usage-based annual reconciliation"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Akeyless is a SaaS identity security platform, founded in 2018 and headquartered in Ramat Gan, Israel. It centralizes management of secrets, certificates, encryption keys, and machine and AI agent identities so teams don't have to deploy and operate a traditional self-hosted vault.$q$, $q$The platform's Distributed Fragments Cryptography architecture is designed so no single party, including Akeyless itself, ever holds a complete encryption key.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Akeyless covers dynamic secrets management, just-in-time privileged access (modern PAM) that removes standing credentials, automated certificate lifecycle management, and multi-cloud encryption/KMS with quantum-resilient options.$q$, $q$A newer capability, AI Agent Identity Security, gives teams runtime authority to track and control what autonomous AI agents access and do, alongside multi-vault governance for centralized visibility across environments.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Akeyless offers a free tier with limited quotas (e.g., 5 clients, 500 static secrets, 5 dynamic secrets, 5 managed certificates, 1,000 encryption transactions per day) and a custom-priced Enterprise tier for larger organizations, billed on usage with annual reconciliation. Specific Enterprise pricing isn't published and requires contacting sales.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Akeyless targets DevOps, security, and platform engineering teams at organizations that need centralized secrets, certificate, and machine/AI-identity management, including regulated industries like finance, given its ISO 27001, SOC 2, PCI DSS, and FIPS 140-3 certifications.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Akiflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Akiflow is an AI-powered task and calendar management app that unifies calendars, tasks, and to-dos from multiple tools into one time-blocking planner.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$19/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$18-25 employees$q$, company_size),
  headquarters = COALESCE($q$Barcelona, Spain$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Akiflow: AI Task & Calendar Planner$q$, seo_title),
  seo_meta_description = COALESCE($q$Akiflow is an AI-powered planner that unifies calendars, tasks, and to-dos from multiple tools into one time-blocking workspace.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Akiflow is an AI-powered task and calendar management app founded around 2020 by Sebastiano Favaro and Nunzio Martinello, backed by Y Combinator (S20 batch), with a team based partly in Barcelona, Spain, and Italy. It's designed to centralize a user's work into one place by syncing multiple calendars (work and personal) and pulling in tasks from other tools — such as Trello, Slack, and Gmail — into a single Universal Inbox. Users then organize that inbox into a time-blocked daily schedule directly on their calendar. Key features include an AI assistant called Aki that helps with scheduling, prioritization, voice commands, and daily briefings; native integrations with common productivity tools plus broader connectivity through Zapier and IFTTT; a focus mode and offline mode; and apps for web, Windows, Mac, iOS, and Android with real-time sync across devices. Akiflow is sold as a subscription: a Pro plan costs $34/month billed monthly, or $19/month when billed annually, with both tiers including unlimited tasks, meetings, and integrations plus the Aki AI assistant. All paid plans include a 7-day free trial, and there is no free perpetual tier. Akiflow reports more than 100,000 users. It's aimed at busy professionals, founders, and operators who juggle many tools and meetings and want a single time-blocked planning workflow instead of separate calendar and to-do apps.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Universal Inbox$q$, $q$Pulls in tasks from Trello, Slack, Gmail, and other tools into one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Unified Calendar$q$, $q$Syncs multiple work and personal calendars into a single view.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Time-Blocking Planner$q$, $q$Schedules tasks directly onto the calendar for focused daily planning.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Aki AI Assistant$q$, $q$AI-driven scheduling, prioritization, voice commands, and daily briefings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Cross-Platform Apps$q$, $q$Available on web, Windows, Mac, iOS, and Android with real-time sync.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Integrations$q$, $q$Native integrations with common productivity tools, plus Zapier and IFTTT support.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Focus & Offline Mode$q$, $q$Dedicated focus tools and offline access with automatic sync on reconnect.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Consolidates tasks and calendars from many different tools into one planning workflow$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Time-blocking approach encourages realistic daily scheduling rather than open-ended to-do lists$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Available across web, desktop (Mac/Windows), and mobile (iOS/Android) with sync$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Backed by Y Combinator with an active product development pace$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$No free perpetual plan — only a 7-day free trial before requiring payment$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Monthly pricing ($34/month) is relatively high compared with some task-management competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Small team size may mean slower feature rollout or support response versus larger productivity vendors$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Does Akiflow have a free plan?$q$, $q$No, Akiflow does not offer a permanent free plan; it offers a 7-day free trial on its Pro plan before requiring a subscription.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$How much does Akiflow cost?$q$, $q$Akiflow's Pro plan costs $34/month billed monthly, or $19/month when billed annually.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$What is Aki?$q$, $q$Aki is Akiflow's built-in AI assistant that helps with scheduling, task prioritization, voice commands, and daily briefings.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$What platforms does Akiflow support?$q$, $q$Akiflow is available on the web, Windows, Mac, iOS, and Android, with real-time sync across devices.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$What tools does Akiflow integrate with?$q$, $q$Akiflow has native integrations with tools like Trello, Slack, and Gmail, plus broader connectivity through Zapier and IFTTT.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Daily Time-Blocking$q$, $q$Converting a scattered task list into a realistic, scheduled daily plan.$q$, $q$Founders, operators, and busy professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Consolidating Scattered Tasks$q$, $q$Pulling tasks and to-dos from multiple apps like Slack, Gmail, and Trello into one inbox.$q$, $q$Professionals juggling many tools$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Cross-Device Scheduling$q$, $q$Managing tasks and calendar consistently across desktop and mobile.$q$, $q$Remote and mobile professionals$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Pro Monthly$q$, $q$$34/month$q$, $q$monthly$q$, NULL, $q$["Unlimited integrations, tasks, meetings","Aki AI assistant","Free 1:1 onboarding call","7-day free trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Pro Yearly$q$, $q$$19/month (billed annually)$q$, $q$yearly$q$, NULL, $q$["Unlimited tasks, meetings, integrations","Aki AI assistant and MCP","7-day free trial"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Akiflow is an AI-powered productivity app that combines calendar management, task planning, and scheduling into a single workspace. It was founded around 2020 by Sebastiano Favaro and Nunzio Martinello, backed by Y Combinator, with a team based partly in Barcelona, Spain, and Italy.$q$, $q$The app centralizes work by syncing multiple calendars and pulling in tasks from tools like Trello, Slack, and Gmail into a single Universal Inbox, then lets users time-block that inbox directly onto their calendar.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Akiflow's Aki AI assistant helps with scheduling, task prioritization, voice commands, and daily briefings. The app offers native integrations with common productivity tools, plus broader connectivity through Zapier and IFTTT, along with focus mode and offline mode with automatic sync on reconnect.$q$, $q$Akiflow is available across web, Windows, Mac, iOS, and Android, with real-time sync keeping schedules consistent across devices.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Akiflow is sold as a subscription with a single Pro plan: $34/month billed monthly, or $19/month when billed annually (a 44% discount). Both billing options include unlimited tasks, meetings, and integrations, along with the Aki AI assistant, and come with a 7-day free trial. Team pricing is available by contacting sales.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Akiflow is aimed at founders, operators, and busy professionals who juggle meetings and tasks across many different tools and want a single time-blocked planning workflow instead of separate calendar and to-do apps.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

